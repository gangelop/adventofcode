package common

import (
	"os"
)

func Getfilepath() string {
	if len(os.Args) > 1 {
		return os.Args[1]
	} else {
		return "input.txt"
	}
}
