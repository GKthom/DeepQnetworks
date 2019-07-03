%maps state-action pair into dqn state (which varies between -1 and 1)
function [x]=dqnstate(state,a,p)

x=[(2*(state(1)-p.min_a)/(p.max_a-p.min_a))-1 (2*(state(2)-p.min_b)/(p.max_b-p.min_b))-1 (2*(a-1)/(p.A-1))-1]';