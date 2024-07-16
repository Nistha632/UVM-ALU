
class sequencer extends uvm_sequencer#(seq_item);
  
  // Factory registration
  `uvm_component_utils(sequencer)

  // new constructor
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

endclass 
