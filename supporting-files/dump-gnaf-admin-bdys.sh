#!/usr/bin/env bash

# set this to taste - NOTE: can't use "~" for your home folder
output_folder="/Users/hugh.saalmans/tmp"

/Applications/Postgres.app/Contents/Versions/9.6/bin/pg_dump -Fc -d geo -n gnaf_201805 -p 5432 -U postgres -f ${output_folder}/gnaf-201805.dmp
echo "GNAF schema exported to dump file"

/Applications/Postgres.app/Contents/Versions/9.6/bin/pg_dump -Fc -d geo -n admin_bdys_201805 -p 5432 -U postgres -f ${output_folder}/admin-bdys-201805.dmp
echo "Admin Bdys schema exported to dump file"

## OPTIONAL - copy files to AWS S3 and allow public read access (requires awscli installed)
#cd ${output_folder}
#
#for f in *-201805.dmp;
#  do
#    aws --profile=default s3 cp --storage-class REDUCED_REDUNDANCY ./${f} s3://minus34.com/opendata/psma-201805/${f};
#    aws --profile=default s3api put-object-acl --acl public-read --bucket minus34.com --key opendata/psma-201805/${f}
#  done
