//
//  MonthYearPickerView.swift
//  MonthYearPicker
//
//  Copyright (c) 2016 Alexander Edge <alex@alexedge.co.uk>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import UIKit

public class MonthYearPickerView: UIPickerView {
    
    public var date: NSDate = NSDate() {
        didSet {
            
            let dateComponents = calendar.components([.Year, .Month], fromDate: date)
            dateComponents.hour = 12
            
            guard let date = calendar.dateFromComponents(dateComponents) else {
                return
            }
            
            setDate(date, animated: true)
            dateSelectionHandler?(date)
        }
    }
    
    public var calendar: NSCalendar = NSCalendar.currentCalendar() {
        didSet {
            monthDateFormatter.calendar = calendar
            yearDateFormatter.calendar = calendar
        }
    }
    
    public var locale: NSLocale? {
        didSet {
            calendar.locale = locale
            monthDateFormatter.locale = locale
            yearDateFormatter.locale = locale
        }
    }
    
    public var dateSelectionHandler: (NSDate -> Void)?
    
    lazy private var monthDateFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter
    }()
    
    lazy private var yearDateFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "y"
        return formatter
    }()
    
    private enum Component: Int {
        case Month
        case Year
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        dataSource = self
        delegate = self
        setDate(date, animated: false)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        dataSource = self
        delegate = self
        setDate(date, animated: false)
    }
    
    public func setDate(date: NSDate, animated: Bool) {
        let month = calendar.component(.Month, fromDate: date) - calendar.maximumRangeOfUnit(.Month).location
        selectRow(month, inComponent: Component.Month.rawValue, animated: animated)
        let year = calendar.component(.Year, fromDate: date) - calendar.maximumRangeOfUnit(.Year).location
        selectRow(year, inComponent: Component.Year.rawValue, animated: animated)
    }
    
}

extension MonthYearPickerView: UIPickerViewDelegate {
    
    public func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let dateComponents = NSDateComponents()
        dateComponents.year = calendar.maximumRangeOfUnit(.Year).location + pickerView.selectedRowInComponent(Component.Year.rawValue)
        dateComponents.month = calendar.maximumRangeOfUnit(.Month).location + pickerView.selectedRowInComponent(Component.Month.rawValue)
        dateComponents.hour = 12
        guard let date = calendar.dateFromComponents(dateComponents) else {
            return
        }
        self.date = date
    }
    
}

extension MonthYearPickerView: UIPickerViewDataSource {
    
    public func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    public func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        guard let component = Component(rawValue: component) else { return 0 }
        switch component {
        case .Month:
            return calendar.maximumRangeOfUnit(.Month).length
        case .Year:
            return calendar.maximumRangeOfUnit(.Year).length
        }
        
    }
    
    public func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let component = Component(rawValue: component) else { return nil }
        
        switch component {
        case .Month:
            let month = calendar.maximumRangeOfUnit(.Month).location + row
            let dateComponents = NSDateComponents()
            dateComponents.month = month
            dateComponents.hour = 12
            guard let date = calendar.dateFromComponents(dateComponents) else {
                return nil
            }
            return monthDateFormatter.stringFromDate(date)
        case .Year:
            let year = calendar.maximumRangeOfUnit(.Year).location + row
            let dateComponents = NSDateComponents()
            dateComponents.year = year
            dateComponents.hour = 12
            guard let date = calendar.dateFromComponents(dateComponents) else {
                return nil
            }
            return yearDateFormatter.stringFromDate(date)
        }
        
    }
    
}