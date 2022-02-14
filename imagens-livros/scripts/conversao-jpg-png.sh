#!/bin/bash

converteImagem() {
cd /Users/paulojacinto/Documents/cursoshell/imagens-livrosfdfsa
    if [ ! -d png ]
    then
        mkdir png
    fi

    for imagem in *.jpg
    do
        local imagem_sem_extensao=$(ls $imagem | awk -F . '{ print $1 }')
        echo $imagem_sem_extensao
        sips -s format png $imagem_sem_extensao.jpg --out png/$imagem_sem_extensao.png
    done
}

converteImagem 2> erros_conversao.txt
RESULTADO=$?

if [ $RESULTADO -eq 0 ]
then 
    echo "Conversão realizada com sucesso"
else
    echo "Houve uma falha no processo"
fi

echo "Saida do Resultado: " $RESULTADO
