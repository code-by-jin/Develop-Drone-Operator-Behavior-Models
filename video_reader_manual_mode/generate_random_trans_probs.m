function trans_probs = generate_random_trans_probs(shape)
trans_probs = zeros(shape(1), shape(2));
for i = 1:shape(1)
  probs = rand(1, shape(2));
  trans_probs(i, :) = probs / sum(probs);
end 

