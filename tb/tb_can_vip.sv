
`timescale 1 ns/1 ps

`include "axi/assign.svh"

module tb_can_vip ();
   import axi_pkg::*;
   
   parameter AW = 32;  //Address width
   parameter DW = 32;  //Data width
   parameter IW = 8;   //ID width
   parameter UW = 8;   //User width
   
   localparam time clk_period = 100ns;
   logic           rx_1, tx_1;
   logic           clk   = 0; 
   logic	         arstn = 1;
                    
   logic [31:0]    s_apb_paddr;      //: std_logic_vector(31 downto 0);
   logic	         s_apb_penable;    //: std_logic;
   logic [2:0]	   s_apb_pprot;      //: std_logic_vector(2 downto 0);
   logic [31:0]    s_apb_prdata;     //: std_logic_vector(31 downto 0);
   logic	         s_apb_pready;     //: std_logic;
   logic	         s_apb_psel;       //: std_logic;
   logic	         s_apb_pslverr;    //: std_logic;
   logic [3:0]	   s_apb_pstrb;      //: std_logic_vector(3 downto 0);
   logic [31:0]    s_apb_pwdata;     //: std_logic_vector(31 downto 0);
   logic	         s_apb_pwrite;     //: std_logic;
   
   
      
   wire      CANH;
   wire      CANL;
   
   //------------------------ AXI drivers --------------------------
   
   AXI_BUS_DV
     #(
       .AXI_ADDR_WIDTH   (AW),
       .AXI_DATA_WIDTH   (DW),
       .AXI_ID_WIDTH     (IW),
       .AXI_USER_WIDTH   (UW)
       ) 
   axi_master_tx_dv(clk), axi_master_rx_dv(clk);
   
   AXI_BUS
     #(
       .AXI_ADDR_WIDTH   (AW),
       .AXI_DATA_WIDTH   (DW),
       .AXI_ID_WIDTH     (IW),
       .AXI_USER_WIDTH   (UW)
       ) 
   axi_master_tx(),axi_master_rx();

   
   `AXI_ASSIGN(axi_master_tx, axi_master_tx_dv)
   `AXI_ASSIGN(axi_master_rx, axi_master_rx_dv)
  

 AXI_LITE
     #(
       .AXI_ADDR_WIDTH(AW),
       .AXI_DATA_WIDTH(DW)
       ) 
   axi_lite_master_tx(),axi_lite_master_rx();

  
   typedef axi_test::axi_driver #(.AW(AW), .DW(DW), .IW(IW), .UW(UW), .TA(200ps), .TT(700ps)) axi_drv_t;
   axi_drv_t axi_master_tx_drv =  new(axi_master_tx_dv);
   axi_drv_t axi_master_rx_drv =  new(axi_master_rx_dv);
   
   /****************************************************************/
   /********************** AXI 2 AXI LITE **************************/
   /****************************************************************/
   
   axi_to_axi_lite_intf
     #(
       .AXI_ADDR_WIDTH     (AW),
       .AXI_DATA_WIDTH     (DW),
       .AXI_ID_WIDTH       (IW),
       .AXI_USER_WIDTH     (UW),
       .AXI_MAX_WRITE_TXNS ( 32'd10  ),
       .AXI_MAX_READ_TXNS  ( 32'd10  ),
       .FALL_THROUGH       ( 1'b1    )
       )
   axi_to_axi_lite_tx
     (
      .clk_i             ( clk                ), 
      .rst_ni            ( rst                ),
      .testmode_i        (1'b0                ),
     
      .slv               ( axi_master_tx      ),
      .mst               ( axi_lite_master_tx )
      );
   
   /****************************************************************/
   /********************** AXI LITE 2 APB **************************/
   /****************************************************************/
/*io*/
   localparam int unsigned AxiAddrWidth = 32;
  localparam int unsigned AxiDataWidth = 32;
  localparam int unsigned AxiStrbWidth = AxiDataWidth/8; 
   typedef logic [AxiAddrWidth-1:0]      addr_t;
  typedef logic [AxiDataWidth-1:0]      data_t;
  typedef logic [AxiStrbWidth-1:0]      strb_t;
/**/
   
 localparam NoAddrRules = 1;
 typedef axi_pkg::xbar_rule_32_t       rule_t;
 localparam rule_t [NoAddrRules-1:0]  AddrMap = '{
   '{ idx: 32'd0, start_addr: 32'h0000_0000, end_addr: 32'h0000_3000 }
   };
   

  axi_lite_to_apb_intf #(
      .NoApbSlaves      ( 32'd1        ),
      .NoRules          ( NoAddrRules  ),
      .AddrWidth        ( AW           ),
      .DataWidth        ( DW           ),
      .PipelineRequest  ( 1'b0         ),
      .PipelineResponse ( 1'b0         ),
      .rule_t           ( rule_t)
) axi_lite_to_apb_tx
     (
      
      .clk_i  ( clk ), // Clock
      .rst_ni ( arstn ), // Asynchronous reset active low
      
      .slv    ( axi_lite_master_tx ),
      
      // APB master port
      .paddr_o          (s_apb_paddr   ),
      .pprot_o          (s_apb_pprot   ),
      .pselx_o          (s_apb_psel    ),
      .penable_o        (s_apb_penable ),
      .pwrite_o         (s_apb_pwrite  ),
      .pwdata_o         (s_apb_pwdata  ),
      .pstrb_o          (s_apb_pstrb   ),
      .pready_i         (s_apb_pready  ),
      .prdata_i         (s_apb_prdata  ),
      .pslverr_i        (s_apb_pslverr ),
  
      // APB Slave Address Map
      .addr_map_i(AddrMap)
      );




   
 /****************************************************************/
 /***************************** DUT ******************************/
 /****************************************************************/ 
   can_top_apb 
     #(
       .rx_buffer_size     ( 32   ),         //: natural range 32 to 4098 := 128;
       .txt_buffer_count   ( 4    ),          //: natural range 2 to 8     := 4; 
       .sup_filtA          ( 1'b0 ),          //: boolean                  := true;
       .sup_filtB          ( 1'b0 ),          //: boolean                  := true;
       .sup_filtC          ( 1'b0 ),          //: boolean                  := true;
       .sup_range          ( 1'b0 ),          //: boolean                  := true;
       .sup_traffic_ctrs   ( 1'b1 ),          //: boolean                  := true;
       .sup_test_registers ( 1'b1 )           //: boolean                  := true
       ) 
   can_tx
     (
      .aclk          ( clk           ),
      .arstn         ( arstn         ),
      .res_n_out     (               ),
      .scan_enable   ( 1'b0          ),     
      
      .irq           (                      ), 
      .CAN_tx        ( tx_1                 ),
      .CAN_rx        ( rx_1                 ),
      .timestamp     ( 64'hffffffffffffffff ),
      
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
   
   can_transciever transciever_t
     (
      .can_transciever_tx_i    (tx_1),
      .can_transciever_rx_o    (rx_1),
      .can_transciever_rs_i    (1'b0),
      .can_transciever_canh_io (CANH),
      .can_transciever_canl_io (CANL)
      );


// high level functions for axi operations
   fixture_can fix();

   
// ---------------------- CLOCK GENERATION ----------------------
   
   
   initial begin
      while (1'b1) begin //SYSTEM CLOCK
	       clk <= 1; 
	       #(clk_period/2);
	       clk <= 0;
	       #(clk_period/2);
      end
   end


 // ------------------------ BEGINNING OF SIMULATION ----------------------
   initial begin
      
      // Reset axi master
      fix.reset_master(axi_master_tx_drv);
      repeat(5) @(posedge clk);

    
          
      #clk_period;
      arstn <= 0;
      repeat(10) @(posedge clk);
      arstn <= 1;
      #clk_period;
  

   
      // Reset axi master
      fix.reset_master(axi_master_tx_drv);
      repeat(5) @(posedge clk);

      #3000ns;
   

     fix.write_axi(axi_master_tx_drv,'h00000810,'h00000040, 'h0f);
      repeat(5) @(posedge clk);
      #5
     $stop();
      
   end
endmodule
