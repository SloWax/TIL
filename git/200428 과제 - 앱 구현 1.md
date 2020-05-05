1. 영상 파일 참고

* 하나의 뷰에 alert를 호출하는 버튼과 값을 표기하는 lable 생성
* alert에 어떤 값을 입력하면 별도의 Label 에 입력된 값 더하기
* alert의 버튼은 총 3개, add, reset, cancel

활용 코드)

alertController.addTextField

alertController.textFields?.first



	import UIKit
	
	class ViewController: UIViewController {
	    
	    let resultLable = UILabel()
	    let alertButton = UIButton(type: .system)
	    var count:Int = 0
	
	    override func viewDidLoad() {
	        super.viewDidLoad()
	        
	        resultLable.frame = CGRect(x: view.center.x-30, y: view.center.y-100, width: 100, height: 50)
	        resultLable.text = "Value: \(count)"
	        view.addSubview(resultLable)
	        
	        alertButton.frame = CGRect(x: view.center.x-25, y: view.center.y-50, width: 50, height: 50)
	        alertButton.setTitle("PLUS", for: .normal)
	        alertButton.tintColor = .systemBlue
	        alertButton.addTarget(self, action: #selector(plusAlert(_:)), for: .touchUpInside)
	        view.addSubview(alertButton)
	    }
	    @objc func plusAlert(_ sender: UIButton){
	        let alert = UIAlertController(title: "카운트 추가", message: nil, preferredStyle: .alert)
	        alert.addTextField{
	            $0.placeholder = "숫자를 입력하세요"
	            $0.keyboardType = .numberPad
	        }
	        let addCount = UIAlertAction(title: "Add Count", style: .default) {_ in
	            var addValue:Int = 0
	            
	            if let textField = alert.textFields?.first,
	                let input = textField.text,
	                let addInPut = Int(input){
	                addValue = addInPut
	            }
	            self.count += addValue
	            self.resultLable.text = "Value: \(self.count)"
	                
	        }
	        let reset = UIAlertAction(title: "Reset", style: .destructive, handler: reset(_:))
	        let cancle = UIAlertAction(title: "Cancle", style: .default)
	        alert.addAction(addCount)
	        alert.addAction(reset)
	        alert.addAction(cancle)
	        present(alert, animated: true)
	    }
	    func reset(_ sender: Any){
	        count = 0
	        resultLable.text = "Value: \(count)"
	    }
	}