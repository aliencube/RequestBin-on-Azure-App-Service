FROM redis:alpine

LABEL org.aliencube.requestbin_with_redis.author="Justin Yoo" \
      org.aliencube.requestbin_with_redis.profile="https://twitter.com/justinchronicle" \
      org.aliencube.requestbin_with_redis.projectUrl="https://github.com/aliencube/RequestBin-on-Azure-App-Service" \
      org.aliencube.requestbin_with_redis.repositoryUrl="https://github.com/aliencube/RequestBin-on-Azure-App-Service" \
      org.aliencube.requestbin_with_redis.license="https://raw.githubusercontent.com/aliencube/RequestBin-on-Azure-App-Service/master/LICENSE"

RUN apk add --update \
        # git
        git \
        # python
        gcc python python-dev py-pip \
        # greenlet
        musl-dev \
        # sys/queue.h
        bsd-compat-headers \
        # event.h
        libevent-dev \
    # remove apk cache
    && rm -rf /var/cache/apk/* \
    # requestbin clone
    && git clone https://github.com/Runscope/requestbin.git /requestbin \
    # change directory
    && mv /requestbin /app

WORKDIR /app

RUN pip install --quiet --disable-pip-version-check -r /app/requirements.txt

# must enable REALM=prod to load REDIS_URL
ENV REALM prod
ENV REDIS_URL //localhost:6379

RUN sed -i 's/DEBUG = False/DEBUG = True/' requestbin/config.py

EXPOSE 80

# Have to use this format to use $PORT environment variable
CMD redis-server --daemonize yes \
    && gunicorn --bind=0.0.0.0:80 --worker-class=gevent --workers=2 --max-requests=1000 requestbin:app
