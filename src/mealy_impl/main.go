package main

import (
  "github.com/pelletier/go-toml"
  "fmt"
  "time"
)

var seq_file string = "/home/j43/dev/verilog/sequence_detector/seq.toml"
var data, _ = toml.LoadFile(seq_file)
var inputs = data.GetArray("sequence").([]int64)

type state struct {
  current uint8
  input int64
  next uint8
  output int64
}
  
func (s *state) init_machine() {
  s.current = 'a'
  s.input = inputs[0]
  s.set_next_state() // impl a function to set next state
  s.set_output()
}

func (s *state) set_next_state() {
  var res uint8 
  switch s.current {
    case 'a':
      if s.input == 0 {
        res = 'a'
      } else{
        res = 'b'
      }
    case 'b':
      if s.input == 0 {
        res = 'c'
      } else{
        res = 'b'
      }
    case 'c':
      if s.input == 0 {
        res = 'a'
      } else{
        res = 'd'
      }
    case 'd':
      if s.input == 0 {
        res = 'c'
      } else{
        res = 'b'
      }
  }
  s.next = res
}

func (s *state) set_output() {
  if s.current == 'd' && s.next == 'b' {
    s.output = 1
  } else {
    s.output = 0
  }
}
	
func (s *state) go_forward(input int64){
  s.input = input
  s.current = s.next
  s.set_next_state()
  s.set_output()
}

func main() {
  var state state = state{}
  sp := &state

  fmt.Printf("input signals lenght = %d\n\n\n", len(inputs))
  time.Sleep(3200*time.Millisecond)
  fmt.Printf("------------------begin---------------\n\n\n")


  sp.init_machine()

  for i := 1; i < len(inputs); i++ {
    time.Sleep(320*time.Millisecond)
    sp.go_forward(inputs[i])
    if state.output == 1 {
      fmt.Printf("input = %d\t\t\t\t\t%s\n", inputs[i], "detected")
      time.Sleep(3200*time.Millisecond)

    } else {
      fmt.Printf("input = %d\t\t\t\t\t%s\n", inputs[i], "waiting...")
    }
  }
  fmt.Printf("------------------end---------------\n\n\n")
}

