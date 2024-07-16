class sequence_c extends uvm_sequence#(seq_item);
  
  
  // Factory registration
  `uvm_object_utils(sequence_c)
  
  // new constructor
  function new(string name = "sequence_c");
    super.new(name);
  endfunction
  int uid=1; 
  // task - body
  virtual task body(); 
    repeat(20)
      begin
        $display("========================================================================");
        $display("randomly generated stimulus number = %0d", uid++);
        $display("========================================================================");
        req = seq_item::type_id::create("req");
        start_item(req);
        assert(req.randomize());
        finish_item(req);
      end
  endtask
  
endclass
