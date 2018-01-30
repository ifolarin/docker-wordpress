#!/bin/bash

#source environment variables
source .env
docker-compose run --rm wp db reset --yes
# change values on this line
docker-compose run --rm wp core install --url=${DOMAIN_NAME} --title="Welcome to ${DOMAIN_NAME}" --admin_user=webadmin --admin_password=${WEB_ADMIN_PASSWORD} --admin_email=hosting@webbasedsol.com
# change value on this line
docker-compose run --rm wp option update blogdescription "This is the tagline."
docker-compose run --rm wp core update
#docker-compose run --rm wp plugin install customizer-theme-resizer jetpack --activate
docker-compose run --rm wp theme update --all
docker-compose run --rm wp plugin update --all
# set your theme choice on this line
#docker-compose run --rm wp theme install https://downloads.wordpress.org/theme/best-reloaded.0.14.0.zip --activate
docker-compose run --rm wp media regenerate --yes
docker-compose run --rm wp rewrite structure '/%year%/%monthnum%/%postname%' --hard
