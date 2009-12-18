function indices = resample_idx(w,n)
% Returns n indices which are sample proportionately from the
% weights in w. w doesn't have to be normalised.

if sum(isnan(w)) ~= 0,
  error('resample_idx:nans_present',...
        'NaN weights are present in weights vector');
end

w = w ./ sum(w);
w_cum = make_cumulative(w);
indices = zeros(1,n);

for i=1:n,
  u= rand();
  greater_than_u = find(u < w_cum);
  %gets the index of the first value of the weights which is
  %greater than the random value we've created.
  indices(i) = greater_than_u(1);
end