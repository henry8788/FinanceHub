//
//  NotificationTableViewDataSource.swift
//  FinanceHub
//
//  Created by Henry Lin on 2025/10/29.
//

import UIKit


class NotificationTableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var itemIdentifier:String
    var items:[Notification] = []
    
    init(items:[Notification], itemIdentifier:String) {
        self.items = items
        self.itemIdentifier = itemIdentifier
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: itemIdentifier) as! NotificationTableViewCell
        if let item = itemAt(indexPath: indexPath){
            cell.setItem(item: item)
        }
        return cell
    }
    
    private func itemAt(indexPath:IndexPath) -> Notification?{
        guard indexPath.row >= 0 && indexPath.row < items.count else{
            return nil
        }
        return items[indexPath.row]
    }
    
}

