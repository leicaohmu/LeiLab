FROM squidfunk/mkdocs-material:latest AS builder

WORKDIR /docs
COPY . .

RUN pip install -r requirements.txt

RUN pip install --no-deps git+https://github.com/leicaohmu/histox.git@master

RUN mkdocs build

FROM nginx:alpine
COPY --from=builder /docs/site /usr/share/nginx/html
