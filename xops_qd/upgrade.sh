rm -rf ./dist
rm -rf /var/www
npm run build
cp -r ./dist /var/www
