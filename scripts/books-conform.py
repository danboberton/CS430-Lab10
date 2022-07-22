import pandas as pd
import csv
import util

# RUN BEFORE spbooks-conform

INPUT = '../rawData/Book.csv'
OUTPUT = '../conformedData/'
LOCATION = 'Main'

bookFinal = pd.DataFrame(columns=
                         ['isbn', 'title', 'publisher', 'date_published'])
authFinal = pd.DataFrame(columns=
                         ['author', 'book'])
locFinal = pd.DataFrame(columns=['isbn', 'location', 'copies',
                                 'shelf', 'floor', 'copies_avail'])

bookIndex = 0
locIndex = 0

with open(INPUT, newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=',')
    tab = False
    curBook = None
    for row in reader:
        if not tab:
            curBook = row[0].lstrip()
            bookFinal.loc[bookIndex] = [row[0].lstrip(), row[4].lstrip(),
                                        row[5].lstrip(), util.convertToSQLDate(row[6])]

            bookIndex += 1
            locFinal.loc[locIndex] = [row[0].lstrip(), LOCATION, row[1].lstrip(), row[2].lstrip(), row[3].lstrip(), row[1].lstrip()]
            locIndex += 1
            tab = True
        elif tab:
            for item in row:
                authFinal.loc[len(authFinal.index)] = [(item.lstrip()).rstrip(), curBook]
            tab = False

authFinal.to_csv(OUTPUT + 'Authored_c.csv', index=False, header=False)
bookFinal.to_csv(OUTPUT + 'Book_c.csv', index=False, header=False)
locFinal.to_csv(OUTPUT + 'Loc_c.csv', index=False, header=False)
print(f"{INPUT} conformed")
