 function Figure8(HT)

LC = linspecer(5);
% phi = (1+sqrt(5))/2; %godlen ratio
width = 9; % Width in inches
height = 7; % Height in inches
alw = 0.5; % AxesLineWidth
fsz = 13; % FontSize
msz=8;
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

gs = @(y)linspace(gb*y, 8, 100);

CR_Grow = @(Y)(Y * (gb / 4) .* HT - (gs(Y) / 4) .* HT) ./ (1 - Y);
axes(ha(1));
plot(gs(0), CR_Grow(0), 'Color', [1,1,1]*0.2, 'LineWidth', 1); hold on
plot(gs(0.5), CR_Grow(0.4), 'Color', [1,1,1]*0.2, 'LineWidth', 2)
plot(gs(0.75), CR_Grow(0.8), 'Color', [1,1,1]*0.2, 'LineWidth', 3)

ll = min(CR_Grow(0.75))*0;
up = max(CR_Grow(0.75))*0;

lw = 2;
plot(ones(1, 1)*4, linspace(ll, up, 1), 'x', 'Color', [1, 1, 1]*0.2, 'MarkerSize',msz, 'LineWidth', lw)
plot(ones(1, 1)*6, linspace(ll, up, 1), 'x', 'Color', LC(1, :), 'MarkerSize',msz, 'LineWidth', lw)
plot(ones(1, 1)*4.5, linspace(ll, up, 1), 'x', 'Color', LC(3, :), 'MarkerSize',msz, 'LineWidth', lw)
plot(ones(1, 1)*1, linspace(ll, up, 1), 'x', 'Color', LC(2, :), 'MarkerSize',msz, 'LineWidth', lw)
plot(ones(1, 1)*2, linspace(ll, up, 1), 'x', 'Color', LC(4, :), 'MarkerSize',msz, 'LineWidth', lw)
plot(ones(1, 1)*gb, linspace(ll, up, 1), 'x', 'Color', LC(5, :), 'MarkerSize',msz, 'LineWidth', lw)



hlegend = legend('Y_{AE} = 0 (No growth)', 'Y_{AE} = 0.4', 'Y_{AE} = 0.8'...
    , 'Glucose/L-Alanine/Glycogen (G)', 'Ethanol (E)', ...
    'gamma-Aminobutyric acid (A)', 'Oxalic acid/Citric acid (O)', 'Formate (F)', 'Biomass (B)');
% hlegend = legend('No growth, Y_{AE} =0', 'Y_{AE} =0.4', 'Y_{AE} =0.8');

set(hlegend, 'box', 'off', 'Location', 'northeast', 'Interpreter', 'tex', 'FontSize', fsz);
% title('Aerobic metabolism')
xlabel('$\gamma_S$ (mol $\mathrm{e^-}$ C-mol$^{-1}$ S)', 'FontSize', fsz, 'Interpreter', 'latex')
ylabel('$CR$ (kJ C-mol$^{-1}$ $\mathrm{CO_2}$)', 'FontSize', fsz, 'Interpreter', 'latex')
axis(ha(1), 'tight')
set(ha(1), ...
    'FontSize', fszax, 'FontName', ftype1, ...
    'LineWidth', alw, 'Box', 'off', ...
    'TickDir', 'out', 'TickLength', [.02, .02], 'XMinorTick', 'on', ...
    'YMinorTick', 'on', 'XGrid', 'off', 'YGrid', 'on', 'XColor', xycolor, 'YColor', xycolor);

legend_size = get(hlegend, 'position');
% new figure width
legend_size(1) = 0.65;
legend_size(2) = 0.55;
% set new figure siz
hlegend.Position = legend_size;
ax1 = ha(1);
ax1_pos = ax1.Position; % position of first axes
ax2_pos = ax1_pos;
ax1_pos = [ax1_pos(1), ax1_pos(2) + 0.15, ax1_pos(3), ax1_pos(4) - 0.15];
ax1.Position = ax1_pos;
ax2 = axes('Position', ax2_pos, ...
    'XAxisLocation', 'bottom', ...
    'YAxisLocation', 'left', ...
    'Color', 'none');

