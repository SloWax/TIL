[ 도전 과제 ]

- 주어진 문자 배열에서 중복되지 않는 문자만을 뽑아내 배열로 반환해주는 함수 ex) ["a", "b", "c", "a", "e", "d", "c"]  ->  ["b", "e" ,"d"]


		func arr(sum:Character...){
		    var resultArray: [Character] = []
		    for i in sum {
		        if sum.filter({ $0 == i }).count == 1 {
		            resultArray.append(i)
		        }
		    }
		    print(resultArray)
		}

- 별도로 전달한 식육목 모식도 라는 자료를 보고 Dictionary 자료형에 맞도록 중첩형태로 데이터를 저장하고  + 해당 변수에서 표범 하위 분류를 찾아 사자와 호랑이를 출력하기


		let carnivora = [
		"식육목":[
	    	"개과":[
	      	"개":["자칼", "늑대", "북미산 이리"],
	    	  "여우":["아메리카 여우", "유럽 여우"]],
	    	"고양이과":[
	     	 "고양이":["고양이", "살쾡이"],
	     	 "표범":["사자", "호랑이"]]
		  ]
		]
	
		print(carnivora["식육목"]!["고양이과"]!["표범"])
