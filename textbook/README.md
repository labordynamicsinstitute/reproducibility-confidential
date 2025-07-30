# Reproducbility when data are confidential 

Reproducibility when data are confidential

## Author

- Lars Vilhuber
- Laurel Krovetz

## All versions (archived)

zenodo link

## Building

- The presentation is built using [Quarto](https://quarto.org/).
- The text book website is built using [Jupyter Book](https://jupyterbook.org/).

### Building the website

- Create Python environment: `python -m venv book-env`
- Activate the environment:
  - On Windows: `book-env\Scripts\activate`
  - On macOS/Linux: `source book-env/bin/activate`
- Install Python requirements: `pip install -r requirements.txt`
- Build the website: `jupyter-book build .`

This is all in `build-book.sh`.

## License

creative commoms license link