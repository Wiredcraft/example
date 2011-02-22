#!/bin/sh
CHECKOUT="no"
if [ ! -d modules ]; then
  if [ ! -d themes ]; then
    CHECKOUT="yes";
  fi
fi

drush make --no-core --contrib-destination=. config/example.make

if [ $CHECKOUT = "yes" ]; then
    echo "Shall we checkout themes and modules now? [y/N]: \c";
    read SELECTION;
    if [ $SELECTION = "y" ]; then
      git checkout themes modules;
      echo "done";
    fi
fi
