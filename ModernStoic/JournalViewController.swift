//
//  ViewController.swift
//  ModernStoic
//
//  Created by Maaz M on 4/16/24.
//

import UIKit

class JournalViewController: UIViewController{

    @IBOutlet weak var JrnlTableView: UITableView!
    
    
    var journals = [Journal]()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        JrnlTableView.dataSource = self
        JrnlTableView.delegate = self
        refreshJournal()
        
        
    }
    @IBAction func didTapNewEntryButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "ComposeSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ComposeSegue" {
            if let composeNavController = segue.destination as? UINavigationController,
               let composeViewController = composeNavController.topViewController as?
                NewEntryViewController {
                composeViewController.entrytoEdit = sender as? Journal
                
                composeViewController.onComposeEntry = { [weak self] entry in
                    entry.save()
                    self?.refreshJournal()
                }
                
            }
        }
    }
    
    private func refreshJournal() {
        journals = Journal.getJournals()  // Fetch the updated list
        JrnlTableView.reloadSections(IndexSet(integer: 0), with: .automatic)

    }
}

extension JournalViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JournalCell", for: indexPath) as! JournalCell
        let journal = journals[indexPath.row]
        cell.textLabel?.text = journal.title  // Ensure cells display the journal title
        cell.detailTextLabel?.text = journal.entry  // If you want to show entry text or part of it
            return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            journals.remove(at: indexPath.row)
            Journal.save(journals)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

}


//allows for Editing tasks
extension JournalViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let selectedEntry = journals[indexPath.row]
        performSegue(withIdentifier: "ComposeSegue", sender: selectedEntry)
    }
}

