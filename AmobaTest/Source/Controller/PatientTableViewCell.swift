//
//  PatientTableViewCell.swift
//  AmobaTest
//
//  Created by Jorge Vásquez on 27/02/2022.
//

import UIKit
import Kingfisher

class PatientTableViewCell: UITableViewCell {

    @IBOutlet weak var namePatientLabel: UILabel!
    @IBOutlet weak var statusPatientLabel: UILabel!
    @IBOutlet weak var imagePatient: UIImageView!
    
    func setData(_ patient: Patient) {
        namePatientLabel.text = patient.fullname
        statusPatientLabel.text = "Paciente Actual"
        imagePatient.kf.setImage(with: patient.image)

    }
    
    @IBAction func detailsPatientButton(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        if let vc = storyboard.instantiateViewController(identifier: "SerieDetailsViewController") as? SerieDetailsViewController {
//
//            
//            navigationController?.pushViewController(vc, animated: false)
        
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        if let vc = storyboard.instantiateViewController(identifier: "SerieDetailsViewController") as? SerieDetailsViewController {
//
//        self.presentViewController(vc, animated: true, completion: nil)
//        }
    }
}
