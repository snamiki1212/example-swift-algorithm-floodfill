Bridges

There’s a country made up of several islands. The president of this country promised people that he would build bridges to connect the islands. However, after he got re-elected he started thinking that it would be a waste to build all the bridges. One day he came to the conclusion that he can get away by building only one bridge (shortest). This country can be represented by N x N grid as below (There are 3 islands). Gray square = land, White square = ocean


In order to build the shortest bridge, here’s one way.

(There are several different ways to build a bridge that has a length of 3)
Given a N x N grid map, write a program to get the length of the shortest bridge.

Input Specification
First line: N (size of the map, 1 <= N <= 100)
Next N lines of data.

Output Specification
The shortest length


```
Sample Input1
10
1 1 1 0 0 0 0 1 1 1
1 1 1 1 0 0 0 0 1 1
1 0 1 1 0 0 0 0 1 1
0 0 1 1 1 0 0 0 0 1
0 0 0 1 0 0 0 0 0 1
0 0 0 0 0 0 0 0 0 1
0 0 0 0 0 0 0 0 0 0
0 0 0 0 1 1 0 0 0 0
0 0 0 0 1 1 1 0 0 0
0 0 0 0 0 0 0 0 0 0
Sample Output1
3



Sample Input2
10
1 1 1 0 0 0 0 1 1 1
1 1 1 1 0 0 0 0 1 1
1 0 1 1 0 0 0 0 1 1
0 0 1 1 1 0 0 0 0 1
0 0 0 1 0 0 0 0 0 1
0 0 0 0 0 0 1 0 0 1
0 0 0 0 0 0 1 0 0 0
0 0 0 0 1 1 1 0 0 0
0 0 0 0 1 1 1 0 0 0
0 0 0 0 0 0 0 0 0 0
Sample Output2
2
```