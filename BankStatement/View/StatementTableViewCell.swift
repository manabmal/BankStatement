//
//  StatementTableViewCell.swift
//  BankStatement
//
//  Created by Manab Kumar Mal on 25/06/21.
//

import UIKit

class StatementTableViewCell: UITableViewCell {
    let imgAtmLocation = UIImageView()
    let lblDate = UILabel()
    let lblDaysAgo = UILabel()
    let lblDescription = UILabel()
    let lblAmount = UILabel()
    
    let vwYellow = UIView()
    let vwWhite = UIView()
    
    var constlblDescriptionLeading1: NSLayoutConstraint!
    var constlblDescriptionLeading2: NSLayoutConstraint!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        vwYellow.backgroundColor = .deepYellow
        vwWhite.backgroundColor = .white
        vwYellow.translatesAutoresizingMaskIntoConstraints = false
        vwWhite.translatesAutoresizingMaskIntoConstraints = false
        lblDate.translatesAutoresizingMaskIntoConstraints = false
        lblDaysAgo.translatesAutoresizingMaskIntoConstraints = false
        imgAtmLocation.translatesAutoresizingMaskIntoConstraints = false
        lblDescription.translatesAutoresizingMaskIntoConstraints = false
        lblAmount.translatesAutoresizingMaskIntoConstraints = false
        vwYellow.addSubview(lblDate)
        vwYellow.addSubview(lblDaysAgo)
        vwWhite.addSubview(imgAtmLocation)
        vwWhite.addSubview(lblDescription)
        vwWhite.addSubview(lblAmount)
        contentView.addSubview(vwYellow)
        contentView.addSubview(vwWhite)
        
        let margins = self.contentView.safeAreaLayoutGuide
        vwYellow.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0).isActive = true
        vwYellow.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0).isActive = true
        vwYellow.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        vwYellow.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        vwWhite.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0).isActive = true
        vwWhite.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0).isActive = true
        vwWhite.topAnchor.constraint(equalTo: vwYellow.bottomAnchor, constant: 0).isActive = true
        vwWhite.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0).isActive = true
        
        lblDate.leadingAnchor.constraint(equalTo: vwYellow.leadingAnchor, constant: 10).isActive = true
        lblDate.widthAnchor.constraint(equalTo: vwYellow.widthAnchor, multiplier: 0.5, constant: 0).isActive = true
        lblDate.topAnchor.constraint(equalTo: vwYellow.topAnchor, constant: 0).isActive = true
        lblDate.bottomAnchor.constraint(equalTo: vwYellow.bottomAnchor, constant: 0).isActive = true
        lblDate.font = .boldSystemFont(ofSize: 18.0)
        lblDate.textColor = .black
        //lblDate.text = "23 Sep 2021"
        
        lblDaysAgo.trailingAnchor.constraint(equalTo: vwYellow.trailingAnchor, constant: -10).isActive = true
        lblDaysAgo.widthAnchor.constraint(equalTo: vwYellow.widthAnchor, multiplier: 0.5, constant: 0).isActive = true
        lblDaysAgo.topAnchor.constraint(equalTo: vwYellow.topAnchor, constant: 0).isActive = true
        lblDaysAgo.bottomAnchor.constraint(equalTo: vwYellow.bottomAnchor, constant: 0).isActive = true
        lblDaysAgo.textAlignment = .right
        lblDaysAgo.font = .boldSystemFont(ofSize: 18.0)
        lblDaysAgo.textColor = .black
        //lblDaysAgo.text = "100 days ago"
        
        
        imgAtmLocation.leadingAnchor.constraint(equalTo: vwWhite.leadingAnchor, constant: 0).isActive = true
        imgAtmLocation.centerYAnchor.constraint(equalTo: vwWhite.centerYAnchor).isActive = true
        imgAtmLocation.heightAnchor.constraint(equalTo: vwWhite.heightAnchor, multiplier: 0.75, constant: 0).isActive = true
        imgAtmLocation.widthAnchor.constraint(equalTo: vwWhite.heightAnchor, multiplier: 0.75, constant: 0).isActive = true
        
        imgAtmLocation.image = UIImage.init(named: "FindUsIcon")
        imgAtmLocation.contentMode = .scaleAspectFit
        
        //imgAtmLocation.backgroundColor = .blue
        
        lblAmount.trailingAnchor.constraint(equalTo: vwWhite.trailingAnchor, constant: -10).isActive = true
        lblAmount.topAnchor.constraint(equalTo: vwWhite.topAnchor, constant: 0).isActive = true
        lblAmount.bottomAnchor.constraint(equalTo: vwWhite.bottomAnchor, constant: 0).isActive = true
        lblAmount.widthAnchor.constraint(equalToConstant: 100).isActive = true
        lblAmount.textAlignment = .right
        lblAmount.font = .boldSystemFont(ofSize: 17.0)
        lblAmount.textColor = .black
        //lblAmount.backgroundColor = .green
        //lblAmount.text = "$100.00"
        
        constlblDescriptionLeading1 = lblDescription.leadingAnchor.constraint(equalTo: lblDate.leadingAnchor, constant: 0)
        constlblDescriptionLeading2 = lblDescription.leadingAnchor.constraint(equalTo: imgAtmLocation.trailingAnchor, constant: 0)
        constlblDescriptionLeading1.isActive = true
        constlblDescriptionLeading2.isActive = false
        lblDescription.topAnchor.constraint(equalTo: vwWhite.topAnchor, constant: 0).isActive = true
        lblDescription.bottomAnchor.constraint(equalTo: vwWhite.bottomAnchor, constant: 0).isActive = true
        lblDescription.trailingAnchor.constraint(equalTo: lblAmount.leadingAnchor, constant: 0).isActive = true
        lblDescription.font = .systemFont(ofSize: 18.0)
        lblDescription.lineBreakMode = .byWordWrapping
        lblDescription.numberOfLines = -1
        lblDescription.textColor = .black
        //lblDescription.backgroundColor = .red
        //lblDescription.text = "Its a long description, I dont know what to write, but it should work properly as I guess, I dont know it will be multiline or not, but it should work smooth as we think".uppercased()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var transaction: Pending?{
        didSet{
            transactionShow()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func transactionShow()
    {
        
        guard let dataTransaction = transaction else {return}
        
        let descText = dataTransaction.pendingDescription.stripOutHtml()?.uppercased() ?? ""
        let normalAttribute = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18.0)]
        var allStr = NSMutableAttributedString(string: descText, attributes: normalAttribute)
        if dataTransaction.isPending
        {
            let boldAttribute = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18.0)]
            let pendStr = NSMutableAttributedString(string: "PENDING: ", attributes: boldAttribute )
            pendStr.append(allStr)
            allStr = pendStr
        }

        lblAmount.text = dataTransaction.amount.toDollar()
        lblDate.text = dataTransaction.effectiveDate.formatDate()
        lblDescription.attributedText = allStr
        lblDaysAgo.text = dataTransaction.effectiveDate.daysAgo()
        
        if let _ = dataTransaction.atmID
        {
            imgAtmLocation.isHidden = false
            constlblDescriptionLeading1.isActive = false
            constlblDescriptionLeading2.isActive = true
        }
        else
        {
            imgAtmLocation.isHidden = true
            constlblDescriptionLeading1.isActive = true
            constlblDescriptionLeading2.isActive = false
            
        }
    }
    
}
