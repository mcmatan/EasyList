//
//  ViewController.swift
//  ExampleProject
//
//  Created by Matan Cohen on 12/16/17.
//  Copyright © 2017 Matan. All rights reserved.
//

import UIKit
import EasyList

class ViewController: UIViewController {
    var easyList: EasyList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let config = EasyListConfiguration.init(
            cellThemeBlock: { IndexPath -> CellTheme in
            return CellTheme.init(height: 50, type: UITableViewCell.self, cellIdentifier: "SomeCellIdentifier")
        }, dataSourceCount: { () -> Int in
            return 50
        }, cellSetParamsBlock: { (cell, indexPath) -> UITableViewCell in
            cell.textLabel?.text = String(indexPath.row)
            return cell
        }) { (cell, indexPath) in
            print("Did select indexPath \(indexPath)")
        }
        
    
        self.easyList = EasyList.init(config)
        self.view.addSubview(self.easyList!)
        self.easyList?.translatesAutoresizingMaskIntoConstraints = false
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.easyList?.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.easyList?.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.easyList?.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.easyList?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    func dataSourceCount() -> Int {
        return 50
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

