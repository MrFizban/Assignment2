
testo= []
with open("query_10.csv",'r') as file:
    for linea in file.readlines():
        temp = linea
        temp = temp.replace(" \n", "\n")
        temp = temp.replace("; ", ";")
        testo.append(temp)

with open("query_10.csv", "w") as file:
    for linea in testo:
        file.write(linea)