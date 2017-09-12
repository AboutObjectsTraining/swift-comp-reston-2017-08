//
//  ReadingListController.swift
//  ReadingList
//
//  Created by Jonathan Lehr on 9/1/17.
//  Copyright © 2017 About Objects. All rights reserved.
//

import UIKit

class ReadingListController: UITableViewController
{
    let store = ReadingListStore("BooksAndAuthors")
    lazy var readingList: ReadingList = self.store.fetch()
    
    @IBAction func doneEditing(segue: UIStoryboardSegue) {
        tableView.reloadData()
        store.save(readingList: readingList)
    }
}

extension ReadingListController
{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let bookDetailController = segue.destination as? BookDetailController,
              let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("Destination must be a BookDetailController")
        }
        bookDetailController.book = readingList.books[indexPath.row]
    }
}

// MARK: - UITableViewDataSource
extension ReadingListController
{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return readingList.books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "BookSummary")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookSummary") else {
            fatalError("Unable to dequeue cell from storyboard. Check the reuse identifier.")
        }
        
        let book = readingList.books[indexPath.row]
        cell.textLabel?.text = book.title
        cell.detailTextLabel?.text = "\(book.year ?? "N/A")  \(book.author?.fullName ?? "Unknown")"
        
        return cell
    }
}
