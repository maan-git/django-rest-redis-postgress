const ws = new WebSocket('ws://localhost:9090/ws/foobar?subscribe-broadcast&publish-broadcast&echo');
ws.onopen = function() {
    console.log("websocket connected");
};
ws.onmessage = function(e) {
    console.log("Received: " + e.data);
};
ws.onerror = function(e) {
    console.error(e);
};
ws.onclose = function(e) {
    console.log(e);
    console.log("Connection Closed");
}

export const sendMessage = (msg) => {
    if (ws) {
     ws.send(msg);
    } else {
     console.error("Message not sent");
    }
}

export default {
  sendMessage,
};