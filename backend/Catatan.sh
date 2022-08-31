# Menjalankan container dengan docker run
docker run -d -p 8080:8080 --name backend backend

# membuat docker network
docker network create todo

# menjalankan postgres container
docker run -d \
-p 5432:5432 \
--name postgres \
-e POSTGRES_USER=postgres \
-e POSTGRES_PASSWORD=postgres \
-e POSTGRES_DB=belajar \
-v $(pwd)/postgres/init.sql:/docker-entrypoint-initdb/init.sql \
--network todo \
postgres

# Menjalankan container dengan docker run lagi dengan configurasi
docker run -d \
-p 8080:8080 \
--name backend \
-e DB_USER=postgres \
-e DB_PASSWORD=postgres \
-e DB_HOST= postgres\
-e DB_PORT=5432 \
-e DB_DATABASE=belajar \
--network todo \
backend
