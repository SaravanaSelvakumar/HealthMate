//
//  DoctorDetailView.swift
//  OpenTurfTask
//
//  Created by Manikandan Arumugam on 09/06/25.
//

import SwiftUI
import MapKit

struct DoctorDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedDate = Date()
    @EnvironmentObject var alertViewModel: AlertViewModel
    let doctor: Doctor
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 16) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(hex: doctor.color))
                    .frame(width: 100, height: 100)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(doctor.name)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(.black)
                        .lineLimit(1)
                    
                    HStack(spacing: 18) {
                        Text("Role: \(doctor.role)")
                            .font(.subheadline)
                            .foregroundColor(Color(hex: "1E2022"))
                            .lineLimit(1)
                        
                        Button(action: {
                            openInMaps(location: doctor.location)
                        }) {
                            HStack(spacing: 8) {
                                Image("MapIcon")
                                    .resizable()
                                    .frame(width: 12, height: 16)
                                
                                Text(doctor.location)
                                    .font(.footnote)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color(hex: "77838F"))
                                    .lineLimit(1)
                            }
                        }
                    }
                    
                    HStack(spacing: 0) {
                        Text(doctor.specialty)
                            .font(.subheadline)
                            .foregroundColor(Color(hex: "1E2022"))
                            .lineLimit(1)
                        
                        Spacer()
                        
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text(String(format: "%.1f", doctor.rating))
                                .font(.caption)
                                .foregroundColor(Color(hex: "1E2022"))
                                .lineLimit(1)
                        }
                        .padding(.trailing, 20)
                    }
                }
            }
            .padding()
            
            DatePicker(
                "Select Appointment Date",
                selection: $selectedDate,
                in: Date()...,
                displayedComponents: [.date]
            )
            .datePickerStyle(GraphicalDatePickerStyle())
            .padding(.horizontal, 30)

            
            Spacer()
            
            Button(action: {
                alertViewModel.displayAlert(title: "Appointment Booked", message:  "Your appointment has been booked successfully for \(selectedDate.formatted(date: .long, time: .omitted)).")
            }) {
                Text("Book Now")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(hex: "457AFE"))
                    .cornerRadius(10)
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 25)
        }
        .navigationTitle("Doctor Profile")
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    withAnimation {
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 17, weight: .medium))
                        .foregroundColor(.black)
                }
            }
        }
        .alert(isPresented: $alertViewModel.showAlert) {
            Alert(title: Text(alertViewModel.alertTitle),
                  message: Text(alertViewModel.alertMessage),
                  dismissButton: .default(Text("OK")){
                alertViewModel.showAlert = false
                withAnimation {
                    presentationMode.wrappedValue.dismiss()
                }
            })
            
        }
    }
    func openInMaps(location: String) {
        let encodedLocation = location.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        if let url = URL(string: "http://maps.apple.com/?q=\(encodedLocation)") {
            UIApplication.shared.open(url)
        }
    }
}


