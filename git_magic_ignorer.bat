@echo off

:loop
set /p item_name=Digite o nome do arquivo ou pasta a ser ignorado e excluído (ou pressione Enter para sair): 

REM Verifica se o usuário pressionou Enter sem digitar um nome
IF "%item_name%"=="" (
  exit /b
)

REM Verifica se o item fornecido existe
IF NOT EXIST "%item_name%" (
  echo O arquivo ou pasta "%item_name%" não existe. Por favor, tente novamente.
  goto loop
)

REM Exclui a pasta ou arquivo do histórico de commits
IF EXIST "%item_name%\." (
  git rm -r --cached "%item_name%"
) ELSE (
  git rm --cached "%item_name%"
)

REM Adiciona o item ao arquivo .gitignore
echo %item_name% >> .gitignore

REM Cria um novo commit
git commit -m "Remover %item_name%"

REM Atualiza o repositório remoto
git push origin main --force

goto loop
