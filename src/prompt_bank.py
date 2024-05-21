column_meaning_prompt = """def convert_schema_to_comprehensive_description(db_id, table_name, column_name, column_type, column_description = None, value_description = None):
    # step1: The interpretation of a column name is contingent upon its relational association with the table name. Thus, the first generated sentence should explain the column meaning within the context of table_name
    # step2: output overall column description according to step1
    assert len(overall_description) <= 100
    return overall_description

overall_description = convert_schema_to_comprehensive_description({input_paras})

print(overall_description)

#Output: """


dummy_sql_prompt = """# the key is the table, the value is a dict which key is original column name and value is the column information including full name, column description, value_description and example values.
database_schema = {database_schema}

# the key is the table, the value is the list of its counterpart primary keys
primary_keys = {primary_key_dic}

# the key is the source column, the value is the target column referenced by foreign key relationship.
foreign_keys = {foreign_key_dic}

question = "{question_prompt}"

evidence = "{evidence}"

def question_to_SQL(question):
  # DO NOT select more things other than what the question asks
  # Generate the SQL to answer the question considering database_schema, primary_keys and foreign_keys
  # Also consider the evidence when generating the SQL
  SQL = "SELECT """
  

sr_examples = """#SR is a piece of pandas-like code. Learn to generate SR based on the question and the schema. Later, the SR will be converted to SQL. 
#SR ignore 'join' action. Do not generate 'join' action.
#In the generated SR, only select the thing that request in the question. Do not select any non-requested stuff. 
#The filter condition in the 'where' function doesn't directly match the text in the question. To find the correct value for the 'where' function, you need to reference the example values or all possible values in column description.

question = "How many movies directed by Francis Ford Coppola have a popularity of more than 1,000? Please also show the critic of these movies."
schema = [movies.movie_title, ratings.critic, movies.director_name, movies.movie_popularity, ratings.movie_id, movies.movie_id']
evidence = "Francis Ford Coppola refers to director_name; popularity of more than 1,000 refers to movie_popularity >1000" 
SR = "df1 = df.where(element = movies.director_name, filter = 'Francis Ford Coppola')
    df2 = df1.where(element = movies.movie_popularity, filter = '> 1000')
    res = df2.select(movies.movie_title, ratings.critic)"
    
question = "For all the movies which were produced by cruel and unusual films, which one has the most popularity?"
schema = [movie.title, `production company`.company_id, movie_company.company_id, movie_company.movie_id, movie.movie_id, `production company`.company_name, movie.popularity]
evidence = "produced by cruel and unusual films refers to company_name = 'Cruel and Unusual Films'; most popularity refers to max(popularity)"
SR = "df1 = df.where(element = `production company`.company_name, filter = 'Cruel and Unusual Films')
    df2 = df1.orderby(by = movie.popularity, desc).limit(1)
    res = df2.select(movie.title)"
    
question = "Among the professors who have more than 3 research assistants, how many of them are male?"
schema = [prof.gender, RA.student_id, RA.prof_id, prof.prof_id]
evidence = "research assistant refers to the student who serves for research where the abbreviation is RA; more than 3 research assistant refers to COUNT(student_id) > 3;"
SR = "df1 = df.groupby(prof.prof_id).having(element = count(RA.student_id), filter = '> 3')
    df2 = df1.where(element = 'prof.gender', filter = 'Male')
    res = df2.count()"

question = "What is the first name of clients who have the highest priority?"
schema = [client.first, client.client_id, callcenterlogs.`rand client`,callcenterlogs.priority]
evidence = "first name refers to first; highest priority refers to priority = 2"
SR = "df1 = df.where(element = callcenterlogs.priority, filter = max(callcenterlogs.priority))
    res = df1.select(client.first)"

question = "What percentage of businesses in the northwest US have forecasted annual sales of above 300,000?"
schema = [SalesPerson.SalesQuota, SalesPerson.BusinessEntityID, SalesPerson.TerritoryID, SalesTerritory.TerritoryID, SalesTerritory.CountryRegionCode, SalesTerritory.Name]
evidence = "northwest refers to Name = 'Northwest'; US refers to CountryRegionCode = 'US'; forecasted annual sales of above 300,000 refers to SalesQuota >300000; Percentage = Divide(Count(TerritoryID(SalesQuota >300000)),Count(TerritoryID))*100"
SR = "df1 = df.where(element = SalesTerritory.CountryRegionCode, filter = 'US').where(element = SalesTerritory.Name, filter = 'Northwest')
    df2 = df1.where(element = SalesPerson.SalesQuota, filter = '> 300000')
    res = df.select(cast(df2.count(), real) * 100 / df1.count())"

question = "How many more followers in percentage are there for the repository used by solution ID 18 than solution ID19?"
schema = [Repo.`Forks Number`, Solution.Id, Repo.Id, Solution.RepoId]
evidence = "followers refers to Forks; percentage = divide(SUBTRACT(Forks(Solution.ID = 18), Forks(Solution.ID = 19)), Forks(Solution.ID = 19))*100%"
SR = "df1 = df.where(element = Solution.Id, filter = 18))
    tmp_res1 = df1.select(Repo.`Forks Number`).sum()
    
    df1 = df.where(element = Solution.Id, filter = 19))
    tmp_res2 = df1.select(Repo.Forks).sum()"
    
    res = df.select(cast((tmp_res1 - tmp_res2),real) * 100 / tmp_res2)"
    
question = "What is the difference between the number of children's films and action films?"
schema = [category.name, film_category.category_id, category.category_id]
evidence = ""
SR = "df1 = df.where(element = category.name, filter = 'ChildrenFilm')
    df2 = df.where(element = category.name, filter = 'ActionFilm')
    res = df.select(df1.count() - df2.count())"
"""


generate_sr = """{sr_example}
column_description = {column_description}
question = {question}
schema = {schema}
evidence = "{evidence}"
SR =
"""



sr2sql = """# Understand the pandas-like SR first. Then convert the SR in to executable SQL based on the question, the schema, the evidence and the imported keywords. 
# Notice the order of the action in SR may not same as the executable SQL. Make sure the generated SQL is executable and can answer the question accurately according to the schema. 
# Only select the thing that the question required. Do not select any non-requested stuff. 
# You may need to look back to the column_description and schema to get the correct value used in the final SQL

from CLAUSE_KEYWORDS import select, from, where, group by, order by, union, limit, having, distinct, as, between, like, all, on, partition by
from JOIN_KEYWORDS import inner join, left join
from WHERE_OPERATIONS import is, not, null, none, in, =, >, <, >=, <=, !=, <>
from DATE_OPERATIONS import now, curdate, strftime
from UNIT_OPERATIONS import -, +, *, /
from COND_OPERATIONS import and, or, case, iif
from SQL_OPERATIONS import avg, count, max, min, round, abs, sum, length, cast, substr, cast, instr
from ORDER_OPERATIONS import desc, asc

column_description = {column_description}

foreign_keys = {foreign_key_dic}

question = {question}
schema = {schema}
evidence = "{evidence}"
SR = "{SR}"
SQL = "SELECT
"""