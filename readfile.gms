
$title THE DIET PROBLEM
sets
i food /1*4/
j nutrition /1*4/;
table a(i,j) amount of nut. j in food i
*$include food_info.txt
$ondelim
$include food_info.csv
$offdelim ;
parameters
b(j) min required level of nutritions
/1 500
 2 6
 3 10
 4 8/
c(i) cost of food /1 50,2 20,3 30,4 80/ ;
positive  variable x(i);
variable z;
equations obj, const(j);
obj.. z=e=sum(i,c(i)*x(i));
const(j).. sum(i,a(i,j)*x(i))=g=b(j);
model diet/all/;
solve diet using lp minimizing z;
display x.l,z.l,a;

File results / results.txt /;
put results;
put "Model status",  diet.modelstat /;
put "Total Cost", z.l /;
put "Decision variables" /;
loop((i),
  put  x.l(i)," number of foood" i.tl, "eaten daily"/; );
putclose;


