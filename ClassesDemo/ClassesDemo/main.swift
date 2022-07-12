
//class: passed by reference, inheritance
//struct: immutable, passed by value
// start by struct, chnage to class when need inheritance or objective c code

//let skeleton = Enemy(health: 100, attackStrength: 10)
//let skeleton2 = Enemy(health: 100, attackStrength: 10)


var skeleton = Enemy(health: 100, attackStrength: 10)
var skeleton2 = Enemy(health: 100, attackStrength: 10)

skeleton.takeDamage(amount: 10)
print(skeleton.health)

//let dragon = Dragon()
//dragon.move()
//dragon.wingSpan = 5
//dragon.attackStrength = 50
//
//dragon.talk(speech: "My teeth are swords")
//dragon.attack()
