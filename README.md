# WordPress con Docker — Guía rápida

## Estructura de archivos

```
wordpress/
├── Dockerfile
├── docker-compose.yml
├── .env
└── README.md
```

## Levantar el entorno

```bash
# 1. Clonar / copiar los archivos en tu máquina
# 2. Asegurarte de que la carpeta de plugins existe:
#    C:\Users\rfalf\Development\code\php\plugins-wordpress

# 3. Levantar los servicios
docker compose up -d

# 4. Ver logs
docker compose logs -f wordpress
```

## URLs

| Servicio    | URL                      |
|-------------|--------------------------|
| WordPress   | http://localhost:8080    |
| phpMyAdmin  | http://localhost:8081    |

## Bind mount de plugins

La carpeta local:
```
C:\Users\user\Development\code\php\plugins-wordpress
```
Se monta directamente en:
```
/var/www/html/wp-content/plugins
```

> Cualquier plugin que agregues o modifiques en tu host se refleja
> inmediatamente dentro del contenedor, sin necesidad de reiniciar.

## Comandos útiles

```bash
# Detener sin borrar datos
docker compose stop

# Detener y eliminar contenedores (los volúmenes se conservan)
docker compose down

# Eliminar TODO incluyendo la base de datos y archivos de WP
docker compose down -v

# Acceder al contenedor de WordPress
docker exec -it wordpress_app bash

# Usar WP-CLI
docker exec -it wordpress_app wp plugin list --allow-root
```

## Notas para Windows

- Docker Desktop debe tener habilitado el **File Sharing** para la unidad `C:\`.
  Settings → Resources → File Sharing → agregar `C:\`
- Si usas **WSL2**, asegúrate de que la ruta del host sea accesible desde WSL.
