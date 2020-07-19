	var inputCases = [
	  [],
	  [1],
	  [1, 2, 3, 5, 6, 7, 9, 10, 14],
	  [1, 1, 2, 2, 3, 3, 1, 2, 3],
	  [14, 10, 9, 7, 6, 5, 3, 2, 1],
	  [5, 6, 1, 3, 10, 2, 7, 14, 9],
	  Array(1...10).map { _ in Int.random(in: 1...999) },
	]

Bubble Sort (버블 정렬)

	func bubbleSort(input: inout [Int]) {
	    guard !input.isEmpty else { return }
	    for x in 0 ..< input.count {
	        for i in 0 ..< input.count - 1 - x{
	            if input[i] > input[i + 1] {
	                input.swapAt(i , i + 1)
	            }
	        }
	    }
	}

Selection Sort (선택 정렬)

Insertion Sort (삽입 정렬)
