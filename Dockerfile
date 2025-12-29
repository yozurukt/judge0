FROM ruby:4.0.0-bookworm AS ruby-source

FROM yozuru/judge0-compilers:1.7.0 AS production

ENV JUDGE0_HOMEPAGE "https://judge0.com"
LABEL homepage=$JUDGE0_HOMEPAGE

ENV JUDGE0_SOURCE_CODE "https://github.com/judge0/judge0"
LABEL source_code=$JUDGE0_SOURCE_CODE

ENV JUDGE0_MAINTAINER "Herman Zvonimir Došilović <hermanz.dosilovic@gmail.com>"
LABEL maintainer=$JUDGE0_MAINTAINER

# -----------------------------------------------------------------------------
# Ruby 4.0.0 (from official image)
# -----------------------------------------------------------------------------
COPY --from=ruby-source /usr/local /usr/local

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      cron \
      libpq-dev \
      sudo \
      nodejs \
      npm \
      procps \
      libyaml-dev \
      && \
    rm -rf /var/lib/apt/lists/* && \
    ldconfig && \
    npm install -g --unsafe-perm aglio@2.3.0

EXPOSE 2358

WORKDIR /api

COPY Gemfile ./

RUN RAILS_ENV=production bundle install

COPY cron /etc/cron.d
RUN cat /etc/cron.d/* | crontab -

COPY . .

ENTRYPOINT ["/api/docker-entrypoint.sh"]
CMD ["/api/scripts/server"]

RUN useradd -u 1000 -m -r judge0 && \
    echo "judge0 ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers && \
    chown -R judge0: /api/tmp/

USER judge0

ENV JUDGE0_VERSION "1.13.2"
LABEL version=$JUDGE0_VERSION

FROM production AS development

CMD ["sleep", "infinity"]