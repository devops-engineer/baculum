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
		~/github/baculum (master) $ docker image ls
			REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
			baculum             18nov2019.1         c2bacebd67ea        23 hours ago        350MB
			debian              stretch             4f5edfdf153f        4 weeks ago         101MB
		~/github/baculum (master) $ docker image save -o baculum.20nov2019.1.tar baculum:18nov2019.1

		~/github/baculum (master) $ ll
			total 730736
			-rw-r--r--  1 robertrt  staff    18K Nov 19 07:38 LICENSE
			drwxr-xr-x  7 robertrt  staff   224B Nov 19 07:39 9.4.4
			-rw-r--r--  1 robertrt  staff   1.9K Nov 19 07:57 README.md
			-rw-------  1 robertrt  staff   346M Nov 20 07:14 baculum.20nov2019.1.tar

```
## Load image from a tar file
```
		~/github/baculum (master) $ docker image load -i baculum.20nov2019.1.tar
			Loaded image: baculum:18nov2019.1
```

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

* Go to  http://<host_ip>:9095/ and complete the wizard. Use BACULUM_USER & BACULUM_PASSWD to login.

## Similar/reference projects:
* https://github.com/devops-engineer/docker-baculum
* dockerhub.com - mishik182/baculum:latest
* https://hub.docker.com/r/fametec/baculum [ https://github.com/fametec/bacula ]


## Todo

Upgrade baculula components on baculum image to latest release 9.4.4

How to install? 

doc link - https://blog.bacula.org/whitepapers/CommunityInstallationGuide.pdf

Install on deb:

```
cd /tmp
wget https://www.bacula.org/downloads/Bacula-4096-Distribution-Verification-key.asc
apt-key add Bacula-4096-Distribution-Verification-key.asc
rm Bacula-4096-Distribution-Verification-key.asc   
# Bacula Community
deb [arch=amd64] http://www.bacula.org/packages/@access-key@/debs/@bacula-version@ /@ubuntu-version@/amd64/   @ubuntu-version@ main
```

Official documentation:

* Deploy [Baculum Web GUI Tool](https://www.bacula.org/9.4.x-manuals/en/console/Baculum_Web_GUI_Tool.html) on Apache/2.4.25, PHP 7.0.33-0+deb9u3