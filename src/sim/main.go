package main

import (
  "github.com/pelletier/go-toml"
  "fmt"
  "io/ioutil"
)
  
func check(e error) {
  if e != nil {
    panic(e)
  }
}

func main() {
  var seq_file string = "/home/j43/dev/verilog/sequence_detector/seq.toml"
  byte_data, err1 := ioutil.ReadFile(seq_file)
  check(err1)
  
  string_data := string(byte_data)
  data, _ := toml.Load(string_data)

  inputs := data.GetArray("sequence")
  var b = []int64{1, 2, 3}
  
  fmt.Printf("type of inputs ---------> %T\n", inputs)
  fmt.Printf("type of b ---------> %T\n", b)
  fmt.Println(b)
  fmt.Println(inputs)

}
