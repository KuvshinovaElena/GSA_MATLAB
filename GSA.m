%�������� ��������������� ������
%N -����� �������
%ITER - ����� ��������
%G0 - ��������� �������� �������������� ����������
%func - ������� �������
%BOUND - ������ 2xdim - ������� ����������� ������������ ������
%opt - ���� �����������: 1 - ������������, 0 - �����������
function [P, F] = GSA(N, ITER, G0, func, BOUND, opt)
G = G0; 
if opt==1 %���� ������������
    opt_func = @max;
else
    opt_func = @min;
end

F = NaN;
dim = size(BOUND, 2);   %����������� ������������
P(1, 1:dim) = NaN;
V = zeros(N, dim);
figure(1);
X = initSpace(N, BOUND);    %��������� ������������� ������������
for i=1:ITER
    FITNESS = fitnessAgent(X, func);    %�������-������
    [best, best_i] = opt_func(FITNESS); %������� �� i ����
    [F] = opt_func(best, F);  %������� �� i �����
    if (F == best) 
        P = X(best_i, :);
    end
    G = Gconst(G, i);   %��������� �������������� ����������
    MASS = calcMass(FITNESS, opt);
    A = calcAcceleration(X, MASS, G);
    V = calcVelocity(A, V);
    X = motion(X, V);   %�������� ������
    X = spaceBound(X,BOUND);    %�������� ������ ������������
        scatter(X(:,1), X(:,2), MASS*1000+1, FITNESS, 'filled');
        colorbar     
        title(i);
        pause(1);
end
end