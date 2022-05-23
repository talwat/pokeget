import os

file = open("/home/tal/Code/pokeget/listfull.txt", "r")
raw = file.read()
file.close()

split = raw.split(" ")
final = {}
for i in split:
    j = i.split(",")
    print(j)
    final[str(j[0])] = j[1].lower()

print(final)

for i in final:
    print(i + final[i])
    os.system("rename " + final[i] + " " + i + " *")
    print("RENAMED " + final[i])