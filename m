Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815321;
	b=UgiSk9L4CDOxW8SEtKb64o69dvAvYGE+MH1M9G4mSsCGpPPzHJ7KOFdlgwVSfRXu6UKA
	 5issqsMnby3ns/TpVf8KU16gPHGB8tWeo6b8Nr/jiT1eizJJJLTvkxsFKgqZhEga1mKWq
	 wXyzDLV71Tbfq6CSx8uQ1M0Zsc70XKYkqVoCd5ZsJ06bXPieTuULSNWued14yuy0dmf42
	 E8HPttcwnKkQJP2nfVqXnbK/zHYi8k+Jg+I3IU8vYVjSZ/k8A92uKHCtBJJe/Y/ulnjcV
	 Y8cVUAv0vUETnH0AIMY1p0sgPGR0KAg3oEAsRg5L2MKQ2+oOxgbA+eI/RBYVHO68iag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815321;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cLOYHF0Lv0/BjR3qcyuo4v1KS+ui4vva8jXSS4FlamY=;
	b=Slom91lp4ZO4uE4dKHhsRO2+bMGltrarHGOiUch1vDBspd+RSKO/A3GP9gLORCJ1XbRG
	 gU/auZsdhcRlg6Q+zA0shjWiqeFZ3+b/rIc4RQkK7fTDCY3aXl5DbPg4u//Ir6EGlmb3D
	 IFFBuZaocZxbe6lJ/vEFJWJx4gA6pgC0rlm3OAaRnpszyI6AEyk9YaHkYf4j0dvgNSQDg
	 0f73NYv7XpbdokixFJo3EhORO8boTsDiQULtp4xfbalB2im12daZ15Z5GCPLtwFr2Er7w
	 gLf6hcD7OVCz/f9R6ObHpr9sY2WLVFvrD8PUlYaZO6lrRgbrTayejMRJ84Rgytkk3cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bY40uGzR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D72606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bY40uGzR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B16A41F000C4;
	Mon, 16 Nov 2026 07:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794815320;
	bh=cLOYHF0Lv0/BjR3qcyuo4v1KS+ui4vva8jXSS4FlamY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bY40uGzRQp+wIc87pOCXDarfjtdWYgJjxCGghCvskrrYsvIhovhC/shbEh63M54Hq
	 u66NNQ0y6r3hsntf1AJ2SmxQlCORQ3JaF7jpA6aSjGyLZqBMj7VxiM0pzWLcjificO
	 Nzgsipi0Y4BRTIGub9kC0ZyIPD+ntlpIEDmFLakEzt2IpniDzDpkn4LefSzMknOf72
	 KWH1mXCEKxw+T7k8xY+5w8Tm280NDCPptWHfry2QWUEA09vucZiCgQASryXbyM4nIA
	 y4uZ/4qou2je9Nzn/L6ImoWt2CP6w16+8OugwF/4zG4c+WZ12X3wKrInYmpaG2BBO+
	 a4AyoQr0e/9hQ==
Message-ID: <sashiko-outbox-216466@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH wireless-next v5 4/4] wifi: aic: Integrate the AIC8800
 SDIO driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yanli Yang" <yanli.yang@bedmex.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <179481380242.4.1693438763870948060@bedmex.com>
References: <179481380235.4.7388336477392853157@bedmex.com>
 <179481380242.4.1693438763870948060@bedmex.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 07:48:40 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 10 potential
issues to consider:
- [High] wifi: aic: stuck drv_conn_state in connect and NULL sta.ap in
  disconnect
- [High] wifi: aic: uninitialized cfm and OOB access in station info and
  survey
- [High] wifi: aic: wrong spinlock unlock, atomic sleep, and leaks in RX
  reorder
- [High] wifi: aic: off-by-one flow control check and stuck cmd_txstate
  in aicwf_sdio_tx_msg()
- [High] wifi: aic: missing credit update and bounds check in
  aicwf_txq_credit_update()
- [High] wifi: aic: unlocked aicwf_txdatacfm() call from
  aicwf_sdio_host_tx_cfm_handler()
- [Medium] wifi: aic: 32-bit BIT() used on 64-bit avail_idx_map in
  aicwf_main.c
- [Medium] wifi: aic: wrong array index for
  ofst_2g4_ofdm_lowrate_chan_10_13
- [Medium] wifi: aic: uninitialized HE radiotap and 40MHz VHT overflow
  in aicwf_rx_add_rtap_hdr()
