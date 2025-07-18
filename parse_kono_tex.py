import re
import json

def parse_latex(filepath):
    with open(filepath, "r", encoding="utf-8") as f:
        content = f.read()

    # Split by sections
    sections = re.split(r'\\section\{(.+?)\}', content)
    results = []

    # For each section, get the title and parse the examples.
    for i in range(1, len(sections), 2):
        section_title = sections[i].strip()
        section_body = sections[i + 1]

        # This regex looks for both \ex. and \exg. examples.
        # It assumes each entry has:
        #  - A transcription (often containing IPA or similar) before the first '\\'
        #  - A gloss or description before the next '\\'
        #  - An English translation wrapped in quotes or backticks in the following content
        entry_pattern = re.compile(
            r'\\exg?\.\s*(.*?)\\\\\s*(.*?)\\\\\s*[`\'‘“](.+?)[`\'’”]',
            re.DOTALL
        )
        entries = entry_pattern.findall(section_body)

        for transcription, gloss, english in entries:
            results.append({
                "category": section_title,
                "ipa": transcription.strip(),
                "kono": gloss.strip(),
                "english": english.strip()
            })

    return results

if __name__ == "__main__":
    # Change "01222025.tex" to the appropriate LaTeX filename if needed.
    parsed_data = parse_latex("01222025.tex")
    # Write output as data.json to match your uploaded file's name
    with open("data.json", "w", encoding="utf-8") as outfile:
        json.dump(parsed_data, outfile, indent=2, ensure_ascii=False)
