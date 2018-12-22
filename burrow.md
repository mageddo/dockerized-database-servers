### Lnks
* [API Docs](https://github.com/linkedin/Burrow/wiki/HTTP-Endpoint)

### Specific group offsets

The offsets records only will change if consumer commit messages, it means if you have no consumer then you will have no messages on the request below

```bash
curl -s http://127.0.0.1/v3/kafka/local/consumer/spring-kafka | jq .
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
          },
          {
            "offset": 5000, // at which offset consumer was at this moment
            "timestamp": 1545510708476, // timestamp when consumer sent information to the broker
            "lag": 3000 // how many offsets are left to the consumer
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

#### Consmer group status
At this API you will know if consumer-group have message lag, and when consumed the last message

```bash
curl -s http://burrow.docker/v3/kafka/local/consumer/spring-kafka/status | jq .
{
  "error": false,
  "message": "consumer status returned",
  "status": {
    "cluster": "local",
    "group": "spring-kafka",
    "status": "OK",
    "complete": 1,
    "partitions": [],
    "partition_count": 1,
    "maxlag": {
      "topic": "COFFEE_REQUEST",
      "partition": 0,
      "owner": "",
      "status": "OK",
      "start": {
        "offset": 8375,
        "timestamp": 1545511085364,
        "lag": 3991
      },
      "end": {
        "offset": 12366,
        "timestamp": 1545511260421,
        "lag": 0
      },
      "current_lag": 2,
      "complete": 1
    },
    "totallag": 2
  },
  "request": {
    "url": "/v3/kafka/local/consumer/spring-kafka/status",
    "host": "burrow.docker"
  }
}
```