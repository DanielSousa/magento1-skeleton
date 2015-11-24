#!/usr/bin/env bash

find . -type l -exec unlink {} \;
ln -sf dev/storage storage
ln -sf ../storage/media htdocs/media
ln -sf ../storage/var htdocs/var
ln -sf ../storage/sitemap htdocs/sitemap
ln -sf ../../../storage/etc/local.xml htdocs/app/etc/local.xml
cd .modman
modman deploy-all