%јлгоритм гравитационного поиска
%N -число агентов
%ITER - число итераций
%G0 - начальное значение гравитационной посто€нной
%func - целева€ функци€
%BOUND - вектор 2xdim - таблица ограничений пространства поиска
%opt - флаг оптимизации: 1 - максимизаци€, 0 - минимизаци€
function [P, F] = GSA(N, ITER, G0, func, BOUND, opt)
G = G0; 
if opt==1 %флаг максимизации
    opt_func = @max;
else
    opt_func = @min;
end

F = NaN;
dim = size(BOUND, 2);   %размерность пространства
P(1, 1:dim) = NaN;
V = zeros(N, dim);
figure(1);
X = initSpace(N, BOUND);    %начальна€ инициализаци€ пространства
for i=1:ITER
    FITNESS = fitnessAgent(X, func);    %фитнесс-оценка
    [best, best_i] = opt_func(FITNESS); %оптимум на i шаге
    [F] = opt_func(best, F);  %оптимум за i шагов
    if (F == best) 
        P = X(best_i, :);
    end
    G = Gconst(G, i);   %вычисл€ем гравитационную посто€нную
    MASS = calcMass(FITNESS, opt);
    A = calcAcceleration(X, MASS, G);
    V = calcVelocity(A, V);
    X = motion(X, V);   %движение агента
    X = spaceBound(X,BOUND);    %проверка границ пространства
        scatter(X(:,1), X(:,2), MASS*1000+1, FITNESS, 'filled');
        colorbar     
        title(i);
        pause(1);
end
end