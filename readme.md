# Starting With Go + ReactJS

As in the description from the Go respository: "Go is an open source programming language that makes it easy to build simple, reliable, and efficient software."

![Go Logo](https://avatars1.githubusercontent.com/u/4314092?s=200&v=4)

**TL;DR:** If you want to deep into the Go language, you can follow the [Go tour](https://tour.golang.org/welcome/1) wich is the best starting point to start working with Go and also a recommendation is to look into the community, wich is very active and is one of the most welcoming communities.

Here are some of the main Go benefits:

- Strongly typed and garbage collected
- Blazing fast compile times
- Concurrency built in (You may be interested in this: [Concurrency is no parallelism](https://www.youtube.com/watch?v=cN_DpYBzKso))
- Extensive standard library

[Futher Reading](https://github.com/golang/go/wiki#getting-started-with-go)


## GIN

Gin is a micro-framework written in GO (golang). it features a martini-like API with much better performance (Everyone loves perf ;) ). Gin carries with the most essential features, libraries, and functionalities needed to build web apps and micro-services. It makes simple to build a request handling pipeline from modular, reusable pieces.

### Prerequisites 

In order to follow along with this tutorial, you will need to hace Go installed on your machine (you can read the official docs), a command line and of course a web browser.

# Let's code < />
Ready, set, *GO!*

``` bash
$ mkdir -p $GOPATH/src/github.com/user/golang-gin
$ cd $GOPATH/src/github.com/user/golang-gin
$ touch go
```

The content of the *maing.go* file:

``` go
package main

import (
  "net/http"

  "github.com/gin-gonic/contrib/static"
  "github.com/gin-gonic/gin"
)

func main() {
  // Set the router as the default one shipped with Gin
  router := gin.Default()

  // Serve frontend static files
  router.Use(static.Serve("/", static.LocalFile("./views", true)))

  // Setup route group for the API
  api := router.Group("/api")
  {
    api.GET("/", func(c *gin.Context) {
      c.JSON(http.StatusOK, gin.H {
        "message": "pong",
      })
    })
  }

  // Start and run the server
  router.Run(":3000")
}

```

