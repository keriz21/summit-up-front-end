<template>
    <table class="table">
        <thead class="table-dark">
            <tr>
                <th scope="col">ID Barang</th>
                <th scope="col">Nama Barang</th>
                <th scope="col">Ketersediaan</th>
                <th scope="col">Perubahan</th>
            </tr>
        </thead>

        <tbody >
            <tr v-for="barang in paginatedDate">
                <th scope="row">{{ barang.id }}</th>
                <td>{{ barang.nama_barang }}</td>
                <td>{{ barang.jumlah}}</td>
                <td>
                    <button class="btn btn-primary"><i class="bi bi-pencil"></i> Edit</button>
                    <button class="btn btn-danger"><i class="bi bi-trash"></i> Delete</button>
                </td>
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
</template>

<script>
export default {
    name : 'form_barang',
    data() {
        return {
            baranglist: [],
            currentPage : 1,
            itemsPerPage : 7
        }
    },
    created() {
        this.fetchData()
    },
    methods:{
        fetchData(){
            fetch('/data/form_barang.json')
            .then(response => response.json())
            .then(data => {
                this.baranglist = data
            })
            .catch(error => {
                console.error('Error fetching data:', error);
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
        }
    },
    computed: {
        totalPages(){
            return Math.ceil(this.baranglist.length / this.itemsPerPage);
        },
        paginatedDate() {
            const start = (this.currentPage - 1) * this.itemsPerPage;
            const end = start + this.itemsPerPage;
            return this.baranglist.slice(start, end);
        }
    }
}
</script>