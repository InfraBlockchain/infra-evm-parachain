FROM docker.io/paritytech/ci-linux:production as builder

WORKDIR /infra-evm

COPY . /infra-evm

RUN cargo build --release --locked

FROM docker.io/library/ubuntu:20.04

COPY --from=builder /infra-evm/target/release/infra-evm-parachain /usr/local/bin

RUN useradd -m -u 1000 -U -s /bin/sh -d /infra-evm infra-evm-parachain && \
    mkdir -p /data /infra-evm/.local/share && \
    chown -R infra-evm-parachain:infra-evm-parachain /data && \
    ln -s /data /infra-evm/.local/share/infra-evm-parachain && \
    /usr/local/bin/infra-evm-parachain --version

USER infra-evm-parachain

EXPOSE 30333 9933 9944 9615
VOLUME ["/data"]

ENTRYPOINT ["/usr/local/bin/infra-evm-parachain"]