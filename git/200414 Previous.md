# Previous

### Dictionary로 저장되어 있는 시험 성적의 평균 점수 구하기
- // 1번 문제 예
// let scores = ["kor": 92,"eng": 88, "math": 96, "science": 89]
// 결과 : 91.25

let classScores = ["kor": 92,"eng": 88, "math": 96, "science": 89]
var allScores: Int = 0

for score in classScores.values{
    allScores += score
}
var result:Double = 0.00
result = Double(allScores) / Double(classScores.count)

### Dictionary로 저장된 scores 데이터를 튜플 타입을 지닌 배열로 변환하여 저장하기

- // 2번 문제 예
// let scores = ["kor": 92,"eng": 88, "math": 96, "science": 89]
// 결과 : [("kor", 92), ("eng", 88), ("math", 96), ("science", 89)]

let classScores2 = ["kor": 92,"eng": 88, "math": 96, "science": 89]
var stuScores: [(String,Int)] = []
for (key,value) in classScores2 {
    stuScores.append((key, value))
}

### 주어진 자료를 보고 Dictionary 자료형에 맞게 데이터를 변수에 저장하기

- // 3번 문제
/*
 **패스트캠퍼스**
- 스쿨
   * iOS 스쿨
   * 백엔드 스쿨
   * 프론트엔드 스쿨
- 캠프
   * A 강의
   * B 강의
- 온라인
   * C 강의
   * D 강의
  */
  
  let fastCampus = [
    "스쿨": ["iOS 스쿨", "백엔드 스쿨", "프론트엔드 스쿨"],
    "캠프": ["A 강의", "B 강의"],
    "온라인": ["C 강의", "D 강의"]
]

### 보기처럼 학생과 좋아하는 과일을 매칭시킨 정보를 Dictionary 형태로 만들고 스펠링에 'e'가 들어간 과일을 모두 찾아 그것과 매칭되는 학생 이름을 배열로 반환하는 함수

**[보기] 철수 - apple, 영희 - banana, 진수 - grape, 미희 - strawberry**

let dicFruit = ["철수": "apple", "영희": "banana", "진수": "grape", "미희": "strawberry"]
var result = [String]()
for (key,value) in dicFruit{
    if value.contains("e"){
        result.append(key)
    }
}


### 임의의 정수 배열을 입력받았을 때 홀수는 배열의 앞부분, 짝수는 배열의 뒷부분에 위치하도록 구성된 새로운 배열을 반환하는 함수

func dicNum(num: Int...) {
    var result = [Int]()
    for x in num{
       if x%2 == 0{
        result.append(x)
       } else{
        result.insert(x, at: 0)        }
    }
    print(result)
}
