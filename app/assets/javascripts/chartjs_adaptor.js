
function getRandomColorGenerator() {
    var colorsAndShadePart = getRandomColorSet();
    return getColorGenerator(colorsAndShadePart);
}

function getRandomColorSet() {
    var shadePart = Math.floor(Math.random() * 3);
    var red = Math.floor(Math.random() * 256);
    var green = Math.floor(Math.random() * 256);
    var blue = Math.floor(Math.random() * 256);
    return [red, green, blue, shadePart];   
}

function getColorGenerator(colorsAndShadePart) {
    return function() {
        var shades = [100, 200];    
        var alpha = 0.8;
        var colors = colorsAndShadePart.slice(0, 3);
        var shadePart = colorsAndShadePart[3];
        return function (ratio) {  
            colors[shadePart] = shades[0] + ratio * (shades[1] - shades[0]);          
            return `rgba(${colors[0]}, ${colors[1]}, ${colors[2]}, ${alpha})`
        };
    }();
}

function getDataOption(algorithms, results, testCases, colorGetter, chartType) {
    if (chartType == "line") {
        // line chart should transpose axis
        var temp = algorithms.map(function(e){ return e[0]; });
        algorithms = testCases.map(function(e){ return [e]; });
        testCases = temp;
        //alert(JSON.stringify(algorithms));
       // alert(JSON.stringify(testCases));
        var newResults = [];
        while (results[0].length > 0) {
            var tempRow = [];
            for (var j = 0; j < results.length; j++) {
                tempRow.push(results[j].shift());
            }    
            newResults.push(tempRow);           
        }
        results = newResults;
       // alert(JSON.stringify(results));
    }

    return {
        labels: algorithms.map(arr => arr[0]),
        datasets: testCases.map(function (test_case, i) {                
            return { fill: false, label: test_case, backgroundColor: colorGetter(1.0 * i / (testCases.length - 1)), data: results.map(arr => arr[i]) }
        })
    };
}

function drawChart(chartId, algorithms, results, testCases, titleString, unitString, colors, duration, chartType) {
    var ctx = document.getElementById(chartId);
    var myChart = new Chart(ctx, {
        type: chartType,
        data: getDataOption(algorithms, results, testCases, colors, chartType),
        options: {
            animation: { duration: duration, easing: 'easeOutQuint' },
            legend: { display: true, labels: { fontSize: 15, boxWidth: 40 } },
            scales: { xAxes: [{ scaleLabel: { display: true, labelString: unitString }, ticks: {
                beginAtZero:true
            }}] },
            title: { text: titleString, fontSize: 25, display: true },
            layout: { padding: { left: 0, right: 0, top: 0, bottom: 0 },
            maintainAspectRatio: true }
        }
    });
    return myChart;
}

