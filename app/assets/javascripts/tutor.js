$(function(){
  console.log("js is loading")
  enableListeners()
})

function enableListeners(){
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

function displayNewForm(){
  $("#new-tutor-form").html('')
    let createTutorHTML = `
      <form onsubmit="createTutor(); return false;">
        <h4> Create a New Tutor </h4>
        <label> Name: </label>
        <input type="text" id="name"></br>
        <label> Gender: </label>
        <input type="text" id="gender"></br>
        <label> Subject: </label>
        <input type="text" id="subject"></br>
        <label> Bio: </label>
        <input type="text" id="bio"></br>
        <label> Email: </label>
        <input type="text" id="email"</br>
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
}

function getTutors(){
  fetch('http://localhost:3000/tutors.json')
  .then(res => res.json())
  .then(tutors => {
    $("#all-tutors").html('')
    tutors.forEach(tutor => {
      let newTutor = new Tutor(tutor)
      let tutorsHTML = newTutor.formatIndex()
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

function showTutor(event){
  event.preventDefault()
  let id = event.currentTarget.dataset.id
  fetch(`http://localhost:3000/tutors/${id}.json`)
  .then(res => res.json())
  .then(tutor => {
    $("#info-spot").html('')
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

  formatIndex() {

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
        <a href="/tutors/${this.id}" id="tutor-info" data-id="${this.id}"> <h3>${this.name}</h3></a>
        <p> Subject: ${this.subject}</p>
        <p> Tutoring has been requested by: ${users}</p>
      </div>
      <div id="info"></div>
      `
    return tutorsHTML
  }

  formatShow() {
    let tutorHTML = `
      <div>
      <h3> ${this.name}'s Personal Info </h3>
      <p> Email: ${this.email}</p>
      <p> Bio: ${this.bio}</p>
      </div>
      `
    return tutorHTML
  }
}
