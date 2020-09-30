function figApp3b(e11)

HT=-469;
Hs = -469;
Hx = HT * 4.2 / 4;
dhana = 0;
dcatL = -18.33;
dcatE = -16.77;
e_eth_max = min([Hs / Hx, 1]); % from excel

e_lac_max = min([Hs / Hx, 1]);

alw = 0.5; % AxesLineWidth
fsz = 10; % FontSize

fszax = fsz;

ftype1 = 'Helvetica'; %hLegend, gca
%ftype2='Times New Roman'; % hTitle, hXLabel, hYLabel
xycolor = [0.2, 0.2, 0.2];
figure;
set(gcf, 'Position', [10, 10, 847, 600]); %<- Set size
%[ha, ~] = tight_subplot(Nh, Nw, [gap_h gap_w], [lower upper], [left right])
[ha, ~] = tight_subplot(2, 3, [.05, .05], [0.25, .05], [.1, .05]);

e2 = linspace(0, e_lac_max, 1000);
DH_Lac = abs(e2*dhana+(1 - 1.05 * e2)*dcatL);
cLac = 0.05 * e2;
beta = 0:0.2:1;
% lw  = 1:0.5:3
LC = linspecer(length(beta),'sequential');

for i = 1:length(beta)
  gamma = 1 - beta(i);

  e1 = e11';
  cue = beta(i) * e1 + gamma * e2;
  DH_eth = abs((1 - e1 * 1.05)*dcatE+e1*dhana);
  cEth = (0.05 * e1 + (1 - 1.05 * e1) * 1 / 3);
  CR = (beta(i) * DH_eth + gamma * DH_Lac) ./ (beta(i) * cEth + gamma * cLac);
  plot(ha(1), (beta(i) * cEth + gamma * cLac), cue, '-', 'Color', LC(i, :), 'LineWidth', 1.5); hold(ha(1), 'on')
  plot(ha(2), (beta(i) * DH_eth + gamma * DH_Lac), cue, '-', 'Color', LC(i, :), 'LineWidth', 1.5); hold(ha(2), 'on')
  plot(ha(3), CR, cue, '-', 'Color', LC(i, :), 'LineWidth', 1.5); hold(ha(3), 'on')
end
i=6;
gamma = 1 - beta(i);
e1 = e11';
cue = beta(i) * e1 + gamma * e2;
DH_eth = abs((1 - e1 * 1.05)*dcatE+e1*dhana);
cEth = (0.05 * e1 + (1 - 1.05 * e1) * 1 / 3);
CR = (beta(i) * DH_eth + gamma * DH_Lac) ./ (beta(i) * cEth + gamma * cLac);
scatter(ha(1), (beta(i) * cEth + gamma * cLac), cue,50,'Marker','o',...
  'MarkerFaceColor', LC(i, :),'MarkerEdgeColor','none');  
scatter(ha(2), (beta(i) * DH_eth + gamma * DH_Lac), cue,50,'Marker','o','MarkerFaceColor', LC(i, :),'MarkerEdgeColor','none') 
scatter(ha(3), CR, cue,50, 'Marker','o','MarkerFaceColor', LC(i, :),'MarkerEdgeColor','none');  
text(ha(3), CR(1)-40, cue(1)-0.05,'\beta = 1','FontSize', fsz, 'FontName', ftype1,'FontWeight','bold');  

% e_eth_max = 0.9;
e1 = linspace(0, e_eth_max, 800);

