const path = require('path');
const pptxgen = require('pptxgenjs');
const html2pptx = require('/Users/zhangxh/.agents/skills/powerpoint/scripts/html2pptx');

(async () => {
  const pptx = new pptxgen();
  pptx.layout = 'LAYOUT_16x9';

  const slides = [
    'slide-01.html','slide-02.html','slide-03.html','slide-04.html','slide-05.html','slide-06.html',
    'slide-07.html','slide-08.html','slide-09.html','slide-10.html','slide-11.html','slide-12.html'
  ];

  for (const s of slides) {
    const f = path.join(__dirname, 'slides', s);
    await html2pptx(f, pptx);
  }

  const out = path.join(__dirname, 'washer-standards.pptx');
  await pptx.writeFile({ fileName: out });
})();
