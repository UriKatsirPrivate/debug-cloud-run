python3 -m venv myenv
source myenv/bin/activate
pip3 install -r requirements.txt
python3 app.py
deactivate
rm -rf myenv
