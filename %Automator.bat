@echo off
setlocal

REM Source > Input
set "source=.\assets"
set "destination=.\.csv_toml\In"
if not exist "%destination%" mkdir "%destination%"
for /r "%source%" %%f in (*.csv *.toml) do (
    move "%%f" "%destination%"
)

REM Decompress
pushd .\.csv_toml
python main.py
popd

REM Output > Package
set "source=.\.csv_toml\Out"
set "destination=.\Csv&Toml Assets"
if not exist "%destination%" mkdir "%destination%"
for /r "%source%" %%f in (*.csv *.toml) do (
    move "%%f" "%destination%"
)

REM Source > Input
set "source=.\assets\sc"
set "destination=.\.fla\sc"
if not exist "%destination%" mkdir "%destination%"
for /r "%source%" %%f in (*.sc *.sctx) do (
    move "%%f" "%destination%"
)

REM Convert
pushd .\.fla
python main.py -d sc
popd

REM Output > Package
set "source=.\.fla\sc"
set "destination=.\Fla Assets"
if not exist "%destination%" mkdir "%destination%"
for %%f in ("%source%\*.fla") do (
    move "%%f" "%destination%"
)

REM Output2 > Package
set "source=%LOCALAPPDATA%\Temp"
set "destination=.\SpriteSheets"
if not exist "%destination%" mkdir "%destination%"
for %%f in ("%source%\*.png") do (
    move "%%f" "%destination%"
)

endlocal