% This script is written and read by pdetool and should NOT be edited.
% There are two recommended alternatives:
 % 1) Export the required variables from pdetool and create a MATLAB script
 %    to perform operations on these.
 % 2) Define the problem completely using a MATLAB script. See
 %    http://www.mathworks.com/help/pde/examples/index.html for examples
 %    of this approach.
function pdemodel
[pde_fig,ax]=pdeinit;
pdetool('appl_cb',9);
set(ax,'DataAspectRatio',[1 3.5999999999999992 1]);
set(ax,'PlotBoxAspectRatio',[1 0.66666666666666663 32]);
set(ax,'XLimMode','auto');
set(ax,'YLimMode','auto');
set(ax,'XTickMode','auto');
set(ax,'YTickMode','auto');

% Geometry description:
pdepoly([ 0,...
 0.0061000000000000004,...
 0.0061000000000000004,...
 0.017500000000000002,...
 0.017500000000000002,...
 0.0124,...
 0.0124,...
 0.010699999999999999,...
 0.010699999999999999,...
 0,...
],...
[ -0.071099999999999997,...
 -0.071099999999999997,...
 -0.1638,...
 -0.1638,...
 -0.17480000000000001,...
 -0.18290000000000001,...
 -0.18770000000000001,...
 -0.19,...
 -0.21540000000000001,...
 -0.21540000000000001,...
],...
 'P1');
pderect([0 0.0055999999999999999 -0.21540000000000001 -0.40000000000000002],'R1');
pderect([0.0061000000000000004 0.0080999999999999996 -0.078 -0.1638],'R2');
pderect([0.050500000000000003 0.075899999999999995 -0.14000000000000001 -0.127],'R3');
pderect([0.0047999999999999996 0.032800000000000003 -0.60960000000000003 -0.498],'R4');
pderect([0.075899999999999995 0.17100000000000001 -0.060999999999999999 -0.14000000000000001],'R5');
pderect([0.075899999999999995 0.080000000000000002 -0.14000000000000001 -0.40400000000000003],'R6');
pderect([0.080000000000000002 0.17100000000000001 -0.14000000000000001 -0.40400000000000003],'R7');
pdeellip(0.085000000000000006,-0.145,0.0050000000000000001,0.0050000000000000001,...
0,'E1');
pdeellip(0.085000000000000006,-0.16,0.0050000000000000001,0.0050000000000000001,...
0,'E2');
pdeellip(0.085000000000000006,-0.17499999999999999,0.0050000000000000001,0.0050000000000000001,...
0,'E3');
pdeellip(0.085000000000000006,-0.19,0.0050000000000000001,0.0050000000000000001,...
0,'E4');
pdeellip(0.085000000000000006,-0.20499999999999999,0.0050000000000000001,0.0050000000000000001,...
0,'E5');
pdeellip(0.085000000000000006,-0.22,0.0050000000000000001,0.0050000000000000001,...
0,'E6');
pdeellip(0.085000000000000006,-0.23499999999999999,0.0050000000000000001,0.0050000000000000001,...
0,'E7');
pdeellip(0.085000000000000006,-0.25,0.0050000000000000001,0.0050000000000000001,...
0,'E8');
pdeellip(0.085000000000000006,-0.26500000000000001,0.0050000000000000001,0.0050000000000000001,...
0,'E9');
pdeellip(0.085000000000000006,-0.28000000000000003,0.0050000000000000001,0.0050000000000000001,...
0,'E10');
pdeellip(0.085000000000000006,-0.29499999999999998,0.0050000000000000001,0.0050000000000000001,...
0,'E11');
pdeellip(0.085000000000000006,-0.31,0.0050000000000000001,0.0050000000000000001,...
0,'E12');
pdeellip(0.085000000000000006,-0.32500000000000001,0.0050000000000000001,0.0050000000000000001,...
0,'E13');
pdeellip(0.085000000000000006,-0.34000000000000002,0.0050000000000000001,0.0050000000000000001,...
0,'E14');
pdeellip(0.085000000000000006,-0.35499999999999998,0.0050000000000000001,0.0050000000000000001,...
0,'E15');
pdeellip(0.085000000000000006,-0.37,0.0050000000000000001,0.0050000000000000001,...
0,'E16');
pdeellip(0.085000000000000006,-0.38500000000000001,0.0050000000000000001,0.0050000000000000001,...
0,'E17');
pdepoly([ 0.050500000000000003,...
 0.075899999999999995,...
 0.075899999999999995,...
 0.032800000000000003,...
 0.032800000000000003,...
 0.0061000000000000004,...
 0.0061000000000000004,...
 0.025100000000000001,...
 0.025100000000000001,...
 0.050500000000000003,...
],...
[ -0.127,...
 -0.127,...
 -0.060999999999999999,...
 -0.060999999999999999,...
 -0.071099999999999997,...
 -0.071099999999999997,...
 -0.078,...
 -0.078,...
 -0.099099999999999994,...
 -0.099099999999999994,...
],...
 'P2');
