import pandas as pd
import csv
import util

INPUT = '../rawData/Members.csv'
OUTPUT = '../conformedData/'
CONCAT_LOC = 'Loc_c.csv'

memFinal = pd.DataFrame(columns=['mid', 'first_name', 'last_name', 'dob', 'gender'])
borFinal = pd.DataFrame(columns=['borrower', 'checkout', 'checkin', 'item'])
locFinal = pd.read_csv(OUTPUT + CONCAT_LOC, keep_default_na=False, header=None)

memIndex = 0
borIndex = 0

with open(INPUT, newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=',')
    curBor = None
    tab = False

    for row in reader:
        checkIndent = row[0][0]
        checkIndent2 = row[0][0:3]
        if checkIndent == "\t" or checkIndent2 == "   ":
            tab = True
        else:
            tab = False

        if not tab:
            curBor = row[0]
            nameSplit = str(row[1].lstrip(' ')).split(' ')
            memFinal.loc[memIndex] = [row[0], nameSplit[0], nameSplit[1], util.convertToSQLDate(row[3]), row[2]]
            memIndex += 1
        elif tab:
            # some entries lack check in date (row[2])
            strippedISBN = row[0].lstrip()

            #find cooresponding isbn from loc
            find = (locFinal == strippedISBN).any(axis=1)
            # count which index and thus item it is
            for i in range(len(find)):
                if find[i] == True:
                    item = i
                    break

            if len(row) > 2:
                borFinal.loc[len(borFinal.index)] = [curBor, util.convertToSQLDate(row[1]), util.convertToSQLDate(row[2]), item]
            elif len(row) == 2:
                borFinal.loc[len(borFinal.index)] = [curBor, util.convertToSQLDate(row[1]), 'null', item]

memFinal.to_csv(OUTPUT + 'Members_c.csv', index=False, header=False)
borFinal.to_csv(OUTPUT + 'Borrow_c.csv', index=False, header=False)
print(f"{INPUT} conformed")
