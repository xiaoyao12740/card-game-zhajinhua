function winner=giveWinner(popcardset)
%给出胜利者
popnum=size(popcardset,1);%游戏人数
winner=1;
for k=2:popnum
    winnercard=popcardset(winner,:);
    popcard=popcardset(k,:);
    if ~compareCard(winnercard,popcard)
        %如果winnercard比popcard小
        winner=k;
    end
end
end
function worl=compareCard(pop1,pop2)
%比较两个牌型的大小，若pop1>pop2，则worl=1,否则为0 
worl=1;%预设第一个大
%比较牌型
popsty1=calCardStyle(pop1);
popsty2=calCardStyle(pop2);
if popsty1<popsty2
    worl=0;
    return
elseif popsty1>popsty2
    worl=1;
    return
end
popnum1=sort(mod(pop1,13));popnum2=sort(mod(pop2,13));
popsuit1=ceil(pop1/13);popsuit2=ceil(pop2/13);
%popnum是面值,popsuit是花色
%若牌型相同，则比较最大的牌值
if popsty1==2
    %如果是对子牌则比较对子
    %%%%自己考虑
    ponum1=unique(popnum1);
    ponum2=unique(popnum2);
    if (sum(popnum1)-sum(ponum1))>(sum(popnum2)-sum(ponum2))
        worl=1;
        return
    elseif (sum(popnum1)-sum(ponum1))<(sum(popnum2)-sum(ponum2))
        worl=0;
        return  
    end
    if (2*sum(ponum1)-sum(popnum1))>(2*sum(ponum2)-sum(popnum2))
        worl=1;
        return 
    elseif (2*sum(ponum1)-sum(popnum1))<(2*sum(ponum2)-sum(popnum2))
        worl=0;
        return
    end
    if (2*sum(ponum1)-sum(popnum1))==(2*sum(ponum2)-sum(popnum2))
        pp1=mod(pop1,13);pp2=mod(pop2,13);
       if pp1(1)==pp1(2)
           if pp2(1)==pp2(2)
                   if popsuit1(3)>popsuit2(3)
                       worl=1;
                       return
                   else
                       worl=0;
                       return
                   end
           elseif pp2(1)==pp2(3)
                 if popsuit1(3)>popsuit2(2)
                   worl=1;
                   return
                 else
                   worl=0;
                   return
                 end
           else
                   if popsuit1(3)>popsuit2(1)
                       worl=1;
                       return
                   else
                       worl=0;
                       return
                   end
           end
       elseif pp1(1)==pp1(3)
               if pp2(1)==pp2(2)
                   if popsuit1(2)>popsuit2(3)
                   worl=1;
                   return
                   else
                   worl=0;
                   return
                   end
           elseif pp2(1)==pp2(3)
                   if popsuit1(2)>popsuit2(2)
                   worl=1;
                   return
                   else
                   worl=0;
                   return
                   end
               else
                   if popsuit1(2)>popsuit2(1)
                   worl=1;
                   return
                   else
                   worl=0;
                   return
                   end
               end
       else
               if pp2(1)==pp2(2)
                   if popsuit1(1)>popsuit2(3)
                   worl=1;
                   return
                   else
                   worl=0;
                   return
                   end
           elseif pp2(1)==pp2(3)
                   if popsuit1(1)>popsuit2(2)
                   worl=1;
                   return
                   else
                   worl=0;
                   return
                   end
               else
                   if popsuit1(1)>popsuit2(1)
                   worl=1;
                   return
                   else
                   worl=0;
                   return
                   end
               end
       end
    end
