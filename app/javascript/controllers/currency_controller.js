import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['price', 'usdPrice', 'currencyType']

  connect() {
    this.convert()
  }

  async convert() {
    try {
      const price = parseFloat(this.priceTarget.value)
      const response = await fetch('https://mindicador.cl/api')
      const data = await response.json()
      const dollarValue = parseFloat(data.dolar.valor)
      const value = this.handleCurrency(dollarValue, price)
      this.usdPriceTarget.innerHTML = value
    } catch (error) {
      console.error('Error al convertir el precio:', error)
    }
  }

  handleCurrency(dollarValue, price) {
    const currencyType = this.currencyTypeTarget.value
    if (currencyType === 'clp') {
      const value = (price / dollarValue).toFixed(2)
      return `Precio en USD es: $${value}`
    } else {
      const value = (dollarValue * price).toFixed(2)
      return `Precio en CLP es: $${value}`
    }
  }
}
