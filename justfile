# start service
up:
	just _check_dot_env
	docker compose up --detach

# pull newest image and start service
update:
	just _check_dot_env
	docker compose up --detach --pull always

# update gravity database
listFeeds:
	docker exec rss2email rss2email list 

# stop service
stop:
	docker compose stop

_check_dot_env:
	test -f .env || echo '.env file not found' || exit 1
