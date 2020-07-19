[ 과제 - 앱 구현 ] 

1. UISwitch, UISegmentedControl 을 이용한 문제 

     1) UISwitch : On, Off 가 바뀔 때마다 Label 의 내용이 On, Off 로 표시되도록 구현

     2) UISegmentedControl : 선택 내용이 바뀔 때마다 Label 의 내용도 해당 타이틀 값으로 함께 변경되도록 구현
   
   * 참고로, 위 2개는 버튼과 달리 event 처리를 touchUpInside 가 아니라 valueChanged 라는 것을 활용해야 함



		class ViewController: UIViewController {
		    
		    let SwitchOnOff = UISwitch()
		    let Lable = UILabel()
		    let ControlCar = UISegmentedControl(items: ["BMW", "Benz", "Audi"])
		    let LableCar = UILabel()
		
		    override func viewDidLoad() {
		        super.viewDidLoad()
		        
		        Lable.frame = CGRect(x: 270, y: 100, width: 65, height: 40)
		        Lable.text = "off"
		        Lable.textColor = .white
		        Lable.backgroundColor = .gray
		        Lable.layer.masksToBounds = true
		        Lable.layer.cornerRadius = 10
		        Lable.textAlignment = .center
		        Lable.font = UIFont.preferredFont(forTextStyle: .largeTitle)
		        view.addSubview(Lable)
		        
		        SwitchOnOff.frame.origin = CGPoint(x: 40, y: 105)
		        SwitchOnOff.addTarget(self, action: #selector(onOff(_:)), for: .valueChanged)
		        view.addSubview(SwitchOnOff)
		        
		        LableCar.frame = CGRect(x: 135, y: 220, width: 105, height: 40)
		        LableCar.text = "Car"
		        LableCar.textColor = .white
		        LableCar.backgroundColor = .gray
		        LableCar.layer.masksToBounds = true
		        LableCar.layer.cornerRadius = 10
		        LableCar.textAlignment = .center
		        LableCar.font = UIFont.preferredFont(forTextStyle: .largeTitle)
		        view.addSubview(LableCar)
		        
		        ControlCar.frame.origin = CGPoint(x: 107.5, y: 333)
		        ControlCar.addTarget(self, action: #selector(selectCar(_:)), for: .valueChanged)
		        view.addSubview(ControlCar)
		        
		    }
		    @objc func onOff(_ sender: UISwitch ) {
		        Lable.text = sender.isOn ? "On" : "Off"
		    }
		    @objc func selectCar(_ sender: UISegmentedControl) {
		        var color: UIColor
		        var text: String
		
		        switch ControlCar.selectedSegmentIndex {
		        case 0:
		            color = UIColor.blue
		            text = "BMW"
		        case 1:
		            color = UIColor.white
		            text = "Benz"
		        case 2:
		            color = UIColor.red
		            text = "Audi"
		        default:
		            return
		        }
		        self.LableCar.textColor = color
		        self.LableCar.text = text
		        
		    }
		}
