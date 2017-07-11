@echo off

REM http://joseoncode.com/2011/11/27/solving-utf-problem-with-jekyll-on-windows/
chcp 65001

cd /d "%~dp0"
REM rmdir _site /s /q
call jekyll build
copy /y README.md.1 _site\README.md
REM git --git-dir=.git --work-tree=_site add --all
REM git --git-dir=.git --work-tree=_site commit -m "autogen: update site"
REM git --git-dir=.git --work-tree=_site push

set REPO=git@github.com:yuliskov/yuliskov.github.io.git

pushd _site

git init
git remote add origin %REPO%
git add -A
git commit -m "autogenerated content"
REM f - force overwrite remote repo
git push -u origin master

popd

REM new branch: sources

git init
git checkout -b sources
git add -A
git commit -m "autogenerated content"
git remote add origin %REPO%
git push -u --set-upstream origin sources

pause