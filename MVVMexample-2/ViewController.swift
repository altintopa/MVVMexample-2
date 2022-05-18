//
//  ViewController.swift
//  MVVMexample-2
//
//  Created by Ahmet WOW on 16/05/2022.
//  
/// Source : https://www.youtube.com/watch?v=qzXJckVxE4w

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    var userArr = [Person]()
    //var userNameArr = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.register(UINib(nibName: "tblViewCell", bundle: nil), forCellReuseIdentifier: "cellID")
        fillArray()
    }
    
    func fillArray(){
        let names = ["Alan","Stefano","Jack","Harry","Susan","Emily","Ivan","Patrick","Lisa","Michael","Arjun"]
        //let usernames = ["TheHacker","MrWTF","CWolf","BigTim","HelloTTQ","BellArt","StanleyStan","34AqTeam","TheGod's W","PolyGun"]
        for name in names {
            userArr.append(Person(name: name,username: "Mr.WTF"))
        }
    }
}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = userArr[indexPath.row]
        let cell = tblView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! tblViewCell
        cell.configureCell(with: tblViewCellViewModel(with: model))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
