FROM ubuntu:16.04

VOLUME /etc/letsencrypt

# Expose HTTP and HTTPS ports for obvious reasons
EXPOSE 80
EXPOSE 443

# Install certbot to provision certificates
RUN apt-get update && \
    apt-get install nginx python-dev -y && \
    apt-get install software-properties-common -y && \
    add-apt-repository ppa:certbot/certbot -y && \
    apt-get update && \
    apt-get install python-certbot-nginx -y && \
    apt-get autoremove -y && \
    apt-get clean   

# Create the /domains directory
RUN mkdir /domains

# Copy the domain names for which we want to get certificates
COPY domains/domains.txt domains/domains.txt

# Copy the scripts we are going to use
COPY ./scripts/ /scripts
RUN chmod +x /scripts/*

# Copy NGINX configurations to nginx/conf.d
COPY ./configs/*.conf /etc/nginx/conf.d/

# Start the stuff
CMD ["python3", "/scripts/startup"]
