set(FLEX_OUTPUT_FILES
    ${CMAKE_CURRENT_BINARY_DIR}/Scanner.c
    )

# Generate lexer code
add_custom_command(COMMAND ${FLEX_EXECUTABLE}
    -o "${CMAKE_CURRENT_BINARY_DIR}/Scanner.c"
    Scanner.l
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
    OUTPUT ${FLEX_OUTPUT_FILES}
    DEPENDS Scanner.l
    )

add_custom_target(GenerateScanner ALL
    DEPENDS ${FLEX_OUTPUT_FILES}
    )

add_executable(Scanner
    Scanner.l
    ${FLEX_OUTPUT_FILES}
    )

target_link_libraries(Scanner
    ${FLEX_LIBRARIES}
    )