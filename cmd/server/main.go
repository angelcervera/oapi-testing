package main

import (
	"log"
	"net/http"
	"palmyra-pro-api/pkg/api"
)

func main() {
	// create a type that satisfies the `api.ServerInterface`, which contains an implementation of every operation from the generated code
	server := api.Server{}
	handler := api.NewStrictHandler(server, nil)

	m := http.NewServeMux()

	// get an `http.Handler` that we can use
	h := api.HandlerFromMux(handler, m)

	s := &http.Server{
		Handler: h,
		Addr:    "0.0.0.0:8080",
	}

	// And we serve HTTP until the world ends.
	log.Fatal(s.ListenAndServe())
}
