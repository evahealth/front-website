rm -r ejsout/*

cp -r img/ ejsout/img
cp -r js/ ejsout/js
cp -r scss/ ejsout/scss
cp -r fonts/ ejsout/fonts
cp -r vendors/ ejsout/vendors
cp -r css/ ejsout/css 

ejs-cli -f index.ejs -o ejsout/
ejs-cli -f elements/index.ejs -o ejsout/
ejs-cli -f pricing/index.ejs -o ejsout/