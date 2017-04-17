//
//  TodoTableViewController.swift
//  TodoApp
//
//  Created by Vanni Galli on 12.04.17.
//  Copyright © 2017 Vanni Galli. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {

    
    var todos = [Todo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        caricaEsempi()
    }

    private func caricaEsempi() {
        let todo1 = Todo(title: "todo 1")
        todo1?.description = "descrizione 1"
        
        let todo2 = Todo(title: "todo 2")
        todo2?.description = "descrizione 2"
        
        let todo3 = Todo(title: "todo 2")
        todo3?.description = "descrizione 3"
        
        todos += [todo1!, todo2!, todo3!]
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "TodoTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TodoTableViewCell

        let todo = todos[indexPath.row]
        
        cell.titleLabel.text = todo.title
        cell.descriptionLabel.text = todo.description
        cell.photoImageView.image = todo.photo
        
        
        return cell
    }
    
    @IBAction func unwindToTodoList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ToDoController, let todo = sourceViewController.todo {
            
    
            
            // leggo il numero dell'ultima riga della tabella
            let newIndexPath = IndexPath(row: todos.count, section: 0)
            
            // aggiungo il nuovo todo alla lista (sia nell'array che in tabella)
            todos.append(todo)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
