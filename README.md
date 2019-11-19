# baculum - web interface for your bacula deployment

## Build image
```

    docker build -t baculum:18nov2019.1 .
    ...
    ...
    ...
    Creating config file /etc/bacula/scripts/make_catalog_backup with new version
    invoke-rc.d: could not determine current runlevel
    invoke-rc.d: policy-rc.d denied execution of start.
    Setting up bacula-server (7.4.4+dfsg-6) ...
    Processing triggers for libc-bin (2.24-11+deb9u4) ...
    Removing intermediate container f129a3a5814d
    ---> 25106f07dffe
    Step 6/7 : COPY bashrc /root/.bashrc
    ---> 59430923d603
    Step 7/7 : CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
    ---> Running in 26ef6f842eae
    Removing intermediate container 26ef6f842eae
    ---> c2bacebd67ea
    Successfully built c2bacebd67ea
    Successfully tagged baculum:18nov2019.1

```
## Export/save image to a tar file
```
    docker save -o baculum.18nov2019.1.tar 
```
## Load image from a tar file
```
    docker load -i baculum.18nov2019.1.tar 
```

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
