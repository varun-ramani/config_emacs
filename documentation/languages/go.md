# Go Support
Out of the box, the configuration comes with syntax highlighting for Go, but getting autoformatting and autocompletion set up require a little bit more work.
* Install the `go` command-line binary, and run the following:
```shell
# Install the Go development tools
go get github.com/mdempsky/gocode 
go get golang.org/x/tools/cmd/goimports

# Ensure that they are accessible
gocode # If this runs without error, then you are good to go!
```
* If the command above throws an error, this just means that you have not added the Go installation directory to your PATH variable.
* `gofmt` is also required, but this is preinstalled with go. 
