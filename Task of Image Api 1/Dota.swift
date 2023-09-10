//
//  File.swift
//  Task of Image Api 1
//
//  Created by Naved Khan on 15/05/23.
//

import Foundation


/*
         "base_agi": 24,
         "base_int": 12,
         "str_gain": 1.6,
         "agi_gain": 2.8,
         "int_gain": 1.8,
         "attack_range": 150,
         "projectile_speed": 0,
         "attack_rate": 1.4,
         "base_attack_time": 100,
         "attack_point": 0.3,
         "move_speed": 310,
*/

/*

 base_health": 120,
         "base_health_regen": 0.75,
         "base_mana": 75,
         "base_mana_regen": 0,
         "base_armor": 0,
         "base_mr": 25,
         "base_attack_min": 29,
         "base_attack_max": 33,
         "base_str": 19,
 */
struct singleArrayBody : Decodable {
    let name : String
    let id : Int
    let localizedName : String
    let img : String
    let roles : [String]
    let attack : String
    let icon : String
    let attackType : String
    let health : Int
    let armorHealth : Float
    let movementSpeed : Int
    enum CodingKeys : String, CodingKey{
        case name
        case id
        case localizedName = "localized_name"
        case img
        case roles
        case attack = "primary_attr"
        case icon
        case attackType = "attack_type"
        case health = "base_health"
        case armorHealth = "base_armor"
        case movementSpeed =  "move_speed"
    }
   
}
