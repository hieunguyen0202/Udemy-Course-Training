## Black-Box Testing
#### [Equivalence Partitioning](https://github.com/markdown-it/markdown-it-emoji) 
#### [Boundary-Value Analysis](https://github.com/markdown-it/markdown-it-emoji) 
--------------|5|---------------------|7|--------------------
- Testing using 2-value: 4,99, 5
- Testing using 3-value: 4,99, 5, 5,01
- We need to test the value less than and itself
- The boundary is important in brake control, temperater
#### [Important Notes About EP & BVA](https://github.com/markdown-it/markdown-it-emoji) 
1. Each value belongs only to one partition
2. Equivalence partitioning and boundary value analysis can be applied to both input or output value
   - Sometimes, the goal in Equivalence partitioning or boundary value analysis is to measure the ouput. In this case, we provide the input to the system that makes these outputs happen
3. We have two types of partitions valid and invalid partitions.
4. Equivalence partitioning coverage: Number of partitions covered by test cases devided by total number of partitions.
eg. If we have 5 partitions in out system and we coverd four of them using test cases. In this case, Equivalence partitioning coverage is 4/5 or 80%
5.  Testing two values from the same partition doesn't increase the coverage.
6.  Some people call Equivalence partitioning is `EP`
7.  Some people call Boundary-Value Analysis is `BVA`
#### [Decision Table Testing](https://github.com/markdown-it/markdown-it-emoji) 
* Different combinations of conditions result in different outcomes
* (condition)Input--->Black-Box---->Output(result actions)
* No of table rules = 2^n
  * n = number of questions
  * 2-> for Yes/No; 3->for Yesy/No/Maybe
#### For examples:
To get a discount you must:
1. Buy items more than 100$
2. Have a goal subscription



|    Conditions            |   |   |   |   |
| ------------------------ | - | - | - | - |
| More than 100            | T | T | F | F |
|     Gold sub             | T | F | T | F |

|    Actions           |   |   |   |   |
| -------------------- | - | - | - | - |
| Apply discount       | O |   |   |   |
| Don't apply discount |   | O | O | O |


#### [State Transition Testing](https://github.com/markdown-it/markdown-it-emoji) 

|____ON(state)____|------Switch off(Transition)------|____OFF(state)____|------Switch on(Transition)------|____ON(state)____|
## White-Box Testing
#### [Statement Coverage](https://github.com/markdown-it/markdown-it-emoji) 
The efficient test design means that you use the least number of test cases to achieve 100% statment
#### [Decision Coverage](https://github.com/markdown-it/markdown-it-emoji) 
- Test all decision outcomes in your code
- Any decision in the world must have at least two outcomes
- So decision coverage cannot be less than two test case
#### [Condition Coverage](https://github.com/markdown-it/markdown-it-emoji) 
Example: if (x > 3) or (y > 5)
- So we have one decision and two conditions:
- In some cases, decision coverage is not enough. So, the condition coverage tests each condition
```python
if (x=0) or (y>0):
   y = y/x;
else:
   x = y;
```
#### [Path Coverage](https://github.com/markdown-it/markdown-it-emoji) 
- Test all possible paths in the code and have more test cases than decision coverage
- We shoukd use path coverage in some situations. But out our goal shoukd not be to achieve 100% of it
- We should cover some of the paths in out code
- If we have n conditions(yes/no) => we have 2^n test cases
#### [Modified Condition Decision Coverage (MCDC)](https://github.com/markdown-it/markdown-it-emoji) 
If you have 10 conditions, this means that you have 1024 test cases. But in this case of the 10 conditions, we will need only 11 test case
