all: kill build run

run:
	docker run -d -p 80:80 -p 443:443 nginx-certbot
build:
	docker build . -t nginx-certbot
kill:
	docker stop nginx-certbot && docker rm nginx-certbot
clean:
	docker image rm nginx-certbot
