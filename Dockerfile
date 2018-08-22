FROM nginx

VOLUME /etc/letsencrypt

# Expose HTTP and HTTPS ports for obvious reasons
EXPOSE 80
EXPOSE 443

# Clean NGINX configurations
RUN rm -f /etc/nginx/conf.d/*

# Install certbot to provision certificates
RUN add-apt-repository ppa:certbot/certbot && \
    apt-get update && \
    apt-get install python-dev && \
    apt-get install python-certbot-nginx && \
    apt-get autoremove && \
    apt-get clean   

# Copy the domain names for which we want to get certificates
COPY domains/domains.txt domains.txt

# Copy the scripts we are going to use
COPY ./scripts/ /scripts
RUN chmod +x /scripts/*

# Copy NGINX configurations to nginx/conf.d
COPY ./configs/*.conf /etc/nginx/conf.d/

# Start the stuff
CMD ["/scripts/startup"]
