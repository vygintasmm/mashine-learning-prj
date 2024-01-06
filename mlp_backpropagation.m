
    % Aproksimatoriaus funkcijos įgyvendinimas su daugiasluoksniu perceptronu
    
    % Pradiniai duomenys
    x = 0.1:1/22:1;
    y = (1 + 0.6*sin(2*pi*x/0.7) + 0.3*sin(2*pi*x))/2;

    % Architektūros parametrai
    input_size = 1;
    hidden_size = 6;
    output_size = 1;
    
    % Svorio ir biaso inicializacija
    input_weights = rand(input_size, hidden_size) * 0.1 - 0.05;
    output_weights = rand(hidden_size, output_size) * 0.1 - 0.05;
    hidden_bias = rand(1, hidden_size);
    
    output_bias = rand(1, output_size);
    
    % Mokymo parametrai
    learning_rate = 0.01;
    epochs = 10000;
    
    for i = 1:epochs
        % Pirmyn sklidimo etapas
        hidden_layer_input = x' .* input_weights + repmat(hidden_bias, length(x), 1);
        hidden_layer_output = tanh(hidden_layer_input);
        
        output_layer_input = hidden_layer_output * output_weights + repmat(output_bias, length(x), 1);
        predicted_output = output_layer_input;
        
        % Klaidos skaičiavimas
        error = y' - predicted_output;
        
        % Atgalinio sklidimo etapas
        d_predicted_output = error;
        error_hidden_layer = d_predicted_output * output_weights';
        d_hidden_layer = error_hidden_layer .* (1 - hidden_layer_output.^2);
        
        % Svorio atnaujinimas
        output_weights = output_weights + learning_rate * hidden_layer_output' * d_predicted_output;
        output_bias = output_bias + learning_rate * sum(d_predicted_output, 1);
        
        input_weights = input_weights + learning_rate * x' .* d_hidden_layer;
        hidden_bias = hidden_bias + learning_rate * sum(d_hidden_layer, 1);
    end
    % Visualization of results
    plot( x, predicted_output, 'r--');
    %plot( x, y, 'b');
%  plot(x, y, 'b', x, predicted_output, 'r--');
%legend('Tikrasis', 'Tinklo išėjimas');

% Aktyvavimo funkcijos

