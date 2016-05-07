#!/bin/sh

for i in bin/*; do
    echo $(basename $i) >> footprint.txt
    time -a -o footprint.txt ./$i
done

echo 'Ceylon' >> footprint.txt
time -a -o footprint.txt ceylon run default
# `car` file requires Ceylon runtime to run,
# so we do not measure its disk usage.
echo 'Kotlin' >> footprint.txt
time -a -o footprint.txt java -jar hello.jar
du -h hello.jar >> footprint.txt
echo 'Swift' >> footprint.txt
time -a -o footprint.txt ./hello-swift
du -h hello-swift >> footprint.txt
echo 'Go' >> footprint.txt
time -a -o footprint.txt ./hello-go
du -h hello-go >> footprint.txt
echo 'Haskell' >> footprint.txt
time -a -o footprint.txt ./hello-hs
du -h hello-hs >> footprint.txt
echo 'OCaml' >> footprint.txt
time -a -o footprint.txt ./hello-ml
du -h hello-ml >> footprint.txt
