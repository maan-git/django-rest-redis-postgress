<template>
  <div class="hello">
    <h1><a @click="sendMessage()">Send Message!</a></h1>
  </div>
</template>

<script>
import {sendMessage} from '@/plugins/ws.js'

export default {
  name: 'HelloWorld',
  props: {
    msg: String
  },
  methods: {
    sendMessage(){
      console.log('Function: ', sendMessage);
      sendMessage('test!');
    },
  },
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  cursor: pointer;
  color: #42b983;
}
</style>
