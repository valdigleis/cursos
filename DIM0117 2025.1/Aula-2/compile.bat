@echo off
set FILENAME=aula

:: Removendo arquivos intermediários se existirem
if exist "%FILENAME%.aux" del /Q "%FILENAME%.aux"
if exist "%FILENAME%.bbl" del /Q "%FILENAME%.bbl"
if exist "%FILENAME%.blg" del /Q "%FILENAME%.blg"
if exist "%FILENAME%.lof" del /Q "%FILENAME%.lof"
if exist "%FILENAME%.log" del /Q "%FILENAME%.log"
if exist "%FILENAME%.out" del /Q "%FILENAME%.out"
if exist "%FILENAME%.toc" del /Q "%FILENAME%.toc"
if exist "%FILENAME%.fdb_latexmk" del /Q "%FILENAME%.fdb_latexmk"
if exist "%FILENAME%.fls" del /Q "%FILENAME%.fls"
if exist "%FILENAME%.snm" del /Q "%FILENAME%.snm"
if exist "%FILENAME%.nav" del /Q "%FILENAME%.nav"

:: Compilação com lualatex e bibtex
lualatex "%FILENAME%.tex"
bibtex "%FILENAME%"
lualatex "%FILENAME%.tex"
lualatex "%FILENAME%.tex"

:: Limpeza de arquivos intermediários se existirem
if exist "%FILENAME%.aux" del /Q "%FILENAME%.aux"
if exist "%FILENAME%.bbl" del /Q "%FILENAME%.bbl"
if exist "%FILENAME%.blg" del /Q "%FILENAME%.blg"
if exist "%FILENAME%.lof" del /Q "%FILENAME%.lof"
if exist "%FILENAME%.log" del /Q "%FILENAME%.log"
if exist "%FILENAME%.out" del /Q "%FILENAME%.out"
if exist "%FILENAME%.toc" del /Q "%FILENAME%.toc"
if exist "%FILENAME%.snm" del /Q "%FILENAME%.snm"
if exist "%FILENAME%.nav" del /Q "%FILENAME%.nav"

:: Limpando subdiretórios
for /r %%f in (*.aux) do del "%%f"

:: Exibindo mensagem de conclusão
echo ================================================================
echo                 Sucess... Build Completed!!!                    
echo ================================================================