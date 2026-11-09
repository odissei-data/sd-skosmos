# Fuseki 5.1.0 leaks a read lock per query and fails after about 65535
# queries (apache/jena#2584, fixed in 5.2.0). The stain image stops at
# 5.1.0, so keep its entrypoint, user and layout and replace the server.
FROM stain/jena-fuseki:5.1.0@sha256:b1d0c96f19adddef417520184471ac816cf36c6e72936a88ea02b29f4305929a

ENV FUSEKI_VERSION=5.6.0
ENV FUSEKI_SHA512=53dfe13cdd5f6387a0c62917e275fde2cd2e2f2052bfe7515384934f24915228b8512a2dd2b50b7060cc300c976254349d991fcea239484cae48e0a59d67cd54

USER root
RUN cd /tmp && \
    curl --fail --silent --show-error --location --retry 3 --output fuseki.tar.gz \
      "${ASF_ARCHIVE}jena/binaries/apache-jena-fuseki-$FUSEKI_VERSION.tar.gz" && \
    echo "$FUSEKI_SHA512  fuseki.tar.gz" | sha512sum -c - && \
    tar xzf fuseki.tar.gz && \
    cp "apache-jena-fuseki-$FUSEKI_VERSION/fuseki-server" \
      "apache-jena-fuseki-$FUSEKI_VERSION/fuseki-server.jar" "$FUSEKI_HOME/" && \
    chown fuseki:fuseki "$FUSEKI_HOME/fuseki-server" "$FUSEKI_HOME/fuseki-server.jar" && \
    rm -rf /tmp/* && \
    sed -i 's/^\[main\]$/[main]\nsecurityManager.subjectDAO.sessionStorageEvaluator.sessionStorageEnabled = false/' \
      "$FUSEKI_HOME/shiro.ini"
COPY entrypoint.sh /fuseki-entrypoint.sh
USER fuseki

ENTRYPOINT ["/sbin/tini", "--", "sh", "/fuseki-entrypoint.sh"]
CMD ["/jena-fuseki/fuseki-server"]
