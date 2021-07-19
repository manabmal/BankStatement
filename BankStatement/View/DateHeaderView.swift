//
//  DateHeaderView.swift
//  BankStatement
//
//  Created by Manab Kumar Mal on 26/06/21.
//

import UIKit

class DateHeaderView: UIView {

    let lblDate = UILabel()
    let lblDaysAgo = UILabel()
    override func draw(_ rect: CGRect) {
        // Drawing code
        //self.backgroundColor = .deepYellow
        lblDate.translatesAutoresizingMaskIntoConstraints = false
        lblDaysAgo.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(lblDate)
        self.addSubview(lblDaysAgo)
        
        lblDate.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        lblDate.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5, constant: 0).isActive = true
        lblDate.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        lblDate.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        lblDate.font = .boldSystemFont(ofSize: 18.0)
        lblDate.textColor = .black
        //lblDate.text = "23 Sep 2021"
        
        lblDaysAgo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        lblDaysAgo.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5, constant: 0).isActive = true
        lblDaysAgo.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        lblDaysAgo.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        lblDaysAgo.textAlignment = .right
        lblDaysAgo.font = .boldSystemFont(ofSize: 18.0)
        lblDaysAgo.textColor = .black
        //lblDaysAgo.text = "100 days ago"
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    var transactionDate: String?{
        didSet{
            transactionShow()
        }
    }
    func transactionShow()
    {
        guard let date = transactionDate else {return}
        lblDate.text = date.formatDate()
        lblDaysAgo.text = date.daysAgo()
    }
}
