from flask.ext.rq import job

@job
def saveJSON2Mongo():
    print("Not implemented! SaveJSON2Mongo")

@job
def convertXML2JSON(xmlStr):
    return converter(xmlStr)

@job
def sleepForThreeSeconds():
    import time
    time.sleep(3)
    with open('temp.txt', 'a') as file:
        file.write("Done sleeping for 3 seconds!\n")
