%main
clear
clc
yorn=0;
tic;
while yorn==0
    popnum=input('请输入玩游戏的人数：');%玩游戏的人数
    if popnum>17||popnum<2
        disp('一副牌去掉大小王为52张，该游戏最多供17人游玩，又因为需要决出胜负，故最少两人游玩')
        fprintf('输入的游玩人数不合理，请重新输入！\n')
        yorn=0;

    else
            yorn=1;
            N=input('请输入游玩的次数：');%玩游戏的次数
            for i=1:N
            popcardset=cutCard(popnum);%发牌
            winner=giveWinner(popcardset);%给出胜利者\
            fprintf('第%d次游玩的结果如下:\n',i)
            dispCard(popnum);
            end
            t=toc;
            fprintf('总共游玩时间为:%f\n',t)
    end
end