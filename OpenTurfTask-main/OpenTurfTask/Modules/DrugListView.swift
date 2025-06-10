//
//  TaskListView.swift
//  SaneForceTask
//
//  Created by APPLE on 02/05/25.
//

import SwiftUI

struct DrugListView: View {
    @StateObject private var viewModel = MainViewModel()
    @EnvironmentObject var alertViewModel: AlertViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.products) { product in
                        ListView(products: product, viewModel: viewModel)
                            .buttonStyle(PlainButtonStyle())
                    }
                }
                .listStyle(PlainListStyle())
                .buttonStyle(PlainButtonStyle())
                
                Button(action: {
                    viewModel.saveProducts(alertViewModel: alertViewModel)
                }) {
                    Text("Save Products")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "457AFE"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .navigationTitle("Order Medicines")
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
                if alertViewModel.alertTitle == "Delete" {
                    return Alert(title: Text(alertViewModel.alertTitle),
                                 message: Text(alertViewModel.alertMessage),
                                 primaryButton: .default(Text("OK")) {
                        withAnimation(.smooth()) {
                            if let index = viewModel.products.firstIndex(where: { $0.id == viewModel.productId }) {
                                viewModel.products.remove(at: index)
                            }
                        }
                    }, secondaryButton: .cancel())
                } else {
                    return   Alert(title: Text(alertViewModel.alertTitle),
                                   message: Text(alertViewModel.alertMessage),
                                   dismissButton: .default(Text("OK")){
                        withAnimation {
                            presentationMode.wrappedValue.dismiss()
                        }})
                }
            }
            .onAppear {
                viewModel.fetchProducts(alertViewModel: alertViewModel)
            }
        }
    }
}


struct ListView: View {
    @ObservedObject var products: Product
    @ObservedObject var viewModel: MainViewModel
    @EnvironmentObject var alertViewModel: AlertViewModel
    @State var value = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(products.product_name)
                    .font(.headline)
                Spacer()
            }

            HStack(spacing: 10) {
                Button(action: {
                    let currentQty = products.productQty
                    value = max(currentQty - 1, 0)
                    products.convQty = "\(value)"
                    
                    if value < 1 {
                        viewModel.productId = products.id 
                        alertViewModel.displayAlert(title: "Delete", message: "Are you sure you want to delete this item?")
                    }
                }) {
                    Text("-")
                        .frame(width: 30, height: 30)
                        .background(Color(hex: "457AFE"))
                        .foregroundColor(.white)
                        .cornerRadius(4)
                }

                Text("\(value)")
                    .frame(width: 36, height: 36)
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                    .background(Color.white)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color(hex: "457AFE").opacity(0.5), lineWidth: 2)
                    )
                    .foregroundColor(Color(hex: "000000"))
                    .font(.system(size: 16, weight: .semibold))
                    .onAppear {
                        value = products.productQty
                    }

                Button(action: {
                    value = products.productQty + 1
                    products.convQty = "\(value)"
                }) {
                    Text("+")
                        .frame(width: 30, height: 30)
                        .background(Color(hex: "457AFE"))
                        .foregroundColor(.white)
                        .cornerRadius(4)
                }

                Spacer()

                Button(action: {
                    viewModel.productId = products.id
                    alertViewModel.displayAlert(title: "Delete", message: "Are you sure you want to delete this item?")
                }) {
                    HStack(spacing: 6) {
                        Image(systemName: "trash")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.white)
                        Text("DEL")
                            .foregroundColor(.white)
                    }
                    .padding(6)
                    .background(Color(hex: "457AFE"))
                    .cornerRadius(4)
                }
            }
        }
        .padding(.vertical, 8)
    }
}

