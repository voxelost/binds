.PHONY: setup_venv build clean rebuild run
CARGO_TARGET_TRIPLE = aarch64-apple-darwin
RUST_SRC_DIR = rust_binds


lib.rs:
	cd ${RUST_SRC_DIR}; cargo build --lib --release --target ${CARGO_TARGET_TRIPLE}

main.py: setup_venv lib.rs
	$(info built dependencies)
	$(info DLL_PATH=${RUST_SRC_DIR}/target/${CARGO_TARGET_TRIPLE}/release/lib${RUST_SRC_DIR}.dylib)

build: main.py

clean:
	rm -rf $(python3 -m pipenv --venv)
	rm -rf __pycache__
	rm -rf .venv
	cd ${RUST_SRC_DIR}; cargo clean

rebuild: clean build

run: build
	$(info running app)
	DLL_PATH=${RUST_SRC_DIR}/target/${CARGO_TARGET_TRIPLE}/release/lib${RUST_SRC_DIR}.dylib python3 main.py

