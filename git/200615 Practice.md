Practice 1

	struct Pet {
	  enum PetType {
	    case dog, cat, snake, pig, bird
	  }
	  var type: PetType
	  var age: Int
	}
	
	let myPet = [
	  Pet(type: .dog, age: 13),
	  Pet(type: .dog, age: 2),
	  Pet(type: .dog, age: 7),
	  Pet(type: .cat, age: 9),
	  Pet(type: .snake, age: 4),
	  Pet(type: .pig, age: 5),
	]


[ 1번 문제 ]
 Pet 타입의 배열을 파라미터로 받아 그 배열에 포함된 Pet 중   강아지의 나이만을 합산한 결과를 반환하는 sumDogAge 함수 구현 func sumDogAge(pets: [Pet]) -> Int

	 func sumDogAge(pets: [Pet]) -> Int {
	  return pets.map{ $0.age }.reduce(0, +)
	}
	sumDogAge(pets: myPet)



 [ 2번 문제 ]
 Pet 타입의 배열을 파라미터로 받아 모든 Pet이 나이를 1살씩 더 먹었을 때의 상태를 지닌 새로운 배열을 반환하는 oneYearOlder 함수 구현
 func oneYearOlder(of pets: [Pet]) -> [Pet]

	func oneYearOlder(of pets: [Pet]) -> [Pet] {
	    return myPet.map { Pet(type: $0.type, age: $0.age + 1) }
	}
	
	oneYearOlder(of: myPet)