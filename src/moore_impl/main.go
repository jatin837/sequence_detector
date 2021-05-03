package main

import (
  "github.com/pelletier/go-toml"
  "time"
  "fmt"
)

var seq_file string = "/home/j43/dev/verilog/sequence_detector/seq.toml"
var data, _ = toml.LoadFile(seq_file)
var inputs = data.GetArray("sequence").([]int64)
var state_val = map[uint8]uint8{'a':0,'b':0, 'c':0, 'd':0, 'e':1}

type state struct {
  current uint8
  input uint8
}

func (s *state) init_machine(){
  s.current = 'a'
  s.input = uint8(inputs[0])
}

func (s *state) go_forward(input uint8){
  s.input = input 
  s.set_current_state()
}

func (s *state) set_current_state() {
  input := s.input 
  var res uint8
  switch s.current {
    case 'a':
      if input == 0 {
        res = 'a'
      } else {
        res = 'b'
      }
    case 'b':
      if input == 0 {
        res = 'c'
      } else {
        res = 'b'
      }
    case 'c':
      if input == 0 {
        res = 'a'
      } else {
        res = 'd'
      }
    case 'd':
      if input == 0 {
        res = 'c'
      } else {
        res = 'e'
      }
    case 'e':
      if input == 0 {
        res = 'c'
      } else {
        res = 'b'
      }
  }
  s.current = res
}
func main() {
  var state state = state{} 
  sp := &state

  fmt.Printf("input signals length = %d\n\n\n", len(inputs))
  time.Sleep(3200*time.Millisecond)
  fmt.Printf("-----------------------begin-------------------\n\n\n")

  sp.init_machine()

  for i := 1; i < len(inputs); i++ {
    time.Sleep(320*time.Millisecond)
    sp.go_forward(uint8(inputs[i]))
    if sp.current == 'e' {
      fmt.Printf("input = %d(at state = %s)\t\t\t\t\t%s\n", inputs[i], string(sp.current), "detected")
      time.Sleep(3200*time.Millisecond)
    } else {
      fmt.Printf("input = %d(at state = %s)\t\t\t\t\t%s\n", inputs[i], string(sp.current), "waiting...")
    }
  }
  fmt.Printf("---------------------end----------------------\n\n\n")
}

