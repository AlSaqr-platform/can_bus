//library ieee;
//use ieee.std_logic_1164.all;
//use ieee.numeric_std.ALL; //ALL deve essere maiuscolo???
//use ieee.math_real.ALL;
//use ieee.std_logic_textio.all;
//use STD.textio.all;

//library work;
//use work.id_transfer_pkg.all;
//use work.can_constants_pkg.all;

//use work.can_types_pkg.all;
//use work.drv_stat_pkg.all;
//use work.unary_ops_pkg.all;
//use work.can_config_pkg.all;
//use work.CAN_FD_register_map.all;
//use work.CAN_FD_frame_format.all;

//library ctu_can_fd_tb_unit;
//use ctu_can_fd_tb_unit.can_unit_test_pkg.all;
//use ctu_can_fd_tb_unit.random_unit_pkg.all;

//library vunit_lib;
//context vunit_lib.vunit_context;
`timescale 1 ns/1 ps
`include "axi/assign.svh"

module tb_can_vip ();
   
   parameter AW = 32;  //Address width
   parameter DW = 64;  //Data width
   parameter IW = 8;   //ID width
   parameter UW = 8;   //User width
   
   localparam time clk_period = 100ns;
   logic	   rx_1, tx_1, clk; 
   logic	   rx_2, tx_2; //uso un transciever per trasmettere 
   
   logic [31:0]	   s_apb_paddr;      //: std_logic_vector(31 downto 0);
   logic	   s_apb_penable;    //: std_logic;
   logic [2:0]	   s_apb_pprot;      //: std_logic_vector(2 downto 0);
   logic [31:0]	   s_apb_prdata;     //: std_logic_vector(31 downto 0);
   logic	   s_apb_pready;     //: std_logic;
   logic	   s_apb_psel;       //: std_logic;
   logic	   s_apb_pslverr;    //: std_logic;
   logic [3:0]	   s_apb_pstrb;      //: std_logic_vector(3 downto 0);
   logic [31:0]	   s_apb_pwdata;     //: std_logic_vector(31 downto 0);
   logic	   s_apb_pwrite;     //: std_logic;
   
   logic	   aclk;                      //: std_logic := '0';
   logic	   arstn;                     //: std_logic := '0';
   
   wire		   CANH, CANL;
   
   //------------------------ AXI drivers --------------------------
   
   AXI_BUS_DV
     #(
       .AXI_ADDR_WIDTH(AW),
       .AXI_DATA_WIDTH(DW),
       .AXI_ID_WIDTH(IW),
       .AXI_USER_WIDTH(UW)
       ) 
   axi_master_tx_dv(s_clk), axi_master_rx_dv(s_clk);
   
   AXI_BUS
     #(
       .AXI_ADDR_WIDTH(AW),
       .AXI_DATA_WIDTH(DW),
       .AXI_ID_WIDTH(IW),
       .AXI_USER_WIDTH(UW)
       ) 
   axi_master_tx(),axi_master_rx();

   AXI_LITE
     #(
       .AXI_ADDR_WIDTH(AW),
       .AXI_DATA_WIDTH(DW)
       ) 
   axi_lite_master_tx(),axi_lite_master_rx();
   
   `AXI_ASSIGN(axi_master_tx, axi_master_tx_dv)
   `AXI_ASSIGN(axi_master_rx, axi_master_rx_dv)
   
   typedef axi_test::axi_driver #(.AW(AW), .DW(DW), .IW(IW), .UW(UW), .TA(200ps), .TT(700ps)) axi_drv_t;
   axi_drv_t axi_master_tx_drv =  new(axi_master_tx_dv);
   axi_drv_t axi_master_rx_drv =  new(axi_master_rx_dv);
   
   /****************************************************************/
   /********************** AXI 2 AXI LITE **************************/
   /****************************************************************/
   
   axi_to_axi_lite_intf
     #(
       .AXI_ADDR_WIDTH(AW),
       .AXI_DATA_WIDTH(DW),
       .AXI_ID_WIDTH(IW),
       .AXI_USER_WIDTH(UW)
       )
   axi_to_axi_lite_tx
     (
      .clk_i  ( clk                ), 
      .rst_ni ( rst                ),
      .testmode_i (1'b0),
      
      .slv    ( axi_master_tx      ),
      .mst    ( axi_lite_master_tx )
      );
   
   /****************************************************************/
   /********************** AXI LITE 2 APB **************************/
   /****************************************************************/

   axi_lite_to_apb_intf axi_lite_to_apb_tx
     (
      
      .clk_i  ( clk ), // Clock
      .rst_ni ( rst ), // Asynchronous reset active low
      
      .slv    ( axi_lite_master_tx ),
      
      // APB master port
      .paddr_o(s_apb_paddr),
      .pprot_o(s_apb_pprot),
      .pselx_o(s_apb_psel),
      .penable_o(s_apb_penable),
      .pwrite_o(s_apb_pwrite),
      .pwdata_o(s_apb_pwdata),
      .pstrb_o(s_apb_pstrb),
      .pready_i(s_apb_pready),
      .prdata_i(s_apb_prdata),
      .pslverr_i(s_apb_pslverr),
  
      // APB Slave Address Map
      .addr_map_i(1'b0)
      );
  
   can_top_apb 
     #(
       .rx_buffer_size     ( 128  ),          //: natural range 32 to 4098 := 128;
       .txt_buffer_count   ( 4    ),          //: natural range 2 to 8     := 4; 
       .sup_filtA          ( 1'b0 ),          //: boolean                  := true;
       .sup_filtB          ( 1'b0 ),          //: boolean                  := true;
       .sup_filtC          ( 1'b0 ),          //: boolean                  := true;
       .sup_range          ( 1'b0 ),          //: boolean                  := true;
       //.sup_traffic_ctrs   (1'b1),          //: boolean                  := true;
       .sup_test_registers (1'b1)             //: boolean                  := true
       ) 
   can_tx
     (
      .aclk          ( clk           ),
      .arstn         ( arstn         ),
      
      .scan_enable   ( 1'b0          ),     
      
      .irq           (               ), 
      .CAN_tx        ( tx_1          ),
      .CAN_rx        ( rx_1          ),
      .timestamp     ( 64'd0         ),
      
      // Ports of APB4
      .s_apb_paddr   ( s_apb_paddr   ),    
      .s_apb_penable ( s_apb_penable ),  
      .s_apb_pprot   ( s_apb_pprot   ),       
      .s_apb_prdata  ( s_apb_prdata  ),     
      .s_apb_pready  ( s_apb_pready  ),      
      .s_apb_psel    ( s_apb_psel    ),        
      .s_apb_pslverr ( s_apb_pslverr ),    
      .s_apb_pstrb   ( s_apb_pstrb   ),      
      .s_apb_pwdata  ( s_apb_pwdata  ),     
      .s_apb_pwrite  ( s_apb_pwrite  )
      );
   
   can_transciever transciever_r
     (
      .can_transciever_tx_i (tx_1),
      .can_transciever_rx_o    (rx_1),
      .can_transciever_rs_i    (1'b0),
      .can_transciever_canh_io (CANH),
      .can_transciever_canl_io (CANL)
      );
   
   can_transciever transciever_t
     (
      .can_transciever_tx_i    ( tx_2 ),
      .can_transciever_rx_o    ( rx_2 ),
      .can_transciever_rs_i    ( 1'b0 ),
      .can_transciever_canh_io ( CANH ),
      .can_transciever_canl_io ( CANL )
      );
   
endmodule
