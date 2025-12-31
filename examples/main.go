package main

import (
	"github.com/engmtcdrm/go-eggy"
	pp "github.com/engmtcdrm/go-prettyprint"

	"example.com/examples/internal"
)

func main() {
	eggy.NewExamplePrompt(internal.AllExamples).
		Title(pp.Yellow("Examples of Lager Logging")).
		Show()
}
