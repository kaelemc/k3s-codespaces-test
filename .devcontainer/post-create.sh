#!/bin/bash
mount --make-rshared /
ln -sf /host-docker.sock /var/run/docker.sock