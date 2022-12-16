//
//  FinanceMovementsViewController.swift
//  iOSFinal
//
//  Created by Muhammed Kocabas on 2022-12-15.
//

import UIKit
import Foundation

class FinanceMovementsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return data!.count
     }
    
    let cellSpacingHeight: CGFloat = 1
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight;
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 50 //or whatever you need
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movementsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FinancialMovementTableCell
        
        let index = indexPath.section
        let paymenttype=data![index].category == true ? "Incoming payment" : "Outgoing payment"
        
        cell.cellimage.image = (data![index].category == true ? UIImage(named: "outgoingpayment") : UIImage(named: "incomingpayment"))
        
        cell.movementtext.text = data![index].accountName
        
        cell.detailslabel.text = "\(paymenttype) | \(formatFromDate(dateInput: data![index].dates!))"
        
        let amount = data![index].amount >= 0 ? "+"+String(describing: data![index].amount)+"€" : String(describing: data![index].amount)+"€"
        cell.amountlabel.text = amount
        
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 0.4
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        
        return cell
    }
    
    var data:[Movements]?

    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var movementsTableView: UITableView!
    
    struct Movements {
        let accountName:String
        let category:Bool
        let dates:Date?
        let amount:Float
    }
    func formatDate (dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        let result = dateFormatter.date(from:dateString)!
        return result
    }
    
    func formatFromDate (dateInput: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        var result = dateFormatter.string(from:dateInput)
        return result
    }

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movementsTableView.delegate = self
        movementsTableView.dataSource = self
        
        let cardimage = UIImage(named: "finance_card")
        cardView.backgroundColor = UIColor(patternImage: cardimage!)
    
        let dateFormatter = DateFormatter()
        
        data = [
            Movements(accountName:"John Doe", category:true, dates: formatDate(dateString: "10/01/2021"), amount: 10),
            Movements(accountName:"Amazon", category:false, dates: formatDate(dateString: "10/01/2021"), amount: -25),
            Movements(accountName:"Ikea", category:false, dates: formatDate(dateString: "10/01/2021"), amount: -150),
            Movements(accountName:"Mc Donalds NYC", category:false, dates: formatDate(dateString: "10/01/2021"), amount: -15),
        ]
        
    }

    var datalar: String?
    @IBAction func unwindFromNewAmountVC(_ sender: UIStoryboardSegue){
        if sender.source is NewAmountVC {
            let senderVC = sender.source as? NewAmountVC
            
            data?.append(Movements(accountName: senderVC!.accName!, category: senderVC!.cat!, dates: formatDate(dateString: (senderVC?.dat)!), amount: senderVC!.amt!))
            
            movementsTableView.reloadData()
         }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
