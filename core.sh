#!/bin/bash

drush make config/core.make temp_html;

if [ ! -d html ]; then
	mkdir html;
fi;

case "$1" in
	-[yY])
		SELECTION="y";
		;;
	*)
		echo -e "Replace html? [Y/n]: \c";
		read SELECTION;
		;;
esac

case "$SELECTION" in
	[nN])
		echo "Canceled.";
		;;
	*)
		if [ ! -d temp_html -o ! -f temp_html/.htaccess ]; then
			echo "Failed.";
			exit;
		fi;
		echo -e "Replacing html...\c";
		DIRS="includes misc modules profiles/minimal profiles/standard profiles/testing scripts themes";
		for DIR in $DIRS; do
			if [ -d "html/$DIR" ]; then
				rm -rf "html/$DIR";
			fi;
		done;
		cp -R temp_html/* html/;
		cp -R temp_html/.htaccess html/;
		rm -rf temp_html;
		echo "done.";
		;;
esac
