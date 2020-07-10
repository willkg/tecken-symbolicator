FROM python:3.8.3-slim@sha256:13af390c7ababf48b675e151c354de224f2ae6ec17ee08fe04ad3df8d0736501

ARG userid=10001
ARG groupid=10001

ENV PYTHONUNBUFFERED=1 \
    PYTHONPATH=/app/

WORKDIR /app

# add a non-privileged user for installing and running the application
RUN groupadd --gid $groupid app && \
    useradd -g app --uid $userid --shell /usr/sbin/nologin --create-home app && \
    chown app:app /app/

# install a few essentials and clean apt caches afterwards
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    apt-transport-https build-essential curl git libpq-dev \
    gettext libffi-dev

# Clean up apt
RUN apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Python dependencies
COPY ./systemtests/requirements /tmp/requirements
# Switch to /tmp to install dependencies outside home dir
WORKDIR /tmp
RUN pip install -U 'pip>=10' && \
    pip install --no-cache-dir -r requirements/default.txt && \
    pip check --disable-pip-version-check

COPY . /app

# Switch back to home directory
WORKDIR /app

RUN chown -R app:app /app

USER app