- [Low] wifi: aic: missing devicetree binding file entry in MAINTAINERS
--

commit e2756605b7e0074b675225d5cc53b5d095cd0e8e
Author: Zhirun Liu <zhirunliu@aicsemi.com>

wifi: aic: Integrate the AIC8800 SDIO driver

This commit connects the AIC wireless vendor directory to the wireless
Kconfig and Makefile and adds a MAINTAINERS entry for the AIC8800 driver.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7336600952c8e..4e327fd62b26a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -746,6 +746,16 @@ L:	linux-scsi@vger.kernel.org
>  S:	Maintained
>  F:	drivers/scsi/aic7xxx/
> =20
> +AIC8800 WIRELESS DRIVER
> +M:	Zhirun Liu <zhirunliu@aicsemi.com>
> +M:	Dijia Xu <dijiaxu@aicsemi.com>
> +M:	Chunqiu Liu <chunqiuliu@aicsemi.com>
> +R:	Liheng Wei <liheng.wei@bedmex.com>
> +R:	Yanli Yang <yanli.yang@bedmex.com>
> +L:	linux-wireless@vger.kernel.org
> +S:	Maintained
> +F:	drivers/net/wireless/aic/

[Severity: Low]
Earlier in the series, commit "dt-bindings: net: wireless: Add AIC8800D80
SDIO Wi-Fi" adds
Documentation/devicetree/bindings/net/wireless/aicsemi,aic8800d80-fmac.yaml.
Should that binding file also be listed under F: here?

[ ... ]

> diff --git a/drivers/net/wireless/Makefile b/drivers/net/wireless/Makefile
> index fa3100ff3bf7b..47b999e8014ca 100644
> --- a/drivers/net/wireless/Makefile
> +++ b/drivers/net/wireless/Makefile
> @@ -4,6 +4,7 @@
>  #
> =20
>  obj-$(CONFIG_WLAN_VENDOR_ADMTEK) +=3D admtek/
> +obj-$(CONFIG_WLAN_VENDOR_AIC) +=3D aic/
>  obj-$(CONFIG_WLAN_VENDOR_ATH) +=3D ath/
>  obj-$(CONFIG_WLAN_VENDOR_ATMEL) +=3D atmel/
>  obj-$(CONFIG_WLAN_VENDOR_BROADCOM) +=3D broadcom/

[Severity: High]
In the driver enabled here, can aicwf_cfg80211_connect() leave
aicwf_vif->drv_conn_state stuck in AICWF_DRV_STATUS_CONNECTING or
AICWF_DRV_STATUS_ROAMING, and can aicwf_rx_sm_disconnect_ind() dereference a
NULL aicwf_vif->sta.ap?

drivers/net/wireless/aic/aic8800_fdrv/aicwf_main.c:aicwf_cfg80211_connect()=
 {
	if ((int)atomic_read(&aicwf_vif->drv_conn_state) =3D=3D (int)AICWF_DRV_STA=
TUS_DISCONNECTING ||
	    (int)atomic_read(&aicwf_vif->drv_conn_state) =3D=3D (int)AICWF_DRV_STA=
TUS_CONNECTING) {
		dev_err(&wiphy->dev, "driver is disconnecting or connecting ,return it\n"=
);
		return 0;
	}

	if (aicwf_vif->sta.is_roam)
		aicwf_set_conn_state(&aicwf_vif->drv_conn_state, (int)AICWF_DRV_STATUS_RO=
AMING);
	else
		aicwf_set_conn_state(&aicwf_vif->drv_conn_state, (int)AICWF_DRV_STATUS_CO=
NNECTING);
    ...
	error =3D aicwf_send_sm_connect_req(aicwf_hw, aicwf_vif, sme, &sm_connect_=
cfm);
	if (error)
		return error;
}

If the SAE check, aicwf_send_sm_connect_req(), or sm_connect_cfm.status fai=
ls
synchronously, drv_conn_state is never reset.  Once stuck in
AICWF_DRV_STATUS_CONNECTING, later scans in aicwf_scan() fail with -EBUSY a=
nd
later aicwf_cfg80211_connect() calls return 0 without starting a connection.

Conversely, if aicwf_cfg80211_disconnect() is called while drv_conn_state is
AICWF_DRV_STATUS_CONNECTING (before aicwf_rx_sm_connect_ind() assigns
aicwf_vif->sta.ap), aicwf_rx_sm_disconnect_ind() unconditionally passes
aicwf_vif->sta.ap to aicwf_txq_sta_deinit() and clears
aicwf_vif->sta.ap->valid, causing a NULL pointer dereference:

