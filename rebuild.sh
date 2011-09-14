#!/bin/bash

drush make --no-core --contrib-destination=temp_all --force-complete config/example.make -y;

if [ ! -d html/sites/all ]; then
	mkdir -p html/sites/all;
fi;

case "$1" in
	-[yY])
		SELECTION="y";
		;;
	*)
		echo -e "Replace all projects? [Y/n]: \c";
		read SELECTION;
		;;
esac

case "$SELECTION" in
	[nN])
		echo "Canceled.";
		;;
	*)
		if [ ! -d temp_all ]; then
			echo "Failed.";
			exit;
		fi;
		echo -e "Replacing all...\c";
		for DIR in `ls temp_all`; do
			if [ ! -d "html/sites/all/$DIR" ]; then
				 mkdir -p "html/sites/all/$DIR";
			fi;
			for SUB_DIR in `ls "temp_all/$DIR"`; do
				if [ -d "html/sites/all/$DIR/$SUB_DIR" ]; then
					 rm -rf "html/sites/all/$DIR/$SUB_DIR";
				fi;
				cp -R "temp_all/$DIR/$SUB_DIR" "html/sites/all/$DIR/";
				echo -e ".\c";
			done;
		done;
		rm -rf temp_all;
		echo "done.";
		;;
esac
