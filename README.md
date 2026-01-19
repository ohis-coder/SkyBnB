# SkyBnB: The Cheapest Alternative to AirBnB 

Think AirBnB, think smaller, think smaller, think smaller, think smaller, now stop thinking entirely… there you have it **SkyBnB**. 

Built using **MVI** where we send intents to cause actions or draw views and pass data through closures—no VM and `if let` everywhere. Welcome to “Decoupling” in the easiest layman's terms ever known to man:

> “So the intent are like: yea when you call me I will push this in the navPath and the navDestination is like yea I know you will that is why I am drawing it this way.”
>
> “Oh but in that my app each view in the navDest actually draws the intent to another view... ooooo yess same thing that view is independent of all views.”

---

The ViewModel
We put all the view cases in the `skyStates` enums. But here is the kicker: **the states can carry data from previous states.** To account for that, the next state has `(String)` for the previous, so 3 states in it will carry 3 strings for the info. Please note this is only implementable for small teeny dumb apps like mine which is just a project to show off and teach myself. I really don't know if you are learning anything... 

In a real-world env we would use a **Struct** to hold all the data being passed so the state enums just carry the struct as types. I'll show that example later on. We will name the example **“THIS STUFF I PROMISED.”**

---

The View
This is where I messed up a bit as I didn't create a home screen so this kind of feels like a jump but yea... sorry not sorry. 

We pass a button with the intent to `viewSkies` which adds the `selectPrice` state to the stack. The main purpose of the app is to show that we can navigate through screens passing data which we do with `NavigationStack` pointing to the `navPath`.

The "Contract"
The `navDestination` and the Enum have a **legal contract**. If you add a new case to your `skyStates` enum (like `.checkout`), the compiler will **scream** at your `navDestination` until you add the code to draw that view. This means you can't have a "ghost" screen that exists in logic but doesn't exist on the screen.

---

## **The Holy Trifecta of Navigation**
1. **The BluePrint** (Enum case)
2. **The Command** (Intents)
3. **The Contractor** (navigationDestination)

---

THIS STUFF I PROMISED (The Pro Way)

Instead of your Enum looking like a grocery list of `(string, string, string, string)`, you bundle all those properties into one Struct. 

1. The Data Bundle (The Struct)
```
struct FilterCriteria: Hashable {
    var price: String = ""
    var amenities: String = ""
    var location: String = ""
}
```

2. The Updated "Snowball" Enum
```
enum skyStates: Hashable {
    case home
    case selectPrice(FilterCriteria)
    case selectAmenities(FilterCriteria)
    case applyFilter(FilterCriteria)
}
```
How the Intent handles it: When the user picks a price, your ViewModel just updates the struct and pushes it to the next state:

```
case .priceSelected(let price):
    var currentCriteria = FilterCriteria() 
    currentCriteria.price = price
    navPath.append(.selectAmenities(currentCriteria))
```
