FROM squidfunk/mkdocs-material:latest AS builder

WORKDIR /docs
COPY . .

RUN git submodule update --init --recursive
RUN pip install -r requirements.txt
RUN mkdocs build

FROM scratch AS output
COPY --from=builder /docs/site /
