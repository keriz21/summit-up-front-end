<script>
import navbar from '../../components/navbar.vue';
import SideBar from '../../components/SideBar.vue';
import infobox from '../../components/infobox.vue';
import debit from '../../components/payment/chart.vue'

export default{
    name : 'chart',
    components : {
        navbar,
        SideBar,
        infobox,
        debit
    }
};
</script>

<template>
<div>
    <SideBar></SideBar>
    <div class="main-content">
        <navbar msg="Payment/Chart"></navbar>
        <infobox/>

        <div class="container">
            <!-- <h1>anjing kalian semua</h1> -->
            <debit />
        </div>
    </div>
</div>

</template>