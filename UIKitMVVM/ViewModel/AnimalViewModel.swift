//
//  AnimalViewModel.swift
//  UIKitMVVM
//
//  Created by Swayam Rustagi on 29/07/24.
//

import Foundation

class AnimalViewModel{
    
    private(set) var animals: [AnimalModel] = [
        AnimalModel(name: "Dog", 
                    info: "The dog (Canis familiaris or Canis lupus familiaris) is a domesticated descendant of the wolf. Also called the domestic dog, it was domesticated from an extinct population of Pleistocene wolves over 14,000 years ago. The dog was the first species to be domesticated by humans. Experts estimate that hunter-gatherers domesticated dogs more than 15,000 years ago, which was before the development of agriculture.",
                    inExistence: "In Existence Since 1200AD", bgColor: .brown),
        
        AnimalModel(name: "Giraffe",
                    info: "The giraffe is a large African hoofed mammal belonging to the genus Giraffa. It is the tallest living terrestrial animal and the largest ruminant on Earth. Traditionally, giraffes have been thought of as one species, Giraffa camelopardalis, with nine subspecies. Most recently, researchers proposed dividing them into four extant species due to new research into their mitochondrial and nuclear DNA, and individual species can be distinguished by their fur coat patterns. Seven other extinct species of Giraffa are known from the fossil record.",
                    inExistence: "In Existence Since 1872", bgColor: .cyan),
        
        AnimalModel(name: "Lion",
                    info: "The lion (Panthera leo) is a large cat of the genus Panthera, native to Africa and India. It has a muscular, broad-chested body; a short, rounded head; round ears; and a dark, hairy tuft at the tip of its tail. It is sexually dimorphic; adult male lions are larger than females and have a prominent mane. It is a social species, forming groups called prides. A lion's pride consists of a few adult males, related females, and cubs. Groups of female lions usually hunt together, preying mostly on large ungulates. The lion is an apex and keystone predator; although some lions scavenge when opportunities occur and have been known to hunt humans, lions typically do not actively seek out and prey on humans.",
                    inExistence: "In Existence Since 1758", bgColor: .yellow),
        
        AnimalModel(name: "Monkey",
                    info: "Monkey is a common name that may refer to most mammals of the infraorder Simiiformes, also known as the simians. Traditionally, all animals in the group now known as simians are counted as monkeys except the apes. Thus monkeys, in that sense, constitute an incomplete paraphyletic grouping; however, in the broader sense based on cladistics, apes (Hominoidea) are also included, making the terms monkeys and simians synonyms in regard to their scope.",
                    inExistence: "In Existence Since 2000BC", bgColor: .purple),
        
        AnimalModel(name: "Panda", 
                    info: "The giant panda (Ailuropoda melanoleuca), also known as the panda bear or simply panda, is a bear species endemic to China. It is characterised by its black-and-white coat and rotund body. The name is used to distinguish it from the distantly related red panda. Adult individuals average 100 to 115 kg (220 to 254 lb), and are typically 1.2 to 1.9 m (3 ft 11 in to 6 ft 3 in) long. The species is sexually dimorphic, as males are typically 10 to 20% larger. The fur is white, with black patches around the eyes, ears, legs and shoulders. A thumb is visible on the bear's forepaw, which helps in holding bamboo in place for feeding. Giant pandas have adapted larger molars and expanded temporal fossa to meet their dietary requirements.",
                    inExistence: "In Existence Since 1000AD", bgColor: .green),
        
        AnimalModel(name: "Peacock", 
                    info: "Peafowl is a common name for two bird species of the genus Pavo and one species of the closely related genus Afropavo within the tribe Pavonini of the family Phasianidae (the pheasants and their allies). Male peafowl are referred to as peacocks, and female peafowl are referred to as peahens.",
                    inExistence: "In Existence Since 400AD", bgColor: .blue),
        
        AnimalModel(name: "Squirrel",
                    info: "Squirrels are members of the family Sciuridae (/sɪˈjuːrɪdeɪ, -diː/), a family that includes small or medium-sized rodents. The squirrel family includes tree squirrels, ground squirrels (including chipmunks and prairie dogs, among others), and flying squirrels. Squirrels are indigenous to the Americas, Eurasia, and Africa, and were introduced by humans to Australia.[1] The earliest known fossilized squirrels date from the Eocene epoch, and among other living rodent families, the squirrels are most closely related to the mountain beaver and dormice.[2]",
                    inExistence: "In Existence Since 1200", bgColor: .systemPink)
        
    ]
    
}
