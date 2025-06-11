//
//  PrescptionModel.swift
//  OpenTurfTask
//
//  Created by Manikandan Arumugam on 11/06/25.
//

import SwiftUI

struct PrescptionModel: Identifiable {
    var id: UUID = UUID()
    var name: String
    var dosage: String
}

struct PrescptionList {
    static let prescriptions: [PrescptionModel] = [
    PrescptionModel(name: "dollo", dosage: "1"),
    PrescptionModel(name: "dollo_2.0", dosage: "2"),
    PrescptionModel(name: "parctmell", dosage: "2"),
    PrescptionModel(name: "newone", dosage: "1"),
    PrescptionModel(name: "tabs", dosage: "1"),
    PrescptionModel(name: "pulton", dosage: "3")
    ]
}

struct SelectedPrescription: Identifiable {
    let id = UUID()
    let name: String
    let dose: String
    let time: String
}
