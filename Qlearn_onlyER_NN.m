function [w]=Qlearn_onlyER_NN(w,p)
state=p.start;
cnt=1;
D=[];
w_copy=w; %keep copy of NN weights
while cnt<=p.lifetime_thresh&&norm(p.target-state)>p.target_thresh%keep running till goal is reached or max number of agent environment interactions is reached.
%Select action%
    if rand<p.epsilon%epsilon greedy exploration
        a=randi(p.A);
    else [a, Qmax]=maxQ_NN(state,w_copy,p);
    end
    next_state=transition(state,a,p);
    %Rewards..
    if norm(next_state-p.target)<=p.target_thresh
        reward=p.highreward;
    elseif p.world(round(next_state(1)),round(next_state(2)))==1
        reward=p.penalty;
    else reward=p.livingpenalty;
    end
        
    x=dqnstate(state,a,p); %mapping from state-action pair to [-1,1]
    [a_NN, Qmax_NN]=maxQ_NN(next_state,w_copy,p);
    y=reward+p.gamma*(Qmax_NN);%Q learning target
    [w,tr]=train(w,x,y); %To update the weights

    %%%%%%Experience replay%%%%%%%%%
    sD=size(D);
    if sD(1)<p.replaymemory
        D=[D;[state(1) state(2) a reward next_state(1) next_state(2)]];
    else D=[];
    end
    sD=size(D);
    
    if sD(1)>1&&rem(sD(1),100)==0%Do experience replay every 100 steps
        for j=1:100%replay 100 transitions
        samp=D(randi(sD(1)),:);
        x=dqnstate([samp(1) samp(2)],samp(3),p);
        [a_NN, Qmax_NN]=maxQ_NN([samp(5) samp(6)],w_copy,p);%[Qmax,a]=maxQ(w,state);
        y=samp(4)+p.gamma*(Qmax_NN);%Q learning target
        [w,tr]=train(w,x,y);
        end
    end

    cnt=cnt+1;
    state=next_state;
    if rem(cnt,p.freezetarg_freq)==0 %Target frequency..
        w_copy=w;
    end
end
