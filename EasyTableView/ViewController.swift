//
//  ViewController.swift
//  EasyTableView
//
//  Created by Matan Cohen on 12/15/17.
//  Copyright © 2017 Matan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var easyTableView: EasyTableView?

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.easyTableView = EasyTableView(tableConfiguration:
            EasyTableConfigurationSimple(cellHeight: 50, configureCell: { (cell, indexPath) -> UITableViewCell in
                cell.textLabel?.text = String(indexPath.row)
                return cell
            }, dataSourceCount: self.dataSourceCount, cellType: UITableViewCell.self))
        self.view.addSubview(self.easyTableView!)
        self.easyTableView?.translatesAutoresizingMaskIntoConstraints = false
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.easyTableView?.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.easyTableView?.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.easyTableView?.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.easyTableView?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    func dataSourceCount() -> Int {
        return 50
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

