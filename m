Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478765;
	b=DWXMxYLBweZ/a65HMvZf04rHikzSldqHdW8nFyndEHy7xOEL+qTb8uLGsH5lOIff+SGM
	 ufs0uuDLkhqDu+lblGOutMnKQfXGXZ2hYlgHRPRNHzL5Pwy5Nr5EPTOEwtW2deB1Da+Ej
	 Q9lXyEX6/k+Ebg3kBhp6+Mp/DS2WX11DhAgx59ZZNLPZvsXfALH0QkZSHaEu9iZTrtTc2
	 ludVxXlyEy1pOXvdxec9TdcIwnsx/zHtbhRBVLAXhbhyxZ3nT7z2obcHxq8ErXJ5ijV5h
	 A2HkAN3M4GQkw0vniw5OeNQPnQUzNXJWd4z2cPm33qJSK8QXKR+sSVKD0fKo6vmyppw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478765;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6ThTOqDjE9SfSJoapgBvWvpzVC+5cP1+YtPLX76dgSE=;
	b=vpUGYKlRNXcRC25jIjwjSGMQnuUazzfxSY3SehOSF4+dyJwPh1K1qEfWPqnX/JUnaMII
	 aa4CFANzP8gPJPIprhZBXP4oRx0Fqw8X71fRew+EbpKyBdcVwx+eHRf1uvrWBV4m/PRjo
	 Jeprxf65iLkwkABdV8xsh15ebW9oJoDya1+ijn1+d+JAUrS1RGOhUXZe6jeYBuWZTIwzv
	 Rp3iKx/15tpOenznOHzYZfZtmTygB5kTifu6lmtcEFwzsn46JfY4KEyCzZMeQ3NGDeY6O
	 mE371RKh1FKUU2anAPIadJpih6hKM9SBUmWNJ4PUJfD7Ovd/jOAYbOmcBflm3WV1kEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ObvKHJhA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A97606A321
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 10:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ObvKHJhA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51CDC1F00A05;
	Thu, 12 Nov 2026 10:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794478764;
	bh=6ThTOqDjE9SfSJoapgBvWvpzVC+5cP1+YtPLX76dgSE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ObvKHJhANKjpeLZS3Mo2nU/Q38UV0O15dUK4u7oG96ztmvTzm5WKW+Yqu54ZUbJwF
	 KXygIz5p1CQEpxpcKooSdTpajHyuu9eaZC1yTuBxdInNRYDrE2LnVIaZJNRaIQFbUg
	 Ak2EzIkeP8g05inQjAQcz3/Ftd/sQhoxMsmjvG1DciC2sVhIDnkuHqUD7LiTBRVjZJ
	 jLCc4HpbPuWeHNF9xburMJpOkWv+wZuaOGHFoeS3bexnCdd1DGreC7d8XIRELdLBH4
	 YWSZaF48r1RTakirE9YtQFU2PpAxS2cdjPcTWV+j/GscTrdcUc6syP1uop4g9KRV26
	 +kkgPPFxxjPqw==
Message-ID: <sashiko-outbox-210929@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next 14/15] wifi: ath12k: add and hook Wi-Fi 8
 mac80211 ops skeleton for QCN9575
Reply-To: sashiko-reviews@lists.linux.dev
To: "Madhavan Ganesan" <madhavan.ganesan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-wifi8_qcn9575_bringup-v1-14-3f30fbc2bb69@oss.qualcomm.com>
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
 <20261112-wifi8_qcn9575_bringup-v1-14-3f30fbc2bb69@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 10:19:23 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] wifi: ath12k: missing sta_set_4addr callback in
  ath12k_ops_wifi8
--

commit 6de3568cf375a8ba9425721f1a8ad36656373d50
Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>

wifi: ath12k: add and hook Wi-Fi 8 mac80211 ops skeleton for QCN9575

This commit adds a dedicated ath12k_ops_wifi8 ieee80211_ops table with a
placeholder TX callback and existing common ath12k_mac_op_* callbacks,
and hooks it in ath12k_wifi8_hw_init().

> diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wir=
eless/ath/ath12k/wifi8/hw.c
> index 92c897de16f4f..30188f4fae022 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c

[ ... ]

> @@ -152,6 +155,72 @@ static const struct ath12k_hw_params ath12k_wifi8_hw=
_params[] =3D {
>  	},
>  };
> =20
> +static void ath12k_wifi8_mac_op_tx(struct ieee80211_hw *hw,
> +				   struct ieee80211_tx_control *control,
> +				   struct sk_buff *skb)
> +{
> +	struct ath12k_hw *ah =3D ath12k_hw_to_ah(hw);
> +
> +	__ath12k_warn(ah->dev, "wifi8: tx stub is a placeholder, dropping frame=
\n");
> +	ieee80211_free_txskb(hw, skb);
> +}
> +
> +static const struct ieee80211_ops ath12k_ops_wifi8 =3D {
> +	.tx				=3D ath12k_wifi8_mac_op_tx,
> +	.wake_tx_queue			=3D ieee80211_handle_wake_tx_queue,
> +	.start				=3D ath12k_mac_op_start,
> +	.stop				=3D ath12k_mac_op_stop,
> +	.reconfig_complete		=3D ath12k_mac_op_reconfig_complete,
> +	.add_interface			=3D ath12k_mac_op_add_interface,
> +	.remove_interface		=3D ath12k_mac_op_remove_interface,
> +	.update_vif_offload		=3D ath12k_mac_op_update_vif_offload,
> +	.link_info_changed		=3D ath12k_mac_op_link_info_changed,
> +	.vif_cfg_changed		=3D ath12k_mac_op_vif_cfg_changed,
> +	.change_vif_links		=3D ath12k_mac_op_change_vif_links,
> +	.configure_filter		=3D ath12k_mac_op_configure_filter,
> +	.hw_scan			=3D ath12k_mac_op_hw_scan,
> +	.cancel_hw_scan			=3D ath12k_mac_op_cancel_hw_scan,
> +	.set_key			=3D ath12k_mac_op_set_key,
> +	.set_rekey_data			=3D ath12k_mac_op_set_rekey_data,
> +	.sta_state			=3D ath12k_mac_op_sta_state,
> +	.sta_set_txpwr			=3D ath12k_mac_op_sta_set_txpwr,
> +	.link_sta_rc_update		=3D ath12k_mac_op_link_sta_rc_update,
> +	.conf_tx			=3D ath12k_mac_op_conf_tx,

[Severity: Medium]
Should ath12k_ops_wifi8 also wire .sta_set_4addr to
ath12k_mac_op_sta_set_4addr like ath12k_ops_wifi7 does?

The other shared callbacks here (ath12k_mac_op_update_vif_offload() and
ath12k_mac_op_add_interface()) enable IEEE80211_OFFLOAD_ENCAP_4ADDR and
WMI_VDEV_PARAM_WDS on 4-address interfaces, but without .sta_set_4addr,
drv_sta_set_4addr() is a no-op and never configures WMI_PEER_USE_4ADDR or
peer->dp_peer->use_4addr when a 4-address station associates.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-wifi8_qcn9=
575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com?part=3D14
