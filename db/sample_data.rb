# Sample data for the application
#
# The command `bin/run db sample_data` executes these seeds

relations = Hanami.application["persistence.rom"].relations


authors_rel = relations[:authors]
articles_rel = relations[:articles]

sergio = authors_rel.changeset(:create, name: "Sergio", slug: "sergio").commit

articles_rel.changeset(:create, title: "Hello world", slug: "hello-world", author_id: sergio[:id]).commit
articles_rel.changeset(:create, title: "Hello again", slug: "hello-again", author_id: sergio[:id]).commit
