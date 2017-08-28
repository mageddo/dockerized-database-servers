Example of nginx server with

* SSL configuration
* Reverse Proxy
* GZIP

Testing Virtual Host

	$ curl -k -I --header 'Host: acme.mageddo.com' 127.0.0.1
	HTTP/1.1 200 OK
	Server: nginx/1.10.3
	Date: Mon, 28 Aug 2017 18:15:55 GMT
	Content-Type: text/html; charset=UTF-8
	Connection: keep-alive
	X-Powered-By: PHP/5.4.45-0+deb7u2
	X-Pingback: http://mageddo.com/xmlrpc.php


Testing gzip compression

	$ curl --raw -I -H 'Host: acme.mageddo.com' -H 'Accept-Encoding: gzip' 127.0.0.1
	HTTP/1.1 200 OK
	Server: nginx/1.10.3
	Date: Mon, 28 Aug 2017 18:15:11 GMT
	Content-Type: text/html; charset=UTF-8
	Connection: keep-alive
	X-Powered-By: PHP/5.4.45-0+deb7u2
	X-Pingback: http://mageddo.com/xmlrpc.php
	Content-Encoding: gzip

Compare the size of the requests

	$ curl -s -w '\n%{size_download}' -H 'Host: acme.mageddo.com' -H 'Accept-Encoding: gzip' 127.0.0.1 | tail -n1
