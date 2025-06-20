document.getElementById("username").textContent = "João"; // ou substitua por valor dinâmico

function drawBarChart(canvasId, data) {
  const canvas = document.getElementById(canvasId);
  const ctx = canvas.getContext("2d");

  ctx.clearRect(0, 0, canvas.width, canvas.height);

  const barWidth = 60;
  const gap = 40;
  const startX = 30;
  const maxHeight = 150;
  const maxValue = Math.max(...data.map(d => d.value));

  data.forEach((bar, i) => {
    const barHeight = (bar.value / maxValue) * maxHeight;
    const x = startX + i * (barWidth + gap);
    const y = canvas.height - barHeight - 30;

    // Bar
    ctx.fillStyle = "#7ec6f9";
    ctx.fillRect(x, y, barWidth, barHeight);

    // Label
    ctx.fillStyle = "#333";
    ctx.fillText(bar.label, x + 10, canvas.height - 10);
  });
}

drawBarChart("chart1", [
  { label: "Up", value: 10 },
  { label: "Down", value: 4 }
]);

drawBarChart("chart2", [
  { label: "Comentários", value: 7 }
]);
