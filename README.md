# Matrix & Fluffychat test environment

To use it, build Fluffychat web and push the build/web directory into
`./fluffychat`.

## Initialization

Add the following line to your `/etc/hosts` file:
```
127.0.0.1  matrix.example.com auth.example.com fluffychat.example.com
```

Before continuing, **choose the branch you need**:
* `step-0-oidc`: default SQLite database with OIDC configured _(default LLNG accounts)_
* `step-1-postgresql`: change database to PostgreSQL
* `step-2-llng-in-db`: use PostgreSQL for both LLNG and Synapse
* `step-3-haproxy`: use haproxy to manage all https servers
* `step-4-scale`: use 3 auth servers 3 synapse servers
* `step-5-backup-and-restore`: scripts to backup and restore the system
* `step-6-root-domain-addresses`: able to deliver @example.com addresses
* `main`: development branch

Then, initialize matrix using [./init.sh](./init.sh) script.

> You should do this at each branch change.

Use the `clean.sh` script to delete local databases.

## Run

* Install your Fluffychat web build into `fluffychat/web`
* Start the container `docker-compose up`
* Access to https://matrix.example.com/.well-known/matrix/client and
  accept certificate (else FluffyChat will fail)
* Launch [FluffyChat web](https://fluffychat.example.com/web/)
* You can then authenticate using LemonLDAP::NG Demo accounts
  _(password=username)_:
  * dwho
  * rtyler
  * msmith
