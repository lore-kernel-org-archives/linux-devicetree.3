Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539970;
	b=iNapIyafwt5khnjtA7GbEallaerY1gHAeFGnqrPr7+tCG03prAjHv+C8SLJaRQ9rxTkj
	 Z+WNQBdv/gBKpouzRcQApgiVkTgBZ5k1tRSn5ackrrRISptRwWLQeumFVnV20kAIRbBZo
	 4iwsy3LdJHhyj9whLaf1ltmdrWl9hsqiKzJkbQhrThqkkEg8Kb7BpiEOm7mZw2mZKtpAW
	 l+Y+vSIhqJ0afc1abT+B3/bC7ZFdxVEppgKtKLcPe2nrqy2EGe/0PuH22O9fuTVOZsSnB
	 9rjUtQ9hZ35pW4/Fm4p/WaLxMK7ln+7yAMtArj88E2LT8ctzXu3UbytEgG9Y6+SYFiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539970;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=exww3rrveZHq3Dli/iCr5Hau1jPeBQrTHJg4fioDVLg=;
	b=d9DFzNvYmT89LAOMHRFsUEOXeO31Mq7N6s2eQSmcqzybDgXaFdNc9dLqFiZqqI1yuJ4B
	 QBR+vkryELNpQ6DLPTGc+nfyvbIZMD7Q4IJF1J3wzb/5ETLxw7/PTAlIKRIvqCpcll4m1
	 HlpRGtsPdAXU4qj/njWZmekft6aki022AYCtuPLr/xbF3DKLa+COgsQTs/4nVt0OWzBeL
	 psf2EpClB3z7nGOqDU7a6/K1v4DA1HSw1RqWZueFl2/yuE1hgQDyS+DHTeaPPS6th1n42
	 xQvEZPDfDEwwg3zvmgcxcTfWkEh9IxdAfeCpx4j4QEejFWUWB1jI2efL2gW2i9dbxJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oK+XLEHG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07332606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oK+XLEHG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2141F000C0;
	Tue, 24 Nov 2026 17:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795539969;
	bh=exww3rrveZHq3Dli/iCr5Hau1jPeBQrTHJg4fioDVLg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oK+XLEHGFroTpAyfBVxVebDF1Y9j2HzM7QbCNHce0PD/NPr4Yw/ONi7Le0IqG1+hN
	 Pd02qnY+c/Yq8U/Z3WSZrhfkGw73AUtmlrzUe098ktYwm/eQnwp5xysKokxHutNJT7
	 gOmSZJdpdGe6p42I9wY6QaO2RjV0WAOp7YdTQi5oJUi4oYQx5FULOXXEf9/7/2KYBy
	 9xM8sz6t3xJtYI3P2AsjXgh5Buwg7Q/h2L/cffcyG6J7RwwE9m4WXfrVz/tTywQ1k+
	 Jf/UoC5gyvKm+BMSuXPmN876HuGW00nVyaAzjFMHxAa68MT2YuUwz3C+dSKMMxc+lc
	 sTkXAjXQfd0vw==
Message-ID: <sashiko-outbox-231654@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next v4 13/14] wifi: ath12k: add and hook Wi-Fi 8
 mac80211 ops skeleton for QCN9575
Reply-To: sashiko-reviews@lists.linux.dev
To: "Madhavan Ganesan" <madhavan.ganesan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-wifi8_qcn9575_bringup-v4-13-1f5b87ece6a3@oss.qualcomm.com>
References: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
 <20261124-wifi8_qcn9575_bringup-v4-13-1f5b87ece6a3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:06:07 +0000
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

commit 63848cb4eed75b682fa5b6bcb9e26bfcc006fc3f
Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>

wifi: ath12k: add and hook Wi-Fi 8 mac80211 ops skeleton for QCN9575

This commit adds a dedicated Wi-Fi 8 ieee80211_ops table with a stub TX
callback and existing common ath12k_mac_op_* callbacks, and hooks it in
ath12k_wifi8_hw_init().

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
ath12k_mac_op_sta_set_4addr, matching ath12k_ops_wifi7?

ath12k_mac_op_update_vif_offload() advertises IEEE80211_OFFLOAD_ENCAP_4ADDR,
so without .sta_set_4addr, 4-address peers never run
ath12k_mac_sta_set_4addr() to configure WMI_PEER_USE_4ADDR and NAWDS in
firmware or set peer->dp_peer->use_4addr.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-wifi8_qcn9=
575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com?part=3D13
