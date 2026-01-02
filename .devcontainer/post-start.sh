#!/bin/bash
set -e

sudo mount --make-rshared /
sudo service k3s start
