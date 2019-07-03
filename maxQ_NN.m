%Finds max Qvalue and corresponding optimal action for a state, given some value function weights
function [a, Qmax]=maxQ_NN(state,w,p)
for i=1:p.A
    q(i)=Q_val_NN(state,i,w,p);
end
a=argmax(q);
Qmax=q(a);