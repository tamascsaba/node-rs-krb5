FROM rust:1.90-bullseye
RUN apt-get update && apt-get install -y libkrb5-dev gdb valgrind pkg-config clang
WORKDIR /app
COPY . .
CMD ["bash"]
