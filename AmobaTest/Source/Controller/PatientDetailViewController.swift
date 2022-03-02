//
//  PatientDetailViewController.swift
//  AmobaTest
//
//  Created by Jorge Vásquez on 28/02/2022.
//

import UIKit
import Kingfisher


class PatientDetailViewController: UIViewController {

    var patient: Patient!
    
    @IBOutlet weak var imagePatient: UIImageView!
    @IBOutlet weak var namePatientLabel: UILabel!
    @IBOutlet weak var ageYearPatientLabel: UILabel!
    @IBOutlet weak var sexPatientLabel: UILabel!
    @IBOutlet weak var adressPatientLabel: UILabel!
    @IBOutlet weak var phonePatientLabel: UILabel!
    @IBOutlet weak var mobilePatientLabel: UILabel!
    @IBOutlet weak var emailPatientLabel: UILabel!
    @IBOutlet weak var idPatientLabel: UILabel!
    @IBOutlet weak var statusPatientLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var mobileLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var historyBotton: UIButton!
    @IBOutlet weak var historyUIButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData(patient: patient)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configurateElements()


    }
    
    @IBAction func closeDetailsBottonTaped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func configurateElements() {
        view.roundView(view: imagePatient)
        historyUIButton.layer.cornerRadius = historyUIButton.bounds.width * 0.1

    }
    func setData(patient: Patient) {
        let font = CustomFont.setFontSofiaProRegular(fontSize: 14)
        
        imagePatient.kf.setImage(with: patient.image)
        namePatientLabel.text = patient.fullname
        namePatientLabel.font = font
        sexPatientLabel.text = genderLabelString(patient.sex)
        sexPatientLabel.font = font
        adressPatientLabel.text = patient.address
        adressPatientLabel.font = font
        phonePatientLabel.text = patient.phone
        phonePatientLabel.font = font
        mobilePatientLabel.text = patient.mobile
        mobilePatientLabel.font = font
        emailPatientLabel.text = patient.email
        emailPatientLabel.font = font
        idPatientLabel.text = patient.peopleDocument
        idPatientLabel.font = font
        ageYearPatientLabel.text = patient.birthday.toAge
        ageYearPatientLabel.font = font
        
        statusPatientLabel.font = font
        ageLabel.font = font
        mobileLabel.font = font
        phoneLabel.font = font
        adressLabel.font = font
        sexLabel.font = font
        
    }
    
    func genderLabelString(_ gender: String) -> String {
        gender == "M" ? "Masculino" : "Femenino"
    }
 
}
