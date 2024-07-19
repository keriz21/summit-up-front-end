<template>
    <h2><b>Latest Customer</b></h2>
    
</template>

<script>

export default {
    name : 'latest_customer',
    data() {
        return {
            customer_date :[]
        }
    },
    created(){
        this.fetchData()
    },
    methods:{
        fetchData(){
            fetch('/data/purchase_date.json')
            .then(response => response.json())
            .then(data => {
                this.customer_date = data
            })
            .catch(error => {
                console.error('Error fetching data:', error)
            })
        }
    }
}

</script>

