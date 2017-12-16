//
//  ViewController.swift
//  ExampleProject
//
//  Created by Matan Cohen on 12/16/17.
//  Copyright © 2017 Matan. All rights reserved.
//

import UIKit
import EasyTableView

class ViewController: UIViewController {
    var easyTableView: EasyTableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let config = EasyTableConfigurationSimple.init(cellHeight: 50, configureCell: { (cell, indexPath) -> UITableViewCell in
            cell.textLabel?.text = String(indexPath.row)
            return cell
        }, dataSourceCount: self.dataSourceCount, cellType: UITableViewCell.self)
        self.easyTableView = EasyTableView(tableConfiguration:config)
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

