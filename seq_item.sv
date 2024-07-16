class seq_item extends uvm_sequence_item;
  
  rand  bit [ 3 : 0] a,b; 
  randc bit [ 1 : 0] mode;
  bit       [ 7 : 0]   y;
    
  // Factory registration
  `uvm_object_utils_begin(seq_item)
  `uvm_field_int(a,UVM_ALL_ON)
  `uvm_field_int(b,UVM_ALL_ON)
  `uvm_field_int(mode,UVM_ALL_ON)
  `uvm_field_int(y,UVM_ALL_ON)
  `uvm_object_utils_end
  
  // new constructor
  function new(string name= "seq_item");
        super.new(name);
    endfunction
  
  // constraint 
  //constraint c_condition { b < a;};

  //constraint c2 { mode inside {0,1,2,3};}

endclass 
