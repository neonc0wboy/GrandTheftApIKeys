import requests
from bs4 import BeautifulSoup

search_query = "ai+sbaliyun"
url = f"https://www.google.com/search?q={search_query}"

response = requests.get(url)
soup = BeautifulSoup(response.text, "html.parser")
links = soup.find_all("a")

for link in links: 
    href = link.get("href")
    if href.startswith("/url?q="): 
        link = href[7:] 
        print(link)
