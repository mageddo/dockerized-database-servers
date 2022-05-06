
Funciona no gpsbabel 1.7, no 1.5 nao funciona

```bash
docker-compose run --entrypoint sh gpsbabel
gpsbabel -i garmin_fit -f /opt/fit/Primeiro_Teste_Coospo_20220505082656.fit -o gpx -F /opt/fit/out.gpx
```

