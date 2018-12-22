### Lnks
* [API Docs](https://github.com/linkedin/Burrow/wiki/HTTP-Endpoint)

### Specific group offsets

```bash
curl -s http://127.0.0.1:8000/v3/kafka/local/consumer/spring-kafka | jq .
{
  "error": false,
  "message": "consumer detail returned",
  "topics": {
    "COFFEE_REQUEST": [
      {
        "offsets": [
          {
            "offset": 4464,
            "timestamp": 1545510706476,
            "lag": 4430
          }
        ],
        "owner": "/172.17.0.1",
        "current-lag": 4430
      }
    ]
  },
  "request": {
    "url": "/v3/kafka/local/consumer/spring-kafka",
    "host": "typer-pc"
  }
}
```