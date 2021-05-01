#!/home/j43/miniconda3/bin/python
import os
import sys

signal_file = "/home/j43/dev/verilog/sequence_detector/target/signals.dat"
verilog_files = list(map(os.path.abspath, sys.argv[1:]))
for verilog_file in verilog_files:

    with open(signal_file, 'r') as f:
        signals = f.readlines()

    with open(verilog_file, 'r') as f:
        file_code = f.readlines()

    with open(verilog_file, 'w') as f:
        start = file_code.index("//--start\n")
        end = file_code.index("//--end\n")
        if end == start + 1:
            for signal in signals:
                file_code[start] += "\n#10; " + f'sequence_in = {signal};\n'
        else :
            del file_code[start+1:end]
            for signal in signals:
                file_code[start] += "\n#10; " + f'sequence_in = {signal};\n'
    with open(verilog_file, 'w') as f:
        final_content = ""
        final_content = final_content.join(file_code)
        f.write(final_content)
            

print(signals)
print(file_code)
