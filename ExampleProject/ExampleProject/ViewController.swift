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
     
        self.setupAutoSizingConfiguration()
        //self.setupSimpleConfiguration()
        
        self.view.addSubview(self.easyList!)
        self.easyList?.translatesAutoresizingMaskIntoConstraints = false
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.easyList?.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.easyList?.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.easyList?.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.easyList?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    private func setupSimpleConfiguration() {
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
    }
    
    private func setupAutoSizingConfiguration() {
        
        let cellConfiguration = CellConfiguration { (cell , indexPath) -> AutoSizingCell in
            cell.setText("blablablablablablablablablablablablablablablablablablablablablablablablablablabla blablablablablablablablablablablablablablablablablablablablablablablablablablabla blablablablablablablablablablablablablablablablablablablablablablablablablablabla blablablablablablablablablablablablablablablablablablablablablablablablablablabla blablablablablablablablablablablablablablablablablablablablablablablablablablabla blablablablablablablablablablablablablablablablablablablablablablablablablablabla")
            return cell
        }

        let cellConfiguration2 = CellConfiguration { (cell, indexPath) -> AutoSizingCell2 in
            cell.setText("da   da   da   da   da da   da   da   da   da da   da   da   da   da da   da   da   da   da ")
            return cell
        }

        let config = EasyListAutoSizeCellConfiguration.init(
            iCellConfigurationForIndexPath: { indexPath -> ICellConfiguration in
                
                if (indexPath.row == 5) {
                    return cellConfiguration2
                }
                
            return cellConfiguration
        }, dataSourceCount: { () -> Int in
            return 50
        }, didSelect: { (cell, indexPath) in
            //
        }, estimatedHeight: 100)
        
        
        
        self.easyList = EasyList.init(config)
    }
    
    func dataSourceCount() -> Int {
        return 50
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

