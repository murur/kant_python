## Docker CLI 명령어

### 컨테이너 실행(구동), 올린다 , 로드한다.
```sh
docker run -d --name my-pg -e POSTGRES_PASSWORD=admin1234 -p 5432:5432 postgres:18

docker run -d --name my-pg

```

### 컨테이너 목록 조회 하는 방법
```sh
docker ps 
```
### 정지된 컨테이너 목록까지 조회 하는 방법
```sh
docker ps -a
```
### 외부 SQL 파일을 도커 컨테이너 내부로 복사 하는 방법
```sh
docker cp kant_shop.sql my-pg:/tmp/kant_shop.sql
```

- 1번째 방법
```sh
docker exec -it my-pg psql -U postgres -f /tmp/kant_shop.sql
```

- 2번째 방법
```sh
docker exec -i my-pg psql -U postgres < kant_shop.sql
```

### 데이터베이스를 선택하여(지정하여) 접속하는 방법
```sh
docker exec -it my-pg psql -U postgres -d kant_shop
```

---

## 도커 볼륨

```
docker volume ls
docker volume creat [볼륨명]
docker volume inspect [볼륨명]
```
- 컨테이너 생성시 볼륨을 연결하기

```sh
docker run -d --name my-pg -e POSTGRES_PASSWORD=admin1234 -p 5432:5432 -v pgdata:/var/lib/postgresql postgres:18
```

```sh
docker exec -it kant-pg psql -U postgres -d kant_shop -c "SELECT * FROM product"
```