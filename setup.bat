@echo off
pip install zstandard sc-compression Pillow numpy affine6p colorama lxml ujson
pause >nul
del "%~f0"