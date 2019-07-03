%specifies all the parameters used. Ignore the unused ones.
function  [out] = parameters()
a=30;
b=30;

%%%%Memory parameters%%%%
parameters.NNsize=100;%number of hidden nodes in the NN
parameters.N_runs=10;%number of runs
parameters.N_targ_pols=50;%n_v
parameters.act_mem=1000;%m_b
parameters.targ_pol_mem=1000;%m_t
parameters.replaymemory=500;%m_t
parameters.fixedtargetupdatefreq=100;
%%%%%%%%%%%%%%%%%%%%%%%%%
%Q learning parameters%%
parameters.freezetarg_freq=100;%how frequently the weights are to be updated in dqn
parameters.alpha=0.3;%learning rate
parameters.gamma=0.9;%discount parameter
parameters.lambda=0.9;%trace parameter
parameters.epsilon=0.1;%exploration
parameters.highreward=1;
parameters.penalty=-1;
parameters.livingpenalty=0;%-10;
parameters.lifetime_thresh=2000;%max length of lifetime
%%%%%%%%%%%%%%%%%%%%%%
%World and agent parameters
parameters.a=a;
parameters.b=b;
parameters.nfeats_a=100;%no. of features for state 1
parameters.nfeats_b=100;%no. of features for state 2

parameters.min_a=1;%min value of state 1
parameters.min_b=1;%min value of state 2
parameters.max_a=30;%max value of state 1
parameters.max_b=30;%max value of state 2

parameters.N_iter=500;%Q learning iterations
parameters.evalsamples=10000;
parameters.target_thresh=3;%number of units within which the target is assumed to be reached.
parameters.tran_prob=0.8;
parameters.A=6;%number of actions 1 to A
parameters.target=[28,2];%[28,2];
parameters.target2=[2,29];%[2,29];
%%%%%World%%%%%%
world=zeros(a,b);
world(:,1)=1;
world(1,:)=1;
world(:,end)=1;
world(end,:)=1;
world(1:3,6:8)=1;
world(5:10,10)=1;
world(10,1:10)=1;
world(1:5,26:28)=1;
%%%%%%%%%%%%%%
start=[randi(a) randi(b)];
while world(start(1),start(2))==1||(start(1)==parameters.target(1)&&(start(2)==parameters.target(2)))
    start=[randi(a) randi(b)];
end
parameters.start=start;
parameters.world=world;
%%%%%%%%%%%%%%%%%%%%%%%%%%%
out=parameters;