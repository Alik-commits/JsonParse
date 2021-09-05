//
//  ViewController.swift
//  JsonParsing
//
//  Created by Allahverdi Yunusov on 03.09.21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        parseJson()
    }
    
    
    
    private func parseJson() {
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else {
            return
        }
        
        let url = URL(fileURLWithPath: path)
       
        var result: Result?
        
        do {
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode(Result.self, from: jsonData)
            
            if let result = result {
                print(result)
            } else {
                print("Failed to parse")
            }
    }
        catch {
            print("Error is \(error)")
        }


 }

}


struct Result: Codable {
    let data: [ResultItem]
}

struct ResultItem: Codable {
    let id: Int
    let title: String
    let content: String
}

