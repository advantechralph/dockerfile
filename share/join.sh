#!/bin/bash
cat "${1:-share.tgz.gpg}".part* >> "${1:-share.tgz.gpg}".joined
