[ 도전 과제 ]

1. 카드 스타일에서 제스처로 내릴 때는 UIAdaptivePresentationControllerDelegate 프로토콜을 사용한 별도의 작업 필요. 관련 내용을 검색해보고 presentationControllerDidDismiss 메서드를 이용해서 구현해보기


		class ViewController: UIViewController, UIAdaptivePresentationControllerDelegate {
		    
		    let aLable = UILabel()
		    let toBButton = UIButton(type: .system)
		    var count: Int = 0
		
		    override func viewDidLoad() {
		        super.viewDidLoad()
		        
		        view.backgroundColor = .darkGray
		        
		        aLable.frame = CGRect (x: view.center.x-50, y: view.center.y-100, width: 200, height: 50)
		        aLable.text = "Lable Count: \(count)"
		        aLable.textColor = .lightGray
		        view.addSubview(aLable)
		        
		        toBButton.frame = CGRect(x: view.center.x-50, y: view.center.y, width: 100, height: 50)
		        toBButton.setTitle("To B", for: .normal)
		        toBButton.tintColor = .lightGray
		        toBButton.addTarget(self, action: #selector(toBToggle(_:)), for: .touchUpInside)
		        view.addSubview(toBButton)
		    }
		    @objc func toBToggle(_ sender: UIButton){
		        let bVC = BViewController()
		        bVC.count = count + 3
		        bVC.bLable.text = "Lable Count: \(bVC.count)"
		        bVC.modalPresentationStyle = .formSheet
		        bVC.presentationController?.delegate = self
		        present(bVC, animated: true)
		    }
		    func presentationControllerDidDismiss(_ presentationController: UIPresentationController){
		            count = count + 4
		            aLable.text = "Lable Count: \(count)"
		    }
		}