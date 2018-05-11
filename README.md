

[![Pod version](https://img.shields.io/cocoapods/v/EasyList.svg?style=flat)](http://cocoadocs.org/docsets/EasyList)
[![Language](https://img.shields.io/badge/language-swift-orange.svg?style=flat)](https://developer.apple.com/swift)

<p align = "center"><img src="https://i.imgur.com/GlCRkUL.png" alt="EasyList Icon"/></p>


## Why EasyList?


EasyList is a UITableView subclass, that will help you create type-safe lists, with less code, and easier to read and maintain.

As probably know, using UITableView forces you to implement delegate pattern, switch statements (In case of different cell types) force casting (UITableViewCell to your custom cell type), and redundant code as 'cell identifier'.

EasyList is a new way of dealing with simple to complex table views, with a generic functional approach.

## Basic usage
Configuration type: EasyListConfigurationDefault, Supports multiple cell types, static height

```Swift

let cellConfiguration = CellConfiguration { (cell, indexPath) -> UITableViewCell in
        cell.textLabel?.text = "You know you shook me. You shook me all night long."
        return cell
}
let config = EasyListConfigurationDefault.init(
        cellConfiguration: { indexPath -> CellConfigurationType in
        return cellConfiguration
}, dataSourceCount: { () -> Int in
        return 50
}, rowHeight: { indexPath -> CGFloat in
        return 50
}) { (selectedCell, selectedIndexPath) in
        ///Did select cell
}
self.easyList = EasyList.init(config)

```

## Advanced usage
Configuration type: EasyListConfigurationAutoSizingCells, Supports multiple cell types, dynamic cell height

```Swift

let cellConfiguration = CellConfiguration { (cell, indexPath) -> AutoSizingCell in
         cell.setText("In the days of my youth, I was told what it means to be a man")
        return cell
}
let cellConfiguration2 = CellConfiguration { (cell, indexPath) -> AutoSizingCell2 in
        cell.setText("Good Times, Bad Times, you know I've had my share")
        return cell
}
let config = EasyListConfigurationAutoSizingCells.init(
        cellConfiguration: { indexPath -> CellConfigurationType in
        if (indexPath.row == 5) {
        return cellConfiguration2
        }
        return cellConfiguration
}, dataSourceCount: { () -> Int in
        return 50
}, estimatedRowsHeight: 100) { (selectedCell, selectedIndexPath) in
        ///Did select cell
}
self.easyList = EasyList.init(config)

```


## Installation

#### Cocoapods
**ImageScaleTransition** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'EasyList'
```

#### Manually
1. Download and drop ```/EasyList``` folder in your project.  
2. Congratulations!  

## Author

[Matan](https://github.com/mcmatan) made this with ❤️.
