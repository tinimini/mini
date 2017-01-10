#!/bin/sh

#
# Add user if provided via environment variables
#
if [ ! -z "$USERID" ]; then
  if [ -z "$USERNAME" ]; then
    USERNAME="tinimini"
  fi
  addgroup -S -g $USERID $USERNAME
  adduser -S -D -H -G $USERNAME -u $USERID $USERNAME
fi

#
# Run CMD as user
#
if [ ! -z "$USERNAME" ]; then
  exec su-exec $USERNAME "$@"
else
  exec "$@"
fi
