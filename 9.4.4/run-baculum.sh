docker stop baculum-test ; \
docker container prune -f ; \
docker run -d \
    --name baculum-test \
    -p 9095:9095 \
    -p 9096:9096 \
    -p 8080:80 \
    -e "BACULUM_USER=admin" \
    -e "BACULUM_PASSWD=admin" \
    -v /etc/bacula:/etc/bacula \
    baculum:944.3