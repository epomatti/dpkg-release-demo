package main

import (
	"fmt"

	flags "main/internal/flags"
	quotes "main/internal/quotes"
)

func main() {
	f := flags.Parse()
	q := quotes.GetQuotes(f)
	printQuotes(q)
}

func printQuotes(quotes []quotes.Quote) {
	for _, q := range quotes {
		fmt.Println(q.Quote)
		fmt.Printf("- %s\n", q.Author)
	}
}
