# Practice

## Conditional Statements

1) 학점을 입력받아 각각의 등급을 반환해주는 함수 (4.5 = A+, 4.0 = A, 3.5 = B+ ...)

	func classScore(sum:Double){
	    switch sum {
	    case 4.5:
	        print("A+")
	    case 4.0:
	        print("A")
	    case 3.5:
	        print("B+")
	    case 3.0:
	        print("B")
	    case 2.5:
	        print("C+")
	    case 2.0:
	        print("C")
	    default:
	        print("F")
	    }
	}

2) 특정 달을 숫자로 입력 받아서 문자열로 반환하는 함수 (1 = "Jan" , 2 = "Feb", ...)

	func calendar(cal: Int){
	    switch cal {
	    case 1:
	        print("Jan")
	    case 2:
	        print("Feb")
	    case 3:
	        print("Mar")
	    case 4:
	        print("Apr")
	    case 5:
	        print("May ")
	    case 6:
	        print("Jun")
	    case 7:
	        print("Jul")
	    case 8:
	        print("Aug")
	    case 9:
	        print("Sep")
	    case 10:
	        print("Oct")
	    case 11:
	        print("Nov")
	    case 12:
	        print("Dec")
	    default:
	        print("nocal")
	    }
	}

3) 세 수를 입력받아 세 수의 곱이 양수이면 true, 그렇지 않으면 false 를 반환하는 함수

	func answer(sum1: Int, sum2: Int, sum3: Int){
	    var allNum: Int = 0
	    allNum = sum1 * sum2 * sum3
	    switch allNum {
	    case allNum where allNum % 2 == 0:
	        print("true")
	    default:
	        print("false")
	    }
	}

## Loops

1) 자연수 하나를 입력받아 그 수의 Factorial 을 구하는 함수

	func facto(sum1: Int){
	    var sum3 : Int = 1
	    for sum2 in 0 ..< sum1{
	        sum3 *= (sum2+1)
	        }
	    print(sum3)
	}



2) 자연수 두 개를 입력받아 첫 번째 수를 두 번째 수만큼 제곱하여 반환하는 함수

	func whi(i: Int, x: Int){
	    var result: Int = 1
	    for _ in 0 ..< x{
	        result *= i
	    }
	    print(result)
	}



3) 자연수 하나를 입력받아 각 자리수 숫자들의 합을 반환해주는 함수

	func nal(num1: Int){
	    var sum: Int = num1
	    var result: Int = 0 
	    while sum != 0 {
	            result += (sum%10)
	      sum = (sum/10)
		} 	print(result) 
	
	}



## Control Transfer

1) 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 반환하는 함수를 만들되,

  그 합이 2000 을 넘는 순간 더하기를 멈추고 바로 반환하는 함수

	func allPlus(num1: Int){
	    var result: Int = 0
	    for x in 0 ... num1{
	        result += x
	        if 2000 <= result{
	            return print(result)
	        }
	    }
	}



2) 1 ~ 50 사이의 숫자 중에서 20 ~ 30 사이의 숫자만 제외하고 그 나머지를 모두 더해 출력하는 함수

	func all(x:Int){
	var result:Int = 0
	for i in 1 ... 50{
	    if i < 20{
	        result += i
	        }
	    if 30 < i{
	        result += i
	        }
	    }
	    print(result)
	}