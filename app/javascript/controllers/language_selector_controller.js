import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { current: String }
  static targets = [ "item" ]
  
  select(e) {
    this.currentValue = e.currentTarget.closest('li').dataset.lang
    e.preventDefault()
  }
  
  currentValueChanged() {
    $(this.itemTargets).removeClass('active')
    $(this.element).find(`li[data-lang='${this.currentValue}']`).addClass('active')
  }
}
