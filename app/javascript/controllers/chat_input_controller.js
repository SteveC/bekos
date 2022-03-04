import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static targets = [ 'input', 'button' ]

  get threadId() { return this.element.dataset.threadId }
  
  connect() {
    this.subscribe()
  }
  
  post(e) {
    e.preventDefault()
    let value = this.inputTarget.value
    if ($.trim(value) == '') return
    
    $.post("/messages", { text: value, thread_id: this.threadId }, res => {
      
    })
  }
  
  subscribe() {
    consumer.subscriptions.create({ channel: "ChatChannel", thread_id: this.threadId }, {
      connected() { },
      disconnected() { },

      received(data) {
        console.log(data)
      },

      sync: function() {
        return this.perform('sync');
      }
    })
  }
}
