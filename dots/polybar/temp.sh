#!/bin/bash
a=`sensors | grep "Core 0"`
echo ${a:15:7}
