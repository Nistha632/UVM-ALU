class monitor extends uvm_monitor#(seq_item);
  
   seq_item seq;

  // Factory registration
  `uvm_component_utils(monitor)    
  
  // virtual interface
  virtual alu_interface vif;
    
  uvm_analysis_port#(seq_item) item_collected_port;
    
  seq_item seq_collected;
  
  // new constructor
  function new(string name, uvm_component parent);
    super.new(name,parent);
    seq_collected=new(); item_collected_port=new("item_collected_port",this);
  endfunction
  
  // Build Phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual alu_interface)::get(this,"", "vif",vif))
      `uvm_fatal("No vif found", {"virtual interface must be set for: ",get_full_name(),".vif"});
  endfunction
  
  // Run Phase
  virtual task run_phase(uvm_phase phase);
    seq_item item_collected;
    forever
      begin
        #5;
        seq_collected.a =vif.a;
        seq_collected.b =vif.b;
        seq_collected.mode =vif.mode;
        
        seq_collected.y =vif.y;
        $display("Values in seq_collected in monitor");
        seq_collected.print();
        $cast(item_collected, seq_collected.clone());
        item_collected_port.write(item_collected);
      end
  endtask
  
endclass
