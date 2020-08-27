//
//  ContentView.swift
//  UnitConversion
//
//  Created by Connor Huffman on 8/21/20.
//  Copyright © 2020 Connor Huffman. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var firstMeasurement = 0
    @State private var secondMeasurement = 0
    @State private var amountToConvert = ""
    
    let measurements = ["Seconds", "Minutes", "Hours", "Days", "Years"]
    
    var conversion: Double {
        let measurement1 = firstMeasurement
        let measurement2 = secondMeasurement
        let measuremtnConvert = Double(amountToConvert) ?? 0
        var converted: Double = 0
        var finalconverted: Double = 0
        
    
        //minutes
        if measurement1 == 1 {
            converted = measuremtnConvert * 60
        }
        //hours
        else if measurement1 == 2 {
            converted = measuremtnConvert * 3600
        }
        //days
        else if measurement1 == 3 {
            converted = measuremtnConvert * 3600 * 24
        }
        //years
        else if measurement1 == 4 {
            converted = measuremtnConvert * 3600 * 24 * 365
        }
        else {
            converted = measuremtnConvert
        }
        
        if measurement2 == 1 {
            finalconverted = converted / 60
        }
        //hours
        else if measurement2 == 2 {
            finalconverted = converted / 3600
        }
        //days
        else if measurement2 == 3 {
            finalconverted = converted / 3600 / 24
        }
        //years
        else if measurement2 == 4 {
            finalconverted = converted / 3600 / 24 / 365
        }
        else {
            finalconverted = converted
        }
        
       
        return finalconverted
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Choose your starting measuremnt")) {
                    Picker("Starting Measurement", selection: $firstMeasurement) {
                        ForEach(0 ..< measurements.count) {
                            Text("\(self.measurements[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    TextField("Amount", text: $amountToConvert)
                    .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Choose your ending measuremnt")) {
                    Picker("Starting Measurement", selection: $secondMeasurement) {
                        ForEach(0 ..< measurements.count) {
                            Text("\(self.measurements[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Converted Amount.")) {
                    Text("\(conversion)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
