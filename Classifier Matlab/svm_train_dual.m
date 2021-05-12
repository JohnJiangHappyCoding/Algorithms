function svm_model_d = svm_train_dual( data_train , label_train , regularisation_para_C)

% change label 0 to -1
label_train(label_train==0) = -1;  

%% dimension of the training samples
[r, c] = size(data_train);

% double sum product
temp1 = zeros(r, r);  
for ii = 1:r
	for jj = 1:r
		temp1(ii, jj) = data_train(ii,:) * data_train(jj,:)'*label_train(ii) *label_train(jj);
	end
end
temp2 = ones(r,1);

%% optimization process
cvx_begin
	variables a(r)
	minimize ((1/2) * a' * temp1 * a - temp2' * a);
	subject to
		0 <= a <= regularisation_para_C/r;
		label_train * a == 0;
cvx_end

% calculate w and b
w_d = sum((a .* label_train') .* data_train);
b_d = (1/r) * sum(label_train' - data_train*w_d');

key1 = 'w';  value1 = w_d;
key2 = 'b';  value2 = b_d; 
key3 ='a';  value3 = a;
svm_model_d = struct(key1, value1, key2, value2, key3, value3);

