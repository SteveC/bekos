import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static targets = [ 'input', 'list' ]

  get threadId() { return this.element.dataset.threadId }
  
  connect() {
    this.subscribe()
    this.scrollToEnd()
    
    this.ping()
    this.statusTimer = setInterval(() => this.ping(), 5000)
  }
  
  disconnect() {
    this.unsubscribe()
    clearInterval(this.statusTimer)
  }
  
  post(e) {
    e.preventDefault()
    let value = this.inputTarget.value
    if ($.trim(value) == '') return
    
    this.subscription.post({ text: value })
  }
  
  subscribe() {
    let self = this
    this.subscription = consumer.subscriptions.create({ channel: "ChatChannel", thread_id: this.threadId }, {
      post(data) { this.perform('post', data) },
      ping(data) { this.perform('ping', data) },

      received(data) {
        self.listTarget.insertAdjacentHTML('beforeend', data.html)
        self.inputTarget.value = ''
        self.scrollToEnd(true)
      },
    })
  }
  
  unsubscribe() {
    consumer.subscriptions.remove(this.subscription)
  }
  
  ping() {
    this.subscription.ping()
  }
  
  scrollToEnd(smooth = false) {
    this.listTarget.scroll({ top: this.listTarget.scrollHeight, behavior: smooth ? 'smooth' : 'auto' })
  }
}
