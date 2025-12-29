FROM yozuru/judge0-compilers:1.7.0 AS production

ENV JUDGE0_HOMEPAGE "https://judge0.com"
LABEL homepage=$JUDGE0_HOMEPAGE

ENV JUDGE0_SOURCE_CODE "https://github.com/judge0/judge0"
LABEL source_code=$JUDGE0_SOURCE_CODE

ENV JUDGE0_MAINTAINER "Herman Zvonimir Došilović <hermanz.dosilovic@gmail.com>"
LABEL maintainer=$JUDGE0_MAINTAINER

ENV GEM_HOME="/usr/local/bundle"
ENV BUNDLE_PATH="$GEM_HOME" \
    BUNDLE_SILENCE_ROOT_WARNING=1 \
    BUNDLE_APP_CONFIG="$GEM_HOME"
ENV GEM_PATH="$GEM_HOME:/root/.local/share/gem/ruby/4.0.0:/usr/local/lib/ruby/gems/4.0.0"
ENV PATH="$GEM_HOME/bin:$BUNDLE_PATH/gems/bin:$PATH"

# -----------------------------------------------------------------------------
# Install dependencies and compile Ruby 4.0.0
# -----------------------------------------------------------------------------
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      build-essential \
      libssl-dev \
      libreadline-dev \
      zlib1g-dev \
      libyaml-dev \
      libffi-dev \
      curl \
      wget \
      cron \
      libpq-dev \
      sudo \
      nodejs \
      npm \
      procps \
      && \
    rm -rf /var/lib/apt/lists/* && \
    npm install -g --unsafe-perm aglio@2.3.0

RUN cd /tmp && \
    wget https://cache.ruby-lang.org/pub/ruby/4.0/ruby-4.0.0.tar.gz && \
    tar -xzvf ruby-4.0.0.tar.gz && \
    cd ruby-4.0.0 && \
    ./configure --enable-shared --prefix=/usr/local && \
    make -j$(nproc) && \
    make install && \
    rm -rf /tmp/ruby-4.0.0*

RUN ldconfig

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