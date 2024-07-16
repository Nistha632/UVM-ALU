

class agent extends uvm_agent;
  
  driver       drv_h;
  monitor      mon_h;
  sequencer   seqr_h;
  
  // Factory registration
  `uvm_component_utils(agent)
  
  // new constructor
  function new(string name = "agent" , uvm_component parent = null);
    super.new(name, parent);
  endfunction 
  
  // Build Phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    drv_h  = driver::type_id::create("drv_h",this);
    mon_h  = monitor::type_id::create("mon_h",this);
    seqr_h = sequencer::type_id::create("seqr_h",this);
  endfunction 

  // Connect Phase
  function void connect_phase(uvm_phase phase);
    if(get_is_active() == UVM_ACTIVE) begin
      drv_h.seq_item_port.connect(seqr_h.seq_item_export);
    end
  endfunction 
  
endclass 
