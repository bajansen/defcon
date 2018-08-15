#!/bin/bash

# Example: ./run_test.sh unbound

TEST=$1

vagrant --prep up
vagrant --$TEST up

vagrant ssh testrunner -c "/vagrant/test.sh $TEST"
