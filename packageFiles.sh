#!/bin/bash

# Set this path to your Lev1 dir
lev1dir="/app/sas/config/mid/Lev1"

backupdir="/tmp/backup"
appdir="$lev1dir/Web/WebAppServer"

doThis()
  {
          cd $appdir
          echo ""
          echo "Working in..."
          pwd

          for dir in  `ls -d1 SASServer*`; do
                  echo "... $dir"

# Setup Section
#                 mkdir -p $dir/sas_webapps/sas.biws.war/WEB-INF/spring-config/
#                 touch $dir/lib/jta.properties
#                 touch $dir/conf/server.xml
#                 touch $dir/sas_webapps/sas.biws.war/WEB-INF/spring-config/messaging-config.xml

# Backup Section
                mkdir -p $backupdir/$dir

                find $dir/lib  -name 'jta.properties' -exec cp "{}" $backupdir/$dir/ \;
                find $dir/conf  -name 'server.xml' -exec cp "{}" $backupdir/$dir/ \;
                find $dir  -name 'messaging-config.xml' -exec cp "{}" $backupdir/$dir/ \;

          done
  }

doThis

cd
#pwd

echo ""
echo "This is what was found"
ls $backupdir/*

echo ""
echo "Creating Package ~/atomikos_pkg_`date '+%Y%m%d'`.tar.gz"

tar -C $backupdir -cvzf atomikos_pkg_`date '+%Y%m%d'`.tar.gz .

echo "Done"
