@echo off
set /p item_name=Digite o nome do arquivo ou pasta a ser ignorado e excluído: 

REM Verifica se o item fornecido é um arquivo ou pasta
IF EXIST "%item_name%" (
  REM Exclui a pasta ou arquivo do histórico de commits
  git rm -r --cached "%item_name%"
) ELSE (
  REM Exclui o arquivo do histórico de commits
  git rm --cached "%item_name%"
)

REM Adiciona o item ao arquivo .gitignore
echo %item_name% >> .gitignore

REM Cria um novo commit
git commit -m "Remover %item_name%"

REM Atualiza o repositório remoto
git push origin main --force

pause
