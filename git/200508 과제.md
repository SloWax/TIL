[과제]

1.  

   * 뷰에 Button과  UIImageView를 생성 하나씩 생성
   * 스위치가 on 이되면 강아지 사진을 표시하고 off일 경우 고양이 사진을 출력
   * UserDefualts를 이용해 스위치와 출력한 사진을 그대로 불러오도록 구현

   

		import UIKit
		
		class ViewController: UIViewController {
		    
		    let animalSwitch = UISwitch()
		    let animalImage = UIImageView()
		    var myImage: UIImage?
		    
		    override func viewDidLoad() {
		        super.viewDidLoad()
		        
		        myImage = UserDefaults.standard.bool(forKey: "Switch") ? UIImage(named: "Dog.jpeg") : UIImage(named: "Cat.jpeg")
		        
		        animalImage.frame = CGRect (x: 20, y: 44, width: 343, height: view.center.y)
		        animalImage.backgroundColor = .systemGray
		        animalImage.contentMode = .scaleToFill
		        animalImage.image = myImage
		        view.addSubview(animalImage)
		        
		        animalSwitch.frame = CGRect (x: view.center.x - 25, y: view.center.y + 70, width: 50, height: 50)
		        animalSwitch.isOn = UserDefaults.standard.bool(forKey: "Switch")
		        animalSwitch.addTarget(self, action: #selector(pushImage(_:)), for: .valueChanged)
		        view.addSubview(animalSwitch)
		        
		    }
		    @objc func pushImage(_ sender: UISwitch){
		        myImage = animalSwitch.isOn ? UIImage(named: "Dog.jpeg") : UIImage(named: "Cat.jpeg")
		        animalImage.image = myImage
		        UserDefaults.standard.set(animalSwitch.isOn, forKey: "Switch")
		    }
		}
