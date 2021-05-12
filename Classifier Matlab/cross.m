function test_accuracy_validation = cross(data_train,labels,regularisation_para_C)

% change label 0 to -1
labels(labels==0) = -1; 
label_train = labels';

% Cross Validation 
[Train, validation] = crossvalind('HoldOut', label_train, 0.5);

trainSample = data_train(Train,:);
train_Label = label_train(Train,1);
validationSample = data_train(validation,:);
validationLabel = label_train(validation,1);

% dimension of the training samples
[r, c] = size(trainSample);


% optimization process
cvx_begin
	variables slack(r) w(c) b
	minimize ((1/2) * w'*w + regularisation_para_C / r *  sum(slack))
	subject to
		train_Label.*(trainSample*w + b) - 1 + slack >= 0;
		slack >= 0;
cvx_end


% Validation accuracy test
[rValidation, cValidation] = size(validationSample);

%% accuracy 
predictions = validationLabel.*(validationSample * w + b);
crtPredict = sum(sum(predictions > 0));
test_accuracy_validation = crtPredict / rValidation;

end