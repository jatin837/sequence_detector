package main

import (
  "fmt"
  "math/rand"
  //"time"
  "os"
  "io"
  "strconv"
)

var possible_input = [2]uint8{0, 1}

func input() uint8 {
  var res uint8 = possible_input[rand.Intn(len(possible_input))]
  return res
}

type state struct {
  current uint8
  input uint8
  next uint8
  output uint8
}

func (s *state) init_machine() {
  s.current = 'a'
  s.input = input()
  s.set_next_state() // impl a function to set next state
  s.set_output()
}

func (s *state) go_forward(input uint8){
  s.input = input
  s.current = s.next
  s.set_next_state()
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

  
func check(e error) {
  if e != nil {
    panic(e)
  }
}

func main() {
  s := state{}
  sp := &s
  var dat_file string = "/home/j43/dev/verilog/sequence_detector/target/signals.dat"
  f, err := os.Create(dat_file)
  defer f.Close()
  check(err)
  sp.init_machine()
  var sim_input uint8
  for {
    sim_input = input()
    io.WriteString(f, strconv.Itoa(int(sim_input)) + "\n")
    
    if sp.output == 1 {
      fmt.Println("---------------------------------------")
      fmt.Println("detected")
    }
    fmt.Print(sim_input)
    sp.go_forward(sim_input)
    
  }    
  
}
