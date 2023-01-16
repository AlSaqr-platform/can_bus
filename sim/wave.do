onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/aw_id
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/aw_addr
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/aw_len
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/aw_size
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/aw_burst
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/aw_lock
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/aw_cache
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/aw_prot
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/aw_qos
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/aw_region
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/aw_atop
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/aw_user
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/aw_valid
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/aw_ready
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/w_data
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/w_strb
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/w_last
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/w_user
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/w_valid
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/w_ready
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/b_id
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/b_resp
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/b_user
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/b_valid
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/b_ready
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/ar_id
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/ar_addr
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/ar_len
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/ar_size
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/ar_burst
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/ar_lock
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/ar_cache
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/ar_prot
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/ar_qos
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/ar_region
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/ar_user
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/ar_valid
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/ar_ready
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/r_id
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/r_data
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/r_resp
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/r_last
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/r_user
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/r_valid
add wave -noupdate -group {AXI MASTER TX} /tb_can_vip/axi_master_tx/r_ready
add wave -noupdate -group TESTBENCH /tb_can_vip/rx_1
add wave -noupdate -group TESTBENCH /tb_can_vip/tx_1
add wave -noupdate -group TESTBENCH /tb_can_vip/clk
add wave -noupdate -group TESTBENCH /tb_can_vip/arstn
add wave -noupdate -group TESTBENCH /tb_can_vip/s_apb_paddr
add wave -noupdate -group TESTBENCH /tb_can_vip/s_apb_penable
add wave -noupdate -group TESTBENCH /tb_can_vip/s_apb_pprot
add wave -noupdate -group TESTBENCH /tb_can_vip/s_apb_prdata
add wave -noupdate -group TESTBENCH /tb_can_vip/s_apb_pready
add wave -noupdate -group TESTBENCH /tb_can_vip/s_apb_psel
add wave -noupdate -group TESTBENCH /tb_can_vip/s_apb_pslverr
add wave -noupdate -group TESTBENCH /tb_can_vip/s_apb_pstrb
add wave -noupdate -group TESTBENCH /tb_can_vip/s_apb_pwdata
add wave -noupdate -group TESTBENCH /tb_can_vip/s_apb_pwrite
add wave -noupdate -group TESTBENCH /tb_can_vip/CANH
add wave -noupdate -group TESTBENCH /tb_can_vip/CANL
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/aw_id
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/aw_addr
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/aw_len
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/aw_size
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/aw_burst
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/aw_lock
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/aw_cache
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/aw_prot
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/aw_qos
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/aw_region
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/aw_atop
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/aw_user
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/aw_valid
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/aw_ready
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/w_data
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/w_strb
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/w_last
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/w_user
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/w_valid
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/w_ready
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/b_id
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/b_resp
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/b_user
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/b_valid
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/b_ready
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/ar_id
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/ar_addr
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/ar_len
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/ar_size
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/ar_burst
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/ar_lock
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/ar_cache
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/ar_prot
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/ar_qos
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/ar_region
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/ar_user
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/ar_valid
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/ar_ready
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/r_id
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/r_data
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/r_resp
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/r_last
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/r_user
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/r_valid
add wave -noupdate -group AXI_TO_AXI_LITE_TX_SLAVE /tb_can_vip/axi_to_axi_lite_tx/slv/r_ready
add wave -noupdate -group AXI_TO_AXI_LITE_TX_MASTER /tb_can_vip/axi_to_axi_lite_tx/mst/aw_addr
add wave -noupdate -group AXI_TO_AXI_LITE_TX_MASTER /tb_can_vip/axi_to_axi_lite_tx/mst/aw_prot
add wave -noupdate -group AXI_TO_AXI_LITE_TX_MASTER /tb_can_vip/axi_to_axi_lite_tx/mst/aw_valid
add wave -noupdate -group AXI_TO_AXI_LITE_TX_MASTER /tb_can_vip/axi_to_axi_lite_tx/mst/aw_ready
add wave -noupdate -group AXI_TO_AXI_LITE_TX_MASTER /tb_can_vip/axi_to_axi_lite_tx/mst/w_data
add wave -noupdate -group AXI_TO_AXI_LITE_TX_MASTER /tb_can_vip/axi_to_axi_lite_tx/mst/w_strb
add wave -noupdate -group AXI_TO_AXI_LITE_TX_MASTER /tb_can_vip/axi_to_axi_lite_tx/mst/w_valid
add wave -noupdate -group AXI_TO_AXI_LITE_TX_MASTER /tb_can_vip/axi_to_axi_lite_tx/mst/w_ready
add wave -noupdate -group AXI_TO_AXI_LITE_TX_MASTER /tb_can_vip/axi_to_axi_lite_tx/mst/b_resp
add wave -noupdate -group AXI_TO_AXI_LITE_TX_MASTER /tb_can_vip/axi_to_axi_lite_tx/mst/b_valid
add wave -noupdate -group AXI_TO_AXI_LITE_TX_MASTER /tb_can_vip/axi_to_axi_lite_tx/mst/b_ready
add wave -noupdate -group AXI_TO_AXI_LITE_TX_MASTER /tb_can_vip/axi_to_axi_lite_tx/mst/ar_addr
add wave -noupdate -group AXI_TO_AXI_LITE_TX_MASTER /tb_can_vip/axi_to_axi_lite_tx/mst/ar_prot
add wave -noupdate -group AXI_TO_AXI_LITE_TX_MASTER /tb_can_vip/axi_to_axi_lite_tx/mst/ar_valid
add wave -noupdate -group AXI_TO_AXI_LITE_TX_MASTER /tb_can_vip/axi_to_axi_lite_tx/mst/ar_ready
add wave -noupdate -group AXI_TO_AXI_LITE_TX_MASTER /tb_can_vip/axi_to_axi_lite_tx/mst/r_data
add wave -noupdate -group AXI_TO_AXI_LITE_TX_MASTER /tb_can_vip/axi_to_axi_lite_tx/mst/r_resp
add wave -noupdate -group AXI_TO_AXI_LITE_TX_MASTER /tb_can_vip/axi_to_axi_lite_tx/mst/r_valid
add wave -noupdate -group AXI_TO_AXI_LITE_TX_MASTER /tb_can_vip/axi_to_axi_lite_tx/mst/r_ready
add wave -noupdate -group AXI_LITE_TO_APB_TX_SLAVE /tb_can_vip/axi_lite_to_apb_tx/slv/aw_addr
add wave -noupdate -group AXI_LITE_TO_APB_TX_SLAVE /tb_can_vip/axi_lite_to_apb_tx/slv/aw_prot
add wave -noupdate -group AXI_LITE_TO_APB_TX_SLAVE /tb_can_vip/axi_lite_to_apb_tx/slv/aw_valid
add wave -noupdate -group AXI_LITE_TO_APB_TX_SLAVE /tb_can_vip/axi_lite_to_apb_tx/slv/aw_ready
add wave -noupdate -group AXI_LITE_TO_APB_TX_SLAVE /tb_can_vip/axi_lite_to_apb_tx/slv/w_data
add wave -noupdate -group AXI_LITE_TO_APB_TX_SLAVE /tb_can_vip/axi_lite_to_apb_tx/slv/w_strb
add wave -noupdate -group AXI_LITE_TO_APB_TX_SLAVE /tb_can_vip/axi_lite_to_apb_tx/slv/w_valid
add wave -noupdate -group AXI_LITE_TO_APB_TX_SLAVE /tb_can_vip/axi_lite_to_apb_tx/slv/w_ready
add wave -noupdate -group AXI_LITE_TO_APB_TX_SLAVE /tb_can_vip/axi_lite_to_apb_tx/slv/b_resp
add wave -noupdate -group AXI_LITE_TO_APB_TX_SLAVE /tb_can_vip/axi_lite_to_apb_tx/slv/b_valid
add wave -noupdate -group AXI_LITE_TO_APB_TX_SLAVE /tb_can_vip/axi_lite_to_apb_tx/slv/b_ready
add wave -noupdate -group AXI_LITE_TO_APB_TX_SLAVE /tb_can_vip/axi_lite_to_apb_tx/slv/ar_addr
add wave -noupdate -group AXI_LITE_TO_APB_TX_SLAVE /tb_can_vip/axi_lite_to_apb_tx/slv/ar_prot
add wave -noupdate -group AXI_LITE_TO_APB_TX_SLAVE /tb_can_vip/axi_lite_to_apb_tx/slv/ar_valid
add wave -noupdate -group AXI_LITE_TO_APB_TX_SLAVE /tb_can_vip/axi_lite_to_apb_tx/slv/ar_ready
add wave -noupdate -group AXI_LITE_TO_APB_TX_SLAVE /tb_can_vip/axi_lite_to_apb_tx/slv/r_data
add wave -noupdate -group AXI_LITE_TO_APB_TX_SLAVE /tb_can_vip/axi_lite_to_apb_tx/slv/r_resp
add wave -noupdate -group AXI_LITE_TO_APB_TX_SLAVE /tb_can_vip/axi_lite_to_apb_tx/slv/r_valid
add wave -noupdate -group AXI_LITE_TO_APB_TX_SLAVE /tb_can_vip/axi_lite_to_apb_tx/slv/r_ready
add wave -noupdate -group AXI_LITE_TO_APB_TX_MASTER /tb_can_vip/axi_lite_to_apb_tx/clk_i
add wave -noupdate -group AXI_LITE_TO_APB_TX_MASTER /tb_can_vip/axi_lite_to_apb_tx/rst_ni
add wave -noupdate -group AXI_LITE_TO_APB_TX_MASTER /tb_can_vip/axi_lite_to_apb_tx/paddr_o
add wave -noupdate -group AXI_LITE_TO_APB_TX_MASTER /tb_can_vip/axi_lite_to_apb_tx/pprot_o
add wave -noupdate -group AXI_LITE_TO_APB_TX_MASTER /tb_can_vip/axi_lite_to_apb_tx/pselx_o
add wave -noupdate -group AXI_LITE_TO_APB_TX_MASTER /tb_can_vip/axi_lite_to_apb_tx/penable_o
add wave -noupdate -group AXI_LITE_TO_APB_TX_MASTER /tb_can_vip/axi_lite_to_apb_tx/pwrite_o
add wave -noupdate -group AXI_LITE_TO_APB_TX_MASTER /tb_can_vip/axi_lite_to_apb_tx/pwdata_o
add wave -noupdate -group AXI_LITE_TO_APB_TX_MASTER /tb_can_vip/axi_lite_to_apb_tx/pstrb_o
add wave -noupdate -group AXI_LITE_TO_APB_TX_MASTER /tb_can_vip/axi_lite_to_apb_tx/pready_i
add wave -noupdate -group AXI_LITE_TO_APB_TX_MASTER /tb_can_vip/axi_lite_to_apb_tx/prdata_i
add wave -noupdate -group AXI_LITE_TO_APB_TX_MASTER /tb_can_vip/axi_lite_to_apb_tx/pslverr_i
add wave -noupdate -group AXI_LITE_TO_APB_TX_MASTER /tb_can_vip/axi_lite_to_apb_tx/addr_map_i
add wave -noupdate -group AXI_LITE_TO_APB_TX_MASTER /tb_can_vip/axi_lite_to_apb_tx/axi_req
add wave -noupdate -group AXI_LITE_TO_APB_TX_MASTER /tb_can_vip/axi_lite_to_apb_tx/axi_resp
add wave -noupdate -group AXI_LITE_TO_APB_TX_MASTER /tb_can_vip/axi_lite_to_apb_tx/apb_req
add wave -noupdate -group AXI_LITE_TO_APB_TX_MASTER /tb_can_vip/axi_lite_to_apb_tx/apb_resp
add wave -noupdate -group AXI_LITE_TO_APB_TX_MASTER /tb_can_vip/axi_lite_to_apb_tx/apb_sel
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4900000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 593
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {33689600 ps}
