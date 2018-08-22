run:
	docker run -d nginx-certbot -p 80:80 -p 443:443
build:
	docker build . -t nginx-certbot
kill:
	docker stop nginx-certbot && docker rm nginx-certbot
clean:
	docker image rm nginx-certbot
