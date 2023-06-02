set(FLEX_OUTPUT_FILES
    ${CMAKE_CURRENT_BINARY_DIR}/Scanner.c
    )

set(BISON_OUTPUT_FILES
    ${CMAKE_CURRENT_BINARY_DIR}/Parser.c
    ${CMAKE_CURRENT_BINARY_DIR}/Parser.h
    )

# Generate lexer code
add_custom_command(COMMAND ${FLEX_EXECUTABLE}
    -o "${CMAKE_CURRENT_BINARY_DIR}/Scanner.c"
    Scanner.l
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
    OUTPUT ${FLEX_OUTPUT_FILES}
    DEPENDS Scanner.l
    )

# Generate parser code
add_custom_command(COMMAND ${BISON_EXECUTABLE}
    "--defines=${CMAKE_CURRENT_BINARY_DIR}/Parser.h"
    -Wcounterexamples
    --no-lines
    -o "${CMAKE_CURRENT_BINARY_DIR}/Parser.c"
    Parser.y
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
    OUTPUT ${BISON_OUTPUT_FILES}
    DEPENDS Parser.y
    )

add_custom_target(GenerateParser ALL
    DEPENDS
        ${FLEX_OUTPUT_FILES}
        ${BISON_OUTPUT_FILES}
    )

add_executable(Parser
    Scanner.l
    Parser.y
    ${FLEX_OUTPUT_FILES}
    ${BISON_OUTPUT_FILES}
    )

target_include_directories(Parser
    PRIVATE
    ${CMAKE_CURRENT_BINARY_DIR}
    )

target_link_libraries(Parser
    ${FLEX_LIBRARIES}
    m
    )
