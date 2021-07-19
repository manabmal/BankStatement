//
//  Extentions.swift
//  BankStatement
//
//  Created by Manab Kumar Mal on 25/06/21.
//

import Foundation
import UIKit

extension UIColor {
    static let deepYellow = UIColor(red: 255.0/255.0, green: 204.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    static let airforceLight = UIColor(red: 146.0/255.0, green: 176.0/255.0, blue: 176.0/255.0, alpha: 1.0)
    static let lightGreyBack = UIColor(red: 246.0/255.0, green: 246.0/255.0, blue: 246.0/255.0, alpha: 1.0)
    static let lightGreyText = UIColor(red: 138.0/255.0, green: 138.0/255.0, blue: 138.0/255.0, alpha: 1.0)
    static let lightBlackText = UIColor(red: 35.0/255.0, green: 31.0/255.0, blue: 32.0/255.0, alpha: 1.0)
}

extension Double{
    
    func toDollar() -> String? {
        return self >= 0 ? String(format: "$%.2f", self) : String(format: "-$%.2f", self * -1)
    }
}

extension Date{
    
    func toString() -> String? {
        let dateFormat1 = DateFormatter()
        dateFormat1.locale = Locale(identifier: "en_US_POSIX")
        dateFormat1.dateFormat = "dd/MM/yyyy"
        return dateFormat1.string(from: self)
    }
}

extension Array{
    func sortByDate() -> [String]
    {
        guard let arrString = self as? [String] else {return [String]()}
        let dates = arrString.compactMap { $0.toDate() }.sorted { $0 > $1 }.compactMap { $0.toString()}
        return dates
    }
}

extension String {
    func toDate() -> Date? {
        
        let arrFormatters = ["dd-MM-yyyy","dd/MM/yyyy","d/MM/yyyy"]
        for strFormat in arrFormatters
        {
            if let date = convertToDate(withFormater: strFormat)
            {
                return date
            }
        }
        func convertToDate(withFormater format: String) -> Date?
        {
            let dateFormat1 = DateFormatter()
            dateFormat1.locale = Locale(identifier: "en_US_POSIX")
            dateFormat1.dateFormat = format
            if let date1 = dateFormat1.date(from: self)
            {
                return date1
            }
            return nil
        }
        return nil
        
    }
    func daysAgo() -> String? {
        if let prevDate = self.toDate()
        {
            let diffInDays = Calendar.current.dateComponents([.day], from: prevDate, to: Date()).day
            if let diffInDays = diffInDays
            {
                if diffInDays < 0
                {
                    let posValue = diffInDays * -1
                    return posValue == 1 ? "1 Day Left" : "\(posValue) Days Left"
                }
                else if diffInDays == 0
                {
                    return "Today"
                }
                else
                {
                    return diffInDays == 1 ? "1 Day Ago" : "\(diffInDays) Days Ago"
                }
            }
        }
        return ""
    }
    func formatDate() -> String? {
        if let prevDate = self.toDate()
        {
            let dateFormat1 = DateFormatter()
            dateFormat1.locale = Locale(identifier: "en_US_POSIX")
            dateFormat1.dateFormat = "dd MMM yyyy"
            return dateFormat1.string(from: prevDate)
        }
        return ""
    }
    
    func stripOutHtml() -> String? {
        
        
        do {
            guard let data = self.data(using: .unicode) else {
                return nil
            }
            let attributed = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            return attributed.string
        } catch {
            return nil
        }
    }
}
let shared = MysharedClass()
class MysharedClass
{
    private var anotherPrivateVar = 10
    fileprivate var filePrivateVar = 20
    final func printMe(withString str: String)
    {
        print(str)
    }
    func letsDance(){}
}

class MySharedClass2
{
    //static let main = MySharedClass2()
    private init(){}
    func printMe(withString str: String)
    {
        print(str)
        shared.accessVariables()
        shared.accessPrivateVar1()
        shared.printMe(withString: "Hey")
        shared.filePrivateVar = 40
    }
    
    
}

extension MysharedClass
{
    private var anotherPrivateVar2: Int{
        get
        {
            filePrivateVar
        }
        set
        {
            filePrivateVar = newValue
        }
    }
    func accessVariables()
    {
        anotherPrivateVar = 20
        filePrivateVar = 30
    }
    
    /*override func letsDance()
    {
        print("LETS Dance")
    }*/
}

extension MysharedClass
{
    var newVar: Int {
        get
        {
            anotherPrivateVar2
        }
        set
        {
            anotherPrivateVar2 = newValue
        }
    }
}
