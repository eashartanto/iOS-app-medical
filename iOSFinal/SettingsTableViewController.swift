//
//  SettingsTableViewController.swift
//  iOSFinal
//
//  Created by Andreas Hartanto on 2022-12-15.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet weak var darkModeSwitch: UISwitch!
    @IBOutlet weak var updateToPro: UIView!
    var indexPathForSelectedRow = 0
    
    @IBAction func switchDidChange(_ sender: UISwitch){
        if sender.isOn {
            view.backgroundColor = UIColor(red: (230/255.0), green: (230/255.0), blue: (230/255.0), alpha: 1)
        } else{
            view.backgroundColor = UIColor(red: (251/255.0), green: (251/255.0), blue: (254/255.0), alpha: 1)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       indexPathForSelectedRow = self.tableView.indexPathForSelectedRow!.row
       print(self.tableView.indexPathForSelectedRow!.row)
       if self.tableView.indexPathForSelectedRow!.row == 0 {
           if let url = URL(string: "https://www.proage.ca/upgrade/" ){
           UIApplication.shared.open(url, options: [:], completionHandler: nil)}
       }
       if self.tableView.indexPathForSelectedRow!.row == 1 {
           if let url = URL(string: "https://apps.apple.com/us/app/rating-rate-everything/id1437744017" ){
           UIApplication.shared.open(url, options: [:], completionHandler: nil)}
       }else{
           if let url = URL(string: "https://wordpress.org/support/article/settings-general-screen/" ){
           UIApplication.shared.open(url, options: [:], completionHandler: nil)}
       }
       
    }
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
