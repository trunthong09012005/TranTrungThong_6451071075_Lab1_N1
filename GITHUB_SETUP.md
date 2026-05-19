# Push lên GitHub

**Repo:** https://github.com/trunthong09012005/TranTrungThong_6451071075_Lab1_N1

## Push nhanh (PowerShell)

```powershell
cd C:\Users\GIGABYTE\jobspot
.\scripts\push_to_github.ps1
```

## Push thủ công

```powershell
cd C:\Users\GIGABYTE\jobspot

git remote add origin https://github.com/trunthong09012005/TranTrungThong_6451071075_Lab1_N1.git
# Nếu đã có origin: git remote set-url origin https://github.com/trunthong09012005/TranTrungThong_6451071075_Lab1_N1.git

git branch -M main
git push -u origin main
```

## Lỗi thường gặp

**Remote có sẵn README trên GitHub:**

```powershell
git pull origin main --rebase --allow-unrelated-histories
git push -u origin main
```

**Chưa đăng nhập GitHub:**

```powershell
& "${env:ProgramFiles}\GitHub CLI\gh.exe" auth login
```

Hoặc dùng tài khoản/mật khẩu (PAT) khi Git hỏi credentials.
