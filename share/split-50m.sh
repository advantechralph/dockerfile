#!/bin/bash
split -b ${2:-50m} ${1:-share.tgz.gpg} "${1:-share.tgz.gpg}.part"