for i = 1:length(beta)
  gamma = 1 - beta(i);

  e2 = e11;
  DH_eth = abs((1 - e1 * 1.05)*dcatE+e1*dhana);
  DH_Lac = abs(e2*dhana+(1 - 1.05 * e2)*dcatL);
  cue = beta(i) * e1 + gamma * e2;
  cLac = 0.05 * e2;
  cEth = (0.05 * e1 + (1 - 1.05 * e1) * 1 / 3);
  CR = (beta(i) * DH_eth + gamma * DH_Lac) ./ (beta(i) * cEth + gamma * cLac);
  plot(ha(4), (beta(i) * cEth + gamma * cLac), cue, '--', 'Color', LC(i, :), 'LineWidth', 1.5); hold(ha(4), 'on')
  plot(ha(5), (beta(i) * DH_eth + gamma * DH_Lac), cue, '--', 'Color', LC(i, :), 'LineWidth', 1.5); hold(ha(5), 'on')
  plot(ha(6), CR, cue, '--', 'Color', LC(i, :), 'LineWidth', 1.5); hold(ha(6), 'on')
end

i=1;  gamma = 1 - beta(i);
e2 = e11;
DH_eth = abs((1 - e1 * 1.05)*dcatE+e1*dhana);
DH_Lac = abs(e2*dhana+(1 - 1.05 * e2)*dcatL);
cue = beta(i) * e1 + gamma * e2;
cLac = 0.05 * e2;
cEth = (0.05 * e1 + (1 - 1.05 * e1) * 1 / 3);
CR = (beta(i) * DH_eth + gamma * DH_Lac) ./ (beta(i) * cEth + gamma * cLac);
scatter(ha(4), (beta(i) * cEth + gamma * cLac), cue,50,'Marker','o','MarkerFaceColor',LC(i, :),'MarkerEdgeColor','none');  
scatter(ha(5), (beta(i) * DH_eth + gamma * DH_Lac), cue,50,'Marker','o','MarkerFaceColor',LC(i, :),'MarkerEdgeColor','none') 
scatter(ha(6), CR, cue,50, 'Marker','o','MarkerFaceColor',LC(i, :),'MarkerEdgeColor','none');  
text(ha(6), CR(1)-50, cue(1)-0.05,'\beta = 0','FontSize', fsz, 'FontName', ftype1,'FontWeight','bold');  

% text(375, 0.5, 'Y_{F2} = 0', 'FontSize', fsz-1)

xlim([ha(3), ha(6)], [0, 900])
ylim(ha, [0, 1])
xlabel(ha(4), 'CO_2 (C-mol B C-mol^{-1} S)','FontSize', fsz)
xlabel(ha(5), '-{\it \DeltaH_{glu}} (kJ C-mol^{-1} S)','FontSize', fsz)
xlabel(ha(6), '{\it CR} (kJ C-mol^{-1} CO_2)','FontSize', fsz)
ylabel(ha(1), '{\it CUE} (C-mol B C-mol^{-1} S)','FontSize', fsz)
ylabel(ha(4), '{\it CUE}  (C-mol B C-mol^{-1} S)','FontSize', fsz)
axis(ha, 'square')

text(ha(1), -0.35, 0.13, 'constant F1 varying F2' , 'Rotation', 90, 'Units', 'normalized', ...
  'FontSize', fsz+1, 'FontName', ftype1)
text(ha(1), 0.6, 0.8,sprintf('Y_{F1} = %1.1f',e11), 'Units', 'normalized', ...
  'FontSize', fsz+3, 'FontName', ftype1)

text(ha(4), -0.35, 0.13, 'constant F2 varying F1 ', 'Rotation', 90, 'Units', 'normalized', ...
  'FontSize', fsz+1, 'FontName', ftype1)
text(ha(4), 0.6, 0.8,sprintf('Y_{F2} = %1.1f',e11), 'Units', 'normalized', ...
  'FontSize', fsz+3, 'FontName', ftype1)

set(ha, ...
  'FontSize', fszax, 'FontName', ftype1, ...
  'LineWidth', alw, 'Box', 'off', ...
  'TickDir', 'out', 'TickLength', [.02, .02], 'XMinorTick', 'on', ...
  'YMinorTick', 'on', 'YGrid', 'on', 'XGrid', 'on', 'XColor', xycolor, 'YColor', xycolor);

