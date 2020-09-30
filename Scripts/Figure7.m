function Figure7(HT)
width = 6;     % Width in inches
height = 4.5;    % Height in inches
alw = 0.5;    % AxesLineWidth
fsz = 10;      % FontSize

fszax = fsz;
lw = 1;      % LineWidth
ftype1= 'Helvetica';  %hLegend, gca
%ftype2='Times New Roman'; % hTitle, hXLabel, hYLabel
xycolor= [0.2 0.2 0.2];
figure;
set(gcf, 'Position', [20 100 width*100, height*100]); %<- Set size
% [ha, ~] = tight_subplot(Nh, Nw, [gap_h gap_w], [lower upper], [left right])
tight_subplot(1,1, [.05, .095], [0.15, .125], [.1, .05]);

gs=4; 
Hx = -491;
gb= 4*Hx/HT;


CR = 0:1:1.5e3;
Hglu = -469*(gs/4);
Hx= HT*(gb/4);
% more reduced SOM
gSOM=6;HSOM = HT*(gSOM/4); r=0;

cue = (CR + (Hglu + r*HSOM)/(1+r) )./(Hx+CR);
id=find(cue<0);id=min(id);
plot(CR(1:id), cue(1:id), '--','Color','k','LineWidth',lw);hold on
ylim([0,1]);
% % Less reduced SOM
% gSOM=2;HSOM = HT*(gSOM/4); r=0;
% cue = (CR + (Hs + r*HSOM)/(1+r) )./(Hx+CR);
% plot(CR(1:id), cue(1:id), '--','Color','k','LineWidth',lw);hold on
% txt2=text(276.8710,0.9045,'glucose\newlinedominated','Color','k',...
%     'FontSize', fsz,'BackgroundColor','none', 'Rotation',-45);
aa=annotation('textarrow',[0.3,0.20],[0.9,0.8],'String','glucose\newlinedominated ');
aa.Position=[  0.1967    0.8955   -0.0433   -0.0556];

text(200,0.93,['$r_p$',sprintf(' = %1.0f',r)],'Color','k',...
  'FontSize', fsz,'BackgroundColor','w', 'Interpreter', 'latex')

% ylim([0,1]);
%=========================================
% gSOM=6;HSOM = HT*(gSOM/4); r=.05;
% cue = (CR + (Hs + r*HSOM)/(1+r) )./(Hx+CR);id=find(cue<0);id=min(id);
% plot(CR, cue, '-','Color','k','LineWidth',lw);hold on
% text(200,0.93,sprintf('f_p=%1.2f',r),'Color','k','FontSize', fsz,'BackgroundColor','w')
% ylim([0,1]);

r=0.1;
% fp= r/(r+1); 
cue = (CR + (Hglu + r*HSOM)/(1+r) )./(Hx+CR);id=find(cue<0);
id=find(cue<0);id=min(id);
plot(CR(1:id), cue(1:id), '-','Color','r','LineWidth',lw);hold on
text(460,0.95,['$r_p$',sprintf(' = %1.1f',r)],'Color','r','FontSize', fsz,'Background','none','Interpreter', 'latex')
ylim([0,1]);

r=0.3;
% fp= r/(r+1); 
cue = (CR + (Hglu + r*HSOM)/(1+r) )./(Hx+CR);id=find(cue<0);id=max(id);
plot(CR(id+1:end), cue(id+1:end), '-','Color','r','LineWidth',1);hold on
text(800,0.95,['$r_p$',sprintf(' = %1.1f',r)],'Color','r','FontSize', fsz,'Background','none','Interpreter', 'latex')
ylim([0,1]);

r=1;
% fp= r/(r+1); 
cue = (CR + (Hglu + r*HSOM)/(1+r) )./(Hx+CR);id=find(cue<0);id=max(id);
plot(CR(id+1:end), cue(id+1:end), '-','Color','k','LineWidth',2);hold on
text(1000,0.88,['$r_p$',sprintf(' = %1.0f',r)],'Color','k','FontSize', fsz,'Background','none','Interpreter', 'latex')
ylim([0,1]);


r=10000;
% fp= r/(r+1); 
cue = (CR + (Hglu + r*HSOM)/(1+r) )./(Hx+CR);id=find(cue<0);id=max(id);
plot(CR(id+1:end), cue(id+1:end), '-','Color','k','LineWidth',3);hold on
txt=text(883.8710 ,   0.4242 ,sprintf('SOC dominated'),'Color','k',...
    'FontSize', fsz,'BackgroundColor','none','Rotation',45);
text(1160,0.775,sprintf('$r_p >>$ 1'),'FontSize', fsz,...
    'Color','k','BackgroundColor','none','Interpreter', 'latex')
