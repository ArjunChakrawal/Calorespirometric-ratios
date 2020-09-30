close all;clearvars
LC=linspecer(5);
% phi = (1+sqrt(5))/2; %godlen ratio
width = 7;     % Width in inches
height = 3;    % Height in inches
alw = 0.5;    % AxesLineWidth
fsz = 11;      % FontSize
fszax = fsz;
lw = 2.0;      % LineWidth
ftype1= 'Helvetica';  %hLegend, gca
% %ftype2='Times New Roman'; % hTitle, hXLabel, hYLabel
xycolor= [0.2 0.2 0.2];

gs= linspace(0,8,100);
cue = min(gs./4.2 ,1);
plot(gs,cue,'Color',LC(1,:),'LineWidth',lw); hold on
plot(ones(1,100)*4.2,linspace(0,1,100),'--','Color',LC(2,:),'LineWidth',1)
xlabel('\it \gamma_S','FontSize', fsz)
ylabel('{\it Y_{AE,S}^{max}} (C-mol B C-mol^{-1} S)','FontSize', fsz)
% axis(ha(1), 'tight')
text(4.8,.96,'Carbon Limited','FontSize', fsz);text(1.75,0.35,'Energy Limited','Rotation',55,'FontSize', fsz)
text(4.15,0.4,'Biomass','Rotation',90, 'BackgroundColor','w','FontSize', fsz)
set(gca,...
    'FontSize', fszax,'FontName',ftype1,...
    'LineWidth',  alw,'Box', 'off',...
    'TickDir', 'out', 'TickLength', [.02 .02],'XMinorTick', 'on', ...
    'YMinorTick', 'on', 'XGrid', 'on','YGrid', 'on','XColor', xycolor, 'YColor', xycolor);
set(gcf,'Color','w');
figpath='..\Figures\';
export_fig(gcf,[figpath,'App_Fig1.pdf'],'-r300');