drivers/net/wireless/aic/aic8800_fdrv/aicwf_msg_rx.c:aicwf_rx_sm_disconnect=
_ind() {
    ...
	aicwf_txq_sta_deinit(aicwf_hw, aicwf_vif->sta.ap);
	aicwf_txq_tdls_vif_deinit(aicwf_vif);
	aicwf_vif->sta.ap->valid =3D false;
	aicwf_vif->sta.ap =3D NULL;
    ...
}

[Severity: High]
Can aicwf_fill_station_info() and aicwf_rx_channel_survey_ind() access
uninitialized stack memory and out-of-bounds array elements?

drivers/net/wireless/aic/aic8800_fdrv/aicwf_main.c:aicwf_fill_station_info(=
) {
    ...
	union aicwf_rate_ctrl_info *rate_info;
	struct mm_get_sta_info_cfm cfm;

	aicwf_send_get_sta_info_req(vif->aicwf_hw, sta->sta_idx, &cfm);
	sinfo->tx_failed =3D cfm.txfailed;
	rate_info =3D (union aicwf_rate_ctrl_info *)&cfm.rate_info;
    ...
	switch (rate_info->format_mod_tx) {
	case FORMATMOD_NON_HT:
	case FORMATMOD_NON_HT_DUP_OFDM:
		sinfo->txrate.flags =3D 0;
		sinfo->txrate.legacy =3D tx_legrates_lut_rate[rate_info->mcs_index_tx];
		break;
    ...
}

If aicwf_send_get_sta_info_req() fails, cfm is read uninitialized from the
stack, and the 7-bit rate_info->mcs_index_tx field indexes the 12-element
tx_legrates_lut_rate[] array without a bounds check.

In addition, aicwf_rx_channel_survey_ind() checks idx >
ARRAY_SIZE(aicwf_hw->survey) instead of >=3D, allowing an out-of-bounds wri=
te
to aicwf_hw->survey[ARRAY_SIZE(aicwf_hw->survey)]:

drivers/net/wireless/aic/aic8800_fdrv/aicwf_msg_rx.c:aicwf_rx_channel_surve=
y_ind() {
    ...
	if (idx > ARRAY_SIZE(aicwf_hw->survey))
		return 0;

	aicwf_survey =3D &aicwf_hw->survey[idx];
    ...
}

[Severity: Medium]
Does using BIT() instead of BIT_ULL() on aicwf_hw->avail_idx_map break on
32-bit architectures?

drivers/net/wireless/aic/aic8800_fdrv/aicwf_main.c:aicwf_cfg80211_init() {
    ...
	for (i =3D 0; i < NX_VIRT_DEV_MAX + NX_REMOTE_STA_MAX; i++)
		aicwf_hw->avail_idx_map |=3D BIT(i);
    ...
}

avail_idx_map is a u64 holding NX_VIRT_DEV_MAX + NX_REMOTE_STA_MAX (36) bit=
s.
On 32-bit architectures, BIT(i) overflows a 32-bit unsigned long for i >=3D=
 32,
and aicwf_hw->avail_idx_map &=3D ~BIT(vif_idx) in aicwf_interface_add() and
aicwf_virtual_interface_add() zero-extends the 32-bit mask and clears the
upper bits of avail_idx_map.

[Severity: Medium]
Does parsing "ofst_2g4_ofdm_lowrate_chan_10_13" in
aicwf_plat_nvram_set_value_group() and aicwf_plat_nvram_set_value_v3() write
to the wrong element of pwrofst2x_tbl_2g4?

drivers/net/wireless/aic/aic8800_fdrv/aicwf_platform.c:aicwf_plat_nvram_set=
_value_group() {
    ...
	} else if (!strcmp(command, "ofst_2g4_ofdm_lowrate_chan_1_4")) {
		uc->txpwr_ofst2x.pwrofst2x_tbl_2g4[2][0] =3D aicwf_atoi(value);
	} else if (!strcmp(command, "ofst_2g4_ofdm_lowrate_chan_5_9")) {
		uc->txpwr_ofst2x.pwrofst2x_tbl_2g4[2][1] =3D aicwf_atoi(value);
	} else if (!strcmp(command, "ofst_2g4_ofdm_lowrate_chan_10_13")) {
		uc->txpwr_ofst2x.pwrofst2x_tbl_2g4[2][0] =3D aicwf_atoi(value);
    ...
}

Both functions write to pwrofst2x_tbl_2g4[2][0] instead of
pwrofst2x_tbl_2g4[2][2], overwriting the channel 1-4 offset and leaving
channels 10-13 unconfigured.

[Severity: High]
Does the RX reorder code in aicwf_rx.c and aicwf_msg_rx.c unlock the wrong
spinlock, sleep in atomic context, and leak recv_msdu frames?

drivers/net/wireless/aic/aic8800_fdrv/aicwf_rx.c:reord_process_unit() {
    ...
	spin_unlock_bh(&rx_priv->stas_reord_lock);

	if (!preorder_ctrl->enable) {
		spin_lock_bh(&preorder_ctrl->reord_list_lock);
		preorder_ctrl->ind_sn =3D pframe->seq_num;
		reord_single_frame_ind(rx_priv, pframe);
		preorder_ctrl->ind_sn =3D (preorder_ctrl->ind_sn + 1) % 4096;
		spin_unlock_bh(&rx_priv->stas_reord_lock);
		return 0;
	}
    ...
}

When !preorder_ctrl->enable, reord_process_unit() locks
preorder_ctrl->reord_list_lock but unlocks rx_priv->stas_reord_lock a second
time, leaving reord_list_lock held and deadlocking the next acquisition.
Earlier in reord_process_unit(), the unsupported iftype and !reord_info err=
or
returns free skb without returning pframe to rx_priv->rxframes_freequeue via
reord_rxframe_free(), exhausting the 250-entry pool.

In reord_flush_tid(), reord_single_frame_ind() is called under
spin_lock_irqsave(&preorder_ctrl->reord_list_lock, flags), but
reord_single_frame_ind() calls spin_unlock_bh(), local_bh_enable(), and
arpoffload_proc() -> handle_dhcp_ack() -> aicwf_send_arpoffload_en_req(),
which allocates with GFP_KERNEL and waits for firmware command completion.

Finally, reord_deinit_sta() calls
cancel_work_sync(&preorder_ctrl->reord_timer_work) while callers such as
aicwf_cfg80211_del_station(), apm_staloss_work_process(), and
aicwf_rx_deinit() hold spin_lock_bh(&rx_priv->stas_reord_lock), whereas
aicwf_rx_sm_disconnect_ind() has stas_reord_lock commented out when walking
and removing from rx_priv->stas_reord_list.

[Severity: Medium]
Can aicwf_rx_add_rtap_hdr() overflow the radiotap buffer on 40 MHz VHT fram=
es
and copy uninitialized stack data on HE SU frames?

drivers/net/wireless/aic/aic8800_fdrv/aicwf_rx.c:aicwf_rx_add_rtap_hdr() {
    ...
		// bandwidth
		if (rxvect->ch_bw =3D=3D PHY_CHNL_BW_40)
			*pos++ =3D 1;
		if (rxvect->ch_bw =3D=3D PHY_CHNL_BW_80)
			*pos++ =3D 4;
		else if ((rxvect->ch_bw =3D=3D PHY_CHNL_BW_160) &&
			 phy_info->phy_center2_freq)
			*pos++ =3D 0; // 80P80
		else if (rxvect->ch_bw =3D=3D PHY_CHNL_BW_160)
			*pos++ =3D 11;
		else // 20 MHz
			*pos++ =3D 0;
    ...
	if (rxvect->format_mod =3D=3D FORMATMOD_HE_SU) {
		struct ieee80211_radiotap_he he;
    ...
}

Because the second if is missing an else, a PHY_CHNL_BW_40 VHT frame writes
both *pos++ =3D 1 and the final else's *pos++ =3D 0, advancing pos by 2 byt=
es
instead of 1 and writing 1 byte past rtap_len into the frame payload.  In t=
he
FORMATMOD_HE_SU block, struct ieee80211_radiotap_he he is not zero-initiali=
zed
on the stack before |=3D updates to data3, data5, and data6 (and with data4
never touched) before copying he into the skb.

[Severity: High]
In aicwf_sdio_tx_msg(), does the flow-control check reject transfers when
len =3D=3D buffer_cnt * BUFFER_SIZE and leave cmd_txstate stuck at true?

drivers/net/wireless/aic/aic8800_fdrv/aicwf_sdio.c:aicwf_sdio_tx_msg() {
    ...
	if (sdiodev->chip_hw->use_flowctrl_msg) {
		buffer_cnt =3D aicwf_sdio_flow_ctrl_msg(sdiodev);
		while ((buffer_cnt <=3D 0 ||
			(buffer_cnt > 0 && len > (buffer_cnt * BUFFER_SIZE))) &&
			   retry < 10) {
			retry++;
			buffer_cnt =3D aicwf_sdio_flow_ctrl_msg(sdiodev);
			dev_dbg(sdiodev->dev, "buffer_cnt =3D %d\n", buffer_cnt);
		}
	}
	down(&sdiodev->tx_priv->cmd_txsema);

	if (sdiodev->chip_hw->use_flowctrl_msg) {
		if (buffer_cnt > 0 && len < (buffer_cnt * BUFFER_SIZE)) {
			err =3D aicwf_sdio_send_pkt(sdiodev, payload, len);
			if (err)
				dev_err(sdiodev->dev, "aicwf_sdio_send_pkt fail%d\n", err);
		} else {
			dev_err(sdiodev->dev, "tx msg fc retry fail:%d, %d\n", buffer_cnt, len);
			up(&sdiodev->tx_priv->cmd_txsema);
			return -1;
		}
	}
    ...
	sdiodev->tx_priv->cmd_txstate =3D false;
}

The retry loop stops waiting when len =3D=3D buffer_cnt * BUFFER_SIZE (for
example, a 1536-byte firmware write command when buffer_cnt is 1), but the
send condition requires len < (buffer_cnt * BUFFER_SIZE).  When they are
equal, the function takes the else branch and returns -1 without clearing
sdiodev->tx_priv->cmd_txstate, causing aicwf_sdio_tx_process() to repeatedly
resend the command buffer.

[Severity: High]
Does aicwf_txq_credit_update() forget to add update to txq->credits, leaving
stopped TX queues permanently stalled?

drivers/net/wireless/aic/aic8800_fdrv/aicwf_tx.c:aicwf_txq_credit_update() {
	struct aicwf_sta *sta =3D &aicwf_hw->sta_table[sta_idx];
	struct aicwf_txq *txq;

	txq =3D aicwf_txq_sta_get(sta, tid, aicwf_hw);

	spin_lock_bh(&aicwf_hw->tx_lock);

	if (txq->idx !=3D TXQ_INACTIVE) {
#ifdef AIC8800_CREATE_TRACE_POINTS
		trace_credit_update(txq, update);
#endif
		if (txq->credits <=3D 0)
			aicwf_txq_stop(txq, AICWF_TXQ_STOP_FULL);
		else
			aicwf_txq_start(txq, AICWF_TXQ_STOP_FULL);
	}

	spin_unlock_bh(&aicwf_hw->tx_lock);
}

txq->credits is never updated with update before checking txq->credits <=3D=
 0,
so any queue that reaches 0 credits and stops with AICWF_TXQ_STOP_FULL will
never be restarted by ME_TX_CREDITS_UPDATE_IND.  In addition, neither
aicwf_rx_me_tx_credits_update_ind() nor aicwf_txq_credit_update() bounds-ch=
ecks
sta_idx or tid before indexing aicwf_hw->sta_table[sta_idx] and calling
aicwf_txq_sta_get().

[Severity: High]
Does calling aicwf_txdatacfm() from aicwf_sdio_host_tx_cfm_handler() without
aicwf_hw->tx_lock race with the TX path?

sdio_busrx_thread                 TX / netdev context
aicwf_process_rxframes()          aicwf_start_xmit() / aicwf_hwq_process_al=
l()
  aicwf_sdio_host_tx_cfm_handler()  spin_lock_bh(&aicwf_hw->tx_lock)
    aicwf_txdatacfm()               aicwf_txq_queue_skb() / aicwf_hwq_proce=
ss()
      aicwf_txq_confirm_any()         /* mutates txq->sk_list, hwq->list,
      aicwf_tx_retry()                   txq->status, and credits */
      aicwf_txq_add_to_hw_list()    spin_unlock_bh(&aicwf_hw->tx_lock)
        <-- unlocked list and credit mutation

aicwf_txdatacfm() and its helpers (aicwf_txq_confirm_any(), aicwf_tx_retry(=
),
and aicwf_txq_add_to_hw_list()) require aicwf_hw->tx_lock to serialize acce=
ss
to txq->sk_list, hwq->list, txq->status, and queue credits, but
aicwf_sdio_host_tx_cfm_handler() invokes aicwf_txdatacfm() without acquiring
aicwf_hw->tx_lock.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179481380235.4.7388=
336477392853157@bedmex.com?part=3D4
