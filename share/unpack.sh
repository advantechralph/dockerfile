#!/bin/bash
gpg -o- -d "${1:-share.tgz.gpg}".joined | tar -zxvf - -C .
