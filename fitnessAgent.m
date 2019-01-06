% Оценка агентов
% X - позиции агентов на i-ом шаге
% func - целевая функция
function fitness = fitnessAgent(X, func)
N =size(X,1);
fitness = zeros(N, 1);
for i=1:N
    fitness(i)= func(X(i,:));
end
end