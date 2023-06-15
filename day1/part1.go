package main

import (
	"advent22/common"
	"bufio"
	"fmt"
	"os"
	"strconv"
)

func main() {
	f, err := os.Open(common.Getfilepath())
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
	defer f.Close()

	scanner := bufio.NewScanner(f)

	sum, max := 0, 0
	for scanner.Scan() {
		i, _ := strconv.Atoi(scanner.Text())
		sum += i
		if i == 0 {
			if sum > max {
				max = sum
			}
			sum = 0
		}
	}
	if sum > max {
		max = sum
	}

	fmt.Println(max)
}
