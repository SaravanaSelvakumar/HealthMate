//
//  StatcProductsModel.swift
//  SaneForceTask
//
//  Created by APPLE on 02/05/25.
//
import SwiftUI
import Foundation


struct Doctor: Identifiable {
    let id = UUID()
    let name: String
    let specialty: String
    let role: String
    let rating: Double
    let location: String
    let color: String
}

struct DoctorModelData {
    static let doctors: [Doctor] = [
        Doctor(name: "Dr. Hilary Ouse", specialty: "Radiology", role: "Doctor", rating: 4.5, location: "Espanola, NM", color: "FCF1D6"),
        Doctor(name: "Dr. Ava Moore", specialty: "Pediatrics", role: "Doctor", rating: 4.8, location: "Palmetto, Florida", color: "D2E6FF"),
        Doctor(name: "Dr. Leo Grant", specialty: "Cardiology", role: "Surgeon", rating: 4.2, location: "Sandusky, Ohio", color: "F9D8D9"),
        Doctor(name: "Dr. Isla Newton", specialty: "Neurology", role: "Consultant", rating: 4.9, location: "Austin, TX", color: "ECE7FE"),
        Doctor(name: "Dr. Ethan Reed", specialty: "Orthopedics", role: "Doctor", rating: 4.3, location: "Denver, CO", color: "FBE8EA"),
        Doctor(name: "Dr. Mia Larson", specialty: "Dermatology", role: "Physician", rating: 4.7, location: "Seattle, WA", color: "EBE9DF"),
        Doctor(name: "Dr. Lucas Vale", specialty: "ENT", role: "Doctor", rating: 4.4, location: "Chicago, IL", color: "E0F1F8"),
        Doctor(name: "Dr. Zoe Kent", specialty: "Oncology", role: "Specialist", rating: 4.6, location: "Tampa, FL", color: "F4EBE8"),
        Doctor(name: "Dr. Noah Lee", specialty: "Immunology", role: "Therapist", rating: 4.1, location: "San Diego, CA", color: "FAEAFD"),
        Doctor(name: "Dr. Lily Hart", specialty: "ENT", role: "Surgeon", rating: 4.5, location: "Boston, MA", color: "E0E9D8"),
        Doctor(name: "Dr. Bailey Smith", specialty: "Ophthalmology", role: "Consultant", rating: 4.7, location: "Austin, TX", color: "E2E6D5"),
        Doctor(name: "Dr. Taylor Lee", specialty: "Immunology", role: "Consultant", rating: 4.1, location: "Dallas, TX", color: "F8EDF1"),
        Doctor(name: "Dr. Jamie Jones", specialty: "Radiology", role: "Doctor", rating: 4.3, location: "Chicago, IL", color: "FDD3E0"),
        Doctor(name: "Dr. Drew Anderson", specialty: "Urology", role: "Therapist", rating: 4.8, location: "San Jose, CA", color: "FCF1D6"),
        Doctor(name: "Dr. Jordan Davis", specialty: "Pediatrics", role: "Specialist", rating: 4.0, location: "San Antonio, TX", color: "DDFEFF"),
        Doctor(name: "Dr. Cameron Wilson", specialty: "Pulmonology", role: "Surgeon", rating: 4.2, location: "Phoenix, AZ", color: "E9EFD8"),
        Doctor(name: "Dr. Morgan Garcia", specialty: "Neurology", role: "Physician", rating: 4.9, location: "Houston, TX", color: "EBFFD3"),
        Doctor(name: "Dr. Riley Brown", specialty: "Cardiology", role: "Doctor", rating: 4.6, location: "New York, NY", color: "FAE6F6"),
        Doctor(name: "Dr. Casey Johnson", specialty: "Hematology", role: "Consultant", rating: 4.4, location: "Philadelphia, PA", color: "D9F6F8"),
        Doctor(name: "Dr. Alex Davis", specialty: "ENT", role: "Specialist", rating: 4.5, location: "Charlotte, NC", color: "FFDFE3"),
        Doctor(name: "Dr. Taylor Garcia", specialty: "Dentistry", role: "Physician", rating: 4.2, location: "San Diego, CA", color: "DEE1F0"),
        Doctor(name: "Dr. Jamie Brown", specialty: "Orthopedics", role: "Surgeon", rating: 4.3, location: "Los Angeles, CA", color: "FEE3FC"),
        Doctor(name: "Dr. Drew Wilson", specialty: "Endocrinology", role: "Doctor", rating: 4.7, location: "Jacksonville, FL", color: "FCF1D6"),
        Doctor(name: "Dr. Riley Jones", specialty: "Oncology", role: "Specialist", rating: 4.1, location: "Tampa, FL", color: "F2EFDC"),
        Doctor(name: "Dr. Bailey Miller", specialty: "Gastroenterology", role: "Therapist", rating: 4.6, location: "Boston, MA", color: "F3DAF1"),
        Doctor(name: "Dr. Cameron Lee", specialty: "Immunology", role: "Doctor", rating: 4.0, location: "Columbus, OH", color: "EEF4E7"),
        Doctor(name: "Dr. Casey Smith", specialty: "Psychiatry", role: "Consultant", rating: 4.8, location: "Seattle, WA", color: "F6DBE7"),
        Doctor(name: "Dr. Taylor Davis", specialty: "Radiology", role: "Surgeon", rating: 4.1, location: "Austin, TX", color: "DDFEFF"),
        Doctor(name: "Dr. Alex Brown", specialty: "Anesthesiology", role: "Physician", rating: 4.4, location: "Denver, CO", color: "E9EFD8"),
        Doctor(name: "Dr. Jamie Anderson", specialty: "Urology", role: "Doctor", rating: 4.5, location: "Boston, MA", color: "EBFFD3"),
        Doctor(name: "Dr. Drew Johnson", specialty: "Neurology", role: "Surgeon", rating: 4.6, location: "Palmetto, Florida", color: "FAE6F6"),
        Doctor(name: "Dr. Riley Smith", specialty: "Pediatrics", role: "Therapist", rating: 4.3, location: "Espanola, NM", color: "D9F6F8"),
        Doctor(name: "Dr. Morgan Miller", specialty: "Ophthalmology", role: "Doctor", rating: 4.7, location: "San Diego, CA", color: "FFDFE3"),
        Doctor(name: "Dr. Jordan Lee", specialty: "Cardiology", role: "Consultant", rating: 4.5, location: "Chicago, IL", color: "DEE1F0"),
        Doctor(name: "Dr. Alex Garcia", specialty: "Dermatology", role: "Specialist", rating: 4.4, location: "New York, NY", color: "FEE3FC"),
        Doctor(name: "Dr. Bailey Brown", specialty: "Pulmonology", role: "Physician", rating: 4.2, location: "Philadelphia, PA", color: "F2EFDC"),
        Doctor(name: "Dr. Taylor Smith", specialty: "Gastroenterology", role: "Doctor", rating: 4.3, location: "Seattle, WA", color: "F3DAF1"),
        Doctor(name: "Dr. Casey Garcia", specialty: "Hematology", role: "Surgeon", rating: 4.8, location: "Houston, TX", color: "EEF4E7"),
        Doctor(name: "Dr. Jamie Wilson", specialty: "Psychiatry", role: "Therapist", rating: 4.6, location: "Los Angeles, CA", color: "EBE9DF"),
        Doctor(name: "Dr. Morgan Lee", specialty: "Endocrinology", role: "Doctor", rating: 4.5, location: "San Jose, CA", color: "E0F1F8"),
        Doctor(name: "Dr. Jordan Brown", specialty: "Dermatology", role: "Consultant", rating: 4.0, location: "Denver, CO", color: "F6DBE7"),
        Doctor(name: "Dr. Drew Garcia", specialty: "Anesthesiology", role: "Doctor", rating: 4.2, location: "Charlotte, NC", color: "F4EBE8"),
        Doctor(name: "Dr. Riley Davis", specialty: "Rheumatology", role: "Specialist", rating: 4.1, location: "Tampa, FL", color: "F4EBE8"),
        Doctor(name: "Dr. Alex Johnson", specialty: "Immunology", role: "Therapist", rating: 4.3, location: "Boston, MA", color: "EBE9DF"),
        Doctor(name: "Dr. Bailey Lee", specialty: "Neurology", role: "Surgeon", rating: 4.4, location: "Dallas, TX", color: "E2E6D5"),
        Doctor(name: "Dr. Taylor Brown", specialty: "ENT", role: "Consultant", rating: 4.6, location: "San Antonio, TX", color: "E9EFD8"),
        Doctor(name: "Dr. Casey Wilson", specialty: "Psychiatry", role: "Doctor", rating: 4.1, location: "Columbus, OH", color: "FFDFE3"),
        Doctor(name: "Dr. Jamie Smith", specialty: "Radiology", role: "Physician", rating: 4.2, location: "Phoenix, AZ", color: "FDD3E0"),
        Doctor(name: "Dr. Riley Anderson", specialty: "Cardiology", role: "Specialist", rating: 4.7, location: "New York, NY", color: "FAEAFD"),
        Doctor(name: "Dr. Drew Miller", specialty: "Orthopedics", role: "Doctor", rating: 4.5, location: "Chicago, IL", color: "FAE6F6"),
        Doctor(name: "Dr. Morgan Smith", specialty: "Dentistry", role: "Surgeon", rating: 4.6, location: "Austin, TX", color: "E0E9D8"),
        Doctor(name: "Dr. Alex Brown", specialty: "Anesthesiology", role: "Physician", rating: 4.0, location: "Jacksonville, FL", color: "E2E6D5"),
        Doctor(name: "Dr. Jamie Garcia", specialty: "Pulmonology", role: "Doctor", rating: 4.2, location: "San Diego, CA", color: "F8EDF1"),
        Doctor(name: "Dr. Casey Davis", specialty: "Urology", role: "Specialist", rating: 4.4, location: "Tampa, FL", color: "FDD3E0"),
        Doctor(name: "Dr. Taylor Johnson", specialty: "Dermatology", role: "Doctor", rating: 4.5, location: "Los Angeles, CA", color: "F6DBE7"),
        Doctor(name: "Dr. Bailey Anderson", specialty: "Pediatrics", role: "Physician", rating: 4.3, location: "Boston, MA", color: "F2EFDC"),
        Doctor(name: "Dr. Drew Smith", specialty: "Rheumatology", role: "Doctor", rating: 4.1, location: "Charlotte, NC", color: "F3DAF1"),
        Doctor(name: "Dr. Riley Lee", specialty: "Oncology", role: "Surgeon", rating: 4.6, location: "Philadelphia, PA", color: "EEF4E7"),
        Doctor(name: "Dr. Jordan Garcia", specialty: "Hematology", role: "Consultant", rating: 4.8, location: "San Antonio, TX", color: "F6DBE7")
    ]
}

extension DoctorModelData {
    static var topRatedDoctors: [Doctor] {
        doctors.filter { $0.rating >= 4.5 }
    }
    
    static var doctor: [Doctor] {
        doctors.filter { $0.role == "Doctor" }
    }

}

