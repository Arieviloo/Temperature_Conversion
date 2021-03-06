//
//  ContentView.swift
//  Conversion
//
//  Created by Jadiê on 06/09/21.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 1
    
    let units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var conversion: Double {
        
        let unitInput = units[inputUnit]
        let unitOutput = units[outputUnit]
        let value = Double(inputNumber) ?? 0
        
        var result = Double()
        
        if unitInput == "Celsius" && unitOutput ==  "Celsius"{
            result = value
        }
        if unitInput == "Celsius" && unitOutput ==  "Fahrenheit"{
            result = (value * 9/5) + 32
        }
        if unitInput == "Celsius" && unitOutput ==  "Kelvin"{
            result = value + 273.15
        }
        
        if unitInput == "Fahrenheit" && unitOutput ==  "Fahrenheit"{
            result = value
        }
        if unitInput == "Fahrenheit" && unitOutput ==  "Celsius"{
            result = (value - 32) * 5/9
        }
        if unitInput == "Fahrenheit" && unitOutput ==  "Kelvin"{
            result = ((value - 32) * 5/9) + 273.15
        }
        
        if unitInput == "Kelvin" && unitOutput ==  "Kelvin"{
            result = value
        }
        if unitInput == "Kelvin" && unitOutput ==  "Fahrenheit"{
            result = ((value - 273.15) * 9/5) + 32
        }
        if unitInput == "Kelvin" && unitOutput ==  "Celsius"{
            result = value - 273.15
        }
        
        
        
        return result
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Number", text: $inputNumber).keyboardType(.numberPad)
                }
                Section(header: Text("Input unit")) {
                    Picker("Input unit", selection: $inputUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Output unit")) {
                    Picker("Output unit", selection: $outputUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Text("\(conversion)")
                
                
                
            }
            .navigationBarTitle(Text("Temperature"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
