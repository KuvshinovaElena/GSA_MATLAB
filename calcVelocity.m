function V = calcVelocity(A, Vprev)
    V = rand(size(A)).*Vprev + A;
end