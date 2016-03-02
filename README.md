# MonthYearPicker

[![CI Status](http://img.shields.io/travis/alexanderedge/MonthYearPicker.svg?style=flat)](https://travis-ci.org/alexanderedge/MonthYearPicker)
[![Version](https://img.shields.io/cocoapods/v/MonthYearPicker.svg?style=flat)](http://cocoapods.org/pods/MonthYearPicker)
[![License](https://img.shields.io/cocoapods/l/MonthYearPicker.svg?style=flat)](http://cocoapods.org/pods/MonthYearPicker)
[![Platform](https://img.shields.io/cocoapods/p/MonthYearPicker.svg?style=flat)](http://cocoapods.org/pods/MonthYearPicker)

![Screenshot](https://raw.githubusercontent.com/alexanderedge/MonthYearPicker/master/screenshot.png)

## Usage

Initialise the picker just like you would `UIPickerView`. You can set a closure to execute when the date changes using thr `dateSelectionHandler` property.

```
let picker = MonthYearPickerView(frame: CGRect(origin: CGPoint(x: 0, y: (CGRectGetHeight(view.bounds) - 216) / 2), size: CGSize(width: CGRectGetWidth(view.bounds), height: 216)))
picker.dateSelectionHandler = { date in
  print("selected: \(date)")
}
self.view.addSubview(picker)
```

## Requirements

iOS 8.0 or later

## Installation

MonthYearPicker is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "MonthYearPicker"
```

## Author

Alexander Edge, alex@alexedge.co.uk

## License

MonthYearPicker is available under the MIT license. See the LICENSE file for more info.
