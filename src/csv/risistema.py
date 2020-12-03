
testo= []
with open("query_13.csv",'r') as file:
    for linea in file.readlines():
        temp = linea[2:-2]
        temp = temp +"\n"
        temp = temp.replace(" | ", ";")
        temp = temp.replace("; ", ";")
        testo.append(temp)

with open("query_13.csv", "w") as file:
    for linea in testo:
        file.write(linea)