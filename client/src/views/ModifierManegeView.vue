<template>
  <div class="app">
    <div>
      <v-btn depressed color="primary">
        <router-link to="/maneges">
          <span class="boutton">Retour à la liste des manèges</span>
        </router-link>
      </v-btn>
    </div>
    <div class="manege">

    </div>
  </div>
</template>

<script>
export default {
  name: "ModifierManege",
}
</script>

<style scoped>
  v-btn{
    width: 20px;
  }
  .boutton{
    color: white;
  }
</style>