import os
import json
import tqdm
import argparse
from src.modules import TASL, TALOG


def generate_sql(tasl, talog, output_path):
    question_json = tasl.question_json
    output_dic = {}
    for i in tqdm.tqdm(range(len(question_json[:3]))):
        sl_schemas = tasl.get_schema(i)
        _, sql = talog.sr2sql(i, sl_schemas)
        db_id = question_json[i]['db_id']
        sql = sql.replace('\"','').replace('\\\n',' ').replace('\n',' ')
        sql = sql + '\t----- bird -----\t' + db_id
        print(sql)
        
        output_dic[str(i)] = sql
        if os.path.exists(output_path):
            with open(output_path, 'r') as f:
                contents = json.loads(f.read())
        else:
            with open(output_path, 'a') as f:
                contents = {}
        contents.update(output_dic)
        json.dump(output_dic, open(output_path, 'w'), indent=4)
        

def parser():
    parser = argparse.ArgumentParser("")
    parser.add_argument('--db_root_path', type=str, default="./data/dev_databases")
    parser.add_argument('--column_meaning_path', type=str, default="./outputs/column_meaning.json")
    parser.add_argument('--mode', type=str, default='dev')
    parser.add_argument('--output_path', type=str, default=f"./outputs/prect_dev.json")
    opt = parser.parse_args()
    return opt

def main(opt):
    db_root_path = opt.db_root_path
    column_meaning_path = opt.column_meaning_path
    mode = opt.mode
    output_path = opt.output_path
    
    tasl = TASL(db_root_path, mode, column_meaning_path)
    talog = TALOG(db_root_path, mode)
    generate_sql(tasl, talog, output_path)

if __name__ == '__main__':
    opt = parser()
    main(opt)
    
    
    