
Funciona no gpsbabel 1.7, no 1.5 nao funciona


Rodando docker e abrindo o terminal com o gpsbabel

```bash
docker-compose run --entrypoint sh gpsbabel
```

Convertendo um arquivo 
```bash
gpsbabel -i garmin_fit -f /opt/fit/Primeiro_Teste_Coospo_20220505082656.fit -o gpx -F /opt/fit/out.gpx
```

Convertendo todos os arquivos do diretorio

```bash
for i in fit/*.fit; do gpsbabel -i garmin_fit -f "$i" -o gpx -F gpx/"$(basename ${i%.fit}.gpx)" ; done
```