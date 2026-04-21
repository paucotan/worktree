import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()


// Connects to data-controller="datepicker"
export default class extends Controller {
  static values = {
    dates: Array,
  }

  connect() {
    const dates = this.datesValue.map(date => ({
      from: date[0],
      to: date[1]
    }))
    flatpickr(this.element, {
      mode: "range",
      dateFormat: "Y-m-d",
      disable: dates
    })
  }
}
