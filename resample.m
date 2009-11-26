function snew = resample(s,w);
% Resample the particles s according to weights w
% Particles must be one COLUMN of s!!!
num_particles = size(s,2);

if sum(isnan(w)) ~= 0,
  error('resample:weightsAreNan','WeightsAreNan');
end
    

snew = zeros(size(s));
w_cum = make_cumulative(w);

for p=1:num_particles,
  u = rand();
  %find the first number greater than u in the cumulative vector,
  %we want the entry that corresponds to.
  greater_than_u = find(u < w_cum);
  first_greater_than_u = greater_than_u(1);
  snew(:,p) = s(:,first_greater_than_u);
end