//
//  ViewController.swift
//  ImagePickerControllerPractice
//
//  Created by 표건욱 on 2020/06/02.
//  Copyright © 2020 SloWax. All rights reserved.
//

import MobileCoreServices
import UIKit

class ViewController: UIViewController {
    
    let imageView = UIImageView()
    let imagePicker = UIImagePickerController()
    let pickButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imageView.image = UIImage(named: "image")
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        pickButton.setTitle("Image Pick", for: .normal)
        pickButton.addTarget(self, action: #selector(pickImage(_:)), for: .touchUpInside)
        view.addSubview(pickButton)
        
        pickButton.translatesAutoresizingMaskIntoConstraints = false
        pickButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        pickButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    @objc func pickImage(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = [kUTTypeImage as String]
        
        present(imagePicker, animated: true)
    }
}
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        imageView.image = image
        
        dismiss(animated: true)
    }
}
