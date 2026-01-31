// SPDX-License-Identifier: Apache-2.0
//
// Copyright (c) 2026 Pranam
// ORCID: https://orcid.org/0009-0007-9316-3616
//
// This code is licensed under the Apache License, Version 2.0.
//
// You may obtain a copy of the License at
//
//     https://www.apache.org/licenses/LICENSE-2.0

import XCTest

@testable import Digipin

final class ConstantsTests: XCTestCase {

    func testSymbolsMatchLabelGrid() {
        let flattened = DIGIPIN_LABEL_GRID.flatMap { $0 }

        XCTAssertEqual(
            flattened,
            DIGIPIN_SYMBOLS,
            "DIGIPIN_SYMBOLS must exactly match DIGIPIN_LABEL_GRID ordering"
        )
    }

    func testSymbolToIndexMapMatchesGrid() {
        for (rowIndex, row) in DIGIPIN_LABEL_GRID.enumerated() {
            for (columnIndex, symbol) in row.enumerated() {
                let index = DIGIPIN_SYMBOL_TO_INDEX[symbol]
                XCTAssertEqual(index?.row, rowIndex)
                XCTAssertEqual(index?.column, columnIndex)
            }
        }
    }
}
