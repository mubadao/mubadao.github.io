"use strict";
import {} from './pdf.js'
import {} from './pdf.worker.js'
pdfjsLib.GlobalWorkerOptions.workerSrc = './pdf.worker.js';
let winW = document.documentElement.clientWidth
let loadingTask = window.pdfjsLib.getDocument("<%= src %>")
loadingTask.promise.then(function (pdf) {
let pageNum = pdf.numPages
for (let i = 1; i <= pageNum; i++) {
  pdf.getPage(i).then(function (page) {
    let viewport = page.getViewport(1)
    let scale = (winW / viewport.width).toFixed(2)
    let scaledViewport = page.getViewport(scale)
    let canvas = document.getElementById('the-canvas' + i)
    let context = canvas.getContext('2d')
    canvas.height = scaledViewport.height
    canvas.width = scaledViewport.width
    let renderContext = {
      canvasContext: context,
      viewport: scaledViewport
    }
    let renderTask = page.render(renderContext)
    renderTask.then(function () {
    })
  })
}
}, function (reason) {
  console.error(reason)
})