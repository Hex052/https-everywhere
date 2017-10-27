#!/bin/sh

# Merge all the .xml rulesets into a single "default.rulesets" file -- this
# prevents inodes from wasting disk space, but more importantly, works around
# the fact that zip does not perform well on a pile of small files.

python2.7 ./utils/merge-rulesets.py

RULESETS=chrome/content/rules/default.rulesets

# We make default.rulesets at build time, but it shouldn't have a variable timestamp.
touch -r src/install.rdf src/$RULESETS
