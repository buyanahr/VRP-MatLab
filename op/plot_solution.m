function  plot_solution(solution,dot)
dot = [dot,[0;0]];
index = (solution == 0);
index = find(index);
if index(end)~=length(solution)
    
    index = [0,index,length(solution)+1];
else 
    index(end) = [];
    solution(end) = [];
    index = [0,index,length(solution)+1];
end
temp = [];
figure
for ii = 2:length(index)
    temp = solution(index(ii-1)+1:index(ii)-1);
    if ~isempty(temp)
        temp = [size(dot,2),temp,size(dot,2)];
        switch  ii-1
            case 1
                plot(dot(1,temp),dot(2,temp),'r-O');hold on;
            case 2
                plot(dot(1,temp),dot(2,temp),'bl-*');hold on;
            case 3
                plot(dot(1,temp),dot(2,temp),'b-O');hold on;
            case 4
                plot(dot(1,temp),dot(2,temp),'g-x');hold on;
            case 5
                plot(dot(1,temp),dot(2,temp),'c-O');
        end
    end
end
label_dot = {'D1,9','D2,17','D3,4','D4,1','D5,27','D6,28','D7,19','D8,5','D9,3'...
    'D10,20','D11,7','D12,8','D13,18','D14,25','D15,24','D16,19','D17,16','D18,2',...
    'D19,13','D20,24','D21,2','D22,12','D23,1','D24,11','D25,7','D26,3','D27,4'...,
    'D28,5','D29,16','D30,14','Ô­µã'};
text(dot(1,:),dot(2,:),label_dot);
grid on;