function svm_model = svm_train_primal(data_train,label_train,regularisation_para_C)

% change label 0 to -1
label_train(label_train==0) = -1;  

% dimension of the training samples
[r, c] = size(data_train);


% optimization process
cvx_begin
	variables slack(r) w(c) b
	minimize ((1/2) * w'*w + regularisation_para_C / r *  sum(slack))
	subject to
		label_train' .*(data_train*w + b) - 1 + slack >= 0;
		slack >= 0;
cvx_end

key1 = 'w';  value1 = w;
key2 = 'b';  value2 = b; 
key3 ='slack';  value3 = slack;
svm_model = struct(key1, value1, key2, value2, key3, value3);

end