rm -r ejsout/*
rm -r ejsout-min/*

cp -r img/ ejsout/img
cp -r js/ ejsout/js
cp -r scss/ ejsout/scss
cp -r fonts/ ejsout/fonts
cp -r vendors/ ejsout/vendors
cp -r css/ ejsout/css 

ejs-cli -f index.ejs -o ejsout/
ejs-cli -f privacy.ejs -o ejsout/
ejs-cli -f tos.ejs -o ejsout/
ejs-cli -f elements/index.ejs -o ejsout/

echo "Minifying html"

html-minifier --collapse-whitespace --remove-comments --minify-css true --minify-js true --minify-urls true --remove-optional-tags --remove-redundant-attributes --remove-script-type-attributes --remove-tag-whitespace --use-short-doctype --input-dir ejsout/ --output-dir ejsout-min/
echo "Copying residue files"
cp -r ejsout/css/* ejsout-min/css/
cp -r ejsout/js/* ejsout-min/js/
cp -r ejsout/img/* ejsout-min/img/
cp -r ejsout/scss/* ejsout-min/scss/
cp -r ejsout/fonts/* ejsout-min/fonts/
cp -r ejsout/vendors/* ejsout-min/vendors/