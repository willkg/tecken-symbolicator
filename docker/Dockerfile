FROM getsentry/symbolicator:e21a5b103a1fcedd61c48f8120f661282ee67bc7

# Create a new user for the Symbolicator to use
ARG APP_UID=10000
ARG APP_GID=10000

RUN groupadd --system app --gid $APP_GID \
    && useradd --system --gid symbolicator --uid $APP_UID app

# Put the config file where docker_entrypoint.sh is
COPY ./config.yml /config.yml

USER app

CMD ["run", "-c", "config.yml"]
