
class environment extends uvm_env;
  
  agent    agnt_h;
  scoreboard  scb_h;
  
  // Factory registration
  `uvm_component_utils(environment)
  
  // new constructor
  function new(string name, uvm_component parent);
        super.new(name,parent);
    endfunction:new
  
  // Build Phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agnt_h = agent::type_id::create("agnt_h",this);
    scb_h  = scoreboard::type_id::create("scb",this);
  endfunction: build_phase
  
  // Connect Phase
  function void connect_phase(uvm_phase phase);
    agnt_h.mon_h.item_collected_port.connect(scb_h.item_collected.analysis_export);
  endfunction: connect_phase

endclass
