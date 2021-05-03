package main

import (
  "github.com/pelletier/go-toml"
  "fmt"
)

var seq_file string = "/home/j43/dev/verilog/sequence_detector/seq.toml"
var data, _ = toml.LoadFile(seq_file)
var inputs = data.GetArray("sequence").([]int64)

type state struct{
	current uint8
	previous uint8
	input uint8
	output uint8
}
  
func (s *state) set_next_state(input int64) {
		
}

func main() {
  
  for i := 0; i < len(inputs); i++{
    fmt.Println(inputs[i])
  }
}

