//
//  AddPlayersViewController.swift
//  PlayShare
//
//  Created by Victoria Grönqvist on 2018-04-13.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

import UIKit

class AddPlayersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var playersList: UITableView!
    @IBOutlet weak var tableView: UITableView!
    
    
    var players : [Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addPlayerButton(_ sender: Any) {
        if nameInput.text!.isEmpty {
            
        } else {
            let player = Player(name: nameInput.text!)
            players.append(player)
            if let i = players.index(of: player) {
                print("\(i), added player: \(player.name)")
            }
        }
        nameInput.text = ""
        reload(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }

    func reload(_ tableView: UITableView) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell")!
        
        cell.textLabel?.text = players[indexPath.row].name
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row) was clicked and the item was \(players[indexPath.row].name)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell")!
        
        cell.textLabel?.text = "Bob"
        
        //players[indexPath.row] = (cell.textLabel?.text!)!
        let p = players[indexPath.row]
        cell.textLabel?.text = p.name
        
        reload(tableView)
        
    }
    
    
    // #warning fix this
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleting \(players[indexPath.row])")
            players.remove(at: indexPath.item)
            //reload(tableView)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        //print("Using canEditRowAt")
        return true
    }
 
 
    func keyboardDown() {
        //#warning press anywhere to make the keyboard disappear
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "StartTournament" {
            if let tournament = segue.destination as? TournamentViewController{
                tournament.players = players
            } else {
                print("Data not passed")
            }
        } else {
            print("Identifier doesn't match, so no data sent")
        }
    }
    

}
