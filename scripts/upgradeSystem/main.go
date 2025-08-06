package main

import (
	"flag"
	"fmt"
	"io"
	"os"
	"os/exec"
)

const usage = "Usage: .upgrade_system [OPTIONS]\n"

var (
	help    bool
	verbose bool
	quite   bool
)

func main() {
	flag.Usage = func() {
		fmt.Fprint(os.Stderr, usage)

		flag.PrintDefaults()
	}

	flag.BoolVar(&help, "h", false, "help message")
	flag.BoolVar(&verbose, "v", false, "verbose output")
	flag.BoolVar(&quite, "q", false, "quite output")

	flag.Parse()

	checkFlags()

	commands := []*exec.Cmd{
		NewCommand("yay", []string{"--noconfirm"}, "-v", nil, nil),
		NewCommand("flutter", []string{"upgrade"}, "-vv", nil, nil),
		NewCommand("rustup", []string{"update"}, "", nil, nil),
		NewCommand("ghcup", []string{"upgrade"}, "-v", nil, nil),
		NewCommand("ghcup", []string{"install", "ghc", "latest"}, "-v", nil, nil),
		NewCommand("ghcup", []string{"install", "cabal", "latest"}, "-v", nil, nil),
		NewCommand("ghcup", []string{"install", "hls", "latest"}, "-v", nil, nil),
		NewCommand("ghcup", []string{"install", "stack", "latest"}, "-v", nil, nil),
		NewCommand("nvim", []string{"--headless", "-c", "Lazy! sync", "-c", "qall"}, "", nil, nil),
		NewCommand("nvim", []string{"--headless", "-c", "lua require('mason-registry').update()", "-c", `lua require("os").execute([[ nvim --headless -c "MasonInstall ]]..unpack(require('mason-registry').get_installed_package_names())..[[ " -c "qall" ]])`, "-c", "qall"}, "", nil, nil),
		NewCommand("pipx", []string{"upgrade-all"}, "-v", nil, nil),
	}

	for _, cmd := range commands {
		if cmd == nil {
			continue
		}

		if err := cmd.Run(); err != nil {
			fmt.Println(err.Error())
			os.Exit(1)
		}
	}
}

func commandExists(cmd string) bool {
	_, err := exec.LookPath(cmd)
	return err == nil
}

func NewCommand(name string, defaultArgs []string, verboseArgs string, outPipe io.Writer, inPipe io.Reader) *exec.Cmd {
	if !commandExists(name) {
		fmt.Printf("No such command: %s\n", name)
		return nil
	}
	newCmd := exec.Command(name, defaultArgs...)

	if verbose {
		newCmd.Args = append(newCmd.Args, verboseArgs)
	}

	newCmd.Stdout = os.Stdout
	if quite {
		newCmd.Stdout = nil
	}

	if outPipe != nil {
		newCmd.Stdout = outPipe
	}

	if inPipe != nil {
		newCmd.Stdin = inPipe
	}

	return newCmd
}

func checkFlags() {
	if flag.NArg() == 0 && help {
		UsageAndExit()
	}

	if verbose && quite {
		fmt.Println("Can't output quitely and verbosly!\n")
		UsageAndExit()
	}
}

func UsageAndExit() {
	flag.Usage()
	os.Exit(0)
}
