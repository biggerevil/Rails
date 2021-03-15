export default class SortingTable {
  constructor(control) {
    this.control = control;

    this.setup();
  }

  sortRowsByTitle() {
    const table = document.querySelector("table");

    const rows = table.querySelectorAll("tr");

    const sortedRows = [];

    // Select all table rows except the first one which is the header
    for (var i = 1; i < rows.length; i++) {
      sortedRows.push(rows[i]);
    }

    let arrowUp = this.control.querySelector(".octicon-arrow-up");
    let arrowDown = this.control.querySelector(".octicon-arrow-down");

    if (arrowUp.classList.contains("hide")) {
      sortedRows.sort((rowA, rowB) =>
        rowA.cells[0].innerHTML > rowB.cells[0].innerHTML ? 1 : -1
      );
      arrowUp.classList.remove("hide");
      arrowDown.classList.add("hide");
    } else {
      sortedRows.sort((rowA, rowB) =>
        rowA.cells[0].innerHTML > rowB.cells[0].innerHTML ? -1 : 1
      );
      this.control
        .querySelector(".octicon-arrow-down")
        .classList.remove("hide");
      arrowUp.classList.add("hide");
    }

    const sortedTable = document.createElement("table");

    sortedTable.classList.add("table");
    sortedTable.appendChild(rows[0]);

    for (var i = 0; i < sortedRows.length; i++) {
      sortedTable.appendChild(sortedRows[i]);
    }

    table.parentNode.replaceChild(sortedTable, table);
  }

  setup() {
    this.control.addEventListener("click", (event) => {
      this.sortRowsByTitle();
    });
  }
}
