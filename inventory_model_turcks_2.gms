Set t period  /April,May, June, July/;
parameter d(t)
/
April 20
May 10
June 30
July 60
/;
scalar holding_cost /12000/;
scalar production_cost /540000/;
positive variables stock(t), production(t);
variable z;
equation obj,stockbalance_cons(t),demand_cons(t),production_cons(t),stock_begining;
obj.. z=e=sum(t,holding_cost*stock(t)+production_cost*production(t));
stock_begining.. stock('April')=e=2+production('April')-d('April');
stockbalance_cons(t)$(ord(t)>1).. stock(t)=e=stock(t-1)+production(t)-d(t);
demand_cons(t)$(ord(t)>1).. stock(t-1)+Production(t)=g=d(t);
production_cons(t).. production(t)=l=30;
model inventory/all/;
solve inventory using lp min z;
