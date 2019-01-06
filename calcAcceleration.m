% ������� ��������� �������
% X - ������� ������� �� i-�� ����
% M - ����� ������� �� i-�� ����
% G - �������������� ���������� �� i-�� ����
function A = calcAcceleration(X, M, G)
[N, dim] = size(X);
A = zeros(N,dim);
for i = 1:N
    for j = 1:N
        if i ~= j
            R = norm(X(i,:)-X(j,:));
            for k = 1:dim
                A(i, k) = A(i, k) + rand*G*M(j)/(R + eps)*(X(j,k)-X(i,k));
            end
        end
    end
end
end