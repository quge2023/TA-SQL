This is the official repo for ["Before Generation, Align it! A Novel and Effective Strategy for Mitigating Hallucinations in Text-to-SQL Generation"](https://openreview.net/pdf?id=TaUrBzbSlKl). 




## Overview

In this work, we first identify and categorize the common types of hallucinations at each stage in text-to-SQL. We then introduce a novel strategy, **T**ask **A**lignment (TA), designed to mitigate hallucinations at each stage. We further propose a text-to-SQL framework named **TA-SQL**, which consists of a **T**ask-**A**ligned **S**chema **L**inking (**TASL**) module and a **T**ask-**A**ligned **LOG**ical synthesis (**TALOG**) module. This repo contains all code for the implementation and evaluation of TA-SQL, utilizing GPT-4 as the backend, on BIRD dev set as stated in our paper.

<img src="./assets/main_figure.png" align="middle" width="95%">

## Environment Setup

1. Config your local environment.

   ```bash
    $ conda create -n tasql python=3.8.16
    $ conda activate tasql
    $ pip3 install -r requirements.txt
   ```

2. OpenAI key?

## Data Preparation

The BIRD dev set used in the paper could be directly download from the [Google Drive link](https://drive.google.com/file/d/1DR8LpYkFHxs0JB5GDVgC3tR4B-bd0I9N/view?usp=drive_link). Please put the unzipped folder under `./data/` after downloading sucessfully. The dataset should under the `./data/dev_databases/`countains the following resources:
 
- `database`: Each database folder should contain 
  - `database_description`: The csv files are manufactured to describe database schema and its values for models to explore or references.
  - `sqlite`: The database contents in BIRD.
- `dev_tables.json`: The file contains related information for each database, including `db_id`, `table_names_originial`, etc,. 
- `dev.json`: The file contains text-to-SQL pairs with the oracle knowledge evidence. 

## Collect results

To run this project, you could directly execute the command libe by following instructions (You may need to adjust parameters and paths with your preference):
   ```bash
    $ sh ./run.sh
   ```

## Evaluation
To run the evaluation, you need to put the ground-truth sql file `dev_gold.sql` in the `./data/` first. Then you could evaluate the results by the following command line:

   ```bash
    $ sh ./run_evaluation.sh
   ```

## Project Structure

```txt
├─data/
|  ├─dev_databases # data of BIRD dev databases
├─src/
|  ├─conclude_meaning.py  # Generate suffcient descriptions for columns in the dataset
|  ├─llm.py               # OpenAI API call
|  ├─modules.py           # Modules of TA-SQL framework
|  ├─prompt_bank.py       # prompt templates used in each module of TA-SQL framework
|  ├─utils.py             # utils functions
├─evaluation/
|  ├─evaluation.py        # EX evaluation script
|  ├─evaluation_ves.py    # VES evaluation script
├─outputs/
├─README.md
├─requirements.txt
├─run.py 
├─run.sh 
```

## Citation
Please cite the repo if you think our work is helpful to you. 
```text
xxxx  
```



