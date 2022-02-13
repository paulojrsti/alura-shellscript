#!/bin/bash

cd /Users/paulojacinto/Documents/cursoshell/imagens-livros
if [ ! -d png ]
then
    mkdir png
fi

for imagem in *.jpg
do
    imagem_sem_extensao=$(ls $imagem | awk -F . '{ print $1 }')
    sips -s format png $imagem_sem_extensao.jpg --out png/$imagem_sem_extensao.png
done
    

