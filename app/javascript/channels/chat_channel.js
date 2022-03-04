// import consumer from "./consumer"
// 
// document.addEventListener("DOMContentLoaded", () => {
//   console.log('loaded')
// 
//   consumer.subscriptions.create({ channel: "ChatChannel", thread_id: 123 }, {
//     connected() {
//       // Called when the subscription is ready for use on the server
//     },
// 
//     disconnected() {
//       // Called when the subscription has been terminated by the server
//     },
// 
//     received(data) {
//       console.log(data)
//       // Called when there's incoming data on the websocket for this channel
//     },
// 
//     sync: function() {
//       return this.perform('sync');
//     }
//   })  
// })
// 
