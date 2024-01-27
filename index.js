const html_to_pdf = require('html-pdf-node');
const fs = require('fs')
const options = { format: 'A4' };
const file = { url: "http://127.0.0.1:3000" };
html_to_pdf.generatePdf(file, options).then(pdfBuffer => {
    fs.writeFileSync('./cv.pdf', pdfBuffer, 'binary');
});