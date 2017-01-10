package main

import (
	"log"
	"net/http"
)

func addLog(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		log.Printf("%s -- %s\n", r.Method, r.URL)
		next.ServeHTTP(w, r)
	})
}

func main() {
	log.Println("Server is about to listen at port 8000.")

	mux := http.NewServeMux()

	mux.Handle("/", http.FileServer(http.Dir("./dist")))

	if err := http.ListenAndServe(":8000", addLog(mux)); err != nil {
		log.Printf("Could not start server at port 8000: %v\n", err)
	}
}
