FROM squidfunk/mkdocs-material:latest AS builder

WORKDIR /docs
COPY . .

RUN pip install -r requirements.txt
RUN pip install git+https://github.com/leicaohmu/histox.git --no-deps
RUN mkdocs build

FROM scratch AS output
COPY --from=builder /docs/site /
