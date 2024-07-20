<script>
export default{
    name: 'form_customer',
    data(){
        return{
            data_customer : [],
            currentPage : 1,
            itemsPerPage : 10
        }
    },
    created(){
        this.fetchData()
    },
    methods:{
        fetchData(){
            fetch('/data/form_customer.json')
            .then(response => response.json())
            .then(data => {
                this.data_customer = data
                console.log(data)
            })
            .catch(error => {
                console.error('Error fetching data', error)
            })
        },
        nextPage() {
            if (this.currentPage < this.totalPages) {
                this.currentPage++;
            }
        },
        prevPage(){
            if (this.currentPage > 1) {
                this.currentPage--;
            }
        },
        gotoPage(page) {
            if (page >= 1 && page <= this.totalPages){
                this.currentPage = page;
            }
        },
        formatCurrency(value) {
            // Convert number to string
            const numberString = value.toString();
            // Insert periods as thousand separators
            return numberString.replace(/\B(?=(\d{3})+(?!\d))/g, '.');
        }
    },
    computed:{
        totalPages(){
            return Math.ceil(this.data_customer.length / this.itemsPerPage)
        },

        paginatedData() {
            const start = (this.currentPage - 1) * this.itemsPerPage;
            const end = start + this.itemsPerPage;

            return this.data_customer.slice(start,end)
        }
    }
}
</script>

<template>
    <div class="container-fluid">
        <div class="bg-custom">
            <div class="main-content-app">
                <h1>
                    <b>Form Customer</b>
                </h1>
                <p>Setiap 1 Bulan form ini akan diperbarui sesuai dari database yang berjalan.</p>

                <table class="table table-striped">
                    <thead class="table-dark">
                        <tr>
                            <th>Invoice ID</th>
                            <th>Date</th>
                            <th>Customer</th>
                            <th>Payable Amount</th>
                            <th>Paid Amount</th>
                            <th>Due</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr v-for="item in paginatedData" class="custom-list-item">
                            <th ><span class="invoice">{{ item.invoice_id }}</span></th>
                            <td>{{ item.date }}</td>
                            <td>{{ item.customer }}</td>
                            <td>
                                <div class="d-flex">
                                    <span>Rp</span>
                                    <span class="ms-auto">{{ formatCurrency(item.payable_amount) }}</span>
                                </div>
                            </td>
                            <td>
                                <div class="d-flex">
                                    <span>Rp</span>
                                    <span class="ms-auto">{{ formatCurrency(item.paid_amount) }}</span>

                                </div>
                            </td>
                            <td>{{ item.due }}</td>
                        </tr>
                    </tbody>
                </table>

                <nav>
                    <ul class="pagination justify-content-center">
                        <li class="page-item">
                            <a class="page-link" @click="prevPage" :disabled="currentPage === 1">
                            <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>

                        <li class="page-item" v-for="page in totalPages" :key="page" :class="{ 'active': currentPage === page }">
                            <a class="page-link" @click="gotoPage(page)">{{ page }}</a>
                        </li>

                        <li class="page-item">
                            <a class="page-link" @click="nextPage" :disabled="currentPage === totalPages">
                            <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>

            </div>

        </div>
    </div>

</template>

<style scoped>

.bg-custom{
    background-color: white;
    margin-top: 10px;
    border-radius: 10px;
    padding-top: 20px;
    padding-bottom: 20px;
    margin-bottom: 20px;
}

.main-content-app {
    margin: 0px 20px;
    margin-bottom: 20px;
}

.custom-list-item{
    padding-top: 40px;
    padding-bottom: 40px;
}

.invoice {
    color: #0B63F8;
}

</style>