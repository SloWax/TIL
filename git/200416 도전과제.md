[ 도전 과제 ]

1. celcius, fahrenheit, kelvin 온도 3가지 케이스를 가진 enum 타입 Temperature 를 정의
   각 케이스에는 Double 타입의 Associated Value 를 받도록 함

추가로 Temperature 타입 내부에 각 온도를 섭씨 온도로 변환해주는 toCelsius() 함수를 구현
섭씨 = (화씨 - 32) * 5 / 9
섭씨 = 켈빈 + 273

	enum Temperature: Double {
	 case celsius, fahrenheit, kelvin
	
	  func toCelsius(temp:Double) -> Double {
	    switch self {
	    case .celsius:
	      return temp
	    case .fahrenheit:
	      return (temp - 32) * 5 / 9
	    case .kelvin:
	      return temp + 273
	    }
	  }
	}