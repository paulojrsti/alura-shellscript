#!/bin/bash

converteImagem() {
    local caminho_imagem=$1
    local imagem_sem_extensao=$(ls $caminho_imagem | awk -F. '{ print $1 }')
    sips -s format png $imagem_sem_extensao.jpg --out $imagem_sem_extensao.png
}

varrerDiretorio() {    
    cd $1
    for arquivo in *
    do  
        local caminho_arquivo=$(find ~/Documents/cursoshell/imagens-novos-livros -name $arquivo)
        if [ -d $caminho_arquivo ]
        then    
            varrerDiretorio $caminho_arquivo
        else
            converteImagem $caminho_arquivo
        fi
    done
}

varrerDiretorio ~/Documents/cursoshell/imagens-novos-livros

if [ $? -eq 0 ]
then
    echo "Conversão realizada com sucesso"
else
    echo "Houve uma falha no processo de conversão"
fi
