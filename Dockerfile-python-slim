FROM python:3.10-slim

# Allow statements and log messages to immediately appear in the Knative logs
ENV PYTHONUNBUFFERED True

# Copy local code to the container image.
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./
# COPY . .

# Optional: Upgrade pip version
# RUN pip3 install --upgrade pip

# Install required libraries
RUN pip3 install -r requirements.txt

ENTRYPOINT ["python", "app.py"]

CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 app:app
# CMD gunicorn --bind :$PORT app:app