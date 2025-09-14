`timescale 1ns / 1ps

module cpu(clk,instr,alures,r1,r2,wd);
input clk;
input [7:0]instr;
output [2:0]alures,wd,r1,r2;

wire [15:0] watermark = {8'h53, 8'h47};
wire watermark_keep = ^watermark;
//wire [7:0]instr;
//wire [2:0]alures,wd,r1,r2;
wire [1:0]aopc;
wire [4:0]pcoa,ia,ares1,ares2,sia,pria;
wire we,br,zf,sel1,sel2,bre,t1,t2,wf,nwe,en;

mux_5bit m1 (.o(ia),.a(ares1),.b(ares2),.s(sel1));
pc p1 (.pci(ia),.pco(pcoa),.clk(clk));
pc_reg p2 (.in(pria),.o(pcoa),.en(en));
decoder d (.op(instr[7:5]),.br(br),.bre(bre),.sel(sel2),.we(we),.aluop(aopc),.en(en));

nor n1 (t1,br,zf);
nand n2 (t2,bre,zf);
xor x1 (sel1,t1,t2);
xor x2 (nwe,we,wf);

reg_file r (.a1(instr[4:3]),.a2(instr[2:1]),.wd(wd),.rd1(r1),.rd2(r2),.clk(clk),.we(nwe));
mux_3bit m2 (.a(instr[2:0]),.b(alures),.s(sel2),.o(wd));
alu_3bit a1 (.a(r1),.b(r2),.o(alures),.zf(zf),.wf(wf),.op(aopc));

sign_ext s1 (.in(instr[4:0]),.out(sia));
adder_5bit a2 (.a(sia),.b(ares1),.o(ares2));
adder_5bit a3(.a(),.b(5'b00001),.o(ares1));
endmodule
