<template>
    <h2><b>Top Product</b></h2>

    <ul class="list-group list-group-flush">
        <li class="list-group-item d-flex">
            <div class="pembeli-name">
                ikan tongkaol
            </div>

            <div class="ms-auto">
                <span class="object-terjual">ikan</span>
                <span class="object-sale">sales</span>
            </div>
        </li>

        <li class="list-group-item d-flex" v-for="item in product">
            <div class="pembeli-name">
                {{ item.product_name }}
            </div>

            <div class="ms-auto">
                <span class="object-terjual">{{item.sales_count}}</span>
                <span class="object-sale">sales</span>
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
        this.fetchData()
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
    },
    computed:{
        product(){
            const sorted = this.top_product.sort((a,b) => b.sales_count - a.sales_count);

            return sorted.slice(0,5)
        }
    }
}
</script>

<style>
    .pembeli-name{
        font-size: 18px;
        font-weight: bold;
    }

    .object-terjual{
        font-size: 18px;
        font-weight: bold;
        margin-right: 10px;
    }

    .object-sales{
        font-size: 12px;
    }

    .list-group-item{
        margin-top: 5px;
        margin-bottom: 5px;
    }
</style>