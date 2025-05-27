package main

import (
    "encoding/json"
    "net/http"
    "log"
)

type Crypto struct {
    Name  string  `json:"name"`
    Price float64 `json:"price"`
}

func getCryptos(w http.ResponseWriter, r *http.Request) {
    cryptos := []Crypto{
        {"Bitcoin", 67000.0},
        {"Ethereum", 3100.0},
        {"Solana", 145.0},
    }

    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(cryptos)
}

func main() {
    http.HandleFunc("/cryptos", getCryptos)
    log.Println("Servidor Go rodando em http://localhost:8080")
    http.ListenAndServe(":8080", nil)
}
