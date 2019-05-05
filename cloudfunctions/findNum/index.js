const cloud = require('wx-server-sdk')

cloud.init()
const db = cloud.database()
exports.main = async (event, context) => await db.collection('counters').doc('17afc330-e113-4777-b599-c208c8e5dac2')