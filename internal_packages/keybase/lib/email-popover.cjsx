{React, Actions} = require 'nylas-exports'
{ParticipantsTextField} = require 'nylas-component-kit'
_ = require 'underscore'

module.exports =
class EmailPopover extends React.Component
  constructor: ->
    @state = {to: [], cc: [], bcc: []}

  render: ->
    participants = @state

    <div className="keybase-import-popover">
      <span className="title">
        Associate Emails with Key
      </span>
      <ParticipantsTextField
        field="to"
        className="keybase-participant-field"
        participants={ participants }
        change={ @_onRecipientFieldChange } />
      <button className="btn btn-toolbar" onClick={ @_onDone }>Done</button>
    </div>

  _onRecipientFieldChange: (contacts) =>
    @setState(contacts)

  _onDone: =>
    @props.onPopoverDone _.pluck(@state.to, 'email')
    Actions.closePopover()
