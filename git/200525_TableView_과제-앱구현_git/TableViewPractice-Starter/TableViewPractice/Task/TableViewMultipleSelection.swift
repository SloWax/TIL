//
//  TableViewMultipleSelection.swift
//  TableViewPractice
//
//  Created by giftbot on 2020/05/25.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class TableViewMultipleSelection: UIViewController {
    
    /*
     [ 실습 - TableViewRefresh 기능을 이어서 수행 ]
     
     1) 처음 화면에 띄워질 목록은 1부터 지정한 숫자까지의 숫자들을 출력
     2) 이후 갱신할 때마다 임의의 숫자들이 출력되도록 할 것
     랜덤 숫자의 범위는 출력할 숫자 개수의 +50 이며, 모든 숫자는 겹치지 않아야 함.
     (여기까지 TableViewRefresh 실습 내용과 동일)
     3) 특정 테이블뷰셀을 선택하고 갱신하면 해당 셀에 있던 숫자는 유지되고 나머지 숫자들만 랜덤하게 갱신되도록 처리
     (셀을 선택한 순서에 따라 그대로 다음 갱신 목록에 출력)
     e.g. 20, 10 두 개의 숫자를 선택하고 갱신하면, 다음 숫자 목록은 (20, 10, random, random...)
     4) 위 3번에서 숫자를 선택할 때 그 숫자가 7보다 작은 셀은 선택이 되지 않도록 처리.
     
     < 힌트 키워드 >
     willSelectRowAt - scrollViewDelegate 참고, 선택 가능 여부
     selectedRow(s) - tableView 속성, 현재 선택된 행에 대한 정보
     multipleSelection - 다중 선택 가능 여부
     */
    
    override var description: String { "Task 1 - MultipleSelection" }
    
    let maxCount = 20
    let maxRange = 50
    
    
    let refresh = UIRefreshControl()
    var selectData : Set<Int> = []
    lazy var data = Array(1...maxCount)
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.frame = view.frame
        tableView.allowsMultipleSelection = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        view.addSubview(tableView)
        
        refresh.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        tableView.refreshControl = refresh
    }
    @objc func reloadData() {
        data.removeAll()
        data = Array(selectData)
        selectData = []
        for _ in 1...maxCount {
            data.append(randumNumberToggle())
        }
        tableView.refreshControl?.endRefreshing()
        tableView.reloadData()
    }
    func randumNumberToggle() -> Int {
        let randumNumber = (1...maxCount + maxRange).randomElement() ?? 0
        guard !data.contains(randumNumber) else { return randumNumberToggle() }
        return randumNumber
    }
}

// MARK: - UITableViewDataSource

extension TableViewMultipleSelection: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = "\(data[indexPath.row])"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectData.insert(data[indexPath.row])
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        selectData.remove(data[indexPath.row])
    }
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if data[indexPath.row] < 7 {
            return nil
        } else {
            return indexPath
        }
    }
}