pdepoly([ 0,...
 0.0047999999999999996,...
 0.0047999999999999996,...
 0.014999999999999999,...
 0.014999999999999999,...
 0.050500000000000003,...
 0.050500000000000003,...
 0.075899999999999995,...
 0.075899999999999995,...
 0.050500000000000003,...
 0.050500000000000003,...
 0.025100000000000001,...
 0.025100000000000001,...
 0.0080999999999999996,...
 0.0080999999999999996,...
 0.017500000000000002,...
 0.017500000000000002,...
 0.0124,...
 0.0124,...
 0.010699999999999999,...
 0.010699999999999999,...
 0.0055999999999999999,...
 0.0055999999999999999,...
 0,...
],...
[ -0.60960000000000003,...
 -0.60960000000000003,...
 -0.47239999999999999,...
 -0.47239999999999999,...
 -0.44450000000000001,...
 -0.44450000000000001,...
 -0.40400000000000003,...
 -0.40400000000000003,...
 -0.14000000000000001,...
 -0.14000000000000001,...
 -0.099099999999999994,...
 -0.099099999999999994,...
 -0.078,...
 -0.078,...
 -0.1638,...
 -0.1638,...
 -0.17480000000000001,...
 -0.18290000000000001,...
 -0.18770000000000001,...
 -0.19,...
 -0.21540000000000001,...
 -0.21540000000000001,...
 -0.40000000000000002,...
 -0.40000000000000002,...
],...
 'P3');
pdepoly([ 0.032800000000000003,...
 0.10000000000000001,...
 0.10000000000000001,...
 0.075899999999999995,...
 0.050500000000000003,...
 0.050500000000000003,...
 0.0848,...
 0.0848,...
 0.032800000000000003,...
],...
[ -0.505,...
 -0.505,...
 -0.40400000000000003,...
 -0.40400000000000003,...
 -0.40400000000000003,...
 -0.41399999999999998,...
 -0.41399999999999998,...
 -0.498,...
 -0.498,...
],...
 'P4');
pdepoly([ 0.050500000000000003,...
 0.079000000000000001,...
 0.079000000000000001,...
 0.0848,...
 0.0848,...
 0.050500000000000003,...
],...
[ -0.4204,...
 -0.4204,...
 -0.498,...
 -0.498,...
 -0.41399999999999998,...
 -0.41399999999999998,...
],...
 'P5');
pdepoly([ 0.0047999999999999996,...
 0.079000000000000001,...
 0.079000000000000001,...
 0.050500000000000003,...
 0.050500000000000003,...
 0.014999999999999999,...
 0.014999999999999999,...
 0.0047999999999999996,...
],...
[ -0.498,...
 -0.498,...
 -0.4204,...
 -0.4204,...
 -0.44450000000000001,...
 -0.44450000000000001,...
 -0.47239999999999999,...
 -0.47239999999999999,...
],...
 'P6');
set(findobj(get(pde_fig,'Children'),'Tag','PDEEval'),'String','P1+R1+R2+R3+P2+P3+R4+P4+P5+P6+R5+R6+R7-E1-E2-E3-E4-E5-E6-E7-E8-E9-E10-E11-E12-E13-E14-E15-E16-E17')

