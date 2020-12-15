# OpenGenomeBrowser Docker Template

Get OpenGenomeBrowser running in 10 minutes!

1. Download demo database
1. Run docker-compose
1. Create superuser
1. Populate database

## Prerequisites

- [docker](https://docs.docker.com/get-docker/)
- [docker-compose](https://docs.docker.com/compose/install/)

## Download demo database

```bash
./download_demo_db.sh
```

## Run docker-compose

```bash
docker-compose -f production-template.yaml up
```

Open https://localhost/, ignore the self-signed certificate, and you should see the welcome page!

## Create superuser

In a seperate terminal, run

```
# open terminal in docker-container
terminal# docker exec -ti opengenomebrowser_web bash

# log in as user
docker (root)# sudo -u user --preserve-env bash
docker (user)# cd /opengenomebrowser/

# create django administrator account
docker (user)# python manage.py createsuperuser
```

Open https://localhost/admin/ and you should be able to log in with your superuser account. Here, you could create new regular users.

## Populate database

In the terminal from before, run:

```
# import organisms and genomes
docker (user)# python db_setup/manage_ogb.py import-database

# import ortholog annotations
docker (user)# python db_setup/manage_ogb.py import-orthologs

# import pathway maps
docker (user)# python db_setup/manage_ogb.py import-pathway-maps
```

Congratulations, OpenGenomeBrowser is ready! (Example: https://localhost/pathway/?map=kegg-00400&genomes=@tax:root)
