$(function(){
  console.log("js is loading")
  enableListeners()
})

function enableListeners(){
  $("button#click-me").on('click', function (event) {
    event.preventDefault
    console.log("worked")
    getTutor()
  })
}

function getTutor(){
  fetch('http://localhost:3000/tutors')
  .then(res => res.json())
  .then(tutors => {
    $("#selected-tutor").html('')
    tutors.forEach(tutor => {
      let newTutor = new Tutor(tutor)
      let tutorHTML = newTutor.formatIndex()
      $("#selected-tutor").append(tutorHTML)
      })
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

  // formatIndex() {
  //   // let tutorHTML = `
  //   // <a href= "/tutors/${this.id}" data-id="${this.id}" class="show_link"><h3>${this.name}</h3></a>
  //   // `
  //   // return tutorHTML
  //
  //   let subjects = this.subjects.map(subject => {
  //     return(`
  //       <ul>
  //         <li>${subject.name}</li>
  //       </ul>
  //       `)
  //   }).join('')
  //
  //   // let users = this.users.map(user => {
  //   //   return(`
  //   //     <ul>
  //   //       <li>${user.name}</li>
  //   //     </ul>
  //   //     `)
  //   // }).join('')
  //
  //   return(`
  //   <div>
  //     <a href= "/tutors/${this.id}" data-id="${this.id}" class="show_link"> <h3>${this.name}</h3></a>
  //     <p> Subjects: ${subjects}</p>
  //   </div>
  //   `)
  // }
}

Tutor.prototype.formatIndex = function() {
  // let tutorHTML = `
  // <a href= "/tutors/${this.id}" data-id="${this.id}" class="show_link"><h3>${this.name}</h3></a>
  // `
  // return tutorHTML

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

  return(`
  <div>
    <a href= "/tutors/${this.id}" data-id="${this.id}" class="show_link"> <h3>${this.name}</h3></a>
    <p> Subjects: ${subjects}</p>
    <p> Users: ${users}</p>
  </div>
  `)
}
