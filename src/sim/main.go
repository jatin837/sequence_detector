package main

import (
  "github.com/pelletier/go-toml"
  "fmt"
  "time"
  "io/ioutil"
)


type state struct {
  current uint8
  input uint8
  next uint8
  output uint8
}

type data struct{
  sequence []uint8
  reset int
  time_period int
}

func (s *state) init_machine() {
  s.current = 'a'
  s.input = uint8(0)
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
  data := data{}
  sp := &s
  var seq_file string = "/home/j43/dev/verilog/sequence_detector/seq.toml"
  byte_data, err1 := ioutil.ReadFile(seq_file)
  fmt.Println(string(byte_data))
  byte_again_data := []byte(string(byte_data))
  check(err1)
  fmt.Println("error here -- 1")  
  toml.Unmarshal(byte_again_data, &data) 
  fmt.Println("error here -- 2")  
  inputs := data.sequence
  fmt.Println(data)
  fmt.Println("error here -- 3")  
  sp.init_machine()
  fmt.Println("error here -- 4")  
  fmt.Println(inputs)
  for i := 0; i < len(inputs); i++ {
    time.Sleep(320*time.Millisecond)
    
    fmt.Println("error here -- 5")  
    if sp.output == 1 {
      fmt.Println("\n---------------------------------------")
      fmt.Println("detected")
    }
    fmt.Print(inputs[i])
    sp.go_forward(inputs[i])
    
  fmt.Println("error here -- final")  
  }    
  
}
