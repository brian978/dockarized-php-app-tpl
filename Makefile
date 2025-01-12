default:
	echo "Please select a valid option"

install:
	sh scripts/install_laravel.sh

reinstall:
	docker-compose down -v
	sh scripts/install_laravel.sh
	sh scripts/run.sh

start:
	sh scripts/run.sh

stop:
	docker-compose stop

clean:
	docker-compose down -v

restart:
	docker-compose stop
	sh scripts/run.sh

cli:
	docker-compose run --rm -it app /bin/bash

vite:
	docker-compose run --rm -it -p "5173:5173" app /bin/bash -c 'npm install && npm run dev -- --host'
