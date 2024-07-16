
class scoreboard extends uvm_scoreboard;
  
  // Factory registration
  `uvm_component_utils(scoreboard)
  
  uvm_tlm_analysis_fifo#(seq_item)item_collected;
  
  seq_item seq;
  int tmp; 
  // new constructor
  function new(string name,uvm_component parent);
        super.new(name,parent);
  endfunction
  
  // Build Phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected=new("items_collected",this);
  endfunction
  
  // Run Phase
  virtual task run_phase(uvm_phase phase);
    forever
      begin
        item_collected.get(seq);
        if(seq.mode== 2'b00)
          begin
              tmp=seq.a+seq.b;
            if(tmp == seq.y)
              begin
                $display("------------------------SCOREBOARD-----------------------------------------");
                `uvm_info(get_type_name(),$sformatf(" TEST PASS FOR ADDITION "),UVM_LOW)
        	    `uvm_info(get_type_name(),$sformatf(" Value of A = %0d", seq.a),UVM_LOW)
       		    `uvm_info(get_type_name(),$sformatf(" Value of B = %0d", seq.b),UVM_LOW)
                `uvm_info(get_type_name(),$sformatf(" Value of A + B = %0d", tmp),UVM_LOW)
       		    $display("-----------------------------------------------------------------------------");
              end
            else
              begin
                `uvm_error(get_type_name(),$sformatf(" TEST FAILED FOR ADDITION "))
        	    `uvm_info(get_type_name(),$sformatf(" Value of A = %0d", seq.a),UVM_LOW)
       		    `uvm_info(get_type_name(),$sformatf(" Value of B = %0d", seq.b),UVM_LOW)
                `uvm_info(get_type_name(),$sformatf(" Value of A + B = %0d", tmp),UVM_LOW)
       		    $display("-----------------------------------------------------------------------------");
              end
          end
        else if(seq.mode == 2'b01)
          begin
              tmp=seq.a-seq.b;
            if(tmp == seq.y)
              begin
                $display("------------------------SCOREBOARD-----------------------------------------");
                `uvm_info(get_type_name(),$sformatf(" TEST PASS FOR SUBSTRACTION "),UVM_LOW)
                `uvm_info(get_type_name(),$sformatf(" Value of A = %0d", seq.a),UVM_LOW)
        	    `uvm_info(get_type_name(),$sformatf(" Value of B = %0d", seq.b),UVM_LOW)
                `uvm_info(get_type_name(),$sformatf(" Value of A - B = %0d", tmp),UVM_LOW)
        		$display("-----------------------------------------------------------------------------");
              end
            else
              begin
                `uvm_error(get_type_name(),$sformatf(" TEST FAILED FOR SUBSTRACTION "))
                `uvm_info(get_type_name(),$sformatf(" Value of A = %0d", seq.a),UVM_LOW)
        	    `uvm_info(get_type_name(),$sformatf(" Value of B = %0d", seq.b),UVM_LOW)
                `uvm_info(get_type_name(),$sformatf(" Value of A - B = %0d", tmp),UVM_LOW)
        		$display("-----------------------------------------------------------------------------");
              end
          end
        
        else if(seq.mode==2'b10)
          begin
              tmp= seq.a * seq.b;
            if(tmp == seq.y)
              begin
                $display("------------------------SCOREBOARD-----------------------------------------");
                `uvm_info(get_type_name(),$sformatf(" TEST PASS FOR MULTIPLICATION "),UVM_LOW)
        	    `uvm_info(get_type_name(),$sformatf(" Value of A = %0d", seq.a),UVM_LOW)
        	    `uvm_info(get_type_name(),$sformatf(" Value of B = %0d", seq.b),UVM_LOW)
                `uvm_info(get_type_name(),$sformatf(" Value of A * B = %0d", tmp),UVM_LOW)
        	    $display("-----------------------------------------------------------------------------");
              end
            else
              begin
                `uvm_error(get_type_name(),$sformatf(" TEST FAILED FOR MULTIPLICATION "))
        	    `uvm_info(get_type_name(),$sformatf(" Value of A = %0d", seq.a),UVM_LOW)
        	    `uvm_info(get_type_name(),$sformatf(" Value of B = %0d", seq.b),UVM_LOW)
                `uvm_info(get_type_name(),$sformatf(" Value of A * B = %0d", tmp),UVM_LOW)
        	    $display("-----------------------------------------------------------------------------");
              end
          end
        
        else if(seq.mode == 2'b11)
          begin
              tmp = seq.a / seq.b;
            if(seq.a / seq.b == seq.y)
              begin
                $display("------------------------SCOREBOARD-----------------------------------------");
                `uvm_info(get_type_name(),$sformatf(" TEST PASS FOR DIVISION "),UVM_LOW)
                `uvm_info(get_type_name(),$sformatf(" Value of A = %0d", seq.a),UVM_LOW)
                `uvm_info(get_type_name(),$sformatf(" Value of B = %0d", seq.b),UVM_LOW)
                `uvm_info(get_type_name(),$sformatf(" Value of A / B = %0d", tmp),UVM_LOW)
                $display("-----------------------------------------------------------------------------");
              end
            else
              begin
                `uvm_error(get_type_name(),$sformatf(" TEST FAILED FOR DIVISION "))
                `uvm_info(get_type_name(),$sformatf(" Value of A = %0d", seq.a),UVM_LOW)
                `uvm_info(get_type_name(),$sformatf(" Value of B = %0d", seq.b),UVM_LOW)
                `uvm_info(get_type_name(),$sformatf(" Value of A / B = %0d", tmp),UVM_LOW)
                $display("-----------------------------------------------------------------------------");
              end
          end
      end
  endtask 

endclass
