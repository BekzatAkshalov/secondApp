//
//  ViewController.swift
//  tableViewMyProject
//
//  Created by Bekzat on 22/9/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var yearLabel: UILabel!
    var sight = Sight()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nameLabel.text = sight.name
        yearLabel.text = sight.year
        ImageView.image = UIImage(named: sight.image)
    }


}

