#!/usr/bin/env bash
rubber -d breeding-program-en.tex      
rubber -d fish-breeding-program-en.tex
rubber -d national-flag-cn.tex

cnfiles="breeding-program-cn.tex \
         fish-breeding-program-cn.tex \
         genomic-selection.tex"

for i in $cnfiles; do
    xelatex $i
    xelatex $i
done

for i in *.pdf; do
    convert $i -density 75 ${i%.pdf}.png
done

mv *.png ../png

git clean -f
