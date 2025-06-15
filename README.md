# Visu.ai

Visu.ai is a Chrome extension that activates on shopping websites (currently supports amazon). It prompts users to select a background surface, detects the searched object, and generates a 3D model from segmented 2D images right on the local compute.

# Team

- Gunjan Giri - gunjangiri8410@gmail.com
- Risabh Kedia - risabh.kedia12@gmail.com
- Shuvam Kumar Panda - shuvamkumar2001@gmail.com
- Manas Ranjan Munda - manasranjanmunda1410@gmail.com

## 🚀 Features

- 🧩 Chrome extension support for shopping platforms (currently Amazon)
- 🖼️ Auto-detect and segment product images (YOLOv8)
- 🛠️ Backend powered by Flask and OpenCV
- 🧠 Converts segmented 2D image into a 3D model using Midas Anything Model
- 👁️ Real-time visualization of the generated 3D object

## Motivation

We created this project to address the challenge of visualizing 3D models of products in a shopping site. The current process of generating 3D models manually is time-consuming and requires users to manually input dimensions of the product fromm the end user. Our extension automates this process, saving users time and effort.

## 🛠️ Tech Stack

**Frontend:**

- Chrome Extension (JavaScript, HTML, CSS)

**Backend:**

- Flask
- OpenCV
- Node JS
- 3JS

**AI Models:**

- Midas Anything Model
- Ultralytics YOLOv8

## 📦 Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/visu.ai.git
   cd visu.ai
   ```

2. Install node JS:

   ```
   # Download and install Chocolatey:
   powershell -c "irm https://community.chocolatey.org/install.ps1|iex"

   # Download and install Node.js
   choco install nodejs-lts --version="22"

   # Verify the Node.js version:
   node -v
   ```

3. Install Python 3:

   ```bash
   https://www.python.org/downloads/windows/
   ```

4. Install dependencies for :

   ```bash
   cd AI_Server && pip install -r requirements.txt
   ```

5. (Optional) Download YOLOv8 model and place it under AI_Server:
   ```python
   from ultralytics import YOLO
   YOLO('yolov8m.pt')  # Will auto-download if not present
   ```

---

## 🧩 Chrome Extension Setup

1. Open Chrome and go to `chrome://extensions`
2. Enable **Developer Mode**
3. Click **Load unpacked**
4. Select the `extension/` folder in this repository which is `ChromeExtension`

---

## 📂 Folder Structure

```
Visu_Ai/

.
├── AI_Server
│   ├── app.py
│   ├── depth.py
│   ├── depth_maps
│   │   ├── Background.jpg
│   │   └── Object.jpg
│   ├── detect.py
│   ├── extension_data
│   │   ├── Background.jpg
│   │   └── Object.jpg
│   ├── merge_ply.py
│   ├── mesh.py
│   ├── midas-midas-v2-float.onnx
│   └── yolov8n.pt
├── ChromeExtension
│   ├── README.md
│   ├── background.js
│   ├── content.js
│   ├── evidence.jpeg
│   ├── manifest.json
│   ├── popup.html
│   └── popup.js
├── ChromeExtensionNode
│   ├── package-lock.json
│   ├── package.json
│   └── server.js
├── LICENSE
├── README.md
└── threed-render
    ├── package-lock.json
    ├── package.json
    ├── public
    │   ├── favicon.ico
    │   ├── index.html
    │   ├── logo192.png
    │   ├── logo512.png
    │   ├── manifest.json
    │   ├── models
    │   │   ├── Backup.ply
    │   │   └── merge_scene.ply
    │   └── robots.txt
    └── src
        ├── 3DModelViewer.js
        ├── App.css
        ├── App.js
        ├── App.test.js
        ├── DoubleModelViewer.js
        ├── DualModelViewer.js
        ├── index.css
        ├── index.js
        ├── logo.svg
        ├── reportWebVitals.js
        └── setupTests.js

```

## 🧾 manifest.json (for Chrome Extension)

```json
{
  "manifest_version": 3,
  "name": "Visu.ai",
  "version": "1.0",
  "description": "Generate 3D models from shopping site images.",
  "permissions": ["activeTab", "scripting"],
  "action": {
    "default_popup": "popup.html",
    "default_icon": {
      "16": "icons/icon16.png",
      "48": "icons/icon48.png",
      "128": "icons/icon128.png"
    }
  },
  "content_scripts": [
    {
      "matches": ["*://*.amazon.in/*", "*://*.flipkart.com/*"],
      "js": ["content.js"]
    }
  ],
  "icons": {
    "16": "icons/icon16.png",
    "48": "icons/icon48.png",
    "128": "icons/icon128.png"
  }
}
```

---

## 🤝 Contributing

Contributions are welcome! Please fork the repo and create a pull request with your improvements.

## 📄 License

Licensed under the [MIT License](LICENSE).

---

## 🙌 Acknowledgments

- [Ultralytics](https://github.com/ultralytics/ultralytics)
- [OpenCV](https://opencv.org/)
- [Flask](https://flask.palletsprojects.com/)
- [Chrome Extensions Docs](https://developer.chrome.com/docs/extensions/)
