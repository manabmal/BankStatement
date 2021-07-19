//
//  AccountSummaryTableViewCell.swift
//  BankStatement
//
//  Created by Manab Kumar Mal on 25/06/21.
//

import UIKit

class AccountSummaryTableViewCell: UITableViewCell {

    let vwFullWhite = UIView()
    let vwHalfWhite = UIView()
    let vwHalfGrey = UIView()
    let imgvwWallet = UIImageView()
    let lblAcName = UILabel()
    let lblAcNumber = UILabel()
    let lblAvailableFundsText = UILabel()
    let lblAvailableBalanceText = UILabel()
    let lblAvailableFundsValue = UILabel()
    let lblAvailableBalanceValue = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .airforceLight
        vwFullWhite.backgroundColor = .white
        vwHalfWhite.backgroundColor = .white
        vwHalfGrey.backgroundColor = .lightGreyBack
        vwFullWhite.translatesAutoresizingMaskIntoConstraints = false
        vwHalfWhite.translatesAutoresizingMaskIntoConstraints = false
        vwHalfGrey.translatesAutoresizingMaskIntoConstraints = false
        imgvwWallet.translatesAutoresizingMaskIntoConstraints = false
        lblAcName.translatesAutoresizingMaskIntoConstraints = false
        lblAcNumber.translatesAutoresizingMaskIntoConstraints = false
        lblAvailableFundsText.translatesAutoresizingMaskIntoConstraints = false
        lblAvailableBalanceText.translatesAutoresizingMaskIntoConstraints = false
        lblAvailableFundsValue.translatesAutoresizingMaskIntoConstraints = false
        lblAvailableBalanceValue.translatesAutoresizingMaskIntoConstraints = false
        vwHalfWhite.addSubview(imgvwWallet)
        vwHalfWhite.addSubview(lblAcName)
        vwHalfWhite.addSubview(lblAcNumber)
        vwHalfGrey.addSubview(lblAvailableFundsText)
        vwHalfGrey.addSubview(lblAvailableBalanceText)
        vwHalfGrey.addSubview(lblAvailableFundsValue)
        vwHalfGrey.addSubview(lblAvailableBalanceValue)
        vwFullWhite.addSubview(vwHalfWhite)
        vwFullWhite.addSubview(vwHalfGrey)
        contentView.addSubview(vwFullWhite)
        
