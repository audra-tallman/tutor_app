$(function(){
  console.log("js is loading")
  enableListeners()
})

function enableListeners(){
  $("button#tutor-list").on('click', function(event) {
    event.preventDefault
    console.log("woot")
    listTutors()
  })
  $("button#tutor-requests").on('click', function(event) {
    event.preventDefault
    console.log("worked")
    getTutors()
  })
  $("button#new-tutor").on('click', function(event) {
    event.preventDefault
    console.log("woohoo")
    displayNewForm()
  })
}

function clearPage(){
  $("#list").html('')
  $("#all-tutors").html('')
  $("#new-tutor-form").html('')
  $("#info-spot").html('')
}

function listTutors() {
  fetch('http://localhost:3000/tutors.json')
  .then(res => res.json())
  .then(tutors => {
    clearPage()
    tutors.forEach(tutor => {
      let newTutor = new Tutor(tutor)
      let listHTML = newTutor.formatList()
      $("#all-tutors").append(listHTML)
    })
    addLinkListener()
  })
}

function displayNewForm() {
  clearPage()
  $("#new-tutor-form").html('')
    let createTutorHTML = `
      <form onsubmit="createTutor(); return false;">
        <h3> Create a New Tutor </h3>
        <i>Please follow directions below each field.</i></br></br>
        <label> Name: </label>
        <input type="text" id="name"></br>(Cannot be blank)</br></br>
        <label> Gender: </label>
        <input type="text" id="gender"></br>(Type as male or female)</br></br>
        <label> Subject: </label>
        <input type="text" id="subject"></br>(Must list single subject)</br></br>
        <label> Bio: </label>
        <input type="text" id="bio"></br>(Cannot exeed 250 characters)</br></br>
        <label> Email: </label>
        <input type="text" id="email"></br>(Must be unique)</br></br>
        <input type="submit" value="Add Tutor">
      </form>
      `
    $("#new-tutor-form").html(createTutorHTML)
}

function createTutor() {
  const tutor = {
    name: document.getElementById("name").value,
    gender: document.getElementById("gender").value,
    subject: document.getElementById("subject").value,
    bio: document.getElementById("bio").value,
    email: document.getElementById("email").value
  }
  fetch('http://localhost:3000/tutors', {
    method: 'POST',
    body: JSON.stringify({ tutor }),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
  })
  .then(res => res.json())
  .then(tutor => {
    console.log(tutor)
  })
  listTutors()
}

function getTutors() {
  fetch('http://localhost:3000/tutors.json')
  .then(res => res.json())
  .then(tutors => {
    clearPage()
    tutors.forEach(tutor => {
      let newTutor = new Tutor(tutor)
      let tutorsHTML = newTutor.formatRequests()
      $("#all-tutors").append(tutorsHTML)
      })
      addLinkListener()
    })
}

function addLinkListener() {
  let links = $("a#tutor-info")
  for (let i = 0; i < links.length; i++) {
    links[i].addEventListener("click", showTutor)
  }
}

function showTutor(event) {
  event.preventDefault()
  let id = event.currentTarget.dataset.id
  fetch(`http://localhost:3000/tutors/${id}.json`)
  .then(res => res.json())
  .then(tutor => {
    $("#info-spot").html('')
    $("#new-tutor-form").html('')
    let newTutor = new Tutor(tutor)
    let tutorHTML = newTutor.formatShow()
    $("#info-spot").append(tutorHTML)
  })
}

class Tutor {
  constructor (tutor) {
    this.id = tutor.id
    this.name = tutor.name
    this.bio = tutor.bio
    this.gender = tutor.gender
    this.email = tutor.email
    this.subject = tutor.subject
    this.subjects = tutor.subjects
    this.users = tutor.users
  }

  formatList() {
    let listHTML = `
      <a href="/tutors/${this.id}" id="tutor-info" data-id="${this.id}"> <h3>${this.name}</h3></a>
    `
    return listHTML
  }

  formatRequests() {
    let subjects = this.subjects.map(subject => {
      return(`
        <ul>
          <li>${subject.name}</li>
        </ul>
        `)
    }).join('')
    let users = this.users.map(user => {
      return(`
        <ul>
          <li>${user.name}</li>
        </ul>
        `)
    }).join('')

    let tutorsHTML = `
      <div>
        <h3>${this.name} - <small>${this.subject}</small></h3>
        <p> Tutoring has been requested by: ${users}</p>
      </div>
      <div id="info-spot"></div>
      `
    return tutorsHTML
  }

  formatShow() {
    let tutorHTML = `
      <div>
      <h3> ${this.name}'s Personal Info </h3>
      <p> Gender: ${this.gender}</p>
      <p> Subject: ${this.subject}</p>
      <p> Bio: ${this.bio}</p>
      <p> Email: ${this.email}</p>
      </div>
      `
    return tutorHTML
  }
}
