db = require('./db')

Events = db.Model.extend
  tableName:    'events'
  attendees:    -> @belongsToMany(Users).through Tickets, 'event_id', 'attendee_id'
  organisers:   -> @belongsToMany Users, 'events_organisers', 'event_id', 'organiser_id'
  group:        -> @hasOne Groups, 'group_id'

ExternAuths = db.Model.extend
  tableName:    'externauths'
  user:         -> @belongsTo Users

Groups = db.Model.extend
  tableName:    'groups'
  members:      -> @belongsToMany Users, 'groups_members', 'group_id', 'member_id'
  organisers:   -> @belongsToMany Users, 'groups_organisers', 'group_id', 'organiser_id'
  events:       -> @hasMany Events

Tickets = db.Model.extend
  tableName:    'tickets'
  attendee:     -> @belongsTo Users, 'attendee_id'
  event:        -> @belongsTo Events, 'event_id'

Users = db.Model.extend
  tableName:    'users'
  attending:    -> @belongsToMany(Events).through Tickets, 'attendee_id', 'event_id'
  organising:   -> @belongsToMany Events, 'events_organisers', 'organiser_id', 'event_id'
  member:       -> @belongsToMany Groups, 'groups_members', 'group_id', 'member_id'
  organiser:    -> @belongsToMany Groups, 'groups_organisers', 'group_id', 'organiser_id'
  externauths:  -> @hasMany ExternAuths

module.exports = {Events, ExternAuths, Groups, Tickets, Users}
