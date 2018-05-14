#!/bin/bash

nohup bash -c "while [ true ]; do echo 'try connect...'; gluster peer probe $SERVER; sleep 60; done" &

glusterd --no-daemon