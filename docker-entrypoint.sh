#!/bin/sh
#
# Basic "docker-entrypoint.sh" to easily override it.
# Keep the following line within your custom docker-entrypoint.sh to preserve functionality
#
exec /tini-entrypoint.sh "$@"