        let margins = self.contentView.safeAreaLayoutGuide
        vwFullWhite.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 20).isActive = true
        vwFullWhite.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -20).isActive = true
        vwFullWhite.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20).isActive = true
        vwFullWhite.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -20).isActive = true
        
        vwHalfWhite.leadingAnchor.constraint(equalTo: vwFullWhite.leadingAnchor, constant: 0).isActive = true
        vwHalfWhite.trailingAnchor.constraint(equalTo: vwFullWhite.trailingAnchor, constant: 0).isActive = true
        vwHalfWhite.topAnchor.constraint(equalTo: vwFullWhite.topAnchor, constant: 0).isActive = true
        vwHalfWhite.heightAnchor.constraint(equalTo: vwFullWhite.heightAnchor, multiplier: 0.5, constant: 0).isActive = true
        
        vwHalfGrey.leadingAnchor.constraint(equalTo: vwFullWhite.leadingAnchor, constant: 0).isActive = true
        vwHalfGrey.trailingAnchor.constraint(equalTo: vwFullWhite.trailingAnchor, constant: 0).isActive = true
        vwHalfGrey.bottomAnchor.constraint(equalTo: vwFullWhite.bottomAnchor, constant: 0).isActive = true
        vwHalfGrey.heightAnchor.constraint(equalTo: vwFullWhite.heightAnchor, multiplier: 0.5, constant: 0).isActive = true
        
        imgvwWallet.leadingAnchor.constraint(equalTo: vwHalfWhite.leadingAnchor, constant: 10).isActive = true
        imgvwWallet.centerYAnchor.constraint(equalTo: vwHalfWhite.centerYAnchor).isActive = true
        imgvwWallet.heightAnchor.constraint(equalTo: vwHalfWhite.heightAnchor, multiplier: 0.55, constant: 0).isActive = true
        imgvwWallet.widthAnchor.constraint(equalTo: vwHalfWhite.heightAnchor, multiplier: 0.55, constant: 0).isActive = true
        imgvwWallet.image = UIImage.init(named: "accountsimagetransactional")
        imgvwWallet.contentMode = .scaleAspectFit
        
        lblAcName.leadingAnchor.constraint(equalTo: imgvwWallet.trailingAnchor, constant: 10).isActive = true
        lblAcName.trailingAnchor.constraint(equalTo: vwHalfWhite.trailingAnchor, constant: 0).isActive = true
        lblAcName.topAnchor.constraint(equalTo: vwHalfWhite.topAnchor, constant: 10).isActive = true
        lblAcName.heightAnchor.constraint(equalTo: vwHalfWhite.heightAnchor, multiplier: 0.5, constant: 0).isActive = true
        lblAcName.font = UIFont.init(name: "HelveticaNeue-Light", size: 25.0)
        lblAcName.textColor = .lightBlackText
        lblAcName.text = ""
        
        
        lblAcNumber.leadingAnchor.constraint(equalTo: imgvwWallet.trailingAnchor, constant: 10).isActive = true
        lblAcNumber.trailingAnchor.constraint(equalTo: vwHalfWhite.trailingAnchor, constant: 0).isActive = true
        lblAcNumber.bottomAnchor.constraint(equalTo: vwHalfWhite.bottomAnchor, constant: -10).isActive = true
        lblAcNumber.heightAnchor.constraint(equalTo: vwHalfWhite.heightAnchor, multiplier: 0.5, constant: 0).isActive = true
        lblAcNumber.textColor = .lightGreyText
        lblAcNumber.font = UIFont.systemFont(ofSize: 20.0)
        lblAcNumber.text = ""
        
        lblAvailableFundsText.leadingAnchor.constraint(equalTo: imgvwWallet.trailingAnchor, constant: 10).isActive = true
        lblAvailableFundsText.topAnchor.constraint(equalTo: vwHalfGrey.topAnchor, constant: 5).isActive = true
        lblAvailableFundsText.widthAnchor.constraint(equalTo: lblAcName.widthAnchor, multiplier: 0.5, constant: 0).isActive = true
        lblAvailableFundsText.heightAnchor.constraint(equalTo: vwHalfGrey.heightAnchor, multiplier: 0.5, constant: 0).isActive = true
        lblAvailableFundsText.textColor = .lightGreyText
        lblAvailableFundsText.font = UIFont.systemFont(ofSize: 19.0)
        lblAvailableFundsText.text = "Available funds"
        
        lblAvailableBalanceText.leadingAnchor.constraint(equalTo: imgvwWallet.trailingAnchor, constant: 10).isActive = true
        lblAvailableBalanceText.bottomAnchor.constraint(equalTo: vwHalfGrey.bottomAnchor, constant: -5).isActive = true
        lblAvailableBalanceText.widthAnchor.constraint(equalTo: lblAcName.widthAnchor, multiplier: 0.5, constant: 0).isActive = true
        lblAvailableBalanceText.heightAnchor.constraint(equalTo: vwHalfGrey.heightAnchor, multiplier: 0.5, constant: 0).isActive = true
        lblAvailableBalanceText.textColor = .lightGreyText
        lblAvailableBalanceText.font = UIFont.systemFont(ofSize: 19.0)
        lblAvailableBalanceText.text = "Account balance"
        
        lblAvailableFundsValue.trailingAnchor.constraint(equalTo: vwHalfGrey.trailingAnchor, constant: -20).isActive = true
        lblAvailableFundsValue.topAnchor.constraint(equalTo: vwHalfGrey.topAnchor, constant: 5).isActive = true
        lblAvailableFundsValue.widthAnchor.constraint(equalTo: lblAcName.widthAnchor, multiplier: 0.5, constant: 0).isActive = true
        lblAvailableFundsValue.heightAnchor.constraint(equalTo: vwHalfGrey.heightAnchor, multiplier: 0.5, constant: 0).isActive = true
        lblAvailableFundsValue.textColor = .lightBlackText
        lblAvailableFundsValue.font = UIFont.boldSystemFont(ofSize: 19.0)
        lblAvailableFundsValue.textAlignment = .right
        lblAvailableFundsValue.text = "$0.00"
        
        lblAvailableBalanceValue.trailingAnchor.constraint(equalTo: vwHalfGrey.trailingAnchor, constant: -20).isActive = true
        lblAvailableBalanceValue.bottomAnchor.constraint(equalTo: vwHalfGrey.bottomAnchor, constant: -5).isActive = true
        lblAvailableBalanceValue.widthAnchor.constraint(equalTo: lblAcName.widthAnchor, multiplier: 0.5, constant: 0).isActive = true
        lblAvailableBalanceValue.heightAnchor.constraint(equalTo: vwHalfGrey.heightAnchor, multiplier: 0.5, constant: 0).isActive = true
        lblAvailableBalanceValue.textColor = .lightGreyText
        lblAvailableBalanceValue.font = UIFont.boldSystemFont(ofSize: 19.0)
        lblAvailableBalanceValue.textAlignment = .right
        lblAvailableBalanceValue.text = "$0.00"
        
    }
    var accountSummary: Account?{
        didSet{
            loadAccountSummary()
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadAccountSummary()
    {
        if let acSummary =  accountSummary
        {
            lblAcName.text = acSummary.accountName
            lblAcNumber.text = acSummary.accountNumber
            lblAvailableFundsValue.text = acSummary.available.toDollar()
            lblAvailableBalanceValue.text = acSummary.balance.toDollar()
        }
    }

}
