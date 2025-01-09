window.addEventListener('message', (event) => {
    const data = event.data;

    if (data.type === "updateInfo") {
        const infoBox = document.getElementById("info-box");
        const job = document.getElementById("job");
        const name = document.getElementById("name");

        job.textContent = `${data.job} - ${data.grade}`;
        name.textContent = data.playerName;

        infoBox.style.left = `${data.x}px`;
        infoBox.style.top = `${data.y}px`;
        infoBox.style.display = data.visible ? "block" : "none";
    }
});
