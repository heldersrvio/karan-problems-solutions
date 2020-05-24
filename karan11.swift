import Foundation

func convertTemp(_ n: Double, _ typeFrom: String, _ typeTo: String) -> Double{
    switch (typeFrom){
    case "Celsius":
        switch (typeTo){
        case "Kelvin":
            return n + 273.15
        case "Fahrenheit":
            return n * (9/5) + 32
        default:
            return 0
        }
    case "Fahrenheit":
        switch (typeTo){
        case "Kelvin":
            return (n + 459.67) * (5/9)
        case "Celsius":
            return (n - 32) * (5/9)
        default:
            return 0
        }
    case "Kelvin":
        switch (typeTo){
        case "Fahrenheit":
            return (n - 273) * 1.8 + 32
        case "Celsius":
            return n - 273
        default:
            return 0
        }
    default:
        return 0
    }
}

func convertCurrency(_ n: Double, _ typeFrom: String, _ typeTo: String) -> Double{
    switch (typeFrom){
    case "Dollar":
        switch (typeTo){
        case "Euro":
            return n * 0.91
        case "Pound":
            return n * 0.82
        default:
            return 0
        }
    case "Euro":
        switch (typeTo){
        case "Dollar":
            return n * 1.09
        case "Pound":
            return n * 0.89
        default:
            return 0
        }
    case "Pound":
        switch (typeTo){
        case "Dollar":
            return n * 1.23
        case "Celsius":
            return n * 1.12
        default:
            return 0
        }
    default:
        return 0
    }
}

func convertVolume(_ n: Double, _ typeFrom: String, _ typeTo: String) -> Double{
    switch (typeFrom){
    case "Ounce":
        switch (typeTo){
        case "Liter":
            return n * 0.03
        case "Gallon":
            return n * 0.008
        default:
            return 0
        }
    case "Liter":
        switch (typeTo){
        case "Ounce":
            return n * 33.814
        case "Gallon":
            return n * 0.264
        default:
            return 0
        }
    case "Gallon":
        switch (typeTo){
        case "Liter":
            return n * 3.79
        case "Ounce":
            return n * 128
        default:
            return 0
        }
    default:
        return 0
    }
}

func convertMass(_ n: Double, _ typeFrom: String, _ typeTo: String) -> Double{
    switch (typeFrom){
    case "Kilogram":
        switch (typeTo){
        case "Gram":
            return n * 1000
        case "Pound":
            return n * 2.2
        default:
            return 0
        }
    case "Gram":
        switch (typeTo){
        case "Kilogram":
            return n / 1000
        case "Pound":
            return n * 0.0022
        default:
            return 0
        }
    case "Pound":
        switch (typeTo){
        case "Kilogram":
            return n * 0.45
        case "Gram":
            return n * 453.6
        default:
            return 0
        }
    default:
        return 0
    }
}

print("43 degrees Celsius is \(convertTemp(43, "Celsius", "Fahrenheit")) degrees Fahrenheit; 1000 dollars is \(convertCurrency(1000, "Dollar", "Pound")) pounds; 20 liters is \(convertVolume(20, "Liter", "Gallon")) gallons; 45 kilograms is \(convertMass(45, "Kilogram", "Pound")) pounds.")
