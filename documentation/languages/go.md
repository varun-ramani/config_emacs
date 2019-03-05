# Setting up Go
Out of the box, the configuration comes with syntax highlighting for Go, but getting autoformatting and autocompletion set up require a little bit more work.
* Install the `go` command-line binary, and run the following:
```shell
go get github.com/mdempsky/gocode
go get golang.org/x/tools/cmd/goimports
```
* `gofmt` is also required, but this is preinstalled with go. 
