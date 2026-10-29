#!/bin/bash
set -e

# download demo folder_structure (folder structure version 3)
if [[ -d ./arx_container/folder_structure ]]; then
    echo 'Folder "folder_structure" already exists. Remove it if you want to download again.'
else
    if ! command -v zstd > /dev/null; then
        echo 'Please install zstd first, e.g. "sudo apt install zstd".'
        exit 1
    fi
    echo "Download demo folder_structure..."
    wget https://cloud.bioinformatics.unibe.ch/public.php/dav/files/9C4sy5ZZg8iJ5GM -O folder_structure.tar.zst \
        || { rm -f folder_structure.tar.zst; exit 1; }
    echo "Unpack demo folder_structure"
    zstd -dc folder_structure.tar.zst | tar -x ./arx_container/folder_structure
    rm folder_structure.tar.zst
fi

# run docker-compose
echo
echo "Ready! Now you may run:"
echo "docker login docker.abrinca.com"
echo "docker compose -f production.yaml up"
