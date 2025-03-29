package flags

import "flag"

func Parse() Flags {
	number := flag.Int("number", 1, "Number of quotes to return (optional)")
	flag.Parse()

	flags := Flags{
		Number: *number,
	}

	return flags
}

type Flags struct {
	Number int
}
