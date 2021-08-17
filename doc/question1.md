Tomato Farm

Tom has a large tomato farm back in Vietnam. His tomatoes are placed in a box as shown in the picture below.

Some of the tomatoes stored in his warehouse are ripe, but some may still be green(unripe). Each day, unripe tomatoes adjacent to ripe tomatoes ripen under the influence of ripe tomatoes. (adjacent = left, right, front, back)
Tom wants to know if the tomatoes stored in the warehouse are ready to be cooked in a few days.

Given the size of the grid-shaped boxes and the information about ripe tomatoes and unripe tomatoes, write a program to calculate how many days it takes for all the tomatoes to ripen.

Input Specification
First line: M N (M: width, N: height where 2 <= M, N <= 1000)
Next N lines: 0s and 1s where 0(unripe tomatoes), 1(ripe tomatoes), -1(no tomatoes)

Output Specification
The minimum days. (O if already ripe, -1 if there’s no way to get all ripe tomatoes)

```
Sample Input1
6 4
0 0 0 0 0 0
0 0 0 0 0 0
0 0 0 0 0 0
0 0 0 0 0 1
Sample Output1
8
Sample Input2
6 4
0 -1 0 0 0 0
-1 0 0 0 0 0
0 0 0 0 0 0
0 0 0 0 0 1
Sample Output2
-1
Sample Input3
6 4
1 -1 0 0 0 0
0 -1 0 0 0 0
0 0 0 0 -1 0
0 0 0 0 -1 1
Sample Output3
6
Sample Input4
5 5
-1 1 0 0 0
0 -1 -1 -1 0
0 -1 -1 -1 0
0 -1 -1 -1 0
0 0 0 0 0
Sample Output4
14

Sample Input5
2 2
1 -1
-1 1
Sample Output5
0
```