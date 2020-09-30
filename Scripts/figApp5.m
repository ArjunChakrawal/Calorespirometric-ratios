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
xycolor = [0.2, 0.2, 0.2];

YF = 0.3;
Hs = -469;
Hx = HT * 4.2 / 4;

dhana = 0;
dcatg = -469;
dcatL = -18.33;
dcatE = -16.77;

e_eth_max = min([Hs / Hx, 1]); % from excel
e_lac_max = min([Hs / Hx, 1]);

%% Anaerobic 2b
width = 7; % Width in inches
height = 4; % Height in inches
alw = 0.5; % AxesLineWidth
fsz = 10; % FontSize

fszax = fsz;
ftype1 = 'Helvetica'; %hLegend, gca
xycolor = [0.2, 0.2, 0.2];

e2 = linspace(0, e_lac_max, 10);
DH_Lac = abs(e2*dhana+(1 - 1.05 * e2)*dcatL);
cLac = 0.05 * e2;
beta = 0:0.2:1;
% lw  = 1:0.5:3
LC = linspecer(length(beta),'sequential');

e11 = linspace(0, e_lac_max, 10);

for i = 1:length(beta)-2
  gamma = 1 - beta(i);

  e1 = e11;
  [x,y]=meshgrid(e1,e2);
  cue = beta(i).* x + gamma .* y;
  DH_eth = abs((1 - x * 1.05)*dcatE );
  cEth = (0.05 * x + (1 - 1.05 * x) * 1 / 3);
 
  CR = (beta(i) * DH_eth + gamma * DH_Lac) ./ (beta(i) * cEth + gamma * cLac);
  figure(1);ax1=gca;
  surf(x,y,cue,'DisplayName', sprintf('\beta=%1.2f',beta(i)));hold on 
  figure(2);ax2=gca;
  surf(x,y,(beta(i) * DH_eth + gamma * DH_Lac),'DisplayName', sprintf('\beta=%1.2f',beta(i)) );hold on 
  figure(3);ax3=gca;
  surf(x,y,CR,'DisplayName', sprintf('\beta=%1.2f',beta(i)));hold on 
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
text(ha(3), CR-40, cue-0.05,'\beta = 1');  

% e_eth_max = 0.9;
e1 = linspace(0, e_eth_max, 800);
lw = [1.5, 2.5];

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
text(ha(6), CR-50, cue-0.05,'\beta = 0');  

% text(375, 0.5, 'Y_{F2} = 0', 'FontSize', fsz-1)

xlim([ha(3), ha(6)], [0, 900])
ylim(ha, [0, 1])
xlabel(ha(4), 'CO_2 (C-mol B C-mol^{-1} S)','FontSize', fsz)
xlabel(ha(5), '\DeltaH_{glu} (kJ C-mol^{-1} S)','FontSize', fsz)
xlabel(ha(6), 'CR (kJ C-mol^{-1} CO_2)','FontSize', fsz)
ylabel(ha(1), 'CUE (C-mol B C-mol^{-1} S)','FontSize', fsz)
ylabel(ha(4), 'CUE (C-mol B C-mol^{-1} S)','FontSize', fsz)
axis(ha, 'square')

text(ha(1), -0.35, 0.13, 'varying F2 constant F1', 'Rotation', 90, 'Units', 'normalized', ...
  'FontSize', fsz+1, 'FontName', ftype1)
text(ha(4), -0.35, 0.13, 'varying F1 constant F2', 'Rotation', 90, 'Units', 'normalized', ...
  'FontSize', fsz+1, 'FontName', ftype1)
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

% export_fig(gcf, [figpath, 'FigApp3b.pdf'], '-r300');
