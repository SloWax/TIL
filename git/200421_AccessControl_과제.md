[과제]

1. 이미지처럼 Animal, Human, Pet, Dog, Cat 클래스 정의

   상속을 적용해 필요한 속성을 모두 가지면서 각각 다른 속성과 값을 지닐 수 있도록 구현


	
		class Animal{
		    var brain = true
		    var legs: Int
		    init(legs:Int = 0) {
		        self.legs = legs
		    }
		}
		class Human: Animal {
		    override init(legs:Int = 2) {
		        super.init(legs: legs)
		    }
		}
		class Pet: Animal {
		    var fleas: Int
		    init(fleas:Int = 0) {
		        self.fleas = fleas
		        super.init(legs: 4)
		    }
		}
		class Dog: Pet {
		    override init(fleas: Int = 8) {
		    super.init(fleas: fleas)
		    }
		}
		class Cat: Pet {
		    override init(fleas: Int = 4) {
		        super.init(fleas: fleas)
		    }
		}



![과제](/Users/slowax/Documents/dev/TIL/git/20.04/200421/과제.png)
