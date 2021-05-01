import os

signal_file = "/home/j43/dev/verilog/sequence_detector/target/signals.dat"
verilog_file = "/home/j43/dev/verilog/sequence_detector/src/verilog/sequence_detector_tb.v"

with open(signal_file, 'r') as f:
    signals = f.readlines()

with open(verilog_file, 'r') as f:
    file_code = f.readlines()

#with open(verilog_file, 'w') as f:
for signal in signals:
    file_code[27] += "\n#10; " + f'sequence_in = {signal};'

new_file = os.path.abspath("./src/temp.txt")
with open(verilog_file, 'w') as f:
    final_content = ""
    final_content = final_content.join(file_code)
    f.write(final_content)
        

print(signals)
print(file_code)
