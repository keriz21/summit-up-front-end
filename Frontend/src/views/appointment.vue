<script>

import SideBar from '../components/SideBar.vue';
import navbar from '../components/navbar.vue';
import info_n_search from '../components/appointment/info_n_search.vue'
import infobox from '../components/infobox.vue';
import form_customer from '../components/appointment/form_customer.vue';

export default {
    name : 'Appointment',
    components: {
        SideBar,
        navbar,
        info_n_search,
        infobox,
        form_customer
    }
}

</script>

<template>
    <div>
        <SideBar></SideBar>
        <div class="main-content">
            <navbar msg="Appointment" style="margin-bottom: 10px;"></navbar>
            <div class="main-content-2">
                <info_n_search />
                <infobox />

                <div>
                    <form_customer/>
                </div>
            </div>
        </div>
    </div>
</template>

<style>

.main-content {
  margin-left: 200px;
  background-color: #f5f5f5;
  min-height: 100vh;
  /* padding: 20px; */
  box-sizing: border-box;
  padding-bottom: 20px;
}

.main-content-2 {
    margin-top: 20px;
    margin-left: 20px;
}


</style>