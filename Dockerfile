FROM squidfunk/mkdocs-material:latest AS builder

WORKDIR /docs
COPY . .

# 强制降级到兼容版本，忽略已安装的包
RUN pip install --upgrade \
    "mkdocstrings==0.25.2" \
    "mkdocstrings-python==1.10.9" \
    "mkdocs-autorefs==0.5.0" \
    "griffe==0.48.0"

RUN pip install -r requirements.txt

RUN mkdocs build

FROM nginx:alpine
COPY --from=builder /docs/site /usr/share/nginx/html
