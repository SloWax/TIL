1. 영상 파일 참고

* 텍스트필드에 10글자까지만 입력되고 그 이상은 입력되지 않도록 하기



		import UIKit
		
		class ViewController: UIViewController {
		    let textField = UITextField()
		
		    override func viewDidLoad() {
		        super.viewDidLoad()
		        
		        textField.frame = CGRect (x: view.center.x-100, y: view.center.y-200, width: 200, height: 50)
		        textField.borderStyle = .roundedRect
		        textField.clearButtonMode = .whileEditing
		        textField.addTarget(self, action: #selector(textLimit(_:)), for: .editingChanged)
		        view.addSubview(textField)
		    }
		    @objc func textLimit(_ sender: Any){
		        let textCount = textField.text
		        if textCount?.count ?? 0 > 10 {
		         textField.deleteBackward()
		        }
		    }
		}