hugo
rm -rf ../budiariyanto.github.io/*
cp -R public/* ../budiariyanto.github.io/
cd ../budiariyanto.github.io/
git add .
git commit -m "update site"
git push origin master
echo "Sync complete"
