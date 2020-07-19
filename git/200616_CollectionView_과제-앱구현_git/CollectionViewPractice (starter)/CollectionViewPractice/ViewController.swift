//
//  ViewController.swift
//  CollectionViewPractice
//
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    let viewLayout = UICollectionViewFlowLayout()
    lazy var collectionView = UICollectionView(
        frame: view.frame, collectionViewLayout: viewLayout
    )
    let basicCatsList = [
        "cat0", "cat1", "cat2", "cat3", "cat4",
        "cat5", "cat6", "cat7", "cat8", "cat9",
        "cat0", "cat1", "cat2", "cat3", "cat4",
        "cat5", "cat6", "cat7", "cat8", "cat9"
    ]
    var catImages = [String]()
    
    var selectItem = [IndexPath]()
    var deleteItem = [IndexPath]()
    
    struct Standard {
        static let padding: CGFloat = 10
        static let edge = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        static var itemCountLine:CGFloat = 2
    }
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        catImages = basicCatsList
        
        navigationItem.title = "CollectionView"
        
        let trashBarButton = UIBarButtonItem(
            barButtonSystemItem: .trash,
            target: self,
            action: #selector(deleteToggle(_:)))
        
        let inputBarButton = UIBarButtonItem(
            barButtonSystemItem: .refresh,
            target: self,
            action: #selector(inputToggle(_:)))
        
        navigationItem.rightBarButtonItems = [trashBarButton, inputBarButton]
        
        collectionView.allowsMultipleSelection = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        view.addSubview(collectionView)
        
        
    }
    
    // MARK: Action
    @objc func deleteToggle(_ sender: UIButton) {
        selectItem.sorted(by: >).forEach {
            catImages.remove(at: $0.item)
        }
        collectionView.deleteItems(at: selectItem)
        deleteItem.append(contentsOf: selectItem)
        selectItem.removeAll()
        
        if catImages.isEmpty {
            catImages = basicCatsList
            collectionView.insertItems(at: deleteItem)
            deleteItem.removeAll()
        }
    }
    
    @objc func inputToggle(_ sender: UIButton) {
        let alert = UIAlertController(title: "한 라인 갯수 입력", message: nil, preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "숫자를 입력하세요."
            textField.keyboardType = .numberPad
        }
        
        let okAction = UIAlertAction(title: "확인", style: .default) { _ in
            if let count = Int(alert.textFields?[0].text ?? "1") {
                guard count != 0 else { return }
                Standard.itemCountLine = CGFloat(count)
                self.collectionView.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
}


// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell {
            cell.imageView.alpha = 0.7
            cell.checkImage.isHidden = false
            selectItem.append(indexPath)
            print(selectItem)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell {
            let index = selectItem.firstIndex(of: indexPath)!
            selectItem.remove(at: index)
            cell.imageView.alpha = 1
            cell.checkImage.isHidden = true
            print(selectItem)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        if cell.isSelected {
            cell.imageView.alpha = 0.7
            cell.checkImage.isHidden = false
        } else {
            cell.imageView.alpha = 1
            cell.checkImage.isHidden = true
        }
        cell.imageView.image = UIImage(named: catImages[indexPath.item])
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    // 줄 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Standard.padding
    }
    // 행 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Standard.padding - 5
    }
    // 테두리
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return Standard.edge
    }
    // 아이템 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width - (Standard.edge.left + Standard.edge.right) - (Standard.padding * (Standard.itemCountLine - 1))) / Standard.itemCountLine
        return CGSize(width: size, height: size)
    }
}
