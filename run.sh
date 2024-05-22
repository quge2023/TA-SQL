db_root_path='./data/dev_databases'
mode='dev'
meaning_output_path='./outputs/column_meaning.json' 
sql_output_path='./outputs/predict_dev.json'

#As stated in Appendix A.1, we first generate succient description for each column.
#You can comment out the following code and directly utilize './outputs/column_meaning.json' to bypass this step
# echo 'Generate succient column descriptions.'
# python3 ./src/conclude_meaning.py --db_root_path ${db_root_path} --mode ${mode} --output_path ${meaning_output_path}
# echo 'Description generation is finished.'

echo 'Generate SQLs.'
python3 ./run.py --db_root_path ${db_root_path} --mode ${mode} --column_meaning_path ${meaning_output_path} --output_path ${sql_output_path}
echo 'SQL generation is finished.'

