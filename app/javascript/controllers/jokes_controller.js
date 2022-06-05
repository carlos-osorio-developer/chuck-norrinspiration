import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="jokes"
export default class extends Controller {
  connect() {    
  }

  delete_like(e) {
    let confirmed = confirm("Are you sure you want to remove this joke from favorites?")
    if (!confirmed) {
      e.preventDefault()
    }
    else {      
      setTimeout(() => {
        e.target.parentNode.parentNode.parentNode.remove()
      }, 500)      
    }
  }
}
