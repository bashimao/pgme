FROM golang:1.9 as builder
COPY ./ ./
RUN make build
RUN pwd && ls -lah

FROM nvidia/cuda:10.1-base-ubuntu18.04
COPY --from=builder /go/pgme /
COPY --from=builder /go/template /template
CMD ["/pgme"]
