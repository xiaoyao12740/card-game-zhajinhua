function popcardset = cutCard(N)
%发牌！有N个人，牌堆为1:52，每人抽三张！
%popcardset为N行3列，每行为第k个人抽到的牌
cardset=1:52;%初始化牌堆
popcardset=zeros(N,3);%初始化手牌集合
for i=1:3
    %第i轮
    for k=1:N
        %第k个人
        cutpos=ceil(length(cardset)*rand);%抽取牌堆中第cutpos张牌
        popcardset(k,i)=cardset(cutpos);%第k个人第i轮抽取了这张牌
        cardset(cutpos)=[];%从牌堆中删除这张牌
    end
end