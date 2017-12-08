FROM verdaccio/verdaccio 

ENV APPDIR /usr/local/app
ENV port 4873
WORKDIR $APPDIR
#VOLUME ["/verdaccio"]

USER root
RUN mkdir -p /opt/conf /opt/storage /opt/project \
    && chown verdaccio:verdaccio /opt/conf /opt/storage /opt/project

USER verdaccio
COPY config.yaml /opt/conf/
RUN pwd \
    && sh -c "bin/verdaccio --config /opt/conf/config.yaml --listen http://0.0.0.0:4873 &" \
    && sleep 3 \
    && cd /opt/project \
    && npm set registry "http://0.0.0.0:4873/" \
    && echo "start downloading npm packages..." \
    && npm install serverless

EXPOSE $port
ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
CMD bin/verdaccio --config /opt/conf/config.yaml --listen http://0.0.0.0:$port

