library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.ALL; //ALL deve essere maiuscolo???
use ieee.math_real.ALL;
use ieee.std_logic_textio.all;
use STD.textio.all;

library work;
use work.id_transfer_pkg.all;
use work.can_constants_pkg.all;

use work.can_types_pkg.all;
use work.drv_stat_pkg.all;
use work.unary_ops_pkg.all;
use work.can_config_pkg.all;
use work.CAN_FD_register_map.all;
use work.CAN_FD_frame_format.all;

library ctu_can_fd_tb_unit;
use ctu_can_fd_tb_unit.can_unit_test_pkg.all;
use ctu_can_fd_tb_unit.random_unit_pkg.all;

library vunit_lib;
context vunit_lib.vunit_context;




module tb_can_vip ();

localparam time clk_period = 100ns;
logic rx_1, tx_1, clk; 
logic rx_2, tx_2; //uso un transciever per trasmettere 

logic  [31:0]   s_apb_paddr;      //: std_logic_vector(31 downto 0);
logic           s_apb_penable;    //: std_logic;
logic  [2:0]    s_apb_pprot;      //: std_logic_vector(2 downto 0);
logic  [31:0]   s_apb_prdata;     //: std_logic_vector(31 downto 0);
logic           s_apb_pready;     //: std_logic;
logic           s_apb_psel;       //: std_logic;
logic           s_apb_pslverr;    //: std_logic;
logic  [3:0]    s_apb_pstrb;      //: std_logic_vector(3 downto 0);
logic  [31:0]   s_apb_pwdata;     //: std_logic_vector(31 downto 0);
logic           s_apb_pwrite;     //: std_logic;

logic  aclk;                      //: std_logic := '0';
logic  arstn;                     //: std_logic := '0';

wire CANH, CANL;
   
initial begin 
	while(1)begin
		clk = 1;
	#(clk_period/2);
		clk = 0;
	#(clk_period/2);
	end
end



can_top_apb (
        #(
            .rx_buffer_size     (128),           //: natural range 32 to 4098 := 128;
            .txt_buffer_count   (4),             //: natural range 2 to 8     := 4; 
            .sup_filtA          (1'b0),          //: boolean                  := true;
            .sup_filtB          (1'b0),          //: boolean                  := true;
            .sup_filtC          (1'b0),          //: boolean                  := true;
            .sup_range          (1'b0),          //: boolean                  := true;
           // .sup_traffic_ctrs   (1'b1),          //: boolean                  := true;
            .sup_test_registers (1'b1)          //: boolean                  := true
        ) CAN
        (
            .aclk (aclk),        //                    : in  std_logic;
            .arstn  (arstn),     //                  : in  std_logic;

            .scan_enable(1'b0),     

            //.irq,               // a chi lo collego??             : out std_logic;
            .CAN_tx (tx_1),     //         : out std_logic;
            .CAN_rx (rx_1),     //         : in  std_logic;
           // .timestamp,          // a chi lo collego??       : in std_logic_vector(63 downto 0);

            // Ports of APB4
            .s_apb_paddr   (s_apb_paddr),    
            .s_apb_penable (s_apb_penable),  
            .s_apb_pprot (s_apb_pprot),       
            .s_apb_prdata  (s_apb_prdata),     
            .s_apb_pready (s_apb_pready),      
            .s_apb_psel (s_apb_psel),        
            .s_apb_pslverr  (s_apb_pslverr),    
            .s_apb_pstrb  (s_apb_pstrb),      
            .s_apb_pwdata  (s_apb_pwdata),     
            .s_apb_pwrite  (s_apb_pwrite),     
    )
   ); // end component can_top_apb

  



 can_transciever transciever_r(
 		.can_transciever_tx_i (tx_1),
 		.can_transciever_rx_o (rx_1),
 		.can_transciever_rs_i (1'b0),
 		.can_transciever_canh_io (CANH),
 		.can_transciever_canl_io (CANL)

 );

can_transciever transciever_t(
 		.can_transciever_tx_i (tx_t),
 		.can_transciever_rx_o (rx_t),
 		.can_transciever_rs_i (1'b0),
 		.can_transciever_canh_io (CANH),
 		.can_transciever_canl_io (CANL)


 );


initial begin
tx_t = 1'b1;
   
repeat(20) @(negedge clk);

for (int i=0; i<8; i++) begin
 tx_t = !tx_t;
 @(negedge clk);
end
end
endmodule
