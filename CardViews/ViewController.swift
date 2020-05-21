//
//  ViewController.swift
//  CardViews
//
//  Created by Narendra Anam on 21/05/20.
//  Copyright © 2020 NarendraAnam. All rights reserved.
//

import UIKit
import SDWebImage

struct CardData : Decodable{
    var name : String
    var age : String
    var location : String
    var url : String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

   @IBOutlet weak var tableView: UITableView!
        var dataArray = [CardData]()
    //    let dataArray = ["saghgg", "gsakjg", "hgkdg"]
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.delegate = self
            tableView.dataSource = self
            tableView.backgroundColor = .systemOrange

            
            parseData()
            
            for mainArray in self.dataArray {
                print(mainArray.name)
            }
        }
        
        
        func parseData() {
            
            let urlString = "http://demo8716682.mockable.io/cardData"
            let url = URL(string: urlString)
            let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
                guard let urlData = data else { return }
                //print(String(data: urlData, encoding: .utf8))
                do {
                self.dataArray = try JSONDecoder().decode([CardData].self, from: urlData)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }

                } catch {
                    print("Error in decoding the card Data : \(error)")
                }
            }
            task.resume()
            
        }


        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return dataArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsCell", for: indexPath) as! DetailsCell
            cell.backgroundColor = .systemOrange
            cell.layer.cornerRadius = 20
            cell.clipsToBounds = true
            cell.nameTxt_Label.text = dataArray[indexPath.row].name
            cell.ageText_Label.text = "Age : \(dataArray[indexPath.row].age)"
            cell.locationText_Label.text = dataArray[indexPath.row].location
            cell.imagesView.sd_setImage(with: URL(string: dataArray[indexPath.row].url), placeholderImage: UIImage(named: "placeholder.png"))
            return cell
        }

}

