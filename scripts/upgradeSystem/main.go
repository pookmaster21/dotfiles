package main

import (
	"flag"
	"fmt"
	"os"
	"os/exec"
)

const usage = "Usage: .upgrade_system [OPTIONS]\n"

type command struct {
	Name        string
	DefaultArgs []string
	VerboseArgs string
}

var (
	commands = []*command{
		NewCommand("yay", []string{"--noconfirm"}, "-v"),
		NewCommand("flutter", []string{"upgrade"}, "-vv"),
		NewCommand("rustup", []string{"update"}, ""),
		NewCommand("ghcup", []string{"upgrade"}, "-v"),
		NewCommand("ghcup", []string{"install", "ghc", "latest"}, "-v"),
		NewCommand("ghcup", []string{"install", "cabal", "latest"}, "-v"),
		NewCommand("ghcup", []string{"install", "hls", "latest"}, "-v"),
		NewCommand("ghcup", []string{"install", "stack", "latest"}, "-v"),
		NewCommand("nvim", []string{"--headless", "-c", "Lazy! sync", "-c", "qall"}, ""),
		NewCommand("pipx", []string{"upgrade-all"}, "-v"),
	}
)

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

	for _, cmd := range commands {
		if !commandExists(cmd.Name) {
			fmt.Printf("No such command: %s\n", cmd.Name)
			continue
		}

		args := cmd.DefaultArgs

		execCommand := exec.Command(cmd.Name, args...)

		execCommand.Stdout = os.Stdout
		if verbose && cmd.VerboseArgs != "" {
			execCommand.Args = append(execCommand.Args, cmd.VerboseArgs)
		}

		if quite {
			execCommand.Stdout = nil
		}

		if err := execCommand.Run(); err != nil {
			fmt.Println(err.Error())
			os.Exit(1)
		}
	}
}

func commandExists(cmd string) bool {
	_, err := exec.LookPath(cmd)
	return err == nil
}

func NewCommand(name string, defaultArgs []string, verboseArgs string) *command {
	return &command{
		Name:        name,
		DefaultArgs: defaultArgs,
		VerboseArgs: verboseArgs,
	}
}

func checkFlags() {
	if flag.NArg() == 0 && help {
		UsageAndExit("")
	}

	if verbose && quite {
		UsageAndExit("Can't output quitely and verbosly!")
	}
}

func UsageAndExit(msg string) {
	if msg != "" {
		fmt.Println(msg)
		fmt.Println()
	}

	flag.Usage()
	os.Exit(0)
}
