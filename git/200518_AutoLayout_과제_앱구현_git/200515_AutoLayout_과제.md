[과제]

1. 두개의 뷰를 모든 화면에서 같은 간격으로 구현되도록 만들기
   * 각 간격은 20, 뷰 사이의 간격은 10


		import UIKit
		
		class ViewController: UIViewController {
		    
		    let view1 = UIView()
		    let view2 = UIView()
		    
		    override func viewDidLoad() {
		        super.viewDidLoad()
		        
		        view1.backgroundColor = .systemRed
		        view2.backgroundColor = .systemBlue
		        view.addSubview(view1)
		        view.addSubview(view2)
		        
		        view1.translatesAutoresizingMaskIntoConstraints = false
		        view1.widthAnchor.constraint(equalTo: view2.widthAnchor).isActive = true
		        view1.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
		        view1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
		        view1.rightAnchor.constraint(equalTo: view2.leftAnchor, constant: -10).isActive = true
		        view1.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
		        
		        view2.translatesAutoresizingMaskIntoConstraints = false
		        view2.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
		        view2.leftAnchor.constraint(equalTo: view1.rightAnchor, constant: 10).isActive = true
		        view2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
		        view2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
		    }
		}