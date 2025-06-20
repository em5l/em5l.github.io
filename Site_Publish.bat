:: Step 1: Go to the Jekyll site directory
cd /d "C:\Users\UnalD\Desktop\Github\EMSLAB" || exit /b 1

:: Step 2: Clean previous build (optional)
rmdir _site /s /q

:: Step 3: Build the Jekyll site
call bundle exec jekyll build || exit /b 1

:: Step 4: Copy _site contents to EMSLAB repo
xcopy _site\* "C:\Users\UnalD\Desktop\Github\home"/s /e /y || exit /b 1
)