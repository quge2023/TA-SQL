import os
import csv
import tqdm
import sqlite3


def new_directory(path):
    if not os.path.exists(path):
        os.makedirs(path)
        
        
def generate_pk_fk(question_info, table_json):
    db_id = question_info['db_id']
    table = [content for content in table_json if content['db_id'] == db_id][0]
    pk_dict = {}
    fk_dict = {}
    table_names_original = table['table_names_original']
    column_names_original = table['column_names_original']
    primary_keys = table['primary_keys']
    foreign_keys = table['foreign_keys']
    
    for _,pk_idx in enumerate(primary_keys):
        if type(pk_idx) == int:
            pk_dict[str(table_names_original[column_names_original[pk_idx][0]])] = [column_names_original[pk_idx][-1]]
        else:
            pk_dict[str(table_names_original[column_names_original[pk_idx[0]][0]])] = [column_names_original[idx][-1] for idx in pk_idx]
    
    for cur_fk in foreign_keys:
        src_col_idx, tgt_col_idx = cur_fk
        src_col_name = str(table_names_original[column_names_original[src_col_idx][0]]) + '.' + str(column_names_original[src_col_idx][-1])
        tgt_col_name = str(table_names_original[column_names_original[tgt_col_idx][0]]) + '.' + str(column_names_original[tgt_col_idx][-1])
        fk_dict[src_col_name] = tgt_col_name
    return pk_dict, fk_dict


def get_info_from_csv(db_root_path, table_json):
    csv_info = {}
    value_prompt = {}
    for i in tqdm.tqdm(range(len(table_json))):
        table_info = table_json[i]
        db_id = table_info['db_id']
        db_path = os.path.join(db_root_path, db_id, f'{db_id}.sqlite')
        conn = sqlite3.connect(db_path)
        cursor = conn.cursor()
        csv_dir = os.path.join(db_root_path,db_id,'database_description')
        otn_list = table_info['table_names_original']
        for otn in otn_list:
            csv_path = os.path.join(os.path.join(csv_dir, f"{otn}.csv"))
            csv_dict = csv.DictReader(open(csv_path, newline='', encoding="latin1"))
            column_info = {}
            
            for row in csv_dict:
                headers = list(row.keys())
                ocn_header = [h for h in headers if 'original_column_name' in h][0]  # remove BOM
                ocn, cn = row[ocn_header].strip(), row['column_name']
                column_description = row['column_description'].strip()
                column_type = row['data_format'].strip()
                column_name = cn if cn not in ['', ' '] else ocn
                value_description = row['value_description'].strip()
                column_info[ocn] = [column_name, column_description, column_type, value_description]

                if column_type in ['text', 'date', 'datetime']:
                    sql = f'''SELECT DISTINCT "{ocn}" FROM `{otn}` where "{ocn}" IS NOT NULL ORDER BY RANDOM()'''
                    cursor.execute(sql)
                    values = cursor.fetchall()
                    if len(values) > 0 and len(values[0][0]) < 50:
                        if len(values) <= 10:
                            example_values = [v[0] for v in values]
                            value_prompt[f"{db_id}|{otn}|{ocn}"] = f"all possible values are {example_values}"
                            # value_prompt[f"{db_id}|{otn}|{ocn}"] = f"all possible values of the column are {', '.join(example_values)}."
                        else:
                            example_values = [v[0] for v in values[:3]]
                            value_prompt[f"{db_id}|{otn}|{ocn}"] = f"example values are {example_values}"
                            # value_prompt[f"{db_id}|{otn}|{ocn}"] = f"three example values of the column are {', '.join(example_values)}."
                    
            csv_info[f"{db_id}|{otn}"] = column_info
        # pdb.set_trace()
    return csv_info, value_prompt 
