function cardstr=num2card(num)
% 数字对应的花色
suit_set={'方块','梅花','红桃','黑桃'};
cn_set={'2','3','4','5','6','7','8','9','10','J','Q','K','A'};
suit=suit_set{ceil(num/13)};%花色
cn=cn_set{mod(num,13)+1};%牌面值
cardstr=[suit,cn];
end