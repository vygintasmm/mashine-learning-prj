x = 0.1:1/22:1;
y = (1 + 0.6*sin(2*pi*x/0.7)) + 0.3*sin(2*pi*x)/2;
gaussian = @(x,c,r) exp(-(x-c).^2./(2*r^2));
c1 = 0.19;
c2 = 0.89;
r1 = 0.15;
r2 = 0.15;
F1 = gaussian(x, c1, r1);
F2 = gaussian(x, c2, r2);

% Inicializuokime svorius ir bias reikšmę
w1 = rand();
w2 = rand();
w0 = rand();
eta = 0.01; % mokymo žingsnio dydis
epochs = 1000; % iteracijų skaičius

for epoch = 1:epochs
    for i = 1:length(x)
        y_pred = w1*F1(i) + w2*F2(i) + w0;
        error = y(i) - y_pred;
        
        % Atnaujinkime svorius ir bias reikšmę
        w1 = w1 + eta * error * F1(i);
        w2 = w2 + eta * error * F2(i);
        w0 = w0 + eta * error;
    end
end
y_test = w1*F1 + w2*F2 + w0;
plot(x, y, 'b', x, y_test, 'r--');
legend('Tikrasis', 'Tinklo išėjimas');
