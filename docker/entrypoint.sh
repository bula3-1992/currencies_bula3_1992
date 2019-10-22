#!/bin/bash
set -e

redis-server

if [ "$(id -u)" = '0' ]; then
	chown -R $APP_USER:$APP_USER $APP_PATH /usr/local
	sync
	exec $APP_PATH/docker/gosu $APP_USER "$BASH_SOURCE" "$@"
fi

exec "$@"
