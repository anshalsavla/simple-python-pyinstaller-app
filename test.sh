source ../jenkins_env/bin/activate
pip install pytest
py.test --verbose --junit-xml test-reports/results.xml sources/test_calc.py
deactivate
