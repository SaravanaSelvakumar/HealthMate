//
//  Untitled.swift
//  OpenTurfTask
//
//  Created by Manikandan Arumugam on 09/06/25.
//

import SwiftUI

struct BookDoctorView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var alertViewModel: AlertViewModel
    @State private var searchText: String = ""
    var filteredDoctors: [Doctor] {
        if searchText.isEmpty {
            return DoctorModelData.doctors
        } else {
            return DoctorModelData.doctors.filter {
                $0.name.localizedCaseInsensitiveContains(searchText) ||
                $0.specialty.localizedCaseInsensitiveContains(searchText) ||
                $0.role.localizedCaseInsensitiveContains(searchText) ||
                $0.location.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        VStack {
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Search...", text: $searchText)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                    .padding(.trailing, 35)
                    .background(
                        ZStack{
                            Rectangle().fill(.gray.opacity(0.2))
                            Rectangle().fill(.ultraThinMaterial)
                        }
                            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    )
                    .overlay(
                        HStack {
                            if searchText != "" {
                                Spacer()
                                Button(action: {
                                    withAnimation {
                                        searchText = ""
                                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                    }
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.gray)
                                }
                                .padding(.trailing, 12)
                            }
                        }
                    )
                    .padding(.horizontal)
                }
                .padding(.top, 10)
            Spacer()
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 12) {
                    DoctorListView(doctors: filteredDoctors,
                                   header: "\(filteredDoctors.count) Doctors Available")
                }
            }
            Spacer()

        }
        .navigationTitle("Book a Doctor")
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
                withAnimation {
                    presentationMode.wrappedValue.dismiss()
                }})
        }
    }
}