% Boundary conditions:
pdetool('changemode',0)
pdesetbd(149,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(148,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(147,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(146,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(145,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(144,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(143,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(142,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(141,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(140,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(139,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(138,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(137,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(136,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(135,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(134,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(133,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(132,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(131,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(130,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(129,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(128,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(127,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(126,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(125,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(124,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(123,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(122,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(121,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(120,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(119,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(118,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(117,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(116,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(115,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(114,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(113,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(112,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(111,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(110,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(109,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(108,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(107,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(106,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(105,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(104,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(103,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(102,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(101,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(100,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(99,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(98,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(97,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(96,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(95,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(94,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(93,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(92,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(91,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(90,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(89,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(88,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(87,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(86,...
'dir',...
1,...
'1',...
'-22')
pdesetbd(85,...
'dir',...
1,...
'1',...
'-21')
pdesetbd(84,...
'dir',...
1,...
'1',...
'-21')
pdesetbd(83,...
'dir',...
1,...
'1',...
'-21')
pdesetbd(82,...
'dir',...
1,...
'1',...
'-21')
pdesetbd(44,...
'dir',...
1,...
'1',...
'18')
pdesetbd(42,...
'dir',...
1,...
'1',...
'20')
pdesetbd(41,...
'dir',...
1,...
'1',...
'20')
pdesetbd(37,...
'neu',...
1,...
'0',...
'0')
pdesetbd(36,...
'neu',...
1,...
'0',...
'0')
pdesetbd(35,...
'neu',...
1,...
'0',...
'0')
pdesetbd(13,...
'dir',...
1,...
'1',...
'20')
pdesetbd(12,...
'dir',...
1,...
'1',...
'20')
pdesetbd(9,...
'dir',...
1,...
'1',...
'18')
pdesetbd(8,...
'dir',...
1,...
'1',...
'18')
pdesetbd(7,...
'dir',...
1,...
'1',...
'20')
pdesetbd(6,...
'dir',...
1,...
'1',...
'20')
pdesetbd(4,...
'dir',...
1,...
'1',...
'20')
pdesetbd(3,...
'dir',...
1,...
'1',...
'20')
pdesetbd(2,...
'dir',...
1,...
'1',...
'20')
pdesetbd(1,...
'dir',...
1,...
'1',...
'20')

% Mesh generation:
setappdata(pde_fig,'Hgrad',1.3);
setappdata(pde_fig,'refinemethod','regular');
setappdata(pde_fig,'jiggle',char('on','mean',''));
setappdata(pde_fig,'MesherVersion','preR2013a');
pdetool('initmesh')
pdetool('refine')

% PDE coefficients:
pdeseteq(1,...
'0.01*x!0.04*x!0.04*x!.3*x!.1*x!10*x!20*x!1*x!0.04*x!200*x!0.04*x!0.04*x!0.03*x!1.0',...
'0!0!0!0!0!0!0!0!0!0!0!0!0!1.0',...
'(0)+(0).*(0.0)!(0)+(0).*(0.0)!(0)+(0).*(0.0)!(0)+(0).*(0.0)!(0)+(0).*(0.0)!(0)+(0).*(0.0)!(0)+(0).*(0.0)!(0)+(0).*(0.0)!(0)+(0).*(0.0)!(0)+(0).*(0.0)!(0)+(0).*(0.0)!(0)+(0).*(0.0)!(0)+(0).*(0.0)!(1.0)+(1.0).*(0.0)',...
'(1.0).*(1.0)!(1.0).*(1.0)!(1.0).*(1.0)!(1.0).*(1.0)!(1.0).*(1.0)!(1.0).*(1.0)!(1.0).*(1.0)!(1.0).*(1.0)!(1.0).*(1.0)!(1.0).*(1.0)!(1.0).*(1.0)!(1.0).*(1.0)!(1.0).*(1.0)!(1.0).*(1.0)',...
'0:10',...
'0.0',...
'0.0',...
'[0 100]')
setappdata(pde_fig,'currparam',...
['1.0!1.0!1.0!1.0!1.0!1.0!1.0!1.0!1.0!1.0!1.0!1.0!1.0!1.0                             ';...
'1.0!1.0!1.0!1.0!1.0!1.0!1.0!1.0!1.0!1.0!1.0!1.0!1.0!1.0                             ';...
'0.01*x!0.04*x!0.04*x!.3*x!.1*x!10*x!20*x!1*x!0.04*x!200*x!0.04*x!0.04*x!0.03*x!1.0  ';...
'0!0!0!0!0!0!0!0!0!0!0!0!0!1.0                                                       ';...
'0!0!0!0!0!0!0!0!0!0!0!0!0!1.0                                                       ';...
'0.0!0.0!0.0!0.0!0.0!0.0!0.0!0.0!0.0!0.0!0.0!0.0!0.0!0.0                             '])

% Solve parameters:
setappdata(pde_fig,'solveparam',...
char('0','22488','10','pdeadworst',...
'0.5','longest','0','1E-4','','fixed','Inf'))

% Plotflags and user data strings:
setappdata(pde_fig,'plotflags',[1 1 1 1 1 1 1 1 0 0 0 1 0 1 0 0 0 1]);
setappdata(pde_fig,'colstring','');
setappdata(pde_fig,'arrowstring','');
setappdata(pde_fig,'deformstring','');
setappdata(pde_fig,'heightstring','');

% Solve PDE:
pdetool('solve')