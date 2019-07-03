%Function for evaluating the performance during the learning process.
function [retj]=calcret(w,p,goal)

retj=0;
for j=1:10%run it 10 times.
state=[randi(p.a) randi(p.b)];%start from random state
%making sure state is valid
if state(1)<=p.min_a
    state(1)=p.min_a+1;
elseif state(1)>=p.max_a
    state(1)=p.max_a-1;
end

if state(2)<=p.min_b
    state(2)=p.min_b+1;
elseif state(2)>=p.max_b
    state(2)=p.max_b-1;
end

ret=0;
for i=1:100% run for 100 steps
    [a, Qmax]=maxQ_NN(state,w,p);%greedily exploit value function weights
    state=transition(state,a,p);%next state based on greedy action
    if norm(state-goal)<=p.target_thresh%rewards
        r=p.highreward;
    elseif p.world(round(state(1)),round(state(2)))==1
        r=p.penalty;
    else r=p.livingpenalty;
    end
    ret=ret+r;%accumulate rewards
end
retj=retj+ret;%sum over 10 runs
end
retj=retj/j;% average value of return.