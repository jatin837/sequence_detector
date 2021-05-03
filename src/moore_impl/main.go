package main

import (
  "github.com/pelletier/go-toml"
  "fmt"
)

var seq_file string = "/home/j43/dev/verilog/sequence_detector/seq.toml"
var data, _ = toml.LoadFile(seq_file)
var inputs = data.GetArray("sequence").([]int64)

type state struct {
  current uint8
  input uint8
  next uint8
  output uint8
}

func main() {
 
}

