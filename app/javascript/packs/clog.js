// document.addEventListener("turbolinks:load", function () {
// })

console.log('loading clog.js . . .')
const finput = document.getElementById('finput')
const flabel = document.getElementById('flabel')
flabel.innerHTML = "Input:";
finput.addEventListener("change", (event) => {
    console.log('Input: ' + event.target.value)
});