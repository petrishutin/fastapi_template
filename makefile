deps:
	pip install --upgrade pip
	pip install -r requirements.txt
	pip install -r requirements-dev.txt

lint:
	black .
	isort .
	flake8
	mypy ./app
	mypy ./tests

check:
	black --check .
	isort --check-only .
	flake8
	mypy ./app
	mypy ./tests

up:
	docker-compose up --build

down:
	docker-compose down

rebuild:
	docker-compose up -d --build app

test:
	pytest -vv -s

build_image:
	docker build --target prod -t application:latest .

push_image: build_image
	docker login
	docker push application:latest
