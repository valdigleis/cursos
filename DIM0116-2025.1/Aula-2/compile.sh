#!/bin/bash

# Nome do arquivo LaTeX (sem a extensão .tex)
FILENAME="aula"

# Limpeza de arquivos intermediários (se já existirem)
if [ -f "$FILENAME.aux" ]; then
  rm -r "$FILENAME.aux"
fi

if [ -f "$FILENAME.bbl" ]; then
  rm -r "$FILENAME.bbl"
fi

if [ -f "$FILENAME.blg" ]; then
  rm -r "$FILENAME.blg"
fi

if [ -f "$FILENAME.lof" ]; then
  rm -r "$FILENAME.lof"
fi

if [ -f "$FILENAME.log" ]; then
  rm -r "$FILENAME.log"
fi

if [ -f "$FILENAME.out" ]; then
  rm -r "$FILENAME.out"
fi

if [ -f "$FILENAME.toc" ]; then
  rm -r "$FILENAME.toc"
fi

if [ -f "$FILENAME.fdb_latexmk" ]; then
  rm -r "$FILENAME.fdb_latexmk"
fi

if [ -f "$FILENAME.fls" ]; then
  rm -r "$FILENAME.fls"
fi

if [ -f "$FILENAME.snm" ]; then
  rm -r "$FILENAME.snm"
fi

if [ -f "$FILENAME.nav" ]; then
  rm -r "$FILENAME.nav"
fi


# Comandos para compilar usadno lualatex e bibtex
lualatex "$FILENAME.tex"
bibtex "$FILENAME.aux"
lualatex "$FILENAME.tex"
lualatex "$FILENAME.tex"

# Limpeza de arquivos intermediários (ação obrigatória para deixar o diretório "limpo")
rm -r "$FILENAME.aux" "$FILENAME.bbl" "$FILENAME.blg" "$FILENAME.lof" "$FILENAME.log" "$FILENAME.out" "$FILENAME.toc" "$FILENAME.snm" "$FILENAME.nav"


# Limpando subdiretórios
find . -type f -name "*.aux" -exec rm -f {} +

clear

echo " ================================================================ "
echo "                   Sucess... Build Completed!!!                   "
echo " ================================================================ "
