% Duomenų skaitymas
data = load('Data.txt');
x1 = data(:, 1);
x2 = data(:, 2);
d = data(:, 3); % norimas atsakymas

% Parametrų inicializacija
w1 = randn(1);
w2 = randn(1);
b = randn(1);
eta = 0.5; % mokymosi greitis (gali būti keičiamas)

N = length(x1); % duomenų eilučių skaičius

...
for epoch = 1:100
    for n = 1:N
        % Išėjimo skaičiavimas
        if x1(n)*w1 + x2(n)*w2 + b > 0
            y = 1;
        else
            y = -1;
        end
        
        % Klaidos skaičiavimas
        e = d(n) - y;
        
        % Svorio ir poslinkio atnaujinimas
        w1 = w1 + eta * e * x1(n);
        w2 = w2 + eta * e * x2(n);
        b = b + eta * e;
    end
end
...


% Atspausdiname galutinius svorius ir poslinkį
disp(['w1: ', num2str(w1)]);
disp(['w2: ', num2str(w2)]);
disp(['b: ', num2str(b)]);
