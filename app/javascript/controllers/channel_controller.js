import ApplicationController from "./application_controller"
import consumer from "../channels/consumer"

export default class extends ApplicationController {
  static targets = ["messages", "newMessage"]

  connect() {
    this.subscription = consumer.subscriptions.create(
      {
        channel: "MessageChannel",
        id: this.data.get("id")
      },
      {
        connected: this.connected.bind(this),
        disconnected: this.disconnected.bind(this),
        received: this.received.bind(this)
      }
    )
  }

  disconnect() {
    consumer.subscriptions.remove(this.subscription)
  }

  connected() {
    // Called when the subscription is ready for use on the server
  }

  disconnected() {
    // Called when the subscription has been terminated by the server
  }

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    if (data.message) {
      this.messagesTarget.insertAdjacentHTML("beforeend", data.message)
    }
  }

  clearMessage() {
    this.newMessageTarget.value = ""
  }
}
