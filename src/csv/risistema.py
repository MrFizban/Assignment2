import pandas as pd
number = 4
tabella = pd.read_csv(f"query_4.csv")

print(tabella.dtypes)
print(tabella.columns)
tabella = tabella.astype({'name':'string'})
tabella.to_csv(f"query_4.csv", sep=";")
print(tabella.dtypes)