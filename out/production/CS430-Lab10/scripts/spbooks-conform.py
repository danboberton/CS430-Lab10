import pandas as pd
import csv
import util

INPUT = '../rawData/BooksInSP.csv'
OUTPUT = '../conformedData/'
LOCATION = 'South Park'
CONCAT_BOOKS = 'Book_c.csv'
CONCAT_LOC = 'Loc_c.csv'
CONCAT_AUTH = 'Authored_c.csv'

bookFinal = pd.read_csv(OUTPUT + CONCAT_BOOKS, keep_default_na=False, header=None)
bookFinal.columns = ['isbn', 'title', 'publisher', 'date_published']
authFinal = pd.read_csv(OUTPUT + CONCAT_AUTH, keep_default_na=False, header=None, dtype=str)
authFinal.columns = ['author', 'book']
locFinal = pd.read_csv(OUTPUT + CONCAT_LOC, keep_default_na=False, header=None)

bookIndex = len(bookFinal.index)
authIndex = len(authFinal.index)
locIndex = len(locFinal.index)

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

# Remove Duplicates from Books and Authored
prebook = len(bookFinal.index)
preAuth = len(authFinal.index)
bookFinal = bookFinal.drop_duplicates(subset='isbn', ignore_index=True)
print(f"{prebook - len(bookFinal.index)} duplicates dropped from Book")
authFinal = authFinal.drop_duplicates(ignore_index=True)
print(f"{preAuth - len(authFinal.index)} duplicates dropped from Authored")

authFinal.to_csv(OUTPUT + 'Authored_c.csv', index=False, header=False)
bookFinal.to_csv(OUTPUT + 'Book_c.csv', index=False, header=False)
# Bug here! index starts at 0, the database needs it to start at 1
locFinal.to_csv(OUTPUT + 'Loc_c.csv', index=True, header=False)
print(f"{INPUT} conformed")
