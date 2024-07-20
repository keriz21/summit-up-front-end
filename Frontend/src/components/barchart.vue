<template>
    <div class="chart-container" style="position: relative; height: 40vh; width: 80vw;">
        <canvas ref="barChart"></canvas>
    </div>
</template>

<script>
import {ref, onMounted} from 'vue'
import {chart} from chart.js

export default{
    name: 'BarChart',
    props:{
        data:{
            type: Array,
            required: true
        }
    }
}
</script>