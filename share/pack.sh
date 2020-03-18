#!/bin/bash
list="config data logs"
tar -zcvf ${1:-share}.tgz $list
gpg -c ${1:-share}.tgz
