close all
clearvars
HT=-469;

% phi = (1+sqrt(5))/2; %godlen ratio
width = 9.5; % Width in inches
height = 7; % Height in inches
alw = 0.5; % AxesLineWidth
fsz = 10; % FontSize

fszax = fsz;

ftype1 = 'Helvetica'; %hLegend, gca
%ftype2='Times New Roman'; % hTitle, hXLabel, hYLabel
xycolor = [0.2, 0.2, 0.2];

YF = 0.3;
Hs = -469;
Hx = HT * 4.2 / 4;

dhana = 0;
dcatg = -469;
dcatL = -18.33;
dcatE = -16.77;
e_eth_max = min([Hs / Hx, 1]); % from excel

e1 = linspace(0, e_eth_max, 10);
beta = linspace(0, 1, 10000);
gamma = 1 - beta;
e2=0.9;
LC = linspecer(length(e1),'sequential');

for i=1:length(e1)
  
  e11=e1(i);
  DH_eth = abs((1 - e11 * 1.05)*dcatE + e11*dhana);
  DH_Lac = abs(e2*dhana + (1 - 1.05 * e2)*dcatL);
  cue = beta * e11 + gamma * e2;
  cLac = 0.05 * e2;
  cEth = (0.05 * e11 + (1 - 1.05 * e11) * 1 / 3);
  CR = (beta * DH_eth + gamma * DH_Lac) ./ (beta * cEth + gamma * cLac);
  fig1=figure(1); ax1=gca;
  plot(beta, cue, 'DisplayName', sprintf('YF1=%1.2f',e11),'Color', LC(i, :), 'LineWidth', 1.5); hold on 
  fig2=figure(2); ax2=gca;
  plot(beta, CR,'DisplayName', sprintf('YF1=%1.2f',e11),'Color', LC(i, :), 'LineWidth', 1.5); hold on 

end
xlabel(ax1, '\beta','FontSize', fsz)
xlabel(ax2, '\beta','FontSize', fsz)
ylabel(ax1, 'CUE (C-mol B C-mol^{-1} S)','FontSize', fsz)
ylabel(ax2, 'CR (kJ C-mol^{-1} CO_2)','FontSize', fsz)
colormap(ax1,'jet');colormap(ax2,'jet')
C1 = colorbar(ax1);C2 = colorbar(ax2);
C1.Box = 'off';C2.Box = 'off';
C1.TickDirection = 'out';C2.TickDirection = 'out';
set(get(C1, 'Title'), 'String', 'Y_{F1}', ...
  'FontName', 'Helvetica', 'FontSize', 10)
set(get(C2, 'Title'), 'String', 'Y_{F1}', ...
  'FontName', 'Helvetica', 'FontSize', 10)
% text(ha(1), -0.35, 0.13, '\beta = ', 'Units', 'normalized', ...
%   'FontSize', fsz+1, 'FontName', ftype1)


% CRmaxLIM = 1;
% CRminLIM = 0;
% C.Limits = [CRminLIM, CRmaxLIM];
% C.Ticks = 0:0.1:1;

set([ax1,ax2], ...
  'FontSize', fszax, 'FontName', ftype1, ...
  'LineWidth', alw, 'Box', 'off', ...
  'TickDir', 'out', 'TickLength', [.02, .02], 'XMinorTick', 'on', ...
  'YMinorTick', 'on', 'YGrid', 'on', 'XGrid', 'on', 'XColor', xycolor, 'YColor', xycolor);

set([fig1,fig2], 'Color', 'w')
