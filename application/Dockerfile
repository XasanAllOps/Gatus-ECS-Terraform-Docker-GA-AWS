# -- Pinned version (v5.22.0) for consistency, best practice.
FROM twinproduction/gatus:v5.23.2

# -- Copy config files over
COPY ./config/config.yaml /config/config.yaml

# -- Instruct Gatus where to find it
ENV GATUS_CONFIG_PATH=/config/config.yaml

# -- Expose Gatus Port
EXPOSE 8080