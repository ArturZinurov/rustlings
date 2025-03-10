@echo off
REM This script loops through each subdirectory in the current directory.
REM For each directory, it asks for confirmation to create a Git branch with that name.

echo Branch creation script starting...
echo.

for /D %%d in (*) do (
    echo Found directory: "%%d"
    choice /c YN /m "Create a Git branch named %%d?"
    REM CHOICE returns ERRORLEVEL 2 if N was pressed and 1 if Y was pressed.
    if errorlevel 2 (
        echo Skipping branch creation for %%d.
        echo.
    ) else (
        echo Creating branch %%d...
        REM Creates and checks out the new branch. If you want to push it, you can uncomment the next line.
        git checkout -b "%%d"
        REM To push the new branch to remote, uncomment the following:
        git push -u origin "%%d"
        echo.
    )
)
echo All done.
pause
