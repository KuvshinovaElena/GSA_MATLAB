% ������ ���� �������
% fitness - ������ �������
% argmin - ���� ���� ����������: 0 - min, 1 - max
% � - ����� �������
function [M] = calcMass(fitness, argmin)
if (argmin > 0)
    f_best = max(fitness); f_worst = min(fitness);
else
    f_best = min(fitness); f_worst = max(fitness);
end
m = (fitness - f_worst)./(f_best -f_worst);
M = m./sum(m);
