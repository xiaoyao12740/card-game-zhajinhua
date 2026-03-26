function cardsty=calCardStyle(popcard)
%牌型的运算
%单张、对子、顺子、金花、同花顺、豹子分别对应1-6
cardsuit=ceil(popcard/13);%花色对应的数字
cardnum=mod(popcard,13);%牌面值对应的数字
cardnum=sort(cardnum);%排序
if length(unique(cardnum))==1
    cardsty=6;%豹子
    return
elseif length(unique(cardnum))==2
    cardsty=2;%对子
    return
elseif length(unique(cardsuit))==1
    %金花或者同花顺
    if cardnum(3)-cardnum(1)==2
        cardsty=5;%同花顺
    else
        cardsty=4;%金花
    end
    return
elseif cardnum(3)-cardnum(1)==2
    cardsty=3;%顺子
    return
else
    cardsty=1;%单张
    return
end
end