//
//  ViewController.swift
//  ContextAction
//
//  Created by 표건욱 on 2020/06/13.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView = UIImageView()
    let imagePicker = UIImagePickerController()
    let container = UIView()
    let pickButton = UIButton(type: .system)
    var leftButton: UIButton! {
        didSet {
            let interaction = UIContextMenuInteraction(delegate: self)
            leftButton.addInteraction(interaction)
        }
    }
    var rightButton: UIButton! {
        didSet {
            let interaction = UIContextMenuInteraction(delegate: self)
            rightButton.addInteraction(interaction)
        }
    }
    
    var images: [UIImage] = []
    var imageIndex:Int = 0
    
    lazy var imagePreview = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        images.append(UIImage(named: "image")!)
        imageView.image = images[0]
        view.addSubview(imageView)
        
        view.addSubview(container)
        
        imagePreview.image = nil
        container.addSubview(imagePreview)
        
        leftButton = UIButton(type: .system)
        leftButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        leftButton.tag = 0
        leftButton.addTarget(self, action: #selector(leftButtonToggle(_:)), for: .touchUpInside)
        container.addSubview(leftButton)
        
        rightButton = UIButton(type: .system)
        rightButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        rightButton.tag = 1
        rightButton.addTarget(self, action: #selector(rightButtonToggle(_:)), for: .touchUpInside)
        container.addSubview(rightButton)
        
        pickButton.setTitle("Image Pick", for: .normal)
        pickButton.addTarget(self, action: #selector(presentImagePick(_:)), for: .touchUpInside)
        container.addSubview(pickButton)
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        container.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
            container.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 50),
            container.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -50),
            container.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftButton.topAnchor.constraint(equalTo: container.topAnchor),
            leftButton.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            leftButton.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            leftButton.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightButton.topAnchor.constraint(equalTo: container.topAnchor),
            rightButton.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            rightButton.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            rightButton.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        pickButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pickButton.topAnchor.constraint(equalTo: container.topAnchor),
            pickButton.leadingAnchor.constraint(equalTo: leftButton.trailingAnchor),
            pickButton.trailingAnchor.constraint(equalTo: rightButton.leadingAnchor),
            pickButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func presentImagePick(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true)
    }
    
    @objc func leftButtonToggle(_ sender: UIButton) {
        imageIndex = max(imageIndex - 1, 0)
        imageView.image = images[imageIndex]
    }
    
    @objc func rightButtonToggle(_ sender: UIButton) {
        imageIndex = min(imageIndex + 1, images.count - 1)
        imageView.image = images[imageIndex]
    }

}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        imageView.image = image
        images.append(image)
        imageIndex = images.count - 1
        
        dismiss(animated: true)
    }
    
}

extension ViewController: UIContextMenuInteractionDelegate {
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil)
    }
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, previewForHighlightingMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        guard let button = interaction.view as? UIButton else { return nil }
        
        let index = button.tag == 0 ? max(imageIndex - 1, 0) : min(imageIndex + 1, images.count - 1)
        
        imagePreview.image = images[index]
        imagePreview.frame = CGRect(x: button.center.x - 60, y: button.center.y + 30, width: 120, height: 120)
        imagePreview.alpha = 1
        return UITargetedPreview(view: imagePreview)
    }
    
    func contextMenuInteraction(
      _ interaction: UIContextMenuInteraction,
      willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration,
      animator: UIContextMenuInteractionCommitAnimating
    ) { }
    
    func contextMenuInteraction(
      _ interaction: UIContextMenuInteraction,
      willEndFor configuration: UIContextMenuConfiguration,
      animator: UIContextMenuInteractionAnimating?
    ) {
      UIView.animate(withDuration: 1.5, delay: 0.3, animations: {
        self.imagePreview.alpha = 0.0
      })
    }
}
