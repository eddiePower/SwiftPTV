//
//  contactAPI.swift
//  MyStopWakeUpCall
//
//  Created by Eddie Power on 5/6/19.
//  Copyright © 2019 Eddie Power. All rights reserved.
//

import Foundation
class ContactAPI
{
    //
    static func getContacts() -> [Contact]
    {
        let contacts =
            [
            Contact(name: "Kelly Goodwin", jobTitle: "Designer", country: "bo"),
            Contact(name: "Mohammad Hussain", jobTitle: "SEO Specialist", country: "be"),
            Contact(name: "Eddie Power", jobTitle: "Software Engineer", country: "au"),
            Contact(name: "Tamilarasi Mohan", jobTitle: "Architect", country: "al"),
            Contact(name: "Kim Yu", jobTitle: "Economist", country: "br"),
            Contact(name: "Derek Fowler", jobTitle: "Web Strategist", country: "ar"),
            Contact(name: "Shreya Nithin", jobTitle: "Product Designer", country: "az"),
            Contact(name: "Emily Adams", jobTitle: "Editor", country: "bo"),
            Contact(name: "Aabidah Amal", jobTitle: "Creative Director", country: "au"),
            Contact(name: "Bob Smith", jobTitle: "Creative Director", country: "au"),
            Contact(name: "Ana Amal", jobTitle: "Creative Director", country: "ag"),
            Contact(name: "Ryu Fighter", jobTitle: "Creative Director", country: "chz"),
            Contact(name: "Ken Faci", jobTitle: "Creative Director", country: "sp"),
            Contact(name: "Imago Lopo", jobTitle: "Creative Director", country: "it"),
            Contact(name: "Johny Cage", jobTitle: "Creative Director", country: "ir"),
            Contact(name: "Franco Cotso", jobTitle: "Creative Director", country: "nz"),
            Contact(name: "Jesus Jesus", jobTitle: "Creative Director", country: "au"),
            Contact(name: "John Connor", jobTitle: "Creative Director", country: "nl"),
            Contact(name: "Termi Nator", jobTitle: "Creative Director", country: "fr"),
            Contact(name: "Sarah Connor", jobTitle: "Creative Director", country: "gb"),
            Contact(name: "Marty McFly", jobTitle: "Creative Director", country: "ja"),
        ]
        return contacts
    }
}
