FROM python:3.11-slim-buster
ARG RUNID=default_value
ARG MLFLOW_TRACKING_URI
ARG MLFLOW_TRACKING_USERNAME
ARG MLFLOW_TRACKING_PASSWORD


WORKDIR /
COPY requirements.txt .
RUN pip3 install --upgrade pip
RUN python3 -m venv myvenv
ENV PATH="/myvenv/bin:$PATH"


RUN pip3 install -r requirements.txt

ENV MLFLOW_TRACKING_URI=${MLFLOW_TRACKING_URI}
ENV MLFLOW_TRACKING_USERNAME=${MLFLOW_TRACKING_USERNAME}
ENV MLFLOW_TRACKING_PASSWORD=${MLFLOW_TRACKING_PASSWORD}
CMD ["sh", "-c", "mlflow models serve --model-uri runs:/$RUNID/model --no-conda --host 0.0.0.0 --port 80"]


EXPOSE 80