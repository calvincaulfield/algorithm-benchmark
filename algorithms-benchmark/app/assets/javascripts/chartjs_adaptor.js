
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
    return function () {
        var shades = [100, 200];
        var alpha = 0.8;
        var colors = colorsAndShadePart.slice(0, 3);
        var shadePart = colorsAndShadePart[3];
        return function (ratio, alpha2 = alpha) {
            colors[shadePart] = shades[0] + ratio * (shades[1] - shades[0]);
            return `rgba(${colors[0]}, ${colors[1]}, ${colors[2]}, ${alpha2})`
        };
    }();
}

function getDataOption(algorithms, results, testCases, colorGetter, chartType) {
    if (chartType == "line") {
        // line chart should transpose axis
        var temp = algorithms.map(function (e) { return e[0]; });
        algorithms = testCases.map(function (e) { return [e]; });
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
            if (testCases.length == 1) {
                var ratio = 0;
            } else {
                var ratio = 1.0 * i / (testCases.length - 1);
            }
            if (chartType == "line") {
                return { fill: true, pointRadius: 5, label: test_case, backgroundColor: colorGetter(ratio, 0.5), data: results.map(arr => arr[i]) };
            } else {
                return { fill: false, label: test_case, backgroundColor: colorGetter(ratio), data: results.map(arr => arr[i]) };
            }
        })
    };
}

function drawChart(chartId, algorithms, results, testCases, titleString, unitString, colors, duration, chartType) {
    if (chartType == '2d') {        
        return draw2dChart(chartId, algorithms, results, testCases, titleString, unitString, colors, duration);
    }
    
    var ctx = document.getElementById(chartId);
    var myChart = new Chart(ctx, {
        type: chartType,
        data: getDataOption(algorithms, results, testCases, colors, chartType),
        options: {
            animation: { duration: duration, easing: 'easeOutQuint' },
            legend: { display: true, labels: { fontSize: 15, boxWidth: 40 } },
            scales: {
                xAxes: [{
                    scaleLabel: { display: true, labelString: unitString }, ticks: {
                        beginAtZero: true
                    }
                }]
            },
            title: { text: titleString, fontSize: 25, display: true },
            layout: {
                padding: { left: 0, right: 0, top: 0, bottom: 0 },
                maintainAspectRatio: false
            }
        }
    });
    return myChart;
}



function make2dChartData(algorithms, results, testCases, colorGetter) {
    var value = algorithms.map(function(algo, i) {
        if (algorithms.length == 1) {
            var ratio = 0;
        } else {
            var ratio = 1.0 * i / (algorithms.length - 1);
        }       
        return { label: algorithms[i][0], backgroundColor: colorGetter(ratio, 0.2), fill: true,
            data: testCases.map(function(testCase, j) { 
                return {x: parseFloat(testCase), y: results[i][j] }; 
            })
        };
    });
    return { datasets: value  };
}

function draw2dChart(chartId, algorithms, results, testCases, titleString, unitString, colors, duration) {
    var ctx = document.getElementById(chartId);
    var myChart = new Chart(ctx, {
        type: 'line',
        data: make2dChartData(algorithms, results, testCases, colors),
        options: {
            animation: { duration: duration, easing: 'easeOutQuint' },
            legend: { display: true, labels: { fontSize: 15, boxWidth: 40 } },
            scales: {
                xAxes: [{ type: 'linear', position: 'bottom',
                    scaleLabel: { display: false }, 
                    ticks: {
                        beginAtZero: true
                    }
                }],
                yAxes: [{
                    type: 'linear',
                    position: 'left',
                    scaleLabel: { display: true, labelString: unitString },
                    ticks: {
                        beginAtZero: true
                    }
                }]
            },
            title: { text: titleString, fontSize: 25, display: true },
        }
    });
    return myChart;
}

function tset() {
    var scatterChart = new Chart("aaa", {
        type: 'line',
        data: {
            datasets: [{
                label: 'Recursive',
                backgroundColor: 'red',
                data: [{
                    x: 800,
                    y: 20
                }, {
                    x: 1200,
                    y: 25
                }, {
                    x: 1280,
                    y: 50
                }]
            },
            {
                label: 'MKL',
                data: [{
                    x: 800,
                    y: 30
                }, {
                    x: 1200,
                    y: 35
                }, {
                    x: 1280,
                    y: 40
                }]
            }]
        },
        options: {
            scales: {
                xAxes: [{
                    type: 'linear',
                    position: 'bottom',
                    ticks: {
                        beginAtZero: true
                    }
                }],
                yAxes: [{
                    type: 'linear',
                    position: 'left',
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });

}