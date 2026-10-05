# System Monitor

Bash cкрипт периодически записывает сведения об оперативной памяти, дисковом пространстве и нагрузке системы в `sys-monitor.log`.

## Состав проекта

- `script.sh` — скрипт мониторинга.
- `Dockerfile` — образ Ubuntu с мониторингом и HTTP-сервером на порту 8080.
- `docker-compose.yml` — запуск мониторинга через Docker Compose с именованным томом.
- `deploy/nginx/my-app.conf` — конфигурация Nginx reverse proxy с HTTPS.
- `deploy/systemd/my-app.service` — systemd-служба для автоматического запуска контейнера.

## Запуск

```bash
docker build -t my-sysadmin-scripts .
docker run -d --name my-app -p 127.0.0.1:8080:8080 my-sysadmin-scripts
curl http://127.0.0.1:8080/sys-monitor.log
```

В рабочем развертывании Nginx принимает HTTPS-запросы на порту 443 и проксирует их к контейнеру на 127.0.0.1:8080. Используется самоподписанный TLS-сертификат, поэтому для проверки применяется curl -k.

## Хранилище
Для учебной части созданы RAID 1 на loop-устройствах, смонтированный в /mnt/raid, и LVM-том lv_logs группы vg_data, смонтированный в /mnt/logs.
