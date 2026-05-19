# Images (`assets/images/`)

Ảnh minh họa nên export từ Figma **@2x hoặc @3x** (rộng ~500–800px) để không bị mờ trên màn retina.

Chạy lại upscale nếu thay file gốc nhỏ:

```powershell
.\scripts\upscale_assets.ps1
```

---

# Icons

## Bộ icon trong project (`assets/icons/*.svg`)

Icon SVG theo style Figma Job Finder UI Kit — dùng qua `AppIcons` và `AppSvgIcon`.

## Export trực tiếp từ Figma (file gốc)

1. Figma → **Settings** → **Personal access tokens** → tạo token  
2. PowerShell:

```powershell
$env:FIGMA_TOKEN = "figd_xxxxxxxx"
cd C:\Users\GIGABYTE\jobspot
.\scripts\export_figma_icons.ps1
```

Icon Figma export vào `assets/icons/figma/`. Có thể thay thế file trong `assets/icons/` và cập nhật `lib/core/assets/app_icons.dart`.

**File Figma:** [Job Finder UI App Kit](https://www.figma.com/design/O4y5fMUKjyXNnx58j68d2P/Job-Finder-Ui-App-Kit--Community-?node-id=1-48)
