
class test extends uvm_test;
  
//   ei_alu_seq_item_c seq;
  
  // Factory Registration 
  `uvm_component_utils(test)
  
  //Creating a handle of sequence and enviornment class 
  sequence_c   seq_h;
  environment env_h;
  
  // new constructor
  function new(string name= "test", uvm_component parent=null);
    super.new(name,parent);
  endfunction:new
  
  // Build Phase
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seq_h = sequence_c::type_id::create ("seq_h,",this);
    env_h = environment::type_id::create( "env_h",this);
  endfunction : build_phase
  
  // Run Phase
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq_h.start(env_h.agnt_h.seqr_h);
    phase.drop_objection(this);
  endtask:run_phase
    
endclass 
