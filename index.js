const html_to_pdf = require('html-pdf-node');
const fs = require('fs')
const options = { format: 'A4' };
const { SERVICE_NAME, PORT } = process.env;

const file = { url: `http://${SERVICE_NAME}:${PORT}` };
html_to_pdf.generatePdf(file, options).then(pdfBuffer => {
    fs.writeFileSync('./cv.pdf', pdfBuffer, 'binary');
});