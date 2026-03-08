## [ERR-20260308-002] thumbnail-soffice-missing

**Logged**: 2026-03-08T09:43:00+08:00
**Priority**: high
**Status**: pending
**Area**: tools

### Summary
thumbnail.py failed because LibreOffice (soffice) is not installed.

### Error
```
Error: [Errno 2] No such file or directory: 'soffice'
```

### Context
- Command: python3 /Users/zhangxh/.agents/skills/powerpoint/scripts/thumbnail.py <pptx> --cols 4
- Purpose: generate thumbnail grid for PPTX verification

### Suggested Fix
Install LibreOffice or ensure `soffice` is in PATH before running thumbnail.py.

### Metadata
- Reproducible: yes
- Related Files: /Users/zhangxh/.agents/skills/powerpoint/scripts/thumbnail.py

---
