#!/bin/bash -l
source jenkins_env/bin/activate
pip install pyinstaller
pyinstaller --onefile sources/add2vals.py
deactivate
rm -r jenkins_env
