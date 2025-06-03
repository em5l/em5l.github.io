@echo on

:: Step 1: Go to the Jekyll site directory
cd /d "C:\Users\UnalD\Desktop\Github\home" || exit /b 1

:: Step 2: Clean previous build (optional)
rmdir _site /s /q

:: Step 3: Build the Jekyll site
call jekyll build || exit /b 1

:: Step 4: Copy _site contents to EMSLAB repo
xcopy _site\* "C:\Users\UnalD\Desktop\Github\EMSLAB" /s /e /y || exit /b 1

:: Step 5: Go to the EMSLAB GitHub repo directory
cd /d "C:\Users\UnalD\Desktop\Github\EMSLAB" || exit /b 1

:: Step 6: Initialize Git if needed
if not exist ".git" (
    git init
    git remote add origin https://github.com/em5l/home
)

:: Step 7: Add, commit, and push
git add --all
git commit -m "Update site contents"
git push origin master

:: Done
echo Site built, copied to EMSLAB, and pushed to GitHub successfully.
pause
