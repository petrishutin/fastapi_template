FROM python:3.8.10
ENV PYTHONUNBUFFERED 1
WORKDIR /app
RUN pip install --upgrade pip
COPY ./requirements.txt /app
RUN pip install -r requirements.txt
COPY ./app /app
COPY ./scripts/entrypoint.sh /
COPY ./scripts/wait-for-it.sh /
COPY ./tests /tests
ADD ./.env /app/.env
ENV PYTHONPATH=/