%======================================
% gSOM=2;HSOM = HT*(gSOM/4); r=.05;
% cue = (CR + (Hs + r*HSOM)/(1+r) )./(Hx+CR);id=find(cue<0);id=min(id);
% plot(CR(1:id), cue(1:id), '--','Color','k','LineWidth',lw);hold on
% text(30,0.92,sprintf('f_p=%1.1f',r),'Color','k','FontSize', fsz,'BackgroundColor','w')


gSOM=2;HSOM = HT*(gSOM/4); 
% r=.3;
% cue = (CR + (Hs + r*HSOM)/(1+r) )./(Hx+CR);id=find(cue<0);id=min(id);
% plot(CR(1:id), cue(1:id), '--','Color','k','LineWidth',1);hold on
% text(95,0.84,sprintf('f_p=%1.1f',r),'Color','k','FontSize', fsz,'BackgroundColor','w')

r=1;
% fp= r/(r+1); 
cue = (CR + (Hglu + r*HSOM)/(1+r) )./(Hx+CR);id=find(cue<0);id=min(id);
plot(CR(1:id), cue(1:id), '--','Color','k','LineWidth',2);hold on
text(150,0.638,['$r_p$',sprintf(' = %1.0f',r)],'Color','k','FontSize', fsz,'Background','none','Interpreter', 'latex')

r=1e4;
% fp= r/(r+1); 
cue = (CR + (Hglu + r*HSOM)/(1+r) )./(Hx+CR);id=find(cue<0);id=min(id);
plot(CR(1:id), cue(1:id), '--','Color','k','LineWidth',3);hold on
text(45,0.375,sprintf('SOC dominated '),'FontSize', fsz,...
    'Color','k','BackgroundColor','none','Rotation',-65)
text(45,0.43,sprintf('$r_p >>$ 1'),'FontSize', fsz,...
    'Color','k','BackgroundColor','none','Interpreter', 'latex')

ylim([0,1]);

set(gca,...
    'FontSize', fszax,'FontName',ftype1,...
    'LineWidth',  alw,'Box', 'off',...
    'XTick',0:250:1500,'YTick',0:0.2:1,...
    'TickDir', 'out', 'TickLength', [.02 .02],'XMinorTick', 'on', ...
    'YMinorTick', 'on', 'YGrid', 'on','XGrid','on','XColor', xycolor, 'YColor', xycolor);

datapath='..\Data\';

TB_data=xlsread([datapath,'Bolscher et al. 2016.xlsx'],'Bolscher 2016 BFS','Q5:R16'); %Heat (uW g-1 soil)
TB_glu = TB_data(1:4, :);
TB_ala = TB_data(5:8, :);
TB_gly = TB_data(9:end, :);

scatter(TB_glu(:, 1), TB_glu(:, 2), 40, 'MarkerFaceColor', 'none', 'MarkerEdgeColor', 'k', 'Marker', 'o')
scatter(TB_ala(:, 1), TB_ala(:, 2), 40, 'MarkerFaceColor', 'none', 'MarkerEdgeColor', 'k', 'Marker', '^')
scatter(TB_gly(:, 1), TB_gly(:, 2), 40, 'MarkerFaceColor', 'none', 'MarkerEdgeColor', 'k', 'Marker', 'v')

p1 = line(nan, nan, 'Linestyle', '-', 'Marker', 'none', 'Color', 'k' ,'LineWidth', 1.5);
p2 = line(nan, nan, 'Linestyle', '--', 'Marker', 'none', 'Color', 'k', 'LineWidth', 1.5);
os1=scatter( nan,nan,40,'MarkerFaceColor', 'none','MarkerEdgeColor','k','Marker','o');
os2=scatter( nan,nan,40,'MarkerFaceColor', 'none','MarkerEdgeColor','k','Marker','^');
os3=scatter( nan,nan,40,'MarkerFaceColor', 'none','MarkerEdgeColor','k','Marker','v');

hlegend=legend([os1,os2,os3,p1,p2],{'Glucose','Glycogen','L-Alanine',...
  'More reduced SOM ($\gamma_{SOC}$ = 6)','Less reduced SOM ($\gamma_{SOC}$ = 2)'});
set(hlegend,'box', 'off','Location', 'best', 'Interpreter','latex','FontSize', fsz);
text(0.6,0.35, 'Soil data','Units','normalized','FontWeight','bold','FontSize',13)

ylabel('$CUE$ (C-mol B C-mol$^{-1}$ glu)','Interpreter', 'latex')
xlabel('$CR$ (kJ C-mol$^{-1}$ $\mathrm{CO_2}$)', 'FontSize', fsz,'Interpreter', 'latex')

set(gcf,'Color','w')
figpath='..\Figures\';
export_fig(gcf,[figpath,'Figure7.pdf'],'-r300');