<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>照片墙</title>

    <style>
        body {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            padding: 20px;
        }

        .folder {
            text-align: center;
            margin: 10px;
            cursor: pointer;
        }

        .photo {
            width: 100%;
            height: auto;
            cursor: pointer;
        }

        #overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            align-items: center;
            justify-content: center;
        }

        #overlay img {
            max-width: 80%;
            max-height: 80%;
        }

        .photo-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }
    </style>
</head>
<body>
<!-- 文件夹 -->
<div class="folder" onclick="openFolder('111')">
    <h3>文件夹1</h3>
</div>

<div class="folder" onclick="openFolder('222')">
    <h3>文件夹2</h3>
</div>

<!-- 照片预览 -->
<div id="overlay" onclick="closeOverlay()">
    <img id="overlayImage" src="" alt="照片预览">
</div>

<!-- 照片容器 -->
<div class="photo-container"></div>

<script>
    function openFolder(folderName) {
        const photoContainer = document.querySelector('.photo-container');
        photoContainer.innerHTML = ''; // 清空容器内的内容

        const photos = [
            '/photo/' + folderName + '/222.jpeg',
            '/photo/' + folderName + '/333.jpeg',
            // 添加更多照片路径
        ];

        photos.forEach(photoPath => {
            const img = document.createElement('img');
            img.src = photoPath;
            img.classList.add('photo');
            img.setAttribute('onclick', 'openOverlay("' + photoPath + '")');
            photoContainer.appendChild(img); // 将照片添加到容器内
        });
    }

    function openOverlay(photoPath) {
        const overlay = document.getElementById('overlay');
        const overlayImage = document.getElementById('overlayImage');
        overlayImage.src = photoPath;
        overlay.style.display = 'flex';
    }

    function closeOverlay() {
        const overlay = document.getElementById('overlay');
        overlay.style.display = 'none';
    }
</script>
</body>
</html>