colormap jet
C = colorbar(ha(end));
CRmaxLIM = 1;
CRminLIM = 0;
% c2.TickLabels=0:100:CRLIM;
C.Location = 'southoutside';
C.Box = 'off';
C.TickDirection = 'out';
C.Limits = [CRminLIM, CRmaxLIM];
C.Ticks = 0:0.2:1;
% [left, bottom, width, height]
C.Position = [0.3980, 0.1, 0.2500, 0.0248];
set(get(C, 'Title'), 'String', '\beta', ...
  'FontName', 'Helvetica', 'FontSize', 10)
% A=annotation('textbox',[.1 .2],[.1 .2]);
% [x_begin y_begin dx dy]
% A.Position=[C.Position(1)-0.01    0.0600    C.Position(3)+0.02   0];
AT=annotation('textbox',[.2 .3 .4 .5],'String','F2 dominated','FitBoxToText','on');
% [x_begin y_begin length height].
AT.Position=[ 0.2862    C.Position(2)-0.01    0.1228    0.0450];
AT.EdgeColor='none';AT.FontSize= fsz;AT.FontName=ftype1;AT.Color=LC(1, :);
AT=annotation('textbox',[.2 .3 .4 .5],'String','F1 dominated','FitBoxToText','on');
AT.Position=[ 0.6534   C.Position(2)-0.01    0.1228    0.0450];
AT.EdgeColor='none';AT.FontSize= fsz;AT.FontName=ftype1;AT.Color=LC(6, :);
set(gcf, 'Color', 'w')

letter = 'abcdefghijk';
for i = 1:6
  text(ha(i), 0.9, 0.95, ['(', letter(i), ')'], 'FontSize', fszax, 'FontName', ftype1, 'Units', 'normalized')
end

A1=annotation('arrow','LineWidth',2,'LineStyle', '-');
A1.Position=[ 1.7155e-01   6.7867e-01   1.1452e-02   1.2367e-01];
A2=annotation('arrow','LineWidth',2,'LineStyle', '-');
A2.Position=[ 5.3341e-01   6.9967e-01  -5.4782e-02   9.3333e-02];
A3=annotation('arrow','LineWidth',2,'LineStyle', '-');
A3.Position=[  8.2408e-01   6.7200e-01  -6.9594e-02   1.2000e-01];

A1.Position = [A1.Position(1)+A1.Position(3), A1.Position(2)+A1.Position(4), -A1.Position(3),-A1.Position(4)];
A2.Position = [A2.Position(1)+A2.Position(3), A2.Position(2)+A2.Position(4), -A2.Position(3),-A2.Position(4)];
A3.Position = [A3.Position(1)+A3.Position(3), A3.Position(2)+A3.Position(4), -A3.Position(3),-A3.Position(4)];

B=annotation('arrow','LineWidth',2,'LineStyle', '--');
B.Position=[3.0000e-01   3.0000e-01  -7.5260e-02   1.4000e-01];
B.Position = [B.Position(1)+B.Position(3), B.Position(2)+B.Position(4), -B.Position(3),-B.Position(4)];

B=annotation('arrow','LineWidth',2,'LineStyle', '--');
B.Position=[5.7413e-01   3.5733e-01  -6.9877e-02   1.1333e-01];
B.Position = [B.Position(1)+B.Position(3), B.Position(2)+B.Position(4), -B.Position(3),-B.Position(4)];

B=annotation('arrow','LineWidth',2,'LineStyle', '--');
B.Position=[7.9197e-01   2.8400e-01   9.6601e-02   3.4667e-02];
B.Position = [B.Position(1)+B.Position(3), B.Position(2)+B.Position(4), -B.Position(3),-B.Position(4)];

C=annotation('arrow','LineWidth',2,'LineStyle', '--');
C.Position=[7.2210e-01   3.3067e-01  -3.4939e-03   1.1067e-01];
C.Position = [C.Position(1)+C.Position(3), C.Position(2)+C.Position(4), -C.Position(3),-C.Position(4)];

figpath='..\Figures\';
export_fig(gcf, [figpath, 'FigApp3b_YF',num2str(e11),'.pdf'], '-r300');
