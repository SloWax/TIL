[ 과제 - 앱 구현 ]

1. 영상 파일 참고
   * 텍스트 필드에 어떤 값을 입력하면 별도의 Label 에 입력된 텍스트 표시
   * 텍스트 필드가 활성화 되어 있을 땐 Label 의 텍스트 색상이 파란색이고, Font 크기는 40
   * 텍스트 필드가 비활성화되면 Label 텍스트 색상이 빨간색이고, Font 크기는 20

			import UIKit
			
			class ViewController: UIViewController {
			    
			    let label = UILabel()
			    let textField = UITextField()
			
			    override func viewDidLoad() {
			        super.viewDidLoad()
			        
			        label.frame = CGRect (x: view.center.x-100, y: view.center.y-200, width: 200, height: 50)
			        label.text = ""
			        view.addSubview(label)
			        
			        textField.frame = CGRect (x: view.center.x-100, y: view.center.y-100, width: 200, height: 50)
			        textField.borderStyle = .roundedRect
			        textField.clearButtonMode = .whileEditing
			        textField.addTarget(self, action: #selector(changeBlue40(_:)), for: .editingChanged)
			        textField.addTarget(self, action: #selector(exitRed20(_:)), for: .editingDidEndOnExit)
			        view.addSubview(textField)
			    }
			    @objc func changeBlue40(_ sender: Any){
			        label.textColor = .systemBlue
			        label.font = .systemFont(ofSize: CGFloat(40))
			        label.text = textField.text
			    }
			    @objc func exitRed20(_ sender: Any){
			        label.textColor = .systemRed
			        label.font = .systemFont(ofSize: CGFloat(20))
			    }
			
			}
