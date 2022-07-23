import pandas as pd
import csv

INPUT = '../rawData/Author.csv'
OUTPUT = '../conformedData/'

authFinal = pd.DataFrame(columns=['aid', 'first_name', 'last_name'])
contFinal = pd.DataFrame(columns=['phone_number', 'phone_type'])
authListFinal = pd.DataFrame(columns=['list', 'aid', 'phone'])

authIndex = 0
authListIndex = 0

with open(INPUT, newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=',')
    # Parse Row
    for row in reader:
        Hindex = 0
        curaid = None
        # Parse Items in Row
        for item in row:
            # AuthorID
            if Hindex == 0:
                curaid = item
                authFinal.loc[authIndex, 'aid'] = curaid
                Hindex += 1
            # Name
            elif Hindex == 1:
                fullName = str(item.lstrip(' ')).split(' ')
                authFinal.loc[authIndex, 'first_name'] = fullName[0]
                authFinal.loc[authIndex, 'last_name'] = fullName[1]
                Hindex += 1
                authIndex += 1
            # Phone Numbers
            elif Hindex > 1:
                split = str(item.lstrip(' ')).split(' ')
                if "None" not in split:
                    if len(split) < 2:
                        split = str(split[0]).split('(')
                        loc = '(' + split[1]
                        split[1] = loc
                    contFinal.loc[len(contFinal.index)] = [split[0], split[1]]
                    authListFinal.loc[authListIndex] = [authListIndex, curaid, split[0]]
                    authListIndex += 1
                    Hindex += 1

authFinal.to_csv(OUTPUT + 'Author_c.csv', index=False, header=False)
contFinal.to_csv(OUTPUT + 'Contact_c.csv', index=False, header=False)
authListFinal.to_csv(OUTPUT + 'AuthList_c.csv', index=False, header=False)
print(f"{INPUT} conformed")




