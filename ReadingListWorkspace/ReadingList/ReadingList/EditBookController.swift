//
//  EditBookController.swift
//  ReadingList
//
//  Created by Jonathan Lehr on 9/1/17.
//  Copyright © 2017 About Objects. All rights reserved.
//

import UIKit

class EditBookController: UITableViewController
{
    var book: Book?
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        titleField.text = book?.title
        yearField.text = book?.year
    }
    
    func populateBook() {
        book?.title = titleField.text
        book?.year = yearField.text
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "Done" else { return }
        populateBook()
    }
}
