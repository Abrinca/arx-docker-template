# OpenGenomeBrowser Docker Template

Get OpenGenomeBrowser running in 10 minutes!

1. Clone this repo
1. Download demo database
1. Run docker-compose
1. Create superuser
1. Populate database

## Prerequisites

- [docker](https://docs.docker.com/get-docker/)
- [docker-compose](https://docs.docker.com/compose/install/)

Note: ensure you have a **current** version of docker! System repositories tend to be out of date!

## Clone this repo

```bash
git clone https://github.com/opengenomebrowser/opengenomebrowser-docker-template.git
cd opengenomebrowser-docker-template
```

## Download demo database

```bash
./download_demo_db.sh
```

## Run docker-compose

```bash
docker-compose -f production-template.yaml up
```

Open https://localhost/, ignore the self-signed certificate, and you should see the welcome page!

## Open a terminal in the container

In a seperate terminal, run:

```bash
# open terminal in docker-container
docker exec -ti opengenomebrowser_web bash

# log in as user
$docker (root)# sudo -u user --preserve-env bash
```

## Create superuser

In the terminal from before, run:

```bash
# create django administrator account
$docker (user)# python manage.py createsuperuser
```

Open https://localhost/admin/ and you should be able to log in with your superuser account. Here, you could create new regular users.

## Populate database

In the terminal from before, run:

```bash
# import organisms and genomes
$docker (user)# python db_setup/manage_ogb.py import-database

# import ortholog annotations
$docker (user)# python db_setup/manage_ogb.py import-orthologs

# import pathway maps
$docker (user)# python db_setup/manage_ogb.py import-pathway-maps
```

Congratulations, OpenGenomeBrowser is ready! (Example: https://localhost/pathway/?map=kornec00400&g1=@tax:root)

## Get ready for production

- Replace the certificates in `nginx/certs` with proper ones
- Adapt `nginx/nginx.conf` accordingly
- Change the `production-template.env`:
  - add your own `DJANGO_SECRET_KEY` (generate one using bash: `$(date | sha256sum | base64 | head -c 60)`)
  - change `DJANGO_ALLOWED_HOSTS` to your domain (e.g. opengenomebrowser.bioinformatics.unibe.ch)
  - ensure `USER_ID` and `GROUP_ID` are correct. It mostly influences the permissions a file created by OpenGenomeBrowser will have. This is the command to get the current users uid/gid: `id -u`/`id -g`.
  
  
