//
//  ListViewController.swift
//  JsonParsing
//
//  Created by Allahverdi Yunusov on 04.09.21.
//

import UIKit


class ListViewController: UIViewController , UITableViewDataSource , UITableViewDelegate  {
    
    
    
    private let tableview: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    
    private let items: [ResultItem?]
    
    
    //MARK: - Initialization
    
    init(items: [ResultItem?]) {
        self.items = items 
        super.init(nibName: nil, bundle: nil) 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        view.addSubview(tableview)
       
        tableview.frame = view.bounds 
       
        tableview.delegate = self
        
        tableview.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    } 
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return items[0]?.title
//        
//    } 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
        cell.textLabel?.text = items[0]?.content
        cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 14.0)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.textColor = .black
        cell.textLabel?.alpha = 0.5
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { 
        tableview.deselectRow(at: indexPath, animated: true)

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(200.0)
    }
     

}
