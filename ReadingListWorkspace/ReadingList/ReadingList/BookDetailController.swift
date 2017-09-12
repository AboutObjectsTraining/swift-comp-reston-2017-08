//  Created by Jonathan Lehr on 9/1/17.
//  Copyright © 2017 About Objects. All rights reserved.

import UIKit

class BookDetailController: UITableViewController
{
    var book: Book?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleLabel.text = book?.title
        yearLabel.text = book?.year
        firstNameLabel.text = book?.author?.firstName
        lastNameLabel.text = book?.author?.lastName
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navController = segue.destination as? UINavigationController,
        let editBookController = navController.childViewControllers.first as? EditBookController else {
            fatalError("Unable to unwrap EditBookController")
        }
        editBookController.book = book
    }
    
    @IBAction func cancelEditing(segue: UIStoryboardSegue) {
        
    }
}
