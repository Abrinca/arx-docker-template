#!/bin/bash

# download demo folder_structure
if [[ -d ./folder_structure ]]; then
  echo 'Folder "folder_structure" already exists. Remove it if you want to download again.'
else
  echo "Download demo folder_structure..."
  curl https://cloud.bioinformatics.unibe.ch/index.php/s/DYNrQZZTrCtYHfW/download/folder_structure.tar.xz -o folder_structure.tar.xz
  echo "Unpack demo folder_structure"
  tar -xf folder_structure.tar.xz
  rm folder_structure.tar.xz
fi

# run docker-compose
echo "ready! run 'docker-compose -f production-template.yaml up'"
