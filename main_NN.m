%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DQN: with single hidden layer feedforward neural net
% Author: Thommen George Karimpanal
% Last modified: January 2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
clc
p=parameters();
avgretlog={};
avgretlog2={};
toclog=[];
for k=1:p.N_runs 
    k
    tic
    p=parameters();
    state=p.start;%start state
    w=newff(minmax([-1 1;-1 1;-1 1]),[p.NNsize,1],{'tansig','purelin'},'traingd'); %initiate NN weights with Neural network toolbox
    w.trainparam.show=1; %
    w.trainparam.lr=0.001; %learning rate
    w.trainparam.epochs=1000; %Training iterations for the neural network
    w.trainparam.goal=1e-6; %goal tolerence
    w.trainParam.showWindow=0; 
    avgret=[];
    for i=1:p.N_iter %Number of episodes for RL
        i
        p=parameters();
        [w]=Qlearn_onlyER_NN(w,p);%Q learning
        k
        disp('evaluating..')
        avgret=[avgret;calcret(w,p,p.target)]% evaluate performance
    end
    avgretlog{k}=avgret;%log returns for each run
    toclog=[toclog; toc]%log time for each run
end
load handel%hallelujah! its done!
sound(y,Fs)