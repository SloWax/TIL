[ 과제 - 알고리즘 ] 

1. 정수 하나를 입력받은 뒤, 해당 숫자와 숫자 1사이에 있는 모든 정수의 합계 구하기 
   e.g)
   5 -> 1 + 2 + 3 + 4 + 5 = 15
   -2 -> -2 + -1 + 0 + 1 = -2 




		func allSum(num:Int) -> Int{
		    var result:Int = 0
		    if 1 <= num{
		        for x in 1 ... num{
		            result += x
		            }
		        }
		        if num < 1 {
		        for a in num ... 1{
		        result += a
		            }
		        }
		    return result
		}



2. 숫자를 입력받아 1부터 해당 숫자까지 출력하되, 3, 6, 9가 하나라도 포함되어 있는 숫자는 *로 표시 e.g.  1, 2, *, 4, 5, *, 7, 8, *, 10, 11, 12, *, 14, 15, * ...  


		func game(gameNum:Int) {
		    for x in 1...gameNum {
		        let allNum = String(x)
		        let result = allNum.contains { ["3", "6", "9"].contains($0) }
		        print(result ? "*" : allNum, terminator: " ")
		      }
		    }





3. 2개의 정수를 입력했을 때 그에 대한 최소공배수와 최대공약수 구하기 e.g.  Input : 6, 9   ->  Output : 18, 3 // 최대공약수 // 
1) 두 수 중 큰 수를 작은 수로 나눈 나머지가 0이면 최대 공약수
2) 나머지가 0이 아니면, 큰 수에 작은 수를 넣고 작은 수에 나머지 값을 넣은 뒤 1) 반복 
최소 공배수 // - 주어진 두 수의 곱을 최대공약수로 나누면 최소공배수  

		func common(num1: Int, num2: Int) -> (Int, Int) {
		    var sum1 = num1, sum2 = num2
		    if sum1 < sum2 {
		      swap(&sum1, &sum2)
		    }
		        while true {
		        let x = sum1 % sum2
		        (sum1, sum2) = (sum2, x)
		            if x == 0 {
		                break
		            }
		    }
		    let gcd = sum1
		    let lcm = num1 * num2 / gcd
		    return(gcd, lcm)
		}
