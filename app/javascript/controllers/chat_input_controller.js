import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'input', 'button' ]

  get threadId() { return this.element.dataset.threadId }
  
  connect() {
  }
  
  post(e) {
    e.preventDefault()
    let value = this.inputTarget.value
    if ($.trim(value) == '') return
    
    $.post("/messages", { text: value, thread_id: this.threadId }, res => {
      
    })
  }
}
