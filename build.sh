python3 -m venv ../jenkins_env
source ../jenkins_env/bin/activate
python -m py_compile sources/add2vals.py sources/calc.py
deactivate
