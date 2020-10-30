//
//  ViewController.swift
//  ContactApp
//
//  Created by Ulvi Bashirov on 10/2/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var data: [Recent]?
    var filtered: [Recent]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = getData()
        setUp()
        addRecentCalls()
    }
    
    func addRecentCalls() {
        filtered = data
        tableView.reloadData()
    }
    
    
    func getData () -> [Recent] {
        return [
            Recent(id: "1", contact: Contact(name: "Ulvi", surname: "Bashir", desc: "mobile"), time: "10:15", isMissed: false),
            Recent(id: "2", contact: Contact(name: "Hamza", surname: "Mammadli", desc: "mobile"), time: "10:15", isMissed: false),
            Recent(id: "3", contact: Contact(name: "John", surname: "Roberto", desc: "mobile"), time: "10:15", isMissed: true),
            Recent(id: "4", contact: Contact(name: "Gustavo", surname: "Fring", desc: "mobile"), time: "10:15", isMissed: false),
            Recent(id: "5", contact: Contact(name: "Walter", surname: "White", desc: "mobile"), time: "10:15", isMissed: true),
            Recent(id: "6", contact: Contact(name: "Saul", surname: "Goodman", desc: "mobile"), time: "10:15", isMissed: false),
            Recent(id: "7", contact: Contact(name: "Jennifer", surname: "Lopez", desc: "mobile"), time: "10:15", isMissed: false),
            Recent(id: "8", contact: Contact(name: "Nikola", surname: "Cena", desc: "mobile"), time: "10:15", isMissed: false),
            Recent(id: "9", contact: Contact(name: "Triple", surname: "Jakson", desc: "mobile"), time: "10:15", isMissed: false),
            Recent(id: "10", contact: Contact(name: "Trump", surname: "Bashir", desc: "mobile"), time: "10:15", isMissed: false),
            Recent(id: "11", contact: Contact(name: "Kennedy", surname: "Gregor", desc: "mobile"), time: "10:15", isMissed: true),
            Recent(id: "12", contact: Contact(name: "Benjamin", surname: "Fring", desc: "mobile"), time: "10:15", isMissed: true),
            Recent(id: "13", contact: Contact(name: "Roger", surname: "White", desc: "mobile"), time: "10:15", isMissed: false),
            Recent(id: "14", contact: Contact(name: "MIT", surname: "Goodman", desc: "mobile"), time: "10:15", isMissed: false),
            Recent(id: "15", contact: Contact(name: "Longterm", surname: "Lopez", desc: "mobile"), time: "10:15", isMissed: false),
            Recent(id: "16", contact: Contact(name: "Zumba", surname: "Milos", desc: "mobile"), time: "10:15", isMissed: false),
        ]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtered?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cellRecents = tableView.dequeueReusableCell(withIdentifier: "recentsCell", for: indexPath) as! RecentsTableViewCell
            return cellRecents
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell
        
        
        cell.descLabel.text = filtered?[indexPath.row].contact.desc ?? "empty desc"
        cell.nameLabel.text = "\(filtered?[indexPath.row].contact.name ?? "empty name") \(filtered?[indexPath.row].contact.surname ?? "empty name")"
        cell.timeLabel.text = filtered?[indexPath.row].time ?? "empty time"
        cell.nameLabel.textColor = filtered?[indexPath.row].isMissed ?? false ? UIColor.red : UIColor.black
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(60)
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            
            var indexPaths: [IndexPath] = []
            for (index, item) in data!.enumerated() {
                if index == 0 { continue }
                if !item.isMissed {
                    filtered = filtered?.filter {
                        $0.id != item.id
                    }
                    indexPaths.append(IndexPath(row: getIndexFromId(id: item.id), section: 0))
                    
                }
                
            }
            tableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            var indexPaths: [IndexPath] = []
            for (index, item) in data!.enumerated() {
                if index == 0 { continue }
                if !item.isMissed {
                    filtered?.insert(item, at: index)
                    indexPaths.append(IndexPath(row: index, section: 0))
                }
            }
            tableView.insertRows(at: indexPaths, with: .fade)
        }
    }
    
    private var lastContentOffset: CGFloat = 0
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (self.lastContentOffset > scrollView.contentOffset.y) {
          // down
         
        }
        else if (self.lastContentOffset < scrollView.contentOffset.y) {
            // up
        }
        
        // update the new position acquired
        self.lastContentOffset = scrollView.contentOffset.y
    }
    
    func getIndexFromId(id: String) -> Int {
        for (index, item) in data!.enumerated() {
            if item.id == id {
                return index
            }
        }
        return 0
    }
    
    func setUp(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

