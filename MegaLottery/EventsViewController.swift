//
//  EventsViewController.swift
//  MegaLottery
//
//  Created by Zhanserik on 11/6/16.
//  Copyright © 2016 Kenes Inc. All rights reserved.
//

import UIKit
import EasyPeasy

class EventsViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    func setupView(){
        self.view.addSubview(tableView)
    }
    
    func setupConstraints(){
        tableView <- [
            Top(0),
            Right(0),
            Left(0),
            Bottom(0)
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension EventsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "identifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
        }
        cell?.textLabel?.text = "Mexx"
        return cell!
    }
}
