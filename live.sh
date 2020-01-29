BASEDIR=$(dirname "$0")
echo "$BASEDIR"

rm -r $BASEDIR/ejsout/*
rm -r $BASEDIR/ejsout-min/*

cp -r img/ $BASEDIR/ejsout/img
cp -r js/ $BASEDIR/ejsout/js
cp -r scss/ $BASEDIR/ejsout/scss
cp -r fonts/ $BASEDIR/ejsout/fonts
cp -r vendors/ $BASEDIR/ejsout/vendors
cp -r css/ $BASEDIR/ejsout/css 
cp -r 404.html $BASEDIR/ejsout/404.html

ejs-cli -f index.ejs -o $BASEDIR/ejsout/
ejs-cli -f privacy.ejs -o $BASEDIR/ejsout/
ejs-cli -f tos.ejs -o $BASEDIR/ejsout/
ejs-cli -f elements/index.ejs -o $BASEDIR/ejsout/
ejs-cli -f pricing/index.ejs -o $BASEDIR/ejsout/

echo "Minifying html"

html-minifier --collapse-whitespace --remove-comments --minify-css true --minify-js true --minify-urls true --remove-optional-tags --remove-redundant-attributes --remove-script-type-attributes --remove-tag-whitespace --use-short-doctype --input-dir $BASEDIR/ejsout/ --output-dir $BASEDIR/ejsout-min/
echo "Copying residue files"
cp -r $BASEDIR/ejsout/css/* $BASEDIR/ejsout-min/css/
cp -r $BASEDIR/ejsout/js/* $BASEDIR/ejsout-min/js/
cp -r $BASEDIR/ejsout/img/* $BASEDIR/ejsout-min/img/
cp -r $BASEDIR/ejsout/scss/* $BASEDIR/ejsout-min/scss/
cp -r $BASEDIR/ejsout/fonts/* $BASEDIR/ejsout-min/fonts/
cp -r $BASEDIR/ejsout/vendors/* $BASEDIR/ejsout-min/vendors/

echo "Pushing to Google now..."

gsutil -m rsync -r $BASEDIR/ejsout-min gs://evaapp.xyz/