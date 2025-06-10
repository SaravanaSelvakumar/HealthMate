//
//  Untitled.swift
//  OpenTurfTask
//
//  Created by Manikandan Arumugam on 09/06/25.
//

import SwiftUI


struct Category: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}

struct CategoryModelData {
    static  let categories: [Category] = [
        Category(name: "Cardiology", imageName: "heart"),
        Category(name: "Neurology", imageName: "brain.head.profile"),
        Category(name: "Orthopedics", imageName: "figure.walk"),
        Category(name: "Dermatology", imageName: "face.smiling"),
        Category(name: "Pediatrics", imageName: "person.2.fill"),
        Category(name: "Psychiatry", imageName: "person.crop.circle.badge.questionmark"),
        Category(name: "Ophthalmology", imageName: "eye.fill"),
        Category(name: "Dentistry", imageName: "mouth.fill"),
        Category(name: "Radiology", imageName: "wave.3.forward.circle"),
        Category(name: "ENT", imageName: "ear.fill"),
        Category(name: "Anesthesiology", imageName: "bed.double.fill"),
        Category(name: "Urology", imageName: "drop.fill"),
        Category(name: "Gastroenterology", imageName: "tortoise.fill"),
        Category(name: "Endocrinology", imageName: "bolt.heart.fill"),
        Category(name: "Hematology", imageName: "cross.case.fill"),
        Category(name: "Oncology", imageName: "bandage.fill"),
        Category(name: "Pulmonology", imageName: "lungs.fill"),
        Category(name: "Rheumatology", imageName: "figure.mind.and.body"),
        Category(name: "Immunology", imageName: "shield.lefthalf.filled")
    ]
}


