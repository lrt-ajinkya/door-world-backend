const express = require("express");
const xl = require("excel4node");
const router = express.Router();

const QUANTITY_COL = 7;
const PRICE_COL = 8;
const NAME_COL_FROM = 1;
const NAME_COL_TO = 6;

router.post("/export", (req, res) => {
  const { name, heightAndWidth, categories, hingeType } = req.body;

  let wb = new xl.Workbook({
    author: "Munitus",
  });

  let ws = wb.addWorksheet("Specification", {
    pageSetup: {
      paperSize: "A4_PAPER",
      fitToWidth: 1,
    },
    printOptions: {
      centerHorizontal: true,
      centerVertical: true,
    },
  });

  // STYLES
  let categoryHeader = wb.createStyle({
    font: {
      color: "#E31E24",
      size: 16,
    },
  });

  let priceStyle = wb.createStyle({
    numberFormat: '##0.00" EUR"; [Red]-##0.00" EUR"; 0.00" EUR"',
  });

  let quantityStyle = wb.createStyle({
    font: {
      bold: true,
    },
    alignment: {
      wrapText: true,
      horizontal: "center",
    },
  });

  let nameStyle = wb.createStyle({
    alignment: {
      wrapText: true,
    },
  });

  let totalStyle = wb.createStyle({
    font: {
      bold: true,
    },
    alignment: {
      wrapText: true,
    },
    border: {
      left: {
        style: "medium",
        color: "#000000",
      },
      right: {
        style: "medium",
        color: "#000000",
      },
      top: {
        style: "medium",
        color: "#000000",
      },
      bottom: {
        style: "medium",
        color: "#000000",
      },
    },
  });

  let totalTextStyle = wb.createStyle({
    font: {
      bold: true,
    },
    alignment: {
      horizontal: "right",
    },
  });

  let bold = wb.createStyle({
    font: {
      bold: true,
    },
    alignment: {
      wrapText: true,
    },
  });

  let specNameStyle = wb.createStyle({
    font: {
      size: 18,
    },
    alignment: {
      wrapText: true,
    },
  });

  let heightAndWidthStyle = wb.createStyle({
    font: {
      size: 14,
    },
    alignment: {
      wrapText: true,
    },
  });

  let centered = wb.createStyle({
    alignment: {
      wrapText: true,
      horizontal: "center",
    },
  });

  let centeredBolded = wb.createStyle({
    font: {
      bold: true,
    },
    alignment: {
      wrapText: true,
      horizontal: "center",
    },
  });

  // IMAGES;
  ws.row(3).setHeight(80);
  ws.cell(1, 7, 2, 8, true);
  ws.addImage({
    path: `${__dirname}/../images/munitus.png`,
    type: "picture",
    position: {
      type: "oneCellAnchor",
      from: {
        col: 7,
        colOff: "0.2cm",
        row: 1,
        rowOff: "0.1cm",
      },
    },
  });

  ws.cell(3, 1, 3, 2, true);
  ws.addImage({
    path: `${__dirname}/../images/hinge_inwards_right.png`,
    type: "picture",
    position: {
      type: "oneCellAnchor",
      from: {
        col: 1,
        colOff: "1.5cm",
        row: 3,
        rowOff: "0.35cm",
      },
    },
  });

  ws.cell(3, 3, 3, 4, true);
  ws.addImage({
    path: `${__dirname}/../images/hinge_outwards_left.png`,
    type: "picture",
    position: {
      type: "oneCellAnchor",
      from: {
        col: 3,
        colOff: "1.5cm",
        row: 3,
        rowOff: "0.35cm",
      },
    },
  });

  ws.cell(3, 5, 3, 6, true);
  ws.addImage({
    path: `${__dirname}/../images/hinge_outwards_right.png`,
    type: "picture",
    position: {
      type: "oneCellAnchor",
      from: {
        col: 5,
        colOff: "1.5cm",
        row: 3,
        rowOff: "0.35cm",
      },
    },
  });

  ws.cell(3, 7, 3, 8, true);
  ws.addImage({
    path: `${__dirname}/../images/hinge_inwards_left.png`,
    type: "picture",
    position: {
      type: "oneCellAnchor",
      from: {
        col: 7,
        colOff: "1.5cm",
        row: 3,
        rowOff: "0.35cm",
      },
    },
  });

  ws.cell(4, 1, 4, 2, true).string("Inwards right hinges").style(centered);
  ws.cell(4, 3, 4, 4, true).string("Outwards left hinges").style(centered);
  ws.cell(4, 5, 4, 6, true).string("Outwards right hinges").style(centered);
  ws.cell(4, 7, 4, 8, true).string("Inwards left hinges").style(centered);

  if (
    hingeType === "hingeInwardsRight" ||
    hingeType === "hinge_inwards_right"
  ) {
    ws.cell(5, 1, 5, 2, true).string("[X]").style(centeredBolded);
  } else {
    ws.cell(5, 1, 5, 2, true).style(centeredBolded);
  }

  if (
    hingeType === "hingeOutwardsLeft" ||
    hingeType === "hinge_outwards_left"
  ) {
    ws.cell(5, 3, 5, 4, true).string("[X]").style(centeredBolded);
  } else {
    ws.cell(5, 3, 5, 4, true).style(centeredBolded);
  }

  if (
    hingeType === "hingeOutwardsRight" ||
    hingeType === "hinge_outwards_right"
  ) {
    ws.cell(5, 5, 5, 6, true).string("[X]").style(centeredBolded);
  } else {
    ws.cell(5, 5, 5, 6, true).style(centeredBolded);
  }

  if (hingeType === "hingeInwardsLeft" || hingeType === "hinge_inwards_left") {
    ws.cell(5, 7, 5, 8, true).string("[X]").style(centeredBolded);
  } else {
    ws.cell(5, 7, 5, 8, true).style(centeredBolded);
  }

  ws.cell(1, 1, 1, 6, true).string(name).style(specNameStyle);
  ws.cell(2, 1, 2, 6, true).string(heightAndWidth).style(heightAndWidthStyle);

  let rowCounter = 6;

  categories.forEach((category) => {
    ws.cell(rowCounter, NAME_COL_FROM, rowCounter, NAME_COL_TO, true)
      .string(category.name)
      .style(categoryHeader);
    rowCounter++;

    category.rows.forEach((row) => {
      if (row.bold) {
        ws.cell(rowCounter, NAME_COL_FROM, rowCounter, NAME_COL_TO, true)
          .string(row.name)
          .style(bold);
      } else {
        ws.cell(rowCounter, NAME_COL_FROM, rowCounter, NAME_COL_TO, true)
          .string(row.name)
          .style(nameStyle);
      }

      if (row.quantity && row.quantity !== 0) {
        if (typeof row.quantity === "string") {
          try {
            const quantity = Number(row.quantity);

            ws.cell(rowCounter, QUANTITY_COL)
              .number(quantity)
              .style(quantityStyle);
          } catch (e) {
            console.warn("Cannot parse quantity to int");
          }
        } else {
          ws.cell(rowCounter, QUANTITY_COL)
            .number(row.quantity)
            .style(quantityStyle);
        }
      }

      ws.cell(rowCounter, PRICE_COL)
        .number(Number(row.price))
        .style(priceStyle);
      rowCounter++;
    });
  });

  ws.cell(rowCounter, NAME_COL_FROM, rowCounter, NAME_COL_TO, true);

  ws.cell(rowCounter, QUANTITY_COL).string("Total").style(totalTextStyle);

  ws.cell(rowCounter, PRICE_COL)
    .formula(`SUM(H4:H${rowCounter - 1})`)
    .style(totalStyle);

  return wb.write(`${name}`, res);
});

module.exports = router;
