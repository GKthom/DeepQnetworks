function [new_state]=transition(state,action,p)

dt=0.2;
v=4;

if action==1
    new_state(2)=state(2)+v*dt;%move up
    new_state(1)=state(1);
%     new_state(3)=90;
elseif action==2
    new_state(1)=state(1)+v*dt;%move right
    new_state(2)=state(2);
%     new_state(3)=0;
elseif action==3
    new_state(2)=state(2)-v*dt;%move down
    new_state(1)=state(1);
%     new_state(3)=-90;
elseif action==4
    new_state(1)=state(1)-v*dt;%move left
    new_state(2)=state(2);
%     new_state(3)=180;
elseif action==5
    new_state(1)=state(1)+v*dt;%move diagonally up and right
    new_state(2)=state(2)+v*dt;
%     new_state(3)=45;
elseif action==6
    new_state(1)=state(1)-v*dt;%move diagonally up and left
    new_state(2)=state(2)+v*dt;
%     new_state(3)=45;
end

if abs(new_state(1))>=p.max_a||abs(new_state(1))<p.min_a||abs(new_state(2))>=p.max_b||abs(new_state(2))<p.min_b%check for invalid states
    new_state=state;
end