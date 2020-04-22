[ 과제 ]
1. 옵셔널 타입의 문자열 파라미터 3개를 입력받은 뒤, 옵셔널을 추출하여 Unwrapped 된 하나의 문자열로 합쳐서 반환하는 함수


			func combineString(str1: String?, str2: String?, str3: String?) -> String {
			
			  var result: String = ""
			
			  if let a = str1, let b = str2, let c = str3 {
			
			    result = a + b + c
			
			  }
			
			  return result
			
			}


2. 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic과 2개의 자연수를 입력 파라미터로 받아 (파라미터 총 3개) 해당 연산의 결과를 반환하는 함수 구현


		enum Arithmetic: Int {
		    case addition, subtraction, multiplication, division
		    
		    func calcu(A:Int, B:Int) {
		        var result:Int = 0
		        switch self {
		        case .addition:
		            result = A + B
		        case .subtraction:
		            result = A - B
		        case .multiplication:
		            result = A * B
		        case .division:
		            result = A / B
		        }
		        return print(result)
		    }
		}
