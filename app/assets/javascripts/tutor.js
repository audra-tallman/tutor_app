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
  history.pushState(null, null, "tutors")
  fetch(`http://localhost:3000/tutors`)
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
