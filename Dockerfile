FROM parity/rust-arm64:gitlab-ci

# build parity
RUN git clone https://github.com/paritytech/parity-ethereum && \
        cd parity-ethereum && \
        git checkout beta && \
        git pull && \
        mkdir -p .cargo && \
        echo '[target.aarch64-unknown-linux-gnu]\n\
        linker = "aarch64-linux-gnu-gcc"\n'\
        >>.cargo/config && \
        cat .cargo/config && \
        cargo build --target aarch64-unknown-linux-gnu --release --verbose

CMD ["/bin/bash"]
