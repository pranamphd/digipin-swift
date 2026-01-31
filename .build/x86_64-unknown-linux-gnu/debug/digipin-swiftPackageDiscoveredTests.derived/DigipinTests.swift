import XCTest
@testable import DigipinTests

fileprivate extension ConstantsTests {
    @available(*, deprecated, message: "Not actually deprecated. Marked as deprecated to allow inclusion of deprecated tests (which test deprecated functionality) without warnings")
    static nonisolated(unsafe) let __allTests__ConstantsTests = [
        ("testSymbolToIndexMapMatchesGrid", testSymbolToIndexMapMatchesGrid),
        ("testSymbolsMatchLabelGrid", testSymbolsMatchLabelGrid)
    ]
}

fileprivate extension DecodeTests {
    @available(*, deprecated, message: "Not actually deprecated. Marked as deprecated to allow inclusion of deprecated tests (which test deprecated functionality) without warnings")
    static nonisolated(unsafe) let __allTests__DecodeTests = [
        ("testDecodeAcceptsFormattedDigipin", testDecodeAcceptsFormattedDigipin),
        ("testDecodeAcceptsLowercaseAndSeparators", testDecodeAcceptsLowercaseAndSeparators),
        ("testDecodeEncodeDecodeIsStable", testDecodeEncodeDecodeIsStable),
        ("testDecodeRejectsInvalidSymbols", testDecodeRejectsInvalidSymbols)
    ]
}

fileprivate extension EncodeTests {
    @available(*, deprecated, message: "Not actually deprecated. Marked as deprecated to allow inclusion of deprecated tests (which test deprecated functionality) without warnings")
    static nonisolated(unsafe) let __allTests__EncodeTests = [
        ("testBoundaryNorthEast", testBoundaryNorthEast),
        ("testBoundarySouthWest", testBoundarySouthWest),
        ("testEncodeAlwaysProducesCorrectLength", testEncodeAlwaysProducesCorrectLength),
        ("testEncodeDecodeRoundTripWithinErrorBounds", testEncodeDecodeRoundTripWithinErrorBounds),
        ("testEncodeIsDeterministic", testEncodeIsDeterministic),
        ("testEncodeKnownLocationProducesValidSymbols", testEncodeKnownLocationProducesValidSymbols),
        ("testEncodeRejectsLatitudeBelowMin", testEncodeRejectsLatitudeBelowMin),
        ("testEncodeRejectsLongitudeAboveMax", testEncodeRejectsLongitudeAboveMax),
        ("testEncodeRejectsOutsideTerritory", testEncodeRejectsOutsideTerritory)
    ]
}

fileprivate extension NormalizeTests {
    @available(*, deprecated, message: "Not actually deprecated. Marked as deprecated to allow inclusion of deprecated tests (which test deprecated functionality) without warnings")
    static nonisolated(unsafe) let __allTests__NormalizeTests = [
        ("testDoesNotModifyNormalizedDigipin", testDoesNotModifyNormalizedDigipin),
        ("testKeepsNonSeparatorCharactersExceptCase", testKeepsNonSeparatorCharactersExceptCase),
        ("testNormalizeDoesNotAlterUnicodeLetters", testNormalizeDoesNotAlterUnicodeLetters),
        ("testNormalizeDoesNotTrimWhitespace", testNormalizeDoesNotTrimWhitespace),
        ("testNormalizeEmptyString", testNormalizeEmptyString),
        ("testNormalizeHandlesMultipleSeparators", testNormalizeHandlesMultipleSeparators),
        ("testNormalizePreservesDigits", testNormalizePreservesDigits),
        ("testRemovesSeparatorsAndUppercases", testRemovesSeparatorsAndUppercases)
    ]
}

fileprivate extension RoundTripTests {
    @available(*, deprecated, message: "Not actually deprecated. Marked as deprecated to allow inclusion of deprecated tests (which test deprecated functionality) without warnings")
    static nonisolated(unsafe) let __allTests__RoundTripTests = [
        ("testRoundtripAcrossMultipleLocations", testRoundtripAcrossMultipleLocations)
    ]
}

fileprivate extension ValidationTests {
    @available(*, deprecated, message: "Not actually deprecated. Marked as deprecated to allow inclusion of deprecated tests (which test deprecated functionality) without warnings")
    static nonisolated(unsafe) let __allTests__ValidationTests = [
        ("testAcceptsExactGeodeticBoundaries", testAcceptsExactGeodeticBoundaries),
        ("testAcceptsValidDigipinFormat", testAcceptsValidDigipinFormat),
        ("testAcceptsValidGeodeticCoordinates", testAcceptsValidGeodeticCoordinates),
        ("testRejectsInvalidLatitude", testRejectsInvalidLatitude),
        ("testRejectsInvalidLength", testRejectsInvalidLength),
        ("testRejectsInvalidLongitude", testRejectsInvalidLongitude),
        ("testRejectsInvalidSymbols", testRejectsInvalidSymbols),
        ("testRejectsOutsideTerritory", testRejectsOutsideTerritory),
        ("testRejectsUnnormalizedDigipin", testRejectsUnnormalizedDigipin)
    ]
}
@available(*, deprecated, message: "Not actually deprecated. Marked as deprecated to allow inclusion of deprecated tests (which test deprecated functionality) without warnings")
func __DigipinTests__allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ConstantsTests.__allTests__ConstantsTests),
        testCase(DecodeTests.__allTests__DecodeTests),
        testCase(EncodeTests.__allTests__EncodeTests),
        testCase(NormalizeTests.__allTests__NormalizeTests),
        testCase(RoundTripTests.__allTests__RoundTripTests),
        testCase(ValidationTests.__allTests__ValidationTests)
    ]
}