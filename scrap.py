
from bs4 import BeautifulSoup
import requests
import pandas as pd
from datetime import datetime, timedelta


def ceil_dt(dt, delta):
    return dt + (datetime.min - dt) % delta


if __name__ == "__main__":
    now = datetime.now()
    time_of_run = ceil_dt(now, timedelta(minutes=30))

    r = requests.get('https://www.miningrigrentals.com/rigs/equihash')
    soup = BeautifulSoup(r.text, 'lxml')

    current = soup.find_all('h3', {'class': 'title text-primary'})

    available = current[0].text[0:(current[0].text.find('(') - 1)]
    rented = current[1].text[0:(current[1].text.find('(') - 1)]
    last = current[2].text
    last_10 = current[3].text

    mrr = pd.read_csv('shiny/mrr.csv')

    record = [time_of_run.strftime("%m-%d-%Y"), time_of_run.strftime("%H:%M"), available, rented, last, last_10]

    mrr.loc[mrr.shape[0]] = record

    mrr.to_csv("shiny/mrr.csv", index = False)
