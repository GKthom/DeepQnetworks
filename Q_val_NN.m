%finds q value of a state-action pair, given some value function weights w.
function [Q]=Q_val_NN(state,action,w,p)
x=dqnstate(state,action,p);
Q=sim(w,x);