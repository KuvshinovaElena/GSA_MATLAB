function main ()
    bound = [-40 40; -40 40];
    [P,F] = GSA(100, 30, 500, @test, bound, 0);
end