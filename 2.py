import requests
from bs4 import BeautifulSoup
from urllib.parse import urlparse, urlunparse

search_query = "ai+sbaliyun"
url = f"https://www.google.com/search?q={search_query}"

response = requests.get(url)
soup = BeautifulSoup(response.text, "html.parser")
links = soup.find_all("a")

for link in links:
    href = link.get("href")
    if href.startswith("/url?q="):
        link = href[7:]

        # Parse the URL to extract the main domain and subdirectories
        parsed_url = urlparse(link)
        main_domain = parsed_url.netloc
        subdirectories = parsed_url.path
        query_string = parsed_url.query
        
        # Replace the subdirectories with "index.html"
        modified_url = urlunparse((parsed_url.scheme, main_domain, "/", "", "", ""))
        if query_string:
            modified_url += "?" + query_string
        print(modified_url)
