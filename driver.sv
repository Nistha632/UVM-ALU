class driver extends uvm_driver#(seq_item);
  
  seq_item req;
  
  `uvm_component_utils(driver)

  // virtual interface
  virtual alu_interface vif;
  
  // new constructor
  function new(string name = "driver" , uvm_component parent = null);
    super.new(name, parent);
    req=new();
  endfunction
  
  // Build Phase
  function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      if(!uvm_config_db#(virtual alu_interface)::get(this,"", "vif",vif))
          `uvm_fatal("No vif found", {"virtual interface must be set for: ",get_full_name(),".vif"});
  
  endfunction
  
  // Run Phase
  virtual task run_phase(uvm_phase phase);
      forever
      begin
          seq_item_port.get_next_item(req);
          drive();
          seq_item_port.item_done();
      end
  endtask
  
  // Drive Task
  virtual task drive();
    vif.a = req.a;
    vif.b = req.b;
    vif.mode = req.mode;
    
      //req.y = vif.y;
    #5;
  endtask
  
endclass
