//
//  TableViewController.swift
//  tableViewMyProject
//
//  Created by Bekzat on 22/9/24.
//

import UIKit

class TableViewController: UITableViewController {
    // var array = ["1", "2", "3", "4", "5"]
    
//    var arrayNames = ["Ho Chi Minh Mausoleum", "The Old Quarter", "Hanoi Opera House", "Hoan Kiem Lake", "Temple of Literature", "Saint Joseph's Cathedral"]
//    
//    var arrayAddress = ["So 1, Hung Vuong, Dien Bien, Ba Dinh", "North of Hoan Kiem Lake", "So 01, Trang Tien, Hoan Kiem", "Hang Trong, Hoàn Kiếm, Hanoi", "58 Quoc Tu Giam, Dong Da", "40 Nha Chung, Hoan Kiem"]
//    
//    var arrayImage = ["mausoleum", "quarter", "operahouse", "lake", "temple", "cathedral"]
    
    var arraySights = [Sight(name: "Ho Chi Minh Mausoleum", year: "1975", image: "mausoleum"),
                      Sight(name: "Hanoi Opera House", year: "1991", image: "operahouse"),
                      Sight(name: "Temple of Literature", year: "1070", image: "temple"),
                      Sight(name: "Saint Joseph's Cathedral", year: "1887", image: "cathedral"),
                       Sight(name: "One Pillar Pagoda", year: "1049", image: "pagoda")
    ]
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @IBAction func addSight(_ sender: Any) {
        arraySights.append(Sight(name: "Name of building", year: "Year of construction", image: "hanoi"))
        
        tableView.reloadData()
    }
    
    // MARK: - Table view data source - отображаем количество элементов и их заполнение

    override func numberOfSections(in tableView: UITableView) -> Int {  //количество секций в tableView
        // #warning Incomplete implementation, return the number of sections
        return 1   //1 section
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //количество элементов которое должно отобразиться
        // #warning Incomplete implementation, return the number of rows
        return arraySights.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) //берем из TableViewCell -  Identifier

            // Configure the cell...

            let label = cell.viewWithTag(1002) as! UILabel
            label.text = arraySights[indexPath.row].name
            
            let labelYear = cell.viewWithTag(1001) as! UILabel
            labelYear.text = arraySights[indexPath.row].year
            
            let imageView = cell.viewWithTag(1003) as! UIImageView
            imageView.image = UIImage(named: arraySights[indexPath.row].image)
            
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) //берем из TableViewCell -  Identifier

        // Configure the cell...

        let label = cell.viewWithTag(1002) as! UILabel
        label.text = arraySights[indexPath.row].name
        
        let labelYear = cell.viewWithTag(1001) as! UILabel
        labelYear.text = arraySights[indexPath.row].year
        
        let imageView = cell.viewWithTag(1003) as! UIImageView
        imageView.image = UIImage(named: arraySights[indexPath.row].image)
        
        //indextPath имеет в себе две переменное row и section
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        vc.sight = arraySights[indexPath.row]
        
        navigationController?.show(vc, sender: self)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

 
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            arraySights.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
     

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
