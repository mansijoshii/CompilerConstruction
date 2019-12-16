#include <stdio.h>
int main () {
int a = 5;
if (a > 10) {
   a = 10;
} else {
   a = 0;
}
switch (a) {
 case 0:
   a = 0;
 case 1:
   a = 10;
}
do {
 a++;
} while (a<15);
return 0;
}                             
