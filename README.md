

[![Pod version](https://img.shields.io/cocoapods/v/EasyTableView.svg?style=flat)](http://cocoadocs.org/docsets/EasyTableView)
[![Language](https://img.shields.io/badge/language-swift-orange.svg?style=flat)](https://developer.apple.com/swift)

<p align = "center"><img src="https://i.imgur.com/SWkSf5L.png" alt="EasyTableView Icon"/></p>


## Description
Table view made simple, just load the damn data


## Usage Defult UITableView

```Swift

self.tableView.delegate = self // and add conform to protocol UITableViewDelegate
self.tableView.dataSource = self // abd add conform to protocol UITableViewDataSource

self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "identifer")

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {}
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {}

```

## Usage EasyTableView

```Swift

let config = EasyTableConfigurationSimple.init(cellHeight: 50, configureCell: { (cell, indexPath) -> UITableViewCell in
            cell.textLabel?.text = String(indexPath.row)
            return cell
        }, dataSourceCount: self.dataSourceCount, cellType: UITableViewCell.self)
        self.easyTableView = EasyTableView(tableConfiguration:config)
        self.view.addSubview(self.easyTableView!)
        
```


## Installation

#### Cocoapods
**ImageScaleTransition** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'EasyTableView'
```

#### Manually
1. Download and drop ```/EasyTableView``` folder in your project.  
2. Congratulations!  

## Author

[Matan](https://github.com/mcmatan) made this with ❤️.
