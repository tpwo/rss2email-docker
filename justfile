# start service
up:
	just _check_dot_env
	docker compose up --detach

# after adding new feeds, register them in db, so there won't be email spam
update:
	just _check_dot_env
	docker compose run --remove-orphans rss2email cron -send=false user@example.com

# list feeds
listFeeds:
	docker compose exec rss2email rss2email list

# add a new feed
addFeed feed:
	docker compose exec rss2email rss2email add {{feed}}

# delete a feed
deleteFeed feed:
	docker compose exec rss2email rss2email delete {{feed}}

# show errors from the last 24h
showErrors:
	docker compose logs rss2email --since 24h | grep error || exit 0

# run a custom command in the running container
command +cmd:
	docker compose exec rss2email {{cmd}}

# apply yt template to all yt feeds
applyYtTemplate:
	cat state/feeds.txt | awk '/^https:\/\/www\.youtube\.com\/feeds\/videos\.xml/ { \
	    print; \
	    getline nextLine; \
	    if (nextLine != " - template: templates/youtube.tmpl") { \
		print " - template: templates/youtube.tmpl"; \
	    } else { \
		print nextLine; \
	    } \
	    next; \
	}  \
	{ print }'

# stop service
stop:
	docker compose stop

_check_dot_env:
	test -f .env || echo '.env file not found' || exit 1
