function Figure5(HT)

% phi = (1+sqrt(5))/2; %godlen ratio
width = 9.5; % Width in inches
height = 7; % Height in inches
alw = 0.5; % AxesLineWidth
fsz = 10; % FontSize

fszax = fsz;

ftype1 = 'Helvetica'; %hLegend, gca
%ftype2='Times New Roman'; % hTitle, hXLabel, hYLabel
xycolor = [0.2, 0.2, 0.2];
figure;
set(gcf, 'Position', [20, 100, width * 100, height * 100]); %<- Set size
%[ha, ~] = tight_subplot(Nh, Nw, [gap_h gap_w], [lower upper], [left right])
[ha, ~] = tight_subplot(3, 3, [.05, .025], [0.1, .05], [.1, .05]);

YF = 0.3;
Hs = -469;
Hx = HT * 4.2 / 4;

dhana = 0;
dcatg = -469;
dcatL = -18.33;
dcatE = -16.77;
%Aerobic 2a
axes(ha(1));
y_ae_max = min([Hs / Hx, 1]);
Y = linspace(0, y_ae_max, 1000);

% DH_AE = (Y*Hx - Hs);
DH_AE = abs((1 - Y * 1.05)*dcatg+Y*dhana);
cAE = (1 - Y);
CR = DH_AE ./ cAE;
plot(ha(1), cAE, Y, '-', 'Color', 'k', 'LineWidth', 1.5);
plot(ha(2), DH_AE, Y, '-', 'Color', 'k', 'LineWidth', 1.5);
p1 = plot(ha(3), CR, Y, '-', 'Color', 'k', 'LineWidth', 1.5); hold on

%Anaerobic to eth
e_eth_max = min([Hs / Hx, 1]); % from excel
e1 = linspace(0, e_eth_max, 1000);
DH_eth = abs((1 - e1 * 1.05)*dcatE+e1*dhana);
cEth = (0.05 * e1 + (1 - 1.05 * e1) * 1 / 3);
CR = DH_eth ./ cEth;
plot(ha(4), cEth, e1, '--', 'Color', 'k', 'LineWidth', 1.5);
plot(ha(5), DH_eth, e1, '--', 'Color', 'k', 'LineWidth', 1.5);
p2 = plot(ha(6), CR, e1, '--', 'Color', 'k', 'LineWidth', 1.5); hold on

% p2 = plot(CR, e1, '--', 'Color', 'k', 'LineWidth', 1.5); hold on


%Anaerobic to Lac
e_lac_max = min([Hs / Hx, 1]);
e2 = linspace(0, e_lac_max, 100);
DH_Lac = abs(e2*dhana+(1 - 1.05 * e2)*dcatL);
cLac = 0.05 * e2;
CR = DH_Lac ./ cLac;
plot(ha(7), cLac, e2, '-.', 'Color', 'k', 'LineWidth', 1.5);
plot(ha(8), DH_Lac, e2, '-.', 'Color', 'k', 'LineWidth', 1.5);
p3 = plot(ha(9), CR, e2, '-.', 'Color', 'k', 'LineWidth', 1.5); hold on

% p3 = plot(CR, e2, '-.', 'Color','k', 'LineWidth', 1.5); hold on
% text(475, 0.29, 'CUE = 0 as CR \newlineapproaches infinity', 'FontSize', fsz,...
%   'Interpreter', 'tex')

xlim([ha(3:3:9)], [0, 900])
ylim(ha, [0, 1])
xlabel(ha(7), 'CO_2 (C-mol B C-mol^{-1} S)','FontSize', fsz)
xlabel(ha(8), [char(8211),'{\it \DeltaH_{glu}} (kJ C-mol^{-1} S)'],'FontSize', fsz)
xlabel(ha(9), '{\it CR} (kJ C-mol^{-1} CO_2)','FontSize', fsz)
ylabel(ha(1), '{\it CUE} (C-mol B C-mol^{-1} S)','FontSize', fsz)
ylabel(ha(4), '{\it CUE} (C-mol B C-mol^{-1} S)','FontSize', fsz)
ylabel(ha(7), '{\it CUE} (C-mol B C-mol^{-1} S)','FontSize', fsz)

