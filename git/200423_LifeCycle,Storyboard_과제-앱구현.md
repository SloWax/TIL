[ 과제 - 앱 구현 ] 

   1. Button을 누를 때마다 Label 의 값 변경하기   

      1) +버튼 또는 -버튼을 누르면 숫자가 증가/감소하도록 만들기   

      2) 숫자가 증가할 때는 label의 텍스트 색을 파란색, 감소할 때는 빨간색으로 변경

	class ViewController: UIViewController {
	
	    let countLabel = UILabel()
	    let ButtonP = UIButton(type: .system)
	    let ButtonM = UIButton(type: .system)
	    let resetButton = UIButton(type: .system)
	    var count:Int = 0
	    
	    override func viewDidLoad() {
	        super.viewDidLoad()
	        
	        countLabel.frame = CGRect(x: 40, y: 100, width: 300, height: 200)
	        countLabel.text = "Count: " + String(count)
	        countLabel.textColor = .black
	        countLabel.textAlignment = .center
	        countLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
	        view.addSubview(countLabel)
	        
	        ButtonP.setTitle("+", for: .normal)
	        ButtonP.setTitle("+1", for: .highlighted)
	        ButtonP.frame = CGRect(x: 50, y: 406, width: 50, height: 50)
	        ButtonP.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
	        ButtonP.layer.cornerRadius = 10
	        ButtonP.tintColor = .white
	        view.addSubview(ButtonP)
	        ButtonP.addTarget(self, action: #selector(plus(_:)), for: .touchUpInside)
	        
	        ButtonM.setTitle("-", for: .normal)
	        ButtonM.setTitle("-1", for: .highlighted)
	        ButtonM.frame = CGRect(x: 275, y: 406, width: 50, height: 50)
	        ButtonM.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
	        ButtonM.layer.cornerRadius = 10
	        ButtonM.tintColor = .white
	        view.addSubview(ButtonM)
	        ButtonM.addTarget(self, action: #selector(minus(_:)), for: .touchUpInside)
	        
	        resetButton.setTitle("reset", for: .normal)
	        resetButton.frame = CGRect(x: 0, y: 100, width: 150, height: 100)
	        resetButton.tintColor = .black
	        view.addSubview(resetButton)
	        resetButton.addTarget(self, action: #selector(reset(_:)), for: .touchUpInside)
	        
	    }
	    @objc func plus(_ sender: Any) {
	        countLabel.textColor = .blue
	        count += 1
	        countLabel.text = "Count: " + String(count)
	    }
	    @objc func minus(_ sender: Any) {
	        countLabel.textColor = .red
	        count -= 1
	        countLabel.text = "Count: " + String(count)
	    }
	    @objc func reset(_ sender: Any) {
	        countLabel.textColor = .black
	        count = 0
	        countLabel.text = "Count: " + String(count)
	    }
	}
