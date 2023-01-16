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
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {0 ps} {16451 ps}
