import requests
from bs4 import BeautifulSoup

username = "wyldsoul@gmail.com"
password = "!fireball!@"
login_url = "https://irlon.org/auth/login.php?/services/download.php"
download_url = "https://irlon.org/services/download.php?time=2020-09-09T00:00:00-04:00/2020-09-16T23:59:59-04:00&tz=est&standard=true&output=csv&pretty=true&qcFilter=true&parameters[]=IRL-FP-WQ+CDOM"

s = requests.Session()
# Send a GET request to the login page
response = s.get(login_url)
soup = BeautifulSoup(response.content, 'html.parser')

# set login credentials
login_data = {
    'email': username,
    'password': password,
    'login-btn': 'Login'
}
# login to site
response = s.post(login_url, data=login_data)

# Check if the login was successful
if response.status_code == 200:
    response = s.get(download_url)
    if response.status_code == 200:
        with open("data.csv", "wb") as f:
            f.write(response.content)
        print("CSV data downloaded successfully!")
    else:
        print("Failed to download CSV data. Status code:", response.status_code)
else:
    print("Failed to login. Status code:", response.status_code)