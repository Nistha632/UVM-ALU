import uvm_pkg::*;
`include "uvm_macros.svh"

`include "dut.sv"
`include "interface.sv"
`include "seq_item.sv"
`include "sequencer.sv"
`include "sequence.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"

module tb;
  
  alu_interface intf();
  
  alu DUT
  (
    .a(intf.a),
    .b(intf.b),
    .y(intf.y),
    .mode(intf.mode)
  );
  
  initial
    begin
      uvm_config_db#(virtual alu_interface)::set(uvm_root::get(),"*","vif",intf);
      $dumpfile("dump.vcd");
      $dumpvars;
    end
  
  initial
    begin
      run_test("test");
    end

endmodule 
