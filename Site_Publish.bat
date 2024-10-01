@echo on
cd /d "%~dp0" || exit /b 1

rmdir _site /s /q || exit /b 1
call jekyll build || exit /b 1

:: Copy contents of _site to the specified directory
xcopy _site\* "C:\Users\UnalWindows\Desktop\Elektromekanik Website\Documents" /s /e /y

:: Change to the target directory
cd "C:\Users\UnalWindows\Desktop\Elektromekanik Website\Documents" || exit /b 1

:: Initialize git if not already initialized
if not exist ".git" (
    git init
    git remote add origin <https://github.com/em5l/home>  :: Replace with your actual GitHub repository URL
)

:: Add, commit, and push changes
git add --all
git commit -m "Update site contents"
git push origin master  :: Adjust the branch name if necessary

echo Site built, copied, and pushed successfully.