else
    %如果不是对子牌
    compos=(popnum1==popnum2);%给出两个相同的位置
    if sum(compos)<3
        %一定存在不相同的位置
        noteqpos=find(compos==0);%找出不相同的位置，最后一个位置是关键
        mid=noteqpos(end);%要比较的位置
        if popnum1(mid)>popnum2(mid)
            worl=1;
            return
        else 
            worl=0;
            return
        end
        return
    else
        %三个位置全相同
        %比较花色，自己考虑
        pp1=mod(pop1,13);pp2=mod(pop2,13);
        if pp1(1)>pp1(3)
            if pp1(1)>pp1(2)
                if pp2(1)>pp2(3)
                    if pp2(1)>pp2(2)
                        if popsuit1(1)>popsuit2(1)
                            worl=1;
                            return
                        elseif popsuit1(1)<popsuit2(1)
                            worl=0;
                            return
                        end
                    else
                        if popsuit1(1)>popsuit2(2)
                            worl=1;
                            return
                        elseif popsuit1(1)<popsuit2(2)
                            worl=0;
                            return
                        end
                    end
                else
                    if pp2(2)>pp2(3)
                        if popsuit1(1)>popsuit2(2)
                            worl=1;
                            return
                        elseif popsuit1(1)<popsuit2(2)
                            worl=0;
                            return
                        end
                    else
                        if popsuit1(1)>popsuit2(3)
                            worl=1;
                            return
                        elseif popsuit1(1)<popsuit2(3)
                            worl=0;
                            return
                        end
                    end
                end
            else
               if pp2(1)>pp2(3)
                    if pp2(1)>pp2(2)
                        if popsuit1(2)>popsuit2(1)
                            worl=1;
                            return
                        elseif popsuit1(2)<popsuit2(1)
                            worl=0;
                            return
                        end
                    else
                        if popsuit1(2)>popsuit2(2)
                            worl=1;
                            return
                        elseif popsuit1(2)<popsuit2(2)
                            worl=0;
                            return
                        end
                    end
                else
                    if pp2(2)>pp2(3)
                        if popsuit1(2)>popsuit2(2)
                            worl=1;
                            return
                        elseif popsuit1(2)<popsuit2(2)
                            worl=0;
                            return
                        end
                    else
                        if popsuit1(2)>popsuit2(3)
                            worl=1;
                            return
                        elseif popsuit1(2)<popsuit2(3)
                            worl=0;
                            return
                        end
                    end
                end
            end
        elseif pp1(2)>pp1(3)
                    if pp2(1)>pp2(3)
                    if pp2(1)>pp2(2)
                        if popsuit1(2)>popsuit2(1)
                            worl=1;
                            return
                        elseif popsuit1(2)<popsuit2(1)
                            worl=0;
                            return
                        end
                    else
                        if popsuit1(2)>popsuit2(2)
                            worl=1;
                            return
                        elseif popsuit1(2)<popsuit2(2)
                            worl=0;
                            return
                        end
                    end
                else
                    if pp2(2)>pp2(3)
                        if popsuit1(2)>popsuit2(2)
                            worl=1;
                            return
                        elseif popsuit1(2)<popsuit2(2)
                            worl=0;
                            return
                        end
                    else
                        if popsuit1(2)>popsuit2(3)
                            worl=1;
                            return
                        elseif popsuit1(2)<popsuit2(3)
                            worl=0;
                            return
                        end
                    end
                    end
        else
                    if pp2(1)>pp2(3)
                    if pp2(1)>pp2(2)
                        if popsuit1(3)>popsuit2(1)
                            worl=1;
                            return
                        elseif popsuit1(3)<popsuit2(1)
                            worl=0;
                            return
                        end
                    else
                        if popsuit1(3)>popsuit2(2)
                            worl=1;
                            return
                        elseif popsuit1(3)<popsuit2(2)
                            worl=0;
                            return
                        end
                    end
                else
                    if pp2(2)>pp2(3)
                        if popsuit1(3)>popsuit2(2)
                            worl=1;
                            return
                        elseif popsuit1(3)<popsuit2(2)
                            worl=0;
                            return
                        end
                    else
                        if popsuit1(3)>popsuit2(3)
                            worl=1;
                            return
                        elseif popsuit1(3)<popsuit2(3)
                            worl=0;
                            return
                        end
                    end
                    end
    end
end
end
end