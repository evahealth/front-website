cp -r img/ ejsout/img
cp -r js/ ejsout/js
cp -r scss/ ejsout/scss
cp -r fonts/ ejsout/fonts
cp -r vendors/ ejsout/vendors
cp -r css/ ejsout/css 

ejs-cli -f index.ejs -o ejsout/

echo "Pushing to Google now..."
gsutil -m cp -r ejsout gs://evaapp.xyz