package quotes

import (
	"encoding/json"
	"fmt"
	"io"
	"log"
	"net/http"
	"strconv"

	flags "main/internal/flags"
)

func GetQuotes(flags flags.Flags) []Quote {
	var url = fmt.Sprintf("https://api.breakingbadquotes.xyz/v1/quotes/%s", strconv.Itoa(flags.Number))
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

	return quotes
}

type Quote struct {
	Quote  string `json:"quote"`
	Author string `json:"author"`
}
