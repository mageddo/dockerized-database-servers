## Instalação

#### Configure o certificado do registry
Pegue o crt no mageddo vps repo

```
$ sudo cp certs/mageddo.com.crt /usr/local/share/ca-certificates/mageddo.crt
$ sudo update-ca-certificates
$ sudo service docker restart
```

* Cheque os volumes
* Dê start