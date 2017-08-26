hugo

if [ ! -d ../budiariyanto.github.io ]; then
    git clone git@github.com:budiariyanto/budiariyanto.github.io ../budiariyanto.github.io
fi

rm -rf ../budiariyanto.github.io/*
cp -R public/* ../budiariyanto.github.io/
git add content/post/*.md
git commit -m "Add articles"
git push origin master
cd ../budiariyanto.github.io/
git add .
git commit -m "update site"
git push origin master
echo "Sync complete"
