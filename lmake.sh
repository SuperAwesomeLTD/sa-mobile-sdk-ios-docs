#!/bin/bash -ex

sdk_theme_folder=$(cat buildata.json | jq -r '.theme.folder')
sdk_themeres_folder=$(cat buildata.json | jq -r '.theme.res')
sdk_theme=$(cat buildata.json | jq -r '.theme.name')
sdk_project=$(cat buildata.json | jq -r '.project.name')
sdk_domain=$(cat buildata.json | jq -r '.project.domain')
sdk_author=$(cat buildata.json | jq -r '.project.author')
sdk_min=$(cat buildata.json | jq -r '.project.min')
sdk_source=$(cat buildata.json | jq -r '.project.source')
sdk_support=$(cat buildata.json | jq -r '.company.support')
sdk_current_version=$(cat buildata.json | jq -r '.current')
sdk_versions=$(cat buildata.json | jq -c -r '.versions[]')

# get the version string
version_string=""
for version in ${sdk_versions[@]};
do version_string+="u'$version', "; echo $version_string > out.dat; done

full_version_string=$(cat out.dat)
full_version_string="[ $full_version_string ]"
rm out.dat

for version in ${sdk_versions[@]};
do
	if [ -d versions/$version ]
	then
		# copy makefile
		cp Makefile versions/$version

		# goto version folder
		cd versions/$version

		# goto source folder
		cd source

		# download latest theme
		rm -rf $sdk_theme_folder
		rm -rf $sdk_themeres_folder
		rm -rf sa-docs-sphinx-theme
		git clone -b master git@github.com:SuperAwesomeLTD/sa-docs-sphinx-theme.git
		mkdir $sdk_theme_folder
		mkdir $sdk_theme_folder/$sdk_theme
		mkdir $sdk_themeres_folder
		cp -rf sa-docs-sphinx-theme/* $sdk_theme_folder/$sdk_theme/
		cp sa-docs-sphinx-theme/static/img/* $sdk_themeres_folder/
		rm -rf sa-docs-sphinx-theme
		cd ../

		# create temporary source folder
		rm -rf rsource
		mkdir rsource

		# copy all the source there
		cp -rf source/* rsource

		# replace variables in rsource
		cd rsource
		sed -i.sedbak "s|<sdk_project>|$sdk_project|g" *.*
		sed -i.sedbak "s|<sdk_author>|$sdk_author|g" *.*
		sed -i.sedbak "s|<sdk_domain>|$sdk_domain|g" *.*
		sed -i.sedbak "s|<sdk_source>|$sdk_source|g" *.*
		sed -i.sedbak "s|<sdk_version_ios>|$version|g" *.*
		sed -i.sedbak "s|<full_version_string>|$full_version_string|g" *.*
		sed -i.sedbak "s|<sdk_theme_folder>|$sdk_theme_folder|g" *.*
		sed -i.sedbak "s|<sdk_devsuspport>|$sdk_support|g" *.*
		sed -i.sedbak "s|<sdk_min>|$sdk_min|g" *.*
		sed -i.sedbak "s|<sdk_themeres_folder>|$sdk_themeres_folder|g" *.*
		sed -i.sedbak "s|<sdk_theme>|$sdk_theme|g" *.*
		find . -name "*.*sedbak" -print0 | xargs -0 rm
		cd ..

		# make the build
		make -f Makefile html

		# clear
		rm -rf rsource

		# go back
		cd ../..
	fi
done
