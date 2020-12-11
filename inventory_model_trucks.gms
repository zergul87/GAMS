Set t period  / March,April,May, June, July/;
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
stock.fx('March')=2;
equation obj,stockbalance_cons(t),demand_cons(t),production_cons(t);
obj.. z=e=sum(t$(ord(t)>1),holding_cost*stock(t)+production_cost*production(t));
stockbalance_cons(t)$(ord(t)>1).. stock(t)=e=stock(t-1)+production(t)-d(t);
demand_cons(t)$(ord(t)>1).. stock(t-1)+Production(t)=g=d(t);
production_cons(t)$(ord(t)>1).. production(t)=l=30;
model inventory/all/;
solve inventory using lp min z;