FROM frvi/ruby

MAINTAINER scaceres@octo.com

RUN gem install bundle dashing
RUN mkdir /dashing && \
    dashing new dashing && \
    cd /dashing && bundle && \
    ln -s /dashing/dashboards /dashboards && \
    ln -s /dashing/jobs /jobs && \
    ln -s /dashing/public /public && \
    ln -s /dashing/widgets /widgets && \
    ln -s /dashing/assets /assets && \
    mkdir /dashing/config && \
    mv /dashing/config.ru /dashing/config/config.ru && \
    ln -s /dashing/config/config.ru /dashing/config.ru && \
    ln -s /dashing/config /config

COPY run.sh /

VOLUME ["/dashboards", "/jobs", "/config", "/public", "/widgets", "/assets"]

ENV PORT 3030
EXPOSE $PORT
WORKDIR /dashing

RUN echo "\ngem 'oa-openid'" >> Gemfile && \
    echo "\ngem 'omniauth-google-oauth2'" >> Gemfile && \
    echo "\ngem 'ruby-trello'" >> Gemfile && \
    bundle install

CMD ["/run.sh"]
