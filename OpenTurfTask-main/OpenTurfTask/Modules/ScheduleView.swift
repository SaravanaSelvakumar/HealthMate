//
//  ScheduleView.swift
//  OpenTurfTask
//
//  Created by Manikandan Arumugam on 09/06/25.
//

import SwiftUI

struct ScheduleView: View {
    @EnvironmentObject var alertViewModel: AlertViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedDate = Date()
    
    var body: some View {
        NavigationStack {
            VStack {
                DatePicker(
                    "Select Appointment Date",
                    selection: $selectedDate,
                    in: Date()...,
                    displayedComponents: [.date]
                )
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding(.horizontal, 30)
                
                Text("List of Schedule")
                    .font(.headline)
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(ScheduleModelData.schedule) { item in
                            HStack(alignment: .center) {
                                Text(item.time)
                                    .frame(width: 80, alignment: .leading)
                                    .font(.subheadline)
                                
                                Text(item.title)
                                    .padding()
                                    .cornerRadius(12)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(item.backgroundColor)
                                    .cornerRadius(12)
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                
                Spacer()
            }
            .navigationTitle("Schedule")
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
                      dismissButton: .default(Text("OK")))
            }
        }
    }
}
