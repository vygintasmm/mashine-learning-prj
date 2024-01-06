data = load('Data.txt');
x1 = data(:, 1);  % Assuming x1 is in the first column
x2 = data(:, 2);  % Assuming x2 is in the second column
d = data(:, 3);  % Assuming d is in the third column
% Initialize parameters
w1 = randn();  % Initialize w1 randomly
w2 = randn();  % Initialize w2 randomly
b = randn();   % Initialize b randomly

eta = 0.1;  % Learning rate

% Number of iterations (you can adjust this)
num_iterations = 100;

for n = 1:num_iterations
    % Calculate the predicted output y
    y = x1.*w1 + x2.*w2 + b;
    
    % Determine the class based on the threshold
    if y > 0
        y = 1;
    else
        y = -1;
    end
    
    % Calculate the error e
    e = d - y;
    
    % Update parameters
    w1 = w1 + eta * e .* x1;
    w2 = w2 + eta * e .* x2;
    b = b + eta * e;
end