text(ha(1), -0.3, 0.45, 'AE', 'Rotation', 90, 'Units', 'normalized', ...
  'FontSize', fszax, 'FontName', ftype1)
text(ha(4), -0.3, 0.45, 'F1', 'Rotation', 90, 'Units', 'normalized', ...
  'FontSize', fszax, 'FontName', ftype1)
text(ha(7), -0.3, 0.45, 'F2', 'Rotation', 90, 'Units', 'normalized', ...
  'FontSize', fszax, 'FontName', ftype1)
set(ha([2,3,5,6,8,9]), 'YTickLabel',[])

set(ha, ...
  'FontSize', fszax, 'FontName', ftype1, ...
  'LineWidth', alw, 'Box', 'off', ...
  'TickDir', 'out', 'TickLength', [.02, .02], 'XMinorTick', 'on', ...
  'YMinorTick', 'on', 'YGrid', 'on', 'XGrid', 'on', 'XColor', xycolor, 'YColor', xycolor);
set(gcf, 'Color', 'w')

letter = 'abcdefghijk';
for i = 1:9
  text(ha(i), 0.9, 0.95, ['(', letter(i), ')'], 'FontSize', fszax, 'FontName', ftype1, 'Units', 'normalized')
end

A1=annotation('arrow','LineWidth',2,'LineStyle', '-');
A1.Position=[ 2.3684e-01   7.6486e-01  -6.9053e-02   7.5429e-02];

A2=annotation('arrow','LineWidth',2,'LineStyle', '-');
A2.Position=[ 5.4926e-01   7.5343e-01  -8.4951e-02   8.8717e-02];


A3=annotation('arrow','LineWidth',2,'LineStyle', '-');
A3.Position=[  8.4484e-01   7.8314e-01  -1.9619e-02   1.2200e-01];
A1.Position = [A1.Position(1)+A1.Position(3), A1.Position(2)+A1.Position(4), -A1.Position(3),-A1.Position(4)];
A2.Position = [A2.Position(1)+A2.Position(3), A2.Position(2)+A2.Position(4), -A2.Position(3),-A2.Position(4)];
A3.Position = [A3.Position(1)+A3.Position(3), A3.Position(2)+A3.Position(4), -A3.Position(3),-A3.Position(4)];


B=annotation('arrow','LineWidth',2,'LineStyle', '--');
B.Position=[2.4189e-01   4.4383e-01  -7.8318e-02   1.0436e-01];
B.Position = [B.Position(1)+B.Position(3), B.Position(2)+B.Position(4), -B.Position(3),-B.Position(4)];

B=annotation('arrow','LineWidth',2,'LineStyle', '--');
B.Position=[ 5.3326e-01   4.4486e-01  -6.6526e-02   7.8857e-02];
B.Position = [B.Position(1)+B.Position(3), B.Position(2)+B.Position(4), -B.Position(3),-B.Position(4)];

B=annotation('arrow','LineWidth',2,'LineStyle', '--');
B.Position=[7.3200e-01   4.4257e-01  -5.0526e-03   1.0286e-01];
B.Position = [B.Position(1)+B.Position(3), B.Position(2)+B.Position(4), -B.Position(3),-B.Position(4)];

C=annotation('arrow','LineWidth',2,'LineStyle', '-.');
C.Position=[1.4926e-01   1.8200e-01   1.1032e-01   1.0971e-01];
C.Position = [C.Position(1)+C.Position(3), C.Position(2)+C.Position(4), -C.Position(3),-C.Position(4)];

C=annotation('arrow','LineWidth',2,'LineStyle', '-.');
C.Position=[ 5.8480e-01   1.7476e-01  -6.8582e-02   7.6283e-02];
C.Position = [C.Position(1)+C.Position(3), C.Position(2)+C.Position(4), -C.Position(3),-C.Position(4)];

C=annotation('arrow','LineWidth',2,'LineStyle', '-.');
C.Position=[ 0.7305    0.2386    0.0971   -0.0652];


figpath='..\Figures\';
export_fig(gcf, [figpath, 'Figure5.pdf'], '-r300');