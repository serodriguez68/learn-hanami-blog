# Sample data for the application
#
# The command `bin/run db sample_data` executes these seeds


require 'faker'

relations = Hanami.application["persistence.rom"].relations

authors_rel = relations[:authors]
articles_rel = relations[:articles]

author1 = authors_rel.changeset(:create, name: Faker::Name.name , slug: "author-1").commit
author2 = authors_rel.changeset(:create, name: Faker::Name.name , slug: "author-2").commit

articles_rel.changeset(
  :create,
  title: Faker::Lorem.sentence(word_count: 3),
  body:  Faker::Lorem.paragraph(sentence_count: 5),
  slug:  "title-1",
  author_id: author1[:id]
).commit

articles_rel.changeset(
  :create,
  title: Faker::Lorem.sentence(word_count: 3),
  body:  Faker::Lorem.paragraph(sentence_count: 5),
  slug:  "title-2",
  author_id: author2[:id]
).commit
