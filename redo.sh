#!/bin/bash
echo "STEP 1. UPDATING HWNORM1C FILE."
cd ../hwnorm1 || exit 1
git pull --ff-only origin main || exit 1
cp sanhw1/hwnorm1c.txt ../cologne-stardict/input/hwnorm1c.txt

echo "STEP 2. UPDATING CSL-ORIG REPOSITORY."
cd ../csl-orig || exit 1
git pull --ff-only origin main || exit 1

echo "STEP 3. CREATING BABYLON FILES AFRESH."
cd ../cologne-stardict || exit 1
dictList=(acc ae ap ap90 ben bhs bop bor bur cae ccs gra gst ieg inm krm mci md mw mw72 mwe pd pe pgn pui pw pwg sch shs skd snp stc vcp vei wil yat lan armh)
for Val in "${dictList[@]}"
do
	echo 'Started' $Val 'handling'.
	python2 make_babylon.py $Val 1
done

echo "STEP 4. CONVERTING BABYLON TO JSON."
cd ../csl-json || exit 1
for Val in "${dictList[@]}"
do
	echo 'Started' $Val 'handling'.
	python2 json_from_babylon.py $Val
done

