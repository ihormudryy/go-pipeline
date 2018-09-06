export GOCD_VERSION=v18.8.0

#export SSL_CONFIG='-e GO_SERVER_SYSTEM_PROPERTIES="-Dgo.ssl.ciphers.include='TLS_ECDHE.*' -Dgo.ssl.ciphers.exclude='.*NULL.*,.*RC4.*' -Dgo.ssl.protocols.include='TLSv1.2' -Dgo.ssl.protocols.exclude='SSLv3' -Dgo.ssl.renegotiation.allowed='N'" \'

docker run \
-v ${HOME}/gocd:/godata \
-v ${HOME}/gocd/home:/home/gocd \
-v /etc/localtime:/etc/localtime \
-v ${HOME}/.secrets:/etc/go \
-p 8153:8153 \
-p 8154:8154 \
-e GOCD_PLUGIN_INSTALL_docker-elastic-agents="https://github.com/gocd-contrib/docker-elastic-agents/releases/download/v1.0.1/docker-elastic-agents-1.0.1-139.jar" \
-e GOCD_PLUGIN_INSTALL_docker-registry-artifact-plugin="https://github.com/gocd/docker-registry-artifact-plugin/releases/download/1.0.0/docker-registry-artifact-plugin-1.0.0-3.jar" \
-e GOCD_PLUGIN_INSTALL_gocd-groovy-dsl-config-plugin="https://github.com/ketan/gocd-groovy-dsl-config-plugin/releases/download/v0.3.0/dsl-0.3.0-3.jar" \
-e GOCD_PLUGIN_INSTALL_kubernetes-elastic-agents="https://github.com/gocd/kubernetes-elastic-agents/releases/download/v1.0.1/kubernetes-elastic-agent-1.0.1-107.jar" \
-e GOCD_PLUGIN_INSTALL_gocd-spark-build-notifier="https://github.com/t04glovern/gocd-spark-build-notifier/releases/download/1.0/gocd-spark-notifier-1.0.jar" \
gocd/gocd-server:${GOCD_VERSION}