ax2.YAxis.Visible = 'off';
NOSC= -4:2:4;
l1 = line(NOSC, NOSC, 'Parent', ax2, 'Color', LC(1, :), 'LineWidth', lw); hold on
l1.LineStyle = 'none';
ax2.YLim=[0,1];
ax2.XLim=[-4,4];
plot(ones(1, 1)*4-4, 0, 'x', 'Color', [1, 1, 1]*0.2, 'MarkerSize',msz, 'LineWidth', lw)
plot(ones(1, 1)*4-6, 0, 'x', 'Color', LC(1, :), 'MarkerSize',msz, 'LineWidth', lw)
plot(ones(1, 1)*4-4.5, 0, 'x', 'Color', LC(3, :), 'MarkerSize',msz, 'LineWidth', lw)
plot(ones(1, 1)*4-1, 0, 'x', 'Color', LC(2, :), 'MarkerSize',msz, 'LineWidth', lw)
plot(ones(1, 1)*4-2, 0, 'x', 'Color', LC(4, :), 'MarkerSize',msz, 'LineWidth', lw)
plot(ones(1, 1)*4-gb, 0, 'x', 'Color', LC(5, :), 'MarkerSize',msz, 'LineWidth', lw)
ax2.XAxis.Direction='reverse';
xlabel(ax2, '$NOSC$', 'FontSize', fsz, 'Interpreter', 'latex')
set(gca, ...
    'FontSize', fszax, 'FontName', ftype1, ...
    'LineWidth', alw, 'Box', 'off', ...
    'TickDir', 'out', 'TickLength', [.02, .02], 'XMinorTick', 'on', ...
    'YMinorTick', 'on', 'XColor', xycolor, 'YColor', xycolor);



ax3 = axes('Position', ax2_pos, ...
    'XAxisLocation', 'bottom', ...
    'YAxisLocation', 'left', ...
    'Color', 'none');
ax3.Position = [ax2_pos(1), ax2_pos(2) - 0.15, ax2_pos(3), ax3.Position(4)+0.15];

ax3.YAxis.Visible = 'off';
l1 = line(1:3000, 1:3000, 'Parent', ax2,'Color', LC(1, :), 'LineWidth', lw); hold on
l1.LineStyle = 'none';
ax3.XLim=[0,-8/4*HT];
ax3.YLim=[0,3000];
plot(4/4*-HT, 0, 'x', 'Color', [1, 1, 1]*0.2, 'MarkerSize',msz, 'LineWidth', lw)
plot(6/4*-HT, 0, 'x', 'Color', LC(1, :), 'MarkerSize',msz, 'LineWidth', lw)
plot(4.5/4*-HT, 0, 'x', 'Color', LC(3, :), 'MarkerSize',msz, 'LineWidth', lw)
plot(1/4*-HT, 0, 'x', 'Color', LC(2, :), 'MarkerSize',msz, 'LineWidth', lw)
plot(2/4*-HT, 0, 'x', 'Color', LC(4, :), 'MarkerSize',msz, 'LineWidth', lw)
plot(gb/4*-HT, 0, 'x', 'Color', LC(5, :), 'MarkerSize',msz, 'LineWidth', lw)
xlabel(ax3, '$(-) \mathrm{Enthalpy \ of \ combustion}$ (kJ C-mol$^{-1}$ S)', 'FontSize', fsz, 'Interpreter', 'latex')
set(gca, ...
    'FontSize', fszax, 'FontName', ftype1, ...
    'LineWidth', alw, 'Box', 'off', ...
    'TickDir', 'out', 'TickLength', [.02, .02], 'XMinorTick', 'on', ...
    'YMinorTick', 'on', 'XGrid', 'on', 'XColor', xycolor, 'YColor', xycolor);

text(ax3,4/4*-HT-25, 100, 'G','Color', [1, 1, 1]*0.2 ,'FontSize', fsz+2, 'FontWeight','bold')
% A0=annotation('textarrow',[0.2257 0.2381],[0.5058 0.3118],'String','G',...
%     'Color', [1, 1, 1]*0.2 ,'FontSize', fsz+2, 'FontWeight','bold');
% A0.Position=[0.2142+ 0.115    0.5387    0.0203   -0.0821];
text(ax3,6/4*-HT-10, 100, 'E','Color', LC(1, :),'FontSize', fsz+2, 'FontWeight','bold')
% A1=annotation('textarrow',[0.3067 0.261],[0.4404 0.3076],'String','A',...
%     'Color', LC(3, :) , 'FontSize', fsz+2, 'FontWeight','bold');
% A1.Position=[0.2896+ 0.12    0.5152   -0.0309   -0.0598];
text(ax3,4.5/4*-HT-15, 100, 'A','Color', LC(3, :) ,'FontSize', fsz+2, 'FontWeight','bold')
text(ax3,1/4*-HT-15, 100, 'O','Color', LC(2, :),'FontSize', fsz+2, 'FontWeight','bold')
text(ax3,2/4*-HT-15, 100, 'F','Color', LC(4, :) ,'FontSize', fsz+2, 'FontWeight','bold')
% A2=annotation('textarrow',[0.2791 0.2467],[0.5121 0.3076],'String','B',...
%     'Color', LC(5, :) ,'FontSize', fsz+2, 'FontWeight','bold');
% A2.Position=[0.3973    0.5600   -0.0334   -0.1025];
text(ax3,gb/4*-HT-15, 100, 'B','Color', LC(5, :) ,'FontSize', fsz+2, 'FontWeight','bold')

  
  
set(gcf, 'Color', 'w');
figpath='..\Figures\';
export_fig(gcf, [figpath, 'Figure8.pdf'], '-r300');
