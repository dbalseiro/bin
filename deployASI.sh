#!/bin/bash
set -e

git checkout stage
git merge development
git pull && git push

git checkout master
git merge stage
git pull && git push

git checkout stage_gcaba
git merge master
git pull gcaba stage && git push gcaba HEAD:stage

git checkout master_gcaba
git merge stage_gcaba
git pull gcaba master && git push gcaba HEAD:master

