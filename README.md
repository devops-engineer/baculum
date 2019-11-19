# baculum - web interface for your bacula deployment

Deploy [Baculum Web GUI Tool](https://www.bacula.org/9.4.x-manuals/en/console/Baculum_Web_GUI_Tool.html) on Apache/2.4.25, PHP 7.0.33-0+deb9u3

### Environment variables
    BACULUM_USER    ; optional
    BACULUM_PASSWD  ; optional

* *BACULUM_USER:* Initial user for Baculum auth. (Default: admin)
* *BACULUM_PASSWD:* Initial password for Baculum auth. (Default: admin)

## Run the image as Container

```
docker stop baculum-test ; \
docker container prune -f ; \
docker run --rm -d \
    --name baculum-test \
    -p 9095:9095 \
    -e "BACULUM_USER=some_user" \
    -e "BACULUM_PASSWD=some_passwd" \
    -v $(pwd)/bacula/bconsole.conf:/etc/bacula/bconsole.conf \
    robertranjan/baculum944
```

### Initial Configuration

* Go to  http://<host_ip>:9095/ and complete the wizard.

## Similar/reference projects:
* https://github.com/devops-engineer/docker-baculum
* dockerhub.com - mishik182/baculum:latest
