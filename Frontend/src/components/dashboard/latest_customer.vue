<template>
    <h2><b>Latest Customer</b></h2>
    <ul class="list-group list-group-flush">
        <!-- <li class="list-group-item" v-for="angka in number" :key="number">{{ angka }}</li> -->
        <li class="list-group-item pembeli-item d-flex">
            <img src="/vite.svg" alt="" class="img-thumbnail">
            <div class="pembeli-details">
                <div class="pembeli-name">asep setiawan</div>
                <div class="pembeli-email">example@gmail.com</div>
            </div>

            <div class="pembeli-amount ms-auto">
                Rp 1.000.000
            </div>
        </li>

        <li class="list-group-item pembeli-item d-flex" v-for="data in latestCustomer">
            <img :src="data.img" alt="" class="img-thumbnail">
            <div class="pembeli-details">
                <div class="pembeli-name">{{data.name}}</div>
                <div class="pembeli-email">example@gmail.com</div>
            </div>

            <div class="pembeli-amount ms-auto">
                Rp {{ formatCurrency(data.purchase_money) }}
            </div>
        </li>
    </ul>
</template>

<script>

export default {
    name : 'latest_customer',
    data() {
        return {
            customer_date :[],
            number : Array.from({length : 10}, (v,k) => k + 1)
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
        },
        formatCurrency(value) {
            // Convert number to string
            const numberString = value.toString();
            // Insert periods as thousand separators
            return numberString.replace(/\B(?=(\d{3})+(?!\d))/g, '.');
        }
    },
    computed:{
        latestCustomer(){
            const sorted = this.customer_date.sort((a,b) => new Date(b.purchase_date) - new Date(a.purchase_date));

            return sorted.slice(0,5)
        }
    }
}

</script>

<style>

.pembeli-item {
    display: flex;
    align-items: center;
    margin-bottom: 15px;
    padding: 10px;;
}

.pembeli-item img {
    margin-right: 5px;
    border: none;
}

.pembeli-details {
    flex-grow: 1;
}

.pembeli-name {
    font-size: 18px;
    font-weight: bold;
}

.pembeli-email {
    font-size: 14px;
    color: #666;
}

.pembeli-amount {
    font-size: 16px;
    font-weight: bold;
    color: #28a745;
}

</style>
