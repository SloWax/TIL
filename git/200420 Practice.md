# Practice

## 1.  
1) width, height 속성을 가진 Rectangle 클래스 정의  
2) 생성자(초기화 메서드)에서 width, height 프로퍼티 값을 설정할 수 있도록 구현  
3) 사각형의 가로 세로 길이를 변경할 수 있는 메서드 구현  
4) 사각형 가로와 세로의 길이를 반환하는 메서드 구현  
5) 사각형의 넓이를 반환하는 메서드 구현  
6) 다음과 같은 속성을 지닌 인스턴스 생성  
	- 직사각형 1개 속성: width = 10, height = 5  
	- 정사각형 1개 속성: width = 7, height = 7  


		    class Rectangle {  
		      var width: Int  
		      var height: Int  
		        
		      init(width:Int, height:Int) {  
		      		self.width = width  
		      		self.height = height  
		      }  
		    		func change(width: Int, height: Int) {  
		    			self.width = width  
		    			self.height = height  
		    		}  
		    		func length() -> (Int, Int) {  
		    			return (width, height)  
		    		}  
		    		func area() -> (Int) {  
		    			return width * height  
		    		}  
		    	}  
      	
       			var rectangle1 = Rectangle(width: 10, height: 5)  
       			var rectangle2 = Rectangle(width: 7, height: 7)  


## 2.  
1) 채널 정보, Volume 값, 전원 설정여부를 속성으로 가지는 클래스 정의  
2) TV 의 현재 채널 및 볼륨을 변경 가능한 메서드 구현  
3) TV 의 현재 채널 및 볼륨을 확인할 수 있는 메서드 구현  
4) TV 전원이 꺼져있을 때는 채널과 볼륨 변경을 할 수 없도록 구현  
(직접 프로퍼티에 값을 설정할 수 없다고 가정)  
5) 채널과 볼륨 정보를 확인했을 때 TV 전원이 꺼져있으면 -1 이 반환되도록 구현  


	 	class TV {  
	 		var channel: Int  
	 		var volume: Int  
	 		var power: Bool  
	
		init(channel: Int, volume: Int, power: Bool) {  
			self.channel = channel  
			self.volume = volume  
			self.power = power  
		}  
		func change(channel: Int, volume: Int) {  
			guard power == true else {  
		  	return  
		    }  
			self.channel = channel  
			self.volume = volume  
		}  
		func check() -> String {  
			if power == true{  
			return ("\(channel), \(volume)")  
			} else {  
			return ("-1")  
			}  
		    }  
		}  


## 3.  
1) 사각형의 길이를 설정하는 초기화 메서드, 둘레와 넓이값을 구하는 메서드 구현  


		class Square {  
			var width: Int  
			var height: Int  
			init(width: Int, height:Int){  
				self.width = width  
				self.height = height  
			}  
			func formula(formula: String) -> Int {  
				if formula == "넓이" {  
					return width * height  
				} else if formula == "둘레" {  
					return width * 2 + height * 2  
				} else {  
					return 0  
				}  
			}  
		}  



2) 원의 반지름을 설정하는 초기화 메서드, 둘레와 넓이값을 구하는 메서드 구현  


		class Circle {  
			var radius: Double  
			init(radius: Double){  
			self.radius = radius  
			}  
			func formula(formula: String) -> Double {  
				if formula == "둘레" {  
					return 2 * 3.14 * radius  
				} else if formula == "넓이" {  
					return 3.14*(radius*radius)  
				} else {  
					return 0  
				}  
			}  
		}  
