FROM alpine:latest AS buildenv

RUN apk add --update npm curl git bash alpine-sdk

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs >/tmp/rust.sh && \
    chmod a+x /tmp/rust.sh && \
    /tmp/rust.sh -y
RUN npm install -g yarn

RUN git clone https://github.com/radicle-dev/radicle-bins.git ~/radicle-bins && \
    cd ~/radicle-bins && \
    cd seed/ui && \
    yarn && \
    yarn build

RUN cd ~/radicle-bins && \
    source ~/.cargo/env && \
    cargo build -p radicle-keyutil --release && \
    cargo build -p radicle-seed-node --release

FROM alpine:latest AS runenv

RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*

COPY --from=buildenv /root/radicle-bins/target/release/radicle-keyutil /usr/local/bin/radicle-keyutil
COPY --from=buildenv /root/radicle-bins/target/release/radicle-seed-node /usr/local/bin/radicle-seed-node
COPY --from=buildenv /root/radicle-bins/seed/ui /root/seed-ui