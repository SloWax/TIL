[ 200414 과제 ]

- 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수 ex) 123 -> 321 , 10293 -> 39201


		  func reversed(sum:Int){  
		    var sum2 = sum   
		    var result = 0  
		    while sum2 != 0 {  
		        result += sum2%10  
		        if sum2/10 != 0{  
		        result *= 10  
		        }  
		        sum2 = (sum2/10)  
		    }
		    print(result)
		}

- 100 ~ 900 사이의 숫자 중 하나를 입력받아 각 자리의 숫자가 모두 다른지 여부를 반환하는 함수 ex) true - 123, 310, 369   /  false - 100, 222, 770


		func match(_ num: Int) -> Bool {
		    let str = String(num)
		    let setNums = Set(str)
		    return str.count == setNums.count
		}
