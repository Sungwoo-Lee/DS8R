S.delivery = [120, 540];   % delivery timing
S.delivery_jitter = randi(10,1, numel(S.delivery))-5;
S.delivery = S.delivery + S.delivery_jitter;  % range: -5 ~ 5 secs