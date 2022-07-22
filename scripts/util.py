import datetime

def convertToSQLDate(input):
    index = 0
    stripped = input.lstrip()
    split = stripped.split('/')
    day = int(split[1])
    month = int(split[0])
    year = int(split[2])
    dateObj = datetime.date(year, month, day)
    output = dateObj.strftime("%Y-%m-%d")
    return output


