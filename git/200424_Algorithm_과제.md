[ 과제 - 알고리즘 ]

1. 입력받은 숫자의 모든 자리 숫자 합계를 출력하기 e.g.  123 -> 6 ,  5678 -> 26 

		func add(_ num1: Int) -> Int{
		    var sum: Int = num1
		    var result: Int = 0
		    while sum != 0 {
		        result += (sum%10)
		        sum = (sum/10)
		   }
		 return result
		}

2. 하샤드 수 구하기  - 하샤드 수 : 자연수 N의 각 자릿수 숫자의 합을 구한 뒤, 그 합한 숫자로 자기 자신이 나누어 떨어지는 수 e.g. 18의 자릿수 합은 1 + 8 = 9 이고, 18은 9로 나누어 떨어지므로 하샤드 수. 

		func harshad(num1: Int) -> Bool{
		    let result = add(num1)
		    if num1%result == 0{
		        return true
		    } else {
		        return false
		    }
		}