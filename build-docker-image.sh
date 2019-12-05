date_stamp=$(date +%d%b%y.%H%M)
docker build -f 9.4.4/Dockerfile -t baculum944:${date_stamp} .
