import { useEffect } from 'react'
import { useSettingsContext, SettingsActions } from '../hooks/SettingsContext'
import { useHyperspaceContext } from '../hyperspace/hooks/HyperspaceContext'
import { usePlayer } from '../hooks/usePlayer'
import { useAgent } from '../hooks/useAgent'
import { ChatDialog } from 'endlessquestagent'
import { coordToSlug } from '@rsodre/crawler-data'

declare global {
  interface Window { QuestNamespace: any }
}

export const ChatInterface = () => {
  const { realmCoord, isChatting, dispatch } = useSettingsContext()

  const _onStopChatting = () => {
    dispatch({
      type: SettingsActions.SET_IS_CHATTING,
      payload: false,
    })
  }
  useEffect(() => {
    window.QuestNamespace.controlsEnabled = !isChatting
  }, [isChatting])

  const { remoteStore } = useHyperspaceContext()
  const { agentEntity } = usePlayer()
  const { coord } = useAgent(agentEntity)
  const chamberSlug = coordToSlug(coord ?? 0n, null) ?? ''

  if (!isChatting) return <></>

  return (
    <div className='FadedCover' onClick={() => _onStopChatting()}>
      <div className='FillScreen CenteredContainer'>
        <div onClick={(e) => e.stopPropagation()}>
          <ChatDialog
            store={remoteStore}
            realmCoord={realmCoord}
            chamberSlug={chamberSlug}
            isChatting={isChatting}
            onStopChatting={_onStopChatting}
          />
        </div>
      </div>
    </div>
  )
}
