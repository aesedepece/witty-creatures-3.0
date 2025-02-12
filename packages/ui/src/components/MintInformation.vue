<template>
  <div v-if="player.mintInfo" class="mint-content">
    <div class="info" v-if="player.mintInfo?.mintExternalConfirmation">
      <p class="label">MINTING BLOCK</p>
      <p class="link bold">
        <a
          :href="`${NETWORKS[player.mintConfig].blockExplorerUrls[0]}/block/${
            player.mintInfo.blockNumber
          }`"
          target="_blank"
          >{{ truncate(player.mintInfo.blockNumber) }}
        </a>
        <SvgImage class="external-link-icon" :svg="externalLink" />
      </p>
    </div>
    <div class="info" v-else>
      <p class="label">MINTING TRANSACTION</p>
      <p class="link bold">
        <a
          :href="`${NETWORKS[player.mintConfig].blockExplorerUrls[0]}/tx/${
            player.mintInfo?.txHash
          }`"
          target="_blank"
          >{{ truncate(player.mintInfo?.txHash) }}
        </a>
        <SvgImage class="external-link-icon" :svg="externalLink" />
      </p>
    </div>
    <div
      class="info"
      v-if="
        player.mintInfo?.mintConfirmation ||
        player.mintInfo?.mintExternalConfirmation
      "
    >
      <div class="link bold">
        <a :href="marketplaceURL" target="_blank"
          >See token #{{ player.guildRanking }} on
          {{ NETWORKS[player.mintConfig].marketplaceName }}</a
        >
        <SvgImage class="external-link-icon" :svg="externalLink" />
      </div>
    </div>
  </div>
</template>
<script>
import { useStore } from '@/stores/player'
import externalLink from '@/assets/external-black.svg?raw'
import { truncate } from '@/utils'
import { OPENSEA_BASE_URL, NETWORKS, TOKEN_STATUS } from '../constants'
import { computed } from 'vue'
export default {
  setup() {
    const player = useStore()
    const marketplaceURL = computed(
      () =>
        `${NETWORKS[player.mintConfig].marketplace}/${
          NETWORKS[player.mintConfig].contractAddress
        }/${player.guildRanking}`
    )
    return {
      openseaBaseUrl: OPENSEA_BASE_URL,
      marketplaceURL,
      player,
      externalLink,
      NETWORKS,
      TOKEN_STATUS,
      truncate,
    }
  },
}
</script>
<style lang="scss" scoped>
.mint-content {
  border-radius: 4px;
  display: grid;
  align-items: flex-end;
  grid-template-rows: max-content max-content;
  row-gap: 4px;
  .status {
    font-weight: bold;
    grid-gap: 8px;
    font-size: 13px;
    display: grid;
  }
  .opensea {
    font-weight: bold;
  }
  .tokenIds {
    text-align: center;
    .token {
      margin-right: 8px;
    }
  }
  .info {
    font-size: 16px;
    justify-content: center;
    .label {
      color: $dark-screen;
      font-weight: bold;
    }
    .link {
      text-decoration: underline;
      line-break: anywhere;
      font-weight: bold;
      padding-bottom: 4px;
    }
    .external-link-icon {
      width: 12px;
      margin-left: 4px;
      display: inline-block;
    }
  }
}
</style>
