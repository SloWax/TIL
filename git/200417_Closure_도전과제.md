[ 도전 과제 ]

아래 두 클로저를 Syntax Optimization을 이용하여 최대한 줄여보기

1)
	let someClosure: (String, String) -> Bool = {
	    (s1: String, s2: String) -> Bool in
	    let isAscending: Bool
	    if s1 > s2 {
	        isAscending = true
	        } else {
	        isAscending = false
	    }
	    return isAscending
	}

->

	let someClosure: (String, String) -> Bool = { $0 > $1 }


2)
	let otherClosure: ([Int]) -> Int = {
	    (values: [Int]) -> Int in
	    var count: Int = 0
	    for _ in values {
	        count += 1
	    }
	    return count
	}

->

	let otherClosure: ([Int]) -> Int = { $0.count}