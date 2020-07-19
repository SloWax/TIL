let immutableArray = Array(1...40)

[ 문제 ]
 immutableArray 배열의 각 인덱스와 해당 인덱스의 요소를 곱한 값 중 홀수는 제외하고 짝수에 대해서만 모든 값을 더하여 결과 출력

단, 아래 1 ~ 3번에 해당하는 함수를 각각 정의하고 이것들을 함께 조합하여 위 문제의 결과를 도출할 것 

1. 배열의 각 요소 * index 값을 반환하는 함수
2. 짝수 여부를 판별하는 함수
3. 두 개의 숫자를 더하여 반환하는 함수


		let immutableArray = Array(1...40)
		
		func multiplyIndex(value: Int, index: Int ) -> Int {
		    return value * index
		}
		
		func isEven(value: Int) -> Bool {
		    return value % 2 == 0
		}
		
		func addNumbers(value1: Int, value2: Int) -> Int {
		    return value1 + value2
		}
		
		let result = immutableArray.enumerated()
		    .map { multiplyIndex(value: $0.element, index: $0.offset) }
		    .filter{ isEven(value: $0) }
		    .reduce(0){ addNumbers(value1: $0, value2: $1) }