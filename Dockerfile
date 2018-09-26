# golang image where workspace (GOPATH) configured at /go.
FROM golang:latest

# Copy the local package files to the container’s workspace.
ADD . /go/src/github.com/josiastech/golang-react

# Build the golang-react command inside the container.
RUN go install github.com/josiastech/golang-react

# Run the golang-react command when the container starts.
ENTRYPOINT /go/bin/golang-react

# http server listens on port 8080.
EXPOSE 8080

docker run —publish 3000:8080 —name goweb —rm go-react

docker run -p 3000:8080 go-react