
module tb_can_transciever();
   
   localparam time clk_period = 1ns;
   logic	   tx_1, rx_1 , clk ; 
   logic	   tx_2, rx_2;
   
   wire		   CANH, CANL;
   
   initial begin 
      while(1)begin
	 clk = 1;
	 #(clk_period/2);
	 clk = 0;
	 #(clk_period/2);
      end
   end
   
   
   can_transciever can_transciever_1 
       (
	.can_transciever_tx_i	  ( tx_1 ),
	.can_transciever_rs_i	  ( 1'b0 ),
	.can_transciever_rx_o	  ( rx_1 ),
  	.can_transciever_canh_io  ( CANH ),
        .can_transciever_canl_io  ( CANL )
        );
 
   can_transciever can_transciever_2 
     (
      .can_transciever_tx_i     ( tx_2 ),
      .can_transciever_rs_i     ( 1'b0 ),
      .can_transciever_rx_o     ( rx_2 ),
      .can_transciever_canl_io  ( CANL ),
      .can_transciever_canh_io  ( CANH )
      ); 
   
   initial begin 
      
      tx_1 = 1'b1;
      tx_2 = 1'b1;
      @(negedge clk)
	
	
	for (int i = 0; i<8; i++) begin
	   tx_1 = !tx_1;
	   @(negedge clk);
	   
	   
	end 
      
      repeat(20) @(negedge clk);
      
      for (int i = 0; i<8; i++) begin
	 tx_2 = !tx_2;
	 @(negedge clk);
	 
	 
      end 
      
      
      
      repeat(20) @(negedge clk);
      
      
      
      $stop();
   end
endmodule 
