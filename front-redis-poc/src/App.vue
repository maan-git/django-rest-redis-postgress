<template>
  <div id="app">
    <HelloWorld/>
    <ListItems></ListItems>
  </div>
</template>

<script>
import HelloWorld from './components/HelloWorld.vue'
import ListItems from './components/ListItems.vue'

export default {
  name: 'App',
  components: {
    HelloWorld,
    ListItems,
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
