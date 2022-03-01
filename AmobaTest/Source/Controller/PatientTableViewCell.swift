//
//  PatientTableViewCell.swift
//  AmobaTest
//
//  Created by Jorge Vásquez on 27/02/2022.
//

import UIKit
import Kingfisher

protocol PatientCellDelegate: AnyObject {
    func patientDetail(cell: UITableViewCell)
}

class PatientTableViewCell: UITableViewCell {
    
    weak var delegate: PatientCellDelegate?
    
    @IBOutlet weak var namePatientLabel: UILabel!
    @IBOutlet weak var statusPatientLabel: UILabel!
    @IBOutlet weak var imagePatient: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundView(view: imagePatient)
    }
    
    func setData(_ patient: Patient, _ delegate: PatientCellDelegate) {
        let font = CustomFont.setFontSofiaProRegular(fontSize: 13)
        
        namePatientLabel.text = patient.fullname
        namePatientLabel.font = font
        statusPatientLabel.text = "Paciente Actual"
        statusPatientLabel.font = font 
        imagePatient.kf.setImage(with: patient.image)
        self.delegate = delegate
    }
    
    @IBAction func detailsPatientButton(_ sender: Any) {
//        productToDelete?.deletedProduct(seletedProduct!)
        delegate?.patientDetail(cell: self)
    }
}
