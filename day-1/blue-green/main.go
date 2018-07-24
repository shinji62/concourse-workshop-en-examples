package main

import (
	"fmt"
	"log"
	"net/http"

	kingpin "gopkg.in/alecthomas/kingpin.v2"
)

var (
	port = kingpin.Flag("port", "Port to listen").Envar("PORT").Short('p').Required().Int()
)

func BarHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello, Concourse Workshop AGAIN")
}

func main() {

	kingpin.Parse()

	http.HandleFunc("/bar", BarHandler)

	log.Fatal(http.ListenAndServe(":"+fmt.Sprintf("%v", *port), nil))

}
