sets i cargoes /1*4/
     j compartments j/1*3/;
parameters
w(j) weight capacity of compartments
/
1 12
2 18
3 10/
 

s(j)  space capacity of compartments
/1 7000
 2 9000
 3 5000/
v(i) volume of cargoes
/
1 500
2 700
3 600
4 400/
a(i) available tones of cargoes
/1 20
 2 16
 3 25
 4 13/
 p(i) profit of cargoes
/1 320
 2 400
 3 360
 4 290/ ;
positive variables x(i,j) tones of cargo i is put into compartment j
variable z;
equations obj,cons1(j) ,cons2(j), cons3(i), cons4, cons5;
obj.. z=e=sum((i,j),p(i)*x(i,j));
cons1(j).. sum(i,v(i)*x(i,j))=l=s(j);
cons2(j).. sum(i,x(i,j))=l=w(j);
cons3(i).. sum(i,x(i,j))=l=a(i);
cons4.. sum(i,x(i,'1'))/12=e=sum(i,x(i,'2'))/18;
cons5.. sum(i,x(i,'2'))/18=e=sum(i,x(i,'3'))/10;
model cargo /all/;
solve cargo using lp max z;
 
