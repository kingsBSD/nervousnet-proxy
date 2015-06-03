#!/bin/bash

pid=`ps aux | grep proxy.jar | awk '{print $2}'`
kill -9 $pid
