const path = require('path');
const pptxgen = require('pptxgenjs');
const html2pptx = require('/Users/zhangxh/.agents/skills/powerpoint/scripts/html2pptx');

(async () => {
  const pptx = new pptxgen();
  pptx.layout = 'LAYOUT_16x9';
  await html2pptx(path.join(__dirname,'index.html'), pptx);
  const out = path.join(__dirname,'gpt54-compare.pptx');
  await pptx.writeFile({ fileName: out });
})();
