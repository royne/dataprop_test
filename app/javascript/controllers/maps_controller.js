import { Controller } from "@hotwired/stimulus"
import 'leaflet'

export default class extends Controller {
  static targets = ['latitude', 'longitude', 'address']

  connect() {
    const lat = parseFloat(this.latitudeTarget.value)
    const lng = parseFloat(this.longitudeTarget.value)
    const map = L.map(this.element).setView([lat, lng], 13)

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      maxZoom: 19,
    }).addTo(map)

    const marker = L.marker([lat, lng]).addTo(map)
    marker.bindPopup(this.addressTarget.value).openPopup()
  }

  disconnect() {
    this.map.remove()
  }

}
