//
//  ViewController.swift
//  DecodableJSON
//
//  Created by Xavier Shelton on 4/3/19.
//  Copyright © 2019 Xavier Shelton. All rights reserved.
//

import UIKit

struct WebsiteDescription:Decodable{
    let name: String
    let description: String
    let courses: [Course]
}
struct Course:Decodable {
    let id: Int
    let name: String
    let link: String
    let imageUrl: String
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let jsonURLString = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        
        guard let url = URL(string: jsonURLString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {return}
       
            do{
//                let courses = try
//                    JSONDecoder().decode([Course].self, from: data)
                
                let websiteDescription = try
                    JSONDecoder().decode(WebsiteDescription.self, from: data)
                print(websiteDescription.name,
                      websiteDescription.description)
            } catch let jsonError{
                print ("Error serializing json:", jsonError)
            }
        }.resume()
    }

    

}

