//
//  DatePicker.swift
//  beep-n-breath
//
//  Created by Jack Lord on 25/02/2021.
//

import Foundation
import SwiftUI
import UIKit

struct ClassicDatePicker: UIViewRepresentable {
    @Binding var date: Date

    private let datePicker = UIDatePicker()

    func makeUIView(context: Context) -> UIDatePicker {
        datePicker.datePickerMode = .time
        datePicker.addTarget(context.coordinator, action: #selector(Coordinator.changed(_:)), for: .valueChanged)
        return datePicker
    }

    func updateUIView(_ uiView: UIDatePicker, context: Context) {
        datePicker.date = date
    }

    func makeCoordinator() -> ClassicDatePicker.Coordinator {
        Coordinator(date: $date)
    }

    class Coordinator: NSObject {
        private let date: Binding<Date>

        init(date: Binding<Date>) {
            self.date = date
        }

        @objc func changed(_ sender: UIDatePicker) {
            self.date.wrappedValue = sender.date
        }
    }
}
