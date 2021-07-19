//
//  ViewController.swift
//  BankStatement
//
//  Created by Manab Kumar Mal on 25/06/21.
//

import UIKit
class ViewController: UIViewController {
    
    var tblvwStatement: UITableView!
    var listStatement = StatementViewModel()
    var isGrouped = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title  = "Account Details"
        // get width and height of View
        tblvwStatement = UITableView.init(frame: CGRect.zero, style: .plain)
        tblvwStatement.register(StatementTableViewCell.self, forCellReuseIdentifier: "StatementTableViewCell")
        tblvwStatement.register(AccountSummaryTableViewCell.self, forCellReuseIdentifier: "AccountSummaryTableViewCell")
        tblvwStatement.register(TransactionsTableViewCell.self, forCellReuseIdentifier: "TransactionsTableViewCell")
        tblvwStatement.rowHeight = UITableView.automaticDimension
        tblvwStatement.estimatedRowHeight = 100
        tblvwStatement.delegate = self
        tblvwStatement.dataSource = self
        tblvwStatement.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tblvwStatement)
        
        let margins = self.view.safeAreaLayoutGuide
        tblvwStatement.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0).isActive = true
        tblvwStatement.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0).isActive = true
        tblvwStatement.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        tblvwStatement.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0).isActive = true
        
        let btn1 = UIBarButtonItem(image: nil, style: .plain, target: self, action: #selector(toggleGroupChange))
        btn1.title = "Toggle Group"
        self.navigationItem.rightBarButtonItem  = btn1
        
        let btn2 = UIBarButtonItem(image: nil, style: .plain, target: self, action: #selector(assumption))
        btn2.title = "Spend"
        self.navigationItem.leftBarButtonItem  = btn2
        
        listStatement.vc = self
        listStatement.getStatement()
    }
    
    @objc func toggleGroupChange()
    {
        isGrouped = !isGrouped
        self.tblvwStatement.reloadData()
    }
    
    @objc func assumption()
    {
        let amount = listStatement.doAssumption()
        let alert = UIAlertController(title: "Assumpted spending in coming two weeks is: $\(amount)", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        shared.printMe(withString: "My Val")
    }
}



extension ViewController: UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return isGrouped ? listStatement.getWholeTransactionByDateKeyCount() + 1 : 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            return nil
        default:
            if isGrouped
            {
                let headerVC = DateHeaderView()
                headerVC.backgroundColor = .deepYellow
                headerVC.transactionDate = listStatement.getTransactionDateBySection(section: section-1)
                return headerVC
            }
            return nil
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return isGrouped ? listStatement.getWholeTransactionByDateKeyCount(section: section-1) : listStatement.getWholeTrsactionCount()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AccountSummaryTableViewCell", for: indexPath) as? AccountSummaryTableViewCell
            cell?.accountSummary = listStatement.retrieveAccountSummary
            return cell!

        default:
            if isGrouped
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionsTableViewCell", for: indexPath) as? TransactionsTableViewCell
                let transaction = listStatement.retrieveTransactionsByDate(section: indexPath.section-1, row: indexPath.row)
                cell?.transaction = transaction
                return cell!
            }
            else
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "StatementTableViewCell", for: indexPath) as? StatementTableViewCell
                let transaction = listStatement.retrieveTransactionInfoBy(index: indexPath.row)
                cell?.transaction = transaction
                return cell!
            }
            
        }
    }
}

extension ViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0
        {
            return 0.0
        }
        return isGrouped ? 30.0 : 0.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0
        {
            return 240.0
        }
        return isGrouped ? 70.0 : 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section > 0
        {
            var transaction = listStatement.retrieveTransactionInfoBy(index: indexPath.row)
            if isGrouped
            {
                transaction = listStatement.retrieveTransactionsByDate(section: indexPath.section-1, row: indexPath.row)
            }
            if let atmID = transaction?.atmID, let atms = listStatement.statements?.atms, let atmDetails = atms.filter({$0.id == atmID}).first
            {
                let atmVC = ATMLocationViewController()
                atmVC.atmDetails = atmDetails
                self.navigationController?.pushViewController(atmVC, animated: true)
            }
        }
    }
}
