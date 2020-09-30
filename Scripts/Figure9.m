function Figure9(HT)

LC = linspecer(5);
% phi = (1+sqrt(5))/2; %godlen ratio
width = 8; % Width in inches
height = 6; % Height in inches
alw = 0.5; % AxesLineWidth
fsz = 12; % FontSize

fszax = fsz-1;



ftype1 = 'Helvetica'; %hLegend, gca
%ftype2='Times New Roman'; % hTitle, hXLabel, hYLabel
xycolor = [0.2, 0.2, 0.2];
figure;
set(gcf, 'Position', [20, 100, width * 100, height * 100]); %<- Set size
% [ha, ~] = tight_subplot(Nh, Nw, [gap_h gap_w], [lower upper], [left right])
[ha, ~] = tight_subplot(1,1, [.05, .095], [0.3, .1], [.1, .4]);


Hx = -491;
gb= 4*Hx/HT;
  
%===========================
datapath='..\Data\';
Cr_y = xlsread([datapath, 'Smeaton et al. 2018.xlsx'], 'D3:G32'); %Heat (uW g-1 soil)

glu_noPro = Cr_y(1:2, 1:2);
glu_Pro = Cr_y(3:5, 1:2);
lact_Pro = Cr_y(7:10, 1:2);
eth_no_Pro = Cr_y(12, 1:2);
% Ace_no_Pro = Cr_y(15:18,1:2);
oxa_no_Pro = Cr_y(20:21, 1:2);
form_no_Pro = Cr_y(23:end, 1:2);



CR = 0:1:1500;
gs = 4;
HTg= -469;
cue = (HTg * (gs / 4) + CR) ./ (HT * (gb / 4) + CR);
id = find(cue < 0);
id = min(id);

