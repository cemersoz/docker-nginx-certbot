# nginx-certbot-docker
Docker container base image configured with certbot and nginx that automatically gets ssl certificates for domains used by nginx. I got the idea for this project from `@staticfloat` who originally forked it from `@henridwyer`. I wrote my own implementation of this same idea, mostly since I couldn't get their versions to work for my usecase with my configuration. This repository uses the certbot nginx plugin and does not parse the domains from nginx configuration files. Instead, I plan to automatically build nginx configurations from simpler domain jsons

# Usage
Place the domains for which you want to have ssl certificates issued in domains/domains.txt and create the nginx configs you usually would in configs/\*.conf. Then build and run the container. (I'll make a cleaner version without the domains and configs copies in the very near future)
