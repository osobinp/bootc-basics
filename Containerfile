FROM quay.io/centos-bootc/centos-bootc:stream10

# Install packages like any container
RUN dnf install -y nginx vim && \
    dnf clean all

# Enable systemd services
RUN systemctl enable nginx

# Drop in configuration files
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /var/www/html/index.html

EXPOSE 8080

# Create user wits
RUN useradd -m -s /bin/bash -p $(openssl passwd -6 'wITs.2026') wits

CMD ["/sbin/init"]