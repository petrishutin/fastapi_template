up:
		docker-compose up --build

stop:
		docker-compose stop

down:
		docker-compose down

rebuild:
		docker-compose stop app
		docker-compose up --build app

test: down
		docker-compose build
		docker-compose run --rm app /wait-for-it.sh pg:5432 redis:6379 -- pytest ../tests
		docker-compose down
