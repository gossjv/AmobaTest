//
//  PatientList.swift
//  AmobaTest
//
//  Created by Jorge Vásquez on 27/02/2022.
//

import UIKit

class PatientListViewController: UIViewController {

    @IBOutlet weak var patientListTableView: UITableView!
    
    
    var doctor: Doctor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "PatientTableViewCell", bundle: nil)
        patientListTableView.register(cellNib, forCellReuseIdentifier: "PatientTableViewCell")
    }
    
}

extension PatientListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doctor.patients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PatientTableViewCell") as? PatientTableViewCell else { return UITableViewCell() }
        
        let index = doctor.patients[indexPath.row]
        cell.setData(index)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.05
    }
    
}
