const { environment } = require('@rails/webpacker')
const svelte = require('./loaders/svelte')

environment.loaders.prepend('svelte', svelte, { before: 'postcss' })
module.exports = environment
