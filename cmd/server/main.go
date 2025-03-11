package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"palmyra-pro-api/pkg/api"
	"palmyra-pro-api/pkg/db"
	"palmyra-pro-api/pkg/db/repository"
)

func main() {

	// Create Repository connections.
	dbConnection := os.Getenv("DB_CONNECTION")
	fmt.Printf("Connecting to database [%s]", dbConnection)

	connection, err := db.NewDB(&db.Config{
		DBConnection: dbConnection,
		Debug:        false,
		MaxOpenConn:  0,
		MaxIdleConns: 0,
	})

	if err != nil {
		panic(err)
	}

	// create a type that satisfies the `api.ServerInterface`, which contains an implementation of every operation from the generated code
	server := api.Server{
		FarmerRepo: repository.NewFarmerRepo(connection),
	}
	handler := api.NewStrictHandler(server, nil)

	m := http.NewServeMux()

	// get an `http.Handler` that we can use
	h := api.HandlerFromMux(handler, m)

	s := &http.Server{
		Handler: h,
		Addr:    "0.0.0.0:3000",
	}

	// And we serve HTTP until the world ends.
	log.Fatal(s.ListenAndServe())
}
