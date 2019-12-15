# Web scraping quotes from "http://quotes.toscrape.com" 
from bs4 import BeautifulSoup
import requests
url = "http://quotes.toscrape.com"
response=requests.get(url)
soup = BeautifulSoup(response.text,"html.parser")

divisions= soup.find_all("span")
for eachquote in divisions:
	print(eachquote.get_text())
