
# Entering the folder
cd output/images/

for file in $(find . -name "*.png" -type f)
do	
	echo "Copying ...$file"
	cp $file ../tmp/results/images/$(echo $file | awk -F"/" '{print $NF}')
done

cd ../

cp eyeballer/* tmp/results

sed -i "s#output/images/#results/images/#g" tmp/results/results{.html,.csv}

cd tmp/ && zip -r results.zip results && mv results.zip ../../last
