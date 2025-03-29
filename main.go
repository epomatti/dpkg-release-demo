package main

import (
	"encoding/json"
	"flag"
	"fmt"
	"io"
	"log"
	"net/http"
	"strconv"
)

func main() {
	number := flag.Int("number", 1, "Number of quotes to return (optional)")
	flag.Parse()
	getRandomQuote(*number)
}

func getRandomQuote(number int) {
	var url = fmt.Sprintf("https://api.breakingbadquotes.xyz/v1/quotes/%s", strconv.Itoa(number))
	resp, err := http.Get(url)
	if err != nil {
		log.Fatal(err)
	}

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		log.Fatalln(err)
	}

	stringBody := string(body)

	var quotes []Quote

	err = json.Unmarshal([]byte(stringBody), &quotes)
	if err != nil {
		log.Fatalf("Error parsing JSON: %v", err)
	}
	var quote = quotes[0]
	fmt.Println(quote.Quote)
	fmt.Printf("- %s\n", quote.Author)
}

type Quote struct {
	Quote  string `json:"quote"`
	Author string `json:"author"`
}
