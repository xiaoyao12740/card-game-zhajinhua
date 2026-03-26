function dispCard(popnum)
popcardset=cutCard(popnum);
winner=giveWinner(popcardset);
paixingset={'单张','对子','顺子','金花','同花顺','豹子',};
for i=1:popnum
cardi=popcardset(i,:);
cardstyi=calCardStyle(popcardset(i,:));
paixingi=paixingset(cardstyi);
cardstr1=num2card(cardi(1));
cardstr2=num2card(cardi(2));
cardstr3=num2card(cardi(3));
disp(['第',num2str(i),'位牌手的的手牌是',cardstr1,cardstr2,cardstr3])
disp(['牌型是',paixingi])
end
wincard=popcardset(winner,:);
cardsty=calCardStyle(wincard);
paixing=paixingset(cardsty);
disp(['胜利的牌手为第',num2str(winner),'位'])
disp(['他的手牌是',num2card(wincard(1)),num2card(wincard(2)),num2card(wincard(3)),'牌型是',paixing])
end