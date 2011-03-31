#!/bin/sh

DIRS="contrib developer multilingual performance";
for DIR in $DIRS; do
  if [[ -d "modules/$DIR" ]]; then
    rm -rf "modules/$DIR";
  fi;
done;

DIRS="tao rubik";
for DIR in $DIRS; do
  if [[ -d "themes/$DIR" ]]; then
    rm -rf "themes/$DIR";
  fi;
done;

drush make --no-core --contrib-destination=. config/example.make -y;
