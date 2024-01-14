FROM python:3.11-slim-buster
ARG RUNID=default_value
WORKDIR /
COPY requirements.txt .
RUN pip3 install --upgrade pip
RUN python3 -m venv myvenv
ENV PATH="/myvenv/bin:$PATH"


RUN pip3 install -r requirements.txt

ENV MLFLOW_TRACKING_URI=https://dagshub.com/nsd8888/mlops-mlflow.mlflow
ENV MLFLOW_TRACKING_USERNAME=nsd8888
ENV MLFLOW_TRACKING_PASSWORD=4ba6357cf461a8fb63f8bd0a797cf96be9d75932
CMD ["sh", "-c", "mlflow models serve --model-uri runs:/$RUNID/model --no-conda --host 0.0.0.0 --port 80"]


EXPOSE 80