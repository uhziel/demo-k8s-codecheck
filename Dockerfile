FROM alpine:latest
LABEL Name=demo-k8s-codecheck-tool Version=0.0.1
RUN apk add --no-cache git make cmake gcc musl-dev
ENTRYPOINT [ "sh" ]