FROM jupyter/datascience-notebook

ARG PIP_PARAMS

USER root

RUN apt-get update && \
    apt-get install -y python3-dev gcc libxml2-dev libxslt-dev musl-dev build-essential libpq-dev

WORKDIR /home/jovyan/work

COPY requirements* .
RUN echo "Running pip install with params: ${PIP_PARAMS}" && \
    pip install ${PIP_PARAMS} -r requirements.txt

# instead of copying, bind dirs when running
# COPY . .
