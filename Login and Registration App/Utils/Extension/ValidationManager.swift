//
//  ValidationManager.swift
//  Login and Registration App
//
//  Created by Shashank Mishra on 24/11/20.
//

import Foundation
enum RegexTypes: String {
    case Name = "[a-zA-Z ]*$" //Only alphabets and space
    case PhoneNumber = "^[1-9]{1}[0-9]{9}$" // Assuming min-max numbers to be 10
    case PinCode = "^\\d{6}$" // Assuming min-max numbers to be 6
    case InternationalPinCode = "^[0-9]{4,7}$" // Assuming min-max numbers to be in between 5-7
    case Email = "^[a-zA-Z][A-Z0-9a-z._%+-]+@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"
    case Password = "^(?=.*\\d)(?=.*[a-zA-Z]).{6,255}$"//minimum 6 characters containing alphabet and numeric
    case CouponCode = "^[0-9a-zA-Z]+$" // Only alphanumberic data
    case OnlyNumbers = "[0-9]+"
    case UpperCaseLetters  = "[A-Z ]+"
    case DecimalNumber = "^[0-9]\\d{0,9}(\\.\\d{1,3})?%?$"
}

/// Validation Types
enum ValidationTypes: Int {
    case name, email, phoneNumber, password, pinCode, numberOnly, UpperCaseLatter, DecimalNumber
}

// Validation Error Types
enum ValidationError: Error {
    case missingInput, invalidInput
}

class ValidationManager {
    //todo: logic can be simplified
    class func validate (value:String?, validationType:ValidationTypes,required:Bool) throws -> Bool {
        let value:String? = value?.trimmingCharacters(in: CharacterSet.whitespaces)
        var isValid = false
        
        switch validationType {
        case ValidationTypes.name:
            guard let name = value, !name.isEmpty else{
            if required{
                throw ValidationError.missingInput
            }else{
                isValid = true
                return isValid
                }
            }
        case ValidationTypes.email:
             guard let email = value, !email.isEmpty else {
            if required {
                throw ValidationError.missingInput
            } else {
                return true
            }
        }
        guard NSPredicate(format: "SELF MATCHES %@", RegexTypes.Email.rawValue)
            .evaluate(with: email) else {
                throw ValidationError.invalidInput
        }
        
        isValid = true
        case ValidationTypes.numberOnly :
            guard let data = value, !data.isEmpty else {
                if required {
                    throw ValidationError.missingInput
                } else {
                    return true
                }
            }
            guard NSPredicate(format: "SELF MATCHES %@", RegexTypes.OnlyNumbers.rawValue)
                .evaluate(with: data) else {
                    throw ValidationError.invalidInput
            }
            
            isValid = true
        case ValidationTypes.UpperCaseLatter :
            guard let data = value, !data.isEmpty else {
                if required {
                    throw ValidationError.missingInput
                } else {
                    return true
                }
            }
            guard NSPredicate(format: "SELF MATCHES %@", RegexTypes.UpperCaseLetters.rawValue)
                .evaluate(with: data) else {
                    throw ValidationError.invalidInput
            }
            
            isValid = true
        case ValidationTypes.DecimalNumber :
            guard let data = value, !data.isEmpty else {
                if required {
                    throw ValidationError.missingInput
                } else {
                    return true
                }
            }
            guard NSPredicate(format: "SELF MATCHES %@", RegexTypes.DecimalNumber.rawValue)
                .evaluate(with: data) else {
                    throw ValidationError.invalidInput
            }
            
            isValid = true
            
        case ValidationTypes.password:
        guard let password = value, !password.isEmpty else {
            if required {
                throw ValidationError.missingInput
            } else {
                return true
            }
        }
       
        
            guard NSPredicate(format: "SELF MATCHES %@", RegexTypes.Password.rawValue)
                .evaluate(with: password) else {
                    throw ValidationError.invalidInput
            }
            
            isValid = true
        default:
            return isValid
        }
         return isValid
    }
}
