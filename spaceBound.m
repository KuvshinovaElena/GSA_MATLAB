% Контроль позиций агентов в границах пространства поиска
% X - позиции агентов
% borders - границы пространства поиска
function X = spaceBound(X, borders)
up = borders(:, 1)';
low = borders(:, 2)';
[N,dim]=size(X);
for i=1:N 
    Tp=X(i,:)>up; Tm=X(i,:)<low;
    X(i,:)=X(i,:).*(Tp&Tm)+(rand(1,dim).*(up-low)+low).*(~(Tp&Tm));
end
end