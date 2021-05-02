# this module should transmit sequences, and other meta data from seq.toml to both verilog test bench 
import toml
import os

seq_file = os.path.abspath('./seq.toml')
verilog_files = [os.path.abspath(i) for i in ['./src/moore_impl/main_tb.v', './src/mealy_impl/main_tb.v']]

with open(seq_file, 'r') as f:
    data = toml.loads(f.read())
    sequences = data['sequence']
    time_period = data['time_period']
    reset_time = data['reset']*time_period

    
for verilog_file in verilog_files:

    with open(verilog_file, 'r') as f:
        file_code = f.readlines()

    with open(verilog_file, 'w') as f:
        start = file_code.index("//--start\n")
        end = file_code.index("//--end\n")
        for_start = file_code.index("//--for\n") + 1
        file_code[for_start] = f'for (i = 0; i <= {2*len(sequences) + 40}; i = i+1)\n'
        file_code[for_start + 1] = f'#{time_period/2} clock = ~clock;\n'

        if end == start + 1:
            file_code[start] += f'reset = 1;\n#{reset_time};\nreset = 0;\n'
            for sequence_in in sequences:
                file_code[start] += f"\n#{time_period}; " + f'sequence_in = {sequence_in};\n'
        else :
            del file_code[start+1:end]
            file_code[start] += f'reset = 1;\n#{reset_time};\nreset = 0;\n'
            for sequence_in in sequences:
                file_code[start] += f"\n#{time_period}; " + f'sequence_in = {sequence_in};\n'

    with open(verilog_file, 'w') as f:
        final_content = ""
        final_content = final_content.join(file_code)
        f.write(final_content)
 
