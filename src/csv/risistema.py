
testo= []
with open("query_7.csv",'r') as file:
    for linea in file.readlines():
        testo.append(linea.replace(" \n", "\n"))

with open("query_7.csv", "w") as file:
    for linea in testo:
        file.write(linea)