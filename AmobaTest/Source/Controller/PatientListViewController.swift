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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let secondVC: PatientDetailViewController = segue.destination as? PatientDetailViewController,
           let patient = sender as? Patient {
            secondVC.patient = patient
        }
    }
}

extension PatientListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doctor.patients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PatientTableViewCell") as? PatientTableViewCell else { return UITableViewCell() }
        
        let patient = doctor.patients[indexPath.row]
        cell.setData(patient, self)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.0
    }
}

extension PatientListViewController: PatientCellDelegate {
    func patientDetail(cell: UITableViewCell) {
        guard let indexPath = patientListTableView.indexPath(for: cell) else {
            return
        }
        
        let patient = doctor.patients[indexPath.row]
        self.performSegue(withIdentifier: "showDetails", sender: patient)

    }
    
}
