package main

import (
  "github.com/pelletier/go-toml"
  "fmt"
)
  
func main() {
  var seq_file string = "/home/j43/dev/verilog/sequence_detector/seq.toml"
   
  data, _ := toml.LoadFile(seq_file)

  inputs := data.GetArray("sequence").([]int64)
  reset := data.Get("reset")
  timeP := data.Get("time_period")
  
  fmt.Printf("type of inputs   ---------> %T\n", inputs)
  fmt.Printf("type of reset    ---------> %T\n", reset)
  fmt.Printf("type of timeP    ---------> %T\n", timeP)
  fmt.Printf("%d is reset time, %d is time period\n\r", reset, timeP)
  fmt.Println("input is :")
  fmt.Println(inputs[4])
  fmt.Println(len(inputs))

  for i := 0; i < len(inputs); i++{
    fmt.Println(inputs[i])
  }
}
