<script>

import SideBar from '../components/SideBar.vue';
import navbar from '../components/navbar.vue';
import user_profile from '../components/user_profile.vue'

export default {
    name: 'profile',
    components: {
        SideBar,
        navbar,
        user_profile
    }
}

</script>

<template>

<div>
    <SideBar />
    <div class="main-content">
        <navbar msg="Profile"/>
        <div class="main-content-2">
            <user_profile />
        </div>
    </div>
</div>

</template>