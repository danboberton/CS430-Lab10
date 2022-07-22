import pandas as pd
import csv

# author-conform must run first!!!

INPUT = '../rawData/Publisher.csv'
OUTPUT = '../conformedData/'
CONTACT_FILE = 'Contact_c.csv'

pubFinal = pd.DataFrame(columns = ['PubID', 'name'])
pubListFinal = pd.DataFrame(columns=['list', 'PubID', 'phone'])
contFinal = pd.read_csv(OUTPUT + CONTACT_FILE, keep_default_na=False, header=None)

pubIndex = -1
pubListIndex = 0

with open(INPUT, newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=',')
    curPub = None
    for row in reader:
        pubIndex += 1
        hIndex = 0
        for item in row:
            # PubID
            if hIndex == 0:
                curPub = item
                pubFinal.loc[pubIndex, 'PubID'] = item
                hIndex += 1
            # Publisher Name
            elif hIndex == 1:
                pubFinal.loc[pubIndex, 'name'] = item.strip()
                hIndex += 1
            elif hIndex > 1:
                split = str(item.lstrip(' ')).split(' ')
                contFinal.loc[len(contFinal.index)] = [split[0], split[1]]
                pubListFinal.loc[pubListIndex] = [pubListIndex, curPub, split[0]]
                pubListIndex += 1


pubFinal.to_csv(OUTPUT + 'Published_c.csv', index=False, header=False)
contFinal.to_csv(OUTPUT + CONTACT_FILE, index=False, header=False)
pubListFinal.to_csv(OUTPUT + 'PubList_c.csv', index=False, header=False)
print(f"{INPUT} conformed")
