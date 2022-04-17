//
//  Ressources.swift
//  ExempleVideo
//
//  Created by Elliot Knight on 28/03/2022.
//

import Foundation
import Foundation

var recipes: [RecipeModel] = [
    //ENTRIES
    RecipeModel(title: "Maakouda", price: 7.55, photo: "maakouda", description: "La maaqouda, maqouda ou maakouda est un mets préparé et consommé en Algérie, au Maroc et en Tunisie, essentiellement pendant le mois de ramadan. Il s'agit d'une sorte de beignet de pommes de terre qui peut aussi se décliner avec du thon, de la viande hachée ou du fromage", ingredients: ["3 oeufs", "4 pitas"], recipCategory: .entry),
    
    RecipeModel(title: "Chaakouta", price: 9.99, photo: "chaakouta", description: "La chakchouka, tchektchouka, tchoukchouka, tchouchkaka ou tchoutchouka une spécialité culinaire de la cuisine maghrébine. Il s'agit d'une sorte de poêlée de poivrons ou de piments verts ou rouges, tomates, oignons et à laquelle s'ajoutent à la fin des œufs",ingredients: ["3 oeufs", "4 pitas"],  recipCategory: .entry),
    
    RecipeModel(title: "Briouats fromage", price: 5, photo: "briouats", description: "La briouate fromage est une entrée que l’on prépare pour le Ramadan et qui accompagne d’autres plats comme la chorba. La cuisson au four est idéale pour éviter que ce soit trop gras et permet d’avoir un côté croustillant délicieux avec le fondant du fromage : un vrai régal ! Cette recette est très facile et rapide à faire.", ingredients: ["3 oeufs", "4 pitas"], recipCategory: .entry),
    
    
    
    //Dishes
    RecipeModel(title: "Tajine poulet", price: 6.50,photo: "tajine", description: "Notre tajine au poulet parfumé aux épices du Maroc est fait avec amour par notre chef. Des légumes du jours ainsi que de belles pièces de poulet accompagneront votre repas.",ingredients: ["3 oeufs", "4 pitas"], recipCategory: .dish),
    
    RecipeModel(title: "Couscous Royal", price: 15.50, photo: "couscou", description: "Le couscous est d'une part une semoule de blé dur préparée à l'huile d'olive et d'autre part, une spécialité culinaire issue de la cuisine berbère, à base de couscous, de légumes, d'épices, d'huile d'olive et de viande ou de poisson.",ingredients: ["3 oeufs", "4 pitas"], recipCategory: .dish),
    
    RecipeModel(title: "Falafel", price: 5.50, photo: "falafel", description: "Les falafels ou ta‘amiyya sont une spécialité culinaire levantine très répandue au Proche-Orient, constituée de boulettes de pois chiches ou de fèves broyés et mélangés à diverses épices, frites dans l'huile. Depuis quelques années, on retrouve cette spécialité également dans les pays européens et occidentaux.",ingredients: ["3 oeufs", "4 pitas"], recipCategory: .dish),
    
    // DESSERTS
    RecipeModel(title: "Baklava", price: 2.50, photo: "baklava", description: "Le baklava, une pâtisserie du bassin méditerranéen à découvrir ou à redécouvrir. On le retrouve en Turquie, en Grèce mais aussi certains pays du moyen-Orient. C'est LE dessert pour les gourmands. Il se compose de très fines feuilles de pâte filo superposées au coeur desquelles on trouve des amandes, des noix, des pistaches ou d'autres fruits secs. On arrose cette pâtisserie d'un sirop de sucre ou de miel. Sa composition précise varie selon les pays.",ingredients: ["3 oeufs", "4 pitas"], recipCategory: .dessert),
    
    RecipeModel(title: "Makrouts", price: 3.50, photo: "makrouts", description: "Le makroud ou makrout, également orthographié maqroudh ou maqrouth, est une pâtisserie maghrébine, à base de semoule de blé et de pâte de dattes, reconnaissable à sa forme en losange. C'est une pâtisserie très populaire au Maghreb",ingredients: ["3 oeufs", "4 pitas"], recipCategory: .dessert),
    
    RecipeModel(title: "Corne de gazelle", price: 4.50, photo: "gazelle", description: "La corne de gazelle est une pâtisserie du Maroc en forme de petits croissants dont le cœur moelleux contient de la pâte d'amande, de la canelle et de l'eau de fleur d'oranger.",ingredients: ["3 oeufs", "4 pitas"], recipCategory: .dessert)
]
