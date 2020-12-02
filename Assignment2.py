'''
Usage:
    Assignment2.py --file <path> [--print]
    Assignment2.py --directory <path> [--print]
    Assignment2.py --zip <path>
    Assignment2.py --set-connection [--dbname <database>] [--user <user>] [--password <password>]
    Assignment2.py --load-data [--old]

Options:
    -h --help           print this page
    -f --file           execute file sql
    -d --directory      execute all file sql inside the folder
    -z --zip            [in development] chek all the files within the compressed folder
    -l --load-data      load table in database
    -p --print          print the table

    --old

    --dbname
    --user
    --password
'''

import psycopg2
import os
from docopt import docopt
import pandas as pd
import json
from re import findall



args = docopt(__doc__)

anagrafica = {
    "dbname": None,
    "user": None,
    "password": None
}

def execute_and_print_query (path):
    try:
        with (psycopg2.connect(dbname=anagrafica['dbname'], user=anagrafica['user'], host='sci-didattica.unitn.it',
                               password=anagrafica['password'])) as connection:
            my_table = pd.read_sql(open(path, 'r').read(), connection)

            if args["--print"]:
                print("===========================================================================")
                print("---------------------------------------------------------------------------")
                print("===========================================================================")
                print(f"resoult from {path}:")
                #pd.set_option('display.max_rows', my_table.shape[0] + 1)
                pd.options.display.width = 0
                pd.set_option('display.max_columns', my_table.shape[1] + 1)
                print(my_table)
                print()

            return my_table
    except FileNotFoundError as e:
        print("FileNotFoundError=> PATH:" + path)


def file_execute (path = "", file =""):
    # chek extensione file
    
    len_path = len(file)
    if file.rfind(".sql", len_path - 4, len_path) > -1:
        
        # chek file number
        if file.rfind("query_") > -1:
            chek_resul(table= execute_and_print_query(os.path.join(path,file)), file=file)

        else:
            execute_and_print_query(os.path.join(path,file))
            print("[WARNING] No compare file available for this queary. Check name spelling.")
    else:
        print("[WARNING] file must be .sql")

def chek_resul(table,file):
    try:
        number = [int(num) for num in findall(r"\d+", file)]
        dirpath = os.path.join(os.path.dirname(os.path.realpath(__file__)),"src","csv",f"query_{number[-1]}.csv")
        confronto = pd.read_csv(dirpath,sep=";")
        
        if table.equals(confronto):
            print(f"[WIN] {file} check succeed")
        else:
            print(f"[LOSE] {file} chek non succed ")


            if confronto.columns[0] ==  table.columns[0]:
                print("[ERROR] data does not math:")
                print(pd.concat([table,confronto]).drop_duplicates(keep=False))
                print(confronto.isin(table))
            else:

                if confronto.columns[0] ==  table.columns[0]:
                    print("[ERROR] data does not math:")
                    print(pd.concat([table,confronto]).drop_duplicates(keep=False))
                    print(confronto)
                else:
                    print("[ERROR] label does not math:")
                    print("your label:   ", table.columns)
                    print("confron file :", confronto.columns)

        if args["--print"]:
            print("===========================================================================")
            print("---------------------------------------------------------------------------")
            print("===========================================================================")


    except FileNotFoundError as e:
        print("[ERROR] no compare file available")
    

    except ValueError as e:
        print("[ERROR] ValueError" + e.__str__())




try:
    with open(os.path.join(os.path.dirname(os.path.realpath(__file__)), "src", "config.json")) as file:
        anagrafica = json.load(file)

except FileNotFoundError as e:
    print("NO FILE CONFIG")
if anagrafica['dbname'] == None:
    anagrafica['dbname'] = input("database: ")

if anagrafica['user'] == None:
    anagrafica['user'] = input("user: ")

if anagrafica['password'] == None:
    anagrafica['password'] = input("password: ")

if args['--file']:
    
    file_execute(file=args['<path>'])

if args["--directory"]:

    files = []
    
    for (dirpath, dirnames, filenames) in os.walk(args['<path>']):
        files.extend(filenames)
        for file in files:
            file_execute(path=args['<path>'], file=file)
    


if args["--load-data"]:
    with (psycopg2.connect(dbname=anagrafica['dbname'], user=anagrafica['user'], host='sci-didattica.unitn.it',
                           password=anagrafica['password'])) as connection:

        percorso = os.path.join(os.path.dirname(os.path.realpath(__file__)), "src", "data", "new_database.sql")

        cur = connection.cursor()

        cur.execute(open(percorso, 'r',encoding="utf8").read())
        connection.commit()

        my_table = pd.read_sql("""SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'""",
                               connection)

        for index, row in my_table.iterrows():
            table = pd.read_sql(f""" SELECT * FROM "{(row['table_name'])}"  """, connection)
            print(table)