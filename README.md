# Matrix & Fluffychat test environment

To use it, build Fluffychat web and push the build/web directory into
`./fluffychat`.

Add the following line to your `/etc/hosts` file:
```
127.0.0.1  matrix.example.com auth.example.com fluffychat.example.com
```

Start the container `docker-compose up` and use your browser
to launch [FluffyChat web](https://fluffychat.example.com/web/). You
can then authenticate using LemonLDAP::NG Demo accounts:
 * dwho
 * rtyler
 * msmith

Password are account names.
