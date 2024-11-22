from config import db
from sqlalchemy import text

from entities.inproceeding import Inproceeding


def get_articles():
    result = db.session.execute(
        text("SELECT * FROM inproceedings")
    )

    result = result.fetchall()

    return [Inproceeding(inproceeding[0], inproceeding[1], inproceeding[2], inproceeding[3]) for inproceeding in result]

def add_user_inproceeding(inproceeding):
    author = inproceeding[0]
    title = inproceeding[1]
    booktitle = inproceeding[2]
    year = inproceeding[3]
    editor = inproceeding[4]
    volume = inproceeding[5]
    number = inproceeding[6]
    series = inproceeding[7]
    pages = inproceeding[8]
    address = inproceeding[9]
    month = inproceeding[10]
    organization = inproceeding[11]
    publisher = inproceeding[12]


    sql = text('''INSERT INTO inproceedings (author, title, booktitle, year, editor, volume, number, series, pages, address, month, organization, publisher)
               VALUES (:author, :title, :booktitle, :year, :editor, :volume, :number, :series, :pages, :address, :month, :organization, :publisher)''')
    
    db.session.execute(sql, {"author":author, "title":title, "booktitle":booktitle, "year":year, "editor":editor, "volume":volume, "number":number, "series":series, "pages":pages, "address":address, "month":month, "organization":organization, "publisher":publisher})


    db.session.commit()