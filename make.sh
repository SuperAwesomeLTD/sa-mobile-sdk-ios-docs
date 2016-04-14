#!/bin/bash -ex

# common variables
sdk_company="2016, SuperAwesome Ltd"
sdk_theme_folder="themes"
sdk_themeres_folder="themeres"
sdk_theme="satheme"
sdk_aa_domain="AwesomeAds"
sdk_kws_domain="KWS"
sdk_devsuspport="devsupport@superawesome.tv"
sdk_iosmin="iOS 6.0+"
sdk_androidmin="API 11: Android 3.0 (Honeycomb)"
sdk_project="iOS SDK"
sdk_version="3.8.1"
sdk_source="https://github.com/SuperAwesomeLTD/sa-mobile-sdk-ios"
sdk_author="Gabriel Coman"

# goto the source
cd source

# delete old theme
rm -rf $sdk_theme_folder
rm -rf $sdk_themeres_folder

# get and setup new theme
rm -rf sa-docs-sphinx-theme
git clone -b master https://github.com/SuperAwesomeLTD/sa-docs-sphinx-theme.git
mkdir $sdk_theme_folder
mkdir $sdk_theme_folder/$sdk_theme
mkdir $sdk_themeres_folder
cp -rf sa-docs-sphinx-theme/* $sdk_theme_folder/$sdk_theme/
cp sa-docs-sphinx-theme/static/img/* $sdk_themeres_folder/
rm -rf sa-docs-sphinx-theme
cd ../

# create temporary rsource folder
rm -rf rsource
mkdir rsource
cp -rf source/* rsource

# replace variables in rsource
cd rsource
sed -i sedbak "s|<sdk_company>|$sdk_company|g" *.*
sed -i sedbak "s|<sdk_theme_folder>|$sdk_theme_folder|g" *.*
sed -i sedbak "s|<sdk_themeres_folder>|$sdk_themeres_folder|g" *.*
sed -i sedbak "s|<sdk_theme>|$sdk_theme|g" *.*
sed -i sedbak "s|<sdk_aa_domain>|$sdk_aa_domain|g" *.*
sed -i sedbak "s|<sdk_kws_domain>|$sdk_kws_domain|g" *.*
sed -i sedbak "s|<sdk_devsuspport>|$sdk_devsuspport|g" *.*
sed -i sedbak "s|<sdk_iosmin>|$sdk_iosmin|g" *.*
sed -i sedbak "s|<sdk_androidmin>|$sdk_androidmin|g" *.*
sed -i sedbak "s|<sdk_project>|$sdk_project|g" *.*
sed -i sedbak "s|<sdk_version>|$sdk_version|g" *.*
sed -i sedbak "s|<sdk_source>|$sdk_source|g" *.*
sed -i sedbak "s|<sdk_author>|$sdk_author|g" *.*
find . -name "*.*sedbak" -print0 | xargs -0 rm
cd ../

# finally make the sphinx doc and cleanup
make -f Makefile html
rm -rf rsource
