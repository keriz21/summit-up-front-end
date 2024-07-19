<template>
    <h2><b>Top Product</b></h2>

    <ul class="list-group list-group-flush">
        <li class="list-group-item d-flex">
            <div>
                ikan tongkaol
            </div>

            <div class="ms-auto">
                <p>ikan</p>
                sales
            </div>
        </li>
    </ul>
</template>

<script>
export default {
    name : 'top_product',
    data(){
        return {
            top_product : [],
        }
    },
    created(){

    },
    methods:{
        fetchData(){
            fetch('/data/top_product.json')
            .then(response => response.json())
            .then(data => {
                this.top_product = data
            })
            .catch(error => {
                console.error('Error fetching data:', error)
            })
        }
    }
}
</script>