lst=[3,10,1,20,7,15,25]

newlst = sorted(range(len(lst)), key= lambda k: lst[k])


with open("new.txt", "w+") as t:
    t.write("i am king of the hastinampur")