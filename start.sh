#!/bin/bash

cd $(dirname $1)
nvim $(basename $1)
