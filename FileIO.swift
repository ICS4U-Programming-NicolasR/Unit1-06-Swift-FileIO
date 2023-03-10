//
// FileIO.swift
//
//  Created by Nicolas Riscalas
//  Created on 2023-03-09
//  Version 1.0
//  Copyright (c) 2023 Nicolas Riscalas. All rights reserved.
//
//  Calculates the sum of numbers on one line
import Foundation
import Glibc

// Set the input and output file paths
let inputFilePath = "Unit1-06-input.txt"
let outputFilePath = "Unit1-06-output.txt"

do {
    // Read the contents of the input file
    let inputFileContents = try String(contentsOfFile: inputFilePath, encoding: .utf8)

    // Split the input file contents into an array of lines
    let lines = inputFileContents.split(separator: "\n")

    // Initialize an empty string for the output file contents
    var outputFileContents = ""

    // Loop through each line of the input file
    for line in lines {
        var num = false
        // Split the line into an array of words
        let words = line.split(separator: " ")

        // Initialize a sum variable for this line
        var sum = 0
        var string = ""
        // Loop through each word in the line
        for word in words {
            // Try to convert the word to an integer
            if let number = Int(word) {
                // If the conversion is successful, add the number to the sum
                sum += number
                num = true
            } else {
                string += word + " "
            }
        }

        // If the sum is greater than zero, add it to the output file contents
        if sum >= 0 && line != "" && num == true {
            outputFileContents += "The sum of the numbers on this line is \(sum).\n"
        }
        if string != "" {
            // Otherwise, just add the line to the output file contents
            outputFileContents += "Could not be added(invalid type) \(string)\n"
        }
    }

    // Write the output file contents to the output file
    try outputFileContents.write(toFile: outputFilePath, atomically: true, encoding: .utf8)

    print("File successfully copied!")
} catch {
    print("Error: \(error.localizedDescription)")
}
