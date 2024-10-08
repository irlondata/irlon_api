require(RCurl)
# get login information
download_url = "https://irlon.org/services/download.php?time=2020-09-09T00:00:00-04:00/2020-09-16T23:59:59-04:00&tz=est&standard=true&output=csv&pretty=true&qcFilter=true&parameters[]=IRL-FP-WQ+CDOM"

#set credentials
un = "username"
pw = "password"
upw = paste(un, pw, sep = ":")
pw = paste(un, pw, sep = ":")

# download the CSV file
csv_data <- getBinaryURL(download_url, userpwd = upw)

# write the CSV data to a file
con <- file("data.csv", "wb")
writeBin(csv_data, con)
close(con)
print("CSV data downloaded successfully!")
