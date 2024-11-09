FROM python:3.10-slim

ENV PYTHONUNBUFFERED True
ENV APP_HOME /app

WORKDIR $APP_HOME

RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY . ./

RUN pip install --no-cache-dir .

CMD [ "uvicorn", "openf1.services.query_api.app:app", "--host", "0.0.0.0", "--port", "8000", "--reload" ]
