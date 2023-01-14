# Run linter
# docker-compose run --rm app sh -c "flake8"

# init django app
# docker-compose run --rm app sh -c "django-admin startproject app ."

docker-compose run --rm app sh -c "python manage.py startapp core"