lw = 1.5;
plot(CR(1:id), cue(1:id), '-', 'Color', LC(1, :).*0, 'LineWidth', lw);
hold on;
grid on
scatter(glu_noPro(:, 1), glu_noPro(:, 2), 40, 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k', 'Marker', 'o')
scatter(glu_Pro(:, 1), glu_Pro(:, 2), 40, 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k', 'Marker', 's')
scatter(lact_Pro(:, 1), lact_Pro(:, 2), 40, 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k', 'Marker', 'd')
ylim([0, 1]);

gs = 6; % ethanol
cue = (HT * (gs / 4) + CR) ./ (HT * (gb / 4) + CR);
id = find(cue < 0);
plot(CR(id+1:end), cue(id+1:end), '-', 'Color', LC(1, :), 'LineWidth', lw);
ylim([0, 1]);
scatter(eth_no_Pro(:, 1), eth_no_Pro(:, 2), 40, 'MarkerFaceColor', LC(1, :), 'MarkerEdgeColor', 'k', 'Marker', 'o')

gs = 4.5;
cue = (HT * (gs / 4) + CR) ./ (HT * (gb / 4) + CR);
id = find(cue < 0);
plot(CR(id+1:end), cue(id+1:end), '-', 'Color', LC(3, :), 'LineWidth', lw);
ylim([0, 1]);

gs = 1;
cue = (HT * (gs / 4) + CR) ./ (HT * (gb / 4) + CR);
id = find(cue < 0);
id = min(id);
plot(CR(1:id), cue(1:id), '-', 'Color', LC(2, :), 'LineWidth', lw);
ylim([0, 1]);
scatter(oxa_no_Pro(:, 1), oxa_no_Pro(:, 2), 40, 'MarkerFaceColor', LC(2, :), 'MarkerEdgeColor', 'k', 'Marker', 'o')

gs = 2;
cue = (HT * (gs / 4) + CR) ./ (HT * (gb / 4) + CR);
id = find(cue < 0);
id = min(id);
plot(CR(1:id), cue(1:id), '-', 'Color', LC(4, :), 'LineWidth', lw);
ylim([0, 1]);
scatter(form_no_Pro(:, 1), form_no_Pro(:, 2), 40, 'MarkerFaceColor', LC(4, :), 'MarkerEdgeColor', 'k', 'Marker', 'o')

xlabel('$CR$ (kJ C-mol$^{-1}$ $\mathrm{CO_2}$)', 'FontSize', fsz, 'Interpreter', 'latex')
ylabel('$Y_{AE}$ (C-mol B C-mol$^{-1}$ S)', 'FontSize', fsz, 'Interpreter', 'latex')
arr1=annotation('doublearrow', [0.47, 0.5524], [0.92, 0.92], 'Head1Length', 5, ...
    'Head2Length', 5, 'Head1Width', 5, 'Head2Width', 5, 'Color', xycolor);
arr1.Position=[ 0.1022    0.9107    0.1568   -0.0000];
arr2=annotation('doublearrow', [0.555, 0.7495], [0.92, 0.92], 'Head1Length', 5, ...
    'Head2Length', 5, 'Head1Width', 5, 'Head2Width', 5, 'Color', xycolor);
arr2.Position=[0.2620    0.9107    0.3400    0.0013];
text(0, 1.075, 'Energy limited', 'FontSize', 10)
text(700, 1.075, 'Carbon limited', 'FontSize', 10)


set(gca, ...
    'YTick',0:.2:1,...
    'FontSize', fszax, 'FontName', ftype1, ...
    'LineWidth', alw, 'Box', 'off', ...
    'TickDir', 'out', 'TickLength', [.02, .02], 'XMinorTick', 'on', ...
    'YMinorTick', 'on', 'XGrid', 'on', 'YGrid', 'on', 'XColor', xycolor, 'YColor', xycolor);



TB_data=xlsread([datapath,'Bolscher et al. 2016.xlsx'],'Bolscher 2016 BFS','Q5:R16'); %Heat (uW g-1 soil)
TB_glu = TB_data(1:4, :);
TB_ala = TB_data(5:8, :);
TB_gly = TB_data(9:end, :);

scatter(TB_glu(:, 1), TB_glu(:, 2), 40, 'MarkerFaceColor', 'none', 'MarkerEdgeColor', 'k', 'Marker', 'o')
scatter(TB_ala(:, 1), TB_ala(:, 2), 40, 'MarkerFaceColor', 'none', 'MarkerEdgeColor', 'k', 'Marker', '^')
scatter(TB_gly(:, 1), TB_gly(:, 2), 40, 'MarkerFaceColor', 'none', 'MarkerEdgeColor', 'k', 'Marker', 'v')

sld1=plot(nan,nan,'-ok', 'MarkerSize',5, 'LineWidth', lw, 'MarkerFaceColor', 'k');
sld2=plot(nan,nan,'-o', 'MarkerSize',5, 'LineWidth', lw,'Color', LC(1, :),'MarkerFaceColor',LC(1, :));
sld3=plot(nan,nan,'-', 'MarkerSize',5, 'LineWidth', lw, 'Color', LC(3, :),'MarkerFaceColor',LC(3, :));
sld4=plot(nan,nan,'-o', 'MarkerSize',5, 'LineWidth', lw, 'Color', LC(2, :),'MarkerFaceColor',LC(2, :));
sld5=plot(nan,nan,'-o', 'MarkerSize',5, 'LineWidth', lw, 'Color', LC(4, :),'MarkerFaceColor',LC(4, :));
sld6=scatter(nan,nan,40,'MarkerFaceColor', 'k','MarkerEdgeColor','k','Marker','s');
sld7=scatter(nan,nan,40,'MarkerFaceColor', 'k','MarkerEdgeColor','k','Marker','d');

os1=scatter( nan,nan,40,'MarkerFaceColor', 'none','MarkerEdgeColor','k','Marker','o');
os2=scatter( nan,nan,40,'MarkerFaceColor', 'none','MarkerEdgeColor','k','Marker','^');
os3=scatter( nan,nan,40,'MarkerFaceColor', 'none','MarkerEdgeColor','k','Marker','v');

hlegend=legend([sld1,sld2,sld3,sld4,sld5,sld6,sld7],{'Glucose','Ethanol','gamma-Aminobutyric acid', ...
    'Oxalic acid','Formate', 'Lactate','Glucose (incomplete\newlineoxidation)'});
hlegend.NumColumns=1;
hlegend.Title.String='Solid symbols: culture data';
% hlegend.Title.NodeChildren.Position=[0.435,0.925,0];
set(hlegend,'box', 'off','Location', 'best', 'Interpreter','tex','FontSize', fsz);
hlegend.Position=[0.6327    0.5940    0.2958    0.3303];

ah1=axes('position',get(gca,'position'),'visible','off');
hlegend2=legend(ah1, [os1,os2,os3],{'Glucose','Glycogen','L-Alanine'});
hlegend2.NumColumns=1;
hlegend2.Title.String='Open symbols: soil data';
hlegend2.Title.NodeChildren.Position=[0.725,0.9,0];
set(hlegend2,'box', 'off','Location', 'best', 'Interpreter','tex','FontSize', fsz);
hlegend2.Position=[0.5905    0.4227    0.2420    0.1537];



ax2_pos = [ 0.4315    0.36    0.13    0.2300];
% [left bottom width height]
ax2 = axes('Position', ax2_pos, ...
    'XAxisLocation', 'bottom', ...
    'YAxisLocation', 'left', ...
    'Color', 'none');

CR = 0:1:1500;
gs = 4;
cue = (HTg * (gs / 4) + CR) ./ (HT * (gb / 4) + CR);
id = find(cue < 0);
id = min(id);

lw = 0.75;
plot(CR(1:id), cue(1:id), '-', 'Color', LC(1, :).*0, 'LineWidth', lw);
hold on;
scatter(glu_noPro(:, 1), glu_noPro(:, 2), 10, 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k', 'Marker', 'o')
scatter(glu_Pro(:, 1), glu_Pro(:, 2), 10, 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k', 'Marker', 's')
scatter(lact_Pro(:, 1), lact_Pro(:, 2), 10, 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k', 'Marker', 'd')
xlim([325, 500])
ylim([0.25, 0.75]);

rectangle(ha, 'Position', [380, 0.3, 110, 0.4], 'EdgeColor', [1, 0, 0]*1, 'LineWidth', 0.25, 'LineStyle', '--')
set(ax2, ...
    'FontSize', fszax-2, 'FontName', ftype1, ...
    'LineWidth', alw, 'Box', 'off', ...
    'XColor', [1, 0, 0]*1, 'YColor', [1, 0, 0]*1);


text(ha(1), -1.8, 3100, '(a)', 'FontSize', fszax+1, 'FontName', ftype1)
text(gca, -290, 1.1, '(b)', 'FontSize', fszax+1, 'FontName', ftype1)
set(gcf, 'Color', 'w');
figpath='..\Figures\';
export_fig(gcf, [figpath, 'Figure9.pdf'], '-r300');
end