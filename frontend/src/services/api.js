
const baseURL = "http://localhost:9098/bmstuapi"


export async function getClient (email) {
    let result = await fetch(baseURL + `/clients?email=${email}`)
    if (result.status !== 200) {
        console.log(result)
        let errorJSON = await result.json()
        throw errorJSON
    }
    return result.json() 
}

export async function addClient(client) {
    let result = await fetch(baseURL + `/clients`, {
        'method': 'POST',
        'body': JSON.stringify(client),
        'mode': 'cors'
    })
    if (result.status !== 200) {
        console.log(result)
        let errorJSON = await result.json()
        throw errorJSON
    }
    return result.json() 
}

export async function getSchedule(clientID) {
    let result = await fetch(baseURL + `/schedules?statusBy=${clientID}`)
    if (result.status !== 200) {
        console.log(result)
        let errorJSON = await result.json()
        throw errorJSON
    }
    return result.json() 
}

export async function getUserSchedule(clientID) {
    let result = await fetch(baseURL + `/clients/${clientID}/schedules`)
    if (result.status !== 200) {
        console.log(result)
        let errorJSON = await result.json()
        throw errorJSON
    }
    return result.json() 
}

export async function createApplication(application) {
    let result = await fetch(baseURL + `/applications`, {
        'method': 'POST',
        'body': JSON.stringify(application),
        'mode': 'cors'
    })
    if (result.status !== 200) {
        console.log(result)
        let errorJSON = await result.json()
        throw errorJSON
    }
    return result.json() 
}