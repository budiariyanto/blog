hugo
mkdir ../budiariyanto.github.io
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
