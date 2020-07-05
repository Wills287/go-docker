package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	helloHandler := func(w http.ResponseWriter, req *http.Request) {
		_, err := fmt.Fprintln(w, "Hello world!")
		if err != nil {
			log.Fatalln("Failed to print")
		}
	}

	http.HandleFunc("/hello", helloHandler)
	log.Println("Listening for requests at http://localhost:8080/hello")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
