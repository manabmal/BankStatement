//
//  StatementViewModel.swift
//  BankStatement
//
//  Created by Manab Kumar Mal on 25/06/21.
//

import Foundation
class StatementViewModel{
    var statements: Statement?
    fileprivate var wholeTransactions: [Pending]?
    fileprivate var wholeTransactionsByDate: [String: [Pending]]?
    
    weak var vc: ViewController?
    func getStatement()
    {
        let url = "https://www.dropbox.com/s/tewg9b71x0wrou9/data.json?dl=1"
        print("URL called: ",url)
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            if error == nil, let data = data
            {
                let statement = try? JSONDecoder().decode(Statement.self, from: data)
                if let statement = statement
                {
                    self.statements = statement
                    self.wholeTransactions = self.gatherData()
                    self.wholeTransactionsByDate = self.gaterDataByDate()
                    DispatchQueue.main.async {
                        self.vc?.tblvwStatement.reloadData()
                    }
                }
            }
            else
            {
                print(error!)
            }
        }.resume()
    }
    
    func retrieveTransactionInfoBy(index: Int) -> Pending?
    {
        if let allTran = wholeTransactions
        {
            return allTran[index]
        }
        return nil
    }
    
    func retrieveTransactionsByDate(section: Int, row: Int) -> Pending?
    {
        if let dictTransactions = wholeTransactionsByDate
        {
            let dates = dictTransactions.keys.sorted()
            let sortedDates = dates.sortByDate()
            let transactionDate = sortedDates[section]
            let transactions = dictTransactions[transactionDate]
            let transaction = transactions?[row]
            return transaction
        }
        return nil
    }
    
    var retrieveAccountSummary: Account?{
        get{
            if let accountSummary = statements?.account
            {
                return accountSummary
            }
            return nil
        }
    }
    
    func gaterDataByDate() -> [String: [Pending]]
    {
        var dictTransactions = [String: [Pending]]()
        if let allTran = wholeTransactions
        {
            for data in allTran
            {
                if let strDate = data.effectiveDate.toDate()?.toString()
                {
                    var transactions = dictTransactions[strDate] ?? [Pending]()
                    transactions.append(data)
                    dictTransactions[strDate] = transactions
                    
                    /*if dictTransactions.keys.contains(data.effectiveDate)
                    {
                        var transactions = dictTransactions[data.effectiveDate]
                        transactions?.append(data)
                        dictTransactions[data.effectiveDate] = transactions
                    }
                    else
                    {
                        var transactions = [Pending]()
                        transactions.append(data)
                        dictTransactions[data.effectiveDate] = transactions
                    }*/
                }
            }
        }
        return dictTransactions
    }
    
    
    func gatherData() -> [Pending]?
    {
        if let transactions = statements?.transactions, let pending = statements?.pending
        {
            var newPending = [Pending]()
            for var pend in pending
            {
                pend.isPending = true
                newPending.append(pend)
            }
            if newPending.count > 0
            {
                return transactions + newPending
            }
            return transactions
        }
        else if let transactions = statements?.transactions
        {
            return transactions
        }
        else if let pending = statements?.pending
        {
            return pending
        }
        return nil
    }
    
    func getWholeTrsactionCount() -> Int
    {
        return self.wholeTransactions?.count ?? 0
    }
    
    func getWholeTransactionByDateKeyCount() -> Int
    {
        return self.wholeTransactionsByDate?.keys.count ?? 0
    }
    
    func getWholeTransactionByDateKeyCount(section: Int) -> Int
    {
        if let dictTransactions = wholeTransactionsByDate
        {
            let dates = dictTransactions.keys.sorted()
            let sortedDates = dates.sortByDate()
            let transactionDate = sortedDates[section]
            let transactions = dictTransactions[transactionDate]
            return transactions?.count ?? 0
        }
        return 0
    }
    
    func getTransactionDateBySection(section: Int) -> String
    {
        if let dictTransactions = wholeTransactionsByDate
        {
            let dates = dictTransactions.keys.sorted()
            let sortedDates = dates.sortByDate()
            let transactionDate = sortedDates[section]
            return transactionDate
        }
        return ""
    }
    
    func doAssumption() -> Int
    {
        if var dictTransactions = wholeTransactionsByDate
        {
            for trasact in dictTransactions
            {
                let transactionDate = trasact.key
                var transactions = trasact.value
                transactions = transactions.filter{$0.amount<0}
                if transactions.count > 0
                {
                    dictTransactions[transactionDate] = transactions
                }
                else
                {
                    dictTransactions.removeValue(forKey: transactionDate)
                }
            }
            
            
            let dates = dictTransactions.keys.sorted()
            let sortedDates = dates.sortByDate()
            var prevDate = ""
            var daysWithMoneySpent = [(Int,Double)]()
            var transactionAmount = 0.0
            for dte in sortedDates
            {
                let dayAmount = dictTransactions[dte]?.reduce(0.0){$0 + $1.amount * -1} ?? 0.0
                transactionAmount =  transactionAmount + dayAmount
                
                if !prevDate.isEmpty, let prev = prevDate.toDate(), let cur = dte.toDate(),let noOfDays = numberOfDaysBetween(cur, and: prev)
                {
                    let dayMoney = (noOfDays,transactionAmount)
                    daysWithMoneySpent.append(dayMoney)
                    transactionAmount = 0.0
                }
                prevDate = dte
            }
            print(daysWithMoneySpent)
            
            let dayAmountWeek = daysWithMoneySpent.reduce((day:0,amount:0.0,week:0)){($0.0 + $1.0, $0.1 + $1.1,$0.2 + Int($1.0/5))}
            print(dayAmountWeek)
            
            let perDaySpent = Int(dayAmountWeek.1) / dayAmountWeek.0
            let perTwoWeek1 = perDaySpent*14
            
            let perWeekSpent = Int(dayAmountWeek.1) / dayAmountWeek.2
            let perTwoWeek2 = perWeekSpent * 2
            
            let average = (perTwoWeek1 + perTwoWeek2) / 2
            
            return average
            
        }
        return 0
    }
    
    func numberOfDaysBetween(_ date: Date, and date2: Date) -> Int? {
        let diffInDays = Calendar.current.dateComponents([.day], from: date, to: date2).day
        return diffInDays
    }
}
