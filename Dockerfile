FROM docker.io/paritytech/ci-linux:production as builder

WORKDIR /infra-evm

COPY . /infra-evm

RUN cargo build --release --locked

FROM docker.io/library/ubuntu:20.04

COPY --from=builder /infra-evm/target/release/infra-evm-node /usr/local/bin

RUN useradd -m -u 1000 -U -s /bin/sh -d /infra-evm infra-evm-node && \
    mkdir -p /data /infra-evm/.local/share && \
    chown -R infra-evm-node:infra-evm-node /data && \
    ln -s /data /infra-evm/.local/share/infra-evm-node && \
    rm -rf /usr/bin /usr/sbin && \
    /usr/local/bin/infra-evm-node --version

USER infra-evm-node

EXPOSE 30333 9933 9944 9615
VOLUME ["/data"]

ENTRYPOINT ["/usr/local/bin/infra-evm-node"]