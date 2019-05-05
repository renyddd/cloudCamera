var imagesSrc = ''

Page({

  onLoad() {
    this.ctx = wx.createCameraContext() 
  },

  takePhoto() {
    this.ctx.takePhoto({
      quality: 'high',
      success: (res) => {
        this.setData({
          src: res.tempImagePath
        })
        imagesSrc = res.tempImagePath
        console.log(imagesSrc)
      }
    })
  },
  
  addPush() {
    wx.cloud.uploadFile({
      cloudPath: 'photos/my_images_' + imagesSrc.substring(13,50), // 上传至云端的路径
      // 命名随机，不会重叠
      filePath: imagesSrc, // 要上传文件资源的路径
      success: res => {
        // 返回文件 ID
        console.log(res.fileID)
        wx.showToast({ // 提示成功信息
          title: '上传成功',
        })
      },
      fail: console.error
    })
  },

  error(e) {
    console.log(e.detail)
  }
})