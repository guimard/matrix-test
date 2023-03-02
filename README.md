# Matrix & Fluffychat test environment

To use it, build Fluffychat web and push the build/web directory into
`./fluffychat`.

Add the following line to your `/etc/hosts` file:
```
127.0.0.1  matrix.example.com auth.example.com fluffychat.example.com
```

First use, initialize matrix using [./init.sh](./init.sh) script.

Then:
* Start the container `docker-compose up`
* Access to https://matrix.example.com/.well-known/matrix/client and
  accept certificate (else FluffyChat will fail)
* Launch [FluffyChat web](https://fluffychat.example.com/web/)
* You can then authenticate using LemonLDAP::NG Demo accounts
  _(password=username)_:
  * dwho
  * rtyler
  * msmith
