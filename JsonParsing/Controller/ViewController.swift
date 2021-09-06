//
//  ViewController.swift
//  JsonParsing
//
//  Created by Allahverdi Yunusov on 03.09.21.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    

    var result: Result?
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseJson()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    //MARK: - TableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return result?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      
        return result?.data[section].title
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
         let myLabel = UILabel()
         myLabel.frame = CGRect(x: 3, y: 0, width: 100, height: 20)
         myLabel.font = UIFont.boldSystemFont(ofSize: 18)
         myLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
         let headerView = UIView()
         headerView.addSubview(myLabel)
         return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if result != nil {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
        cell.textLabel?.text = result?.data[indexPath.section].content
        cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 12.0)
        cell.textLabel?.textColor = .black
        cell.textLabel?.alpha = 0.6
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50.0)
    }
    
    //MARK: - TableViewDelegate
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        print(indexPath.section)
        
        let category = result?.data[indexPath.section]
        
        print(category as Any)
        
        let vc = ListViewController(items: [category])
        
        
        vc.title = category?.title
        
        navigationController?.pushViewController(vc, animated: true)
        
        if tableView.cellForRow(at: indexPath)?.accessoryType ==  UITableViewCell.AccessoryType.checkmark {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
         else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
        
        
        
    }
    
    //MARK: - JSON Parsing
    
    private func parseJson() {
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else {
            return
        }

        let url = URL(fileURLWithPath: path)



        do {
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode(Result.self, from: jsonData)
    }
        catch {
            print("Error is \(error)")
        }
        
        //MARK: - With the url request
        //This did not work due to connection error 
          
//        let urlString = "http://assignment-ios-br.free.beeceptor.com/"
//
//        let url = URL(string: urlString)
//
//        guard url != nil else {
//            return
//        }
//
//        let session = URLSession.shared
//
//        let dataTask = session.dataTask(with: url!) { data, response, error in
//
//            if error == nil && data != nil {
//
//                do {
//                    let jsonData = try Data(contentsOf: url!)
//                    self.result = try JSONDecoder().decode(Result.self, from: jsonData)
//                }
//
//                catch {
//                    print("Erro is \(error)")
//                }
//            }
//
//
//        }
//
//        dataTask.resume()
//
// }

 }
}
