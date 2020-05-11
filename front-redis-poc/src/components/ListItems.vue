<template>
    <div class="list-items">
        <ul>
            <li>Item 1</li>
        </ul>
        <button @click="loadItems()">Load</button>
    </div>
</template>

<script>
import api from '../store/api.js';

export default {
  name: 'HelloWorld',
  props: {
    msg: String
  },
  methods: {
    loadItems() {
      api().get('api/items').then((s) => {
        console.log('Success: ', s);
      }).catch((error) => {
        console.log('Error: ', error);
      });
    }
  }
}

</script>

        <!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.list-items{
  margin: 0 auto;
  width: 300px;
}
.list-items ul {
  list-style-type: none;
  padding: 0;
}
.list-items li {
  display: inline;
  width: 100%;
  margin: 0 10px;
}
.list-items a {
  color: #42b983;
}

</style>
