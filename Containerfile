FROM quay.io/fedora/fedora-bootc:45

# Install packages like any container
RUN dnf install -y nginx vim htop && \
    dnf clean all

# Enable systemd services
RUN systemctl enable nginx

# Drop in configuration files
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /var/www/html/index.html

EXPOSE 8080
CMD ["/sbin/init"]