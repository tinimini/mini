# Tini Mini

Tiniest Docker Image based on `alpine` with [tini](https://github.com/krallin/tini) inside and [su-exec](https://github.com/ncopa/su-exec)
to run services inside safely within a `non-root` approach.

## Why `tini`?

See [tini](https://github.com/krallin/tini#why-tini) `Why?` section.
See also [this comment](https://github.com/krallin/tini/issues/8#issuecomment-146135930) for a detailed explanation.

## Why `su-exec`?

`su-exec` does more or less exactly the same thing as `gosu` but it is only 10kb instead of 1.8MB.
See [gosu](https://github.com/tianon/gosu#why) `Why?` section.

## Usage

Run with user id `500`:

    $ docker run -it -e USERID=500 tini/mini

Override the `username`:

    $ docker run -it -e USERID=999 -e USERNAME=postgres tini/mini

## Extending

**Dockerifle**

    FROM tini/mini
    RUN apk add --no-cache postgresql

    ENV PGDATA /var/lib/postgresql/data
    ENV USERNAME postgres

    COPY docker-entrypoint.sh /
    CMD ["postgres"]

**docker-entrypoint.sh**

    #!/bin/sh
    su-exec postgres initdb $PGDATA
    exec /tini-entrypoint.sh "$@"

## Supported Environment Variables

* `USERID` - Creates a user with this integer id.
* `USERNAME` - If `USERID` provided a user with this name will be created. Default `tinimini`
