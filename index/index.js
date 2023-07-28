let log = console.log

let getUserData = () => {
    let loginFormNodeList = document.querySelectorAll('#loginForm');
    let allInformation = Array.from(loginFormNodeList)
    let valueArray = []
    let informationMap = new Map()
    let mapLabels = ["name", "email", "phoneNumber", "subject", "description"]

    for (let i = 0; i < 5; i++) {
        valueArray.push(allInformation[0][i].value)
    } 

    zip(informationMap, mapLabels, valueArray)

    return informationMap
}

let zip = (map, firstArray, secondArray) => {
    for (let i = 0; i < 5; i++){
        map.set(firstArray[i], secondArray[i])
    }
}
// Implement data sharding when doing sql and look at different sharding keys

userDataMap = getUserData()
console.log(userDataMap.get("name"))