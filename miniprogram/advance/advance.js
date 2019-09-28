// miniprogram/advance/advance.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    canIUse: wx.canIUse('button.open-type.getUserInfo'),
    title: '',
    content: '',
    user: {},
    contents: '13709192532'
  },

  /**
     * 复制微信号
     */
  copyText: function (e) {
    console.log(e)
    wx.setClipboardData({
      data: e.currentTarget.dataset.text,
      success: function (res) {
        wx.getClipboardData({
          success: function (res) {
            wx.showToast({
              title: '复制成功'
            })
          }
        })
      }
    }),
      setTimeout(function () {
        //要延时执行的代码
        wx.navigateBack({
          url: '../home/home',
        })
      }, 1000) //延迟时间
  }

})