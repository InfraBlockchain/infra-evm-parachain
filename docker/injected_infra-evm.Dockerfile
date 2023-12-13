FROM docker.io/library/ubuntu:20.04

COPY ./target/release/infra-evm-node /usr/local/bin

EXPOSE 30333 9933 9944 9615
VOLUME ["/data"]

ENTRYPOINT ["/usr/local/bin/infra-evm-node"]