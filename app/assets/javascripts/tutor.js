$(function(){
  console.log("js is loading")
  enableListeners()
})

function enableListeners(){
  $("button#tutor-requests").on('click', function (event) {
    event.preventDefault
    console.log("worked")
    getTutors()
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
      // $("button#tutor-info").addEventListener("click", function() {alert("Bam")})
    })
}
function addLinkListener() {
  let links = $("a#tutor-info")
  for (let i = 0; i < links.length; i++) {
    links[i].addEventListener("click", showTutor)
  }
}

// function addEventListener(){
//  $("#show_link").on('click', function (event) {
//     event.preventDefault
//     console.log("bazinga")
//     showTutor()
//   })
// }

  function showTutor(event){
    event.preventDefault()
    let id = event.currentTarget.dataset.id
    fetch(`http://localhost:3000/tutors/${id}.json`)
    .then(res => res.json())
    .then(tutor => {
      let newTutor = new Tutor(tutor)
      let tutorHTML = newTutor.formatShow()
      $("#info").append(tutorHTML)
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
      <div id="info"></div>`
    return tutorsHTML
    // <button id="tutor-info"> Tutor Info
  }



  formatShow() {
    let tutorHTML = `
      <div>
      <p> Name: ${this.name}</p>
      <p> Email: ${this.email}</p>
      <p> Bio: ${this.bio}</p>
      </div>
      `
      return tutorHTML
  }
}
