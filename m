Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D459175A95
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 09:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778404257; cv=none; b=lS6yM10Y/uKwtp6zOSCV7ezKQT0JnZFcIDGYNwoPy57aV+kjEZBhmLp2j96cb7qEB+IsL7Zh6Jrwm/GZuPxNs5a3ilY9a5bhiifApdPd5EeoIZQiwnTENBrDLaddalT43cMGyezLqAL6lb/CfUusMKkpaW7ndg7BhHGmzkj4HWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778404257; c=relaxed/simple;
	bh=rCLPeM1/5j4uZo/qrstOpeNAh7eQXvv1GSLyg3WMrUE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lETC7/YzazNwNTlhhWPgp4XUp+ah1RvXU66IesBAsDgd3nto9cNpgkZQerIFf6BFD1rbsj44rDuNesIg8EtOzMKA9umeSxJ8guDsFnOozYKFmvU49qljooSHy2TJZL3ipmWbl+M/xO3ULRFzSjpTw4FcTetKN+su0eUZdiSVsGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q1+IgzeW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q1+IgzeW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91967C2BCB8;
	Sun, 10 May 2026 09:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778404256;
	bh=rCLPeM1/5j4uZo/qrstOpeNAh7eQXvv1GSLyg3WMrUE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=q1+IgzeWMA6XuDlYaZJO3rvn+LEIS1pLcXc4VUEibV/o+fF6NGOAs79fdCB3lsl/G
	 C1FaEpS58Nyc/d/jltRdOPZEo8ZrHaceTPCfCdz7Xh4+B3LnX5JoE/ejpX7+37032d
	 wcBnyZFzkL3Gs1H/yID/qcqtDOGlXDi88OTU+YrgCitLTaWgotYNpvSf5BlyLy+OK7
	 FEEaDohjyQIF0weYKmBrA8jzzRNDTxk3s+uqAZtUaYpxJCq4WuKUxxHq7Qdccybm86
	 1zU9VUPSAO9Y8NrvL+hfZ6l+iQsTbwjTX9WVc1ojC5+EmP+aFiqc8GQuSkpZUumjRN
	 mG+G2TxLD2uow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/4] net: dsa: tag_hms: Add HMS tag protocol
Reply-To: sashiko@lists.linux.dev
To: "Minghuan Lian" <minghuan.lian@nxp.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260509090632.2959553-3-minghuan.lian@nxp.com>
References: <20260509090632.2959553-3-minghuan.lian@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 May 2026 09:10:56 +0000
Message-Id: <20260510091056.91967C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The `buf` pointer in `hms_rcv_meta_cmd()` becomes a dangling point=
er if `skb_linearize()` reallocates the SKB.
- [High] Incorrect length calculation in `hms_rcv_meta_cmd()` leads to an i=
nteger underflow when invoking the switch driver's meta command handler.
- [High] Returning `NULL` after `__vlan_hwaccel_push_inside()` fails in `hm=
s_imprecise_xmit()` causes a double free in the caller.
- [Medium] The Kconfig symbol NET_DSA_TAG_HMS selects a non-existent symbol=
 NET_DSA_TAG_8021Q.
--

commit 5802d819bc05556c0d9f828794cc67145ff4496a
Author: Minghuan Lian <minghuan.lian@nxp.com>
   =20
net: dsa: tag_hms: Add HMS tag protocol
   =20
This commit adds a DSA tagger for NXP Heterogeneous Multi-SoC (HMS) switche=
s.
It supports both tag_8021q based transmit and receive handling for regular
data traffic, and an HMS meta frame format for link-local and control traff=
ic.

> diff --git a/net/dsa/Kconfig b/net/dsa/Kconfig
> --- a/net/dsa/Kconfig
> +++ b/net/dsa/Kconfig
> @@ -211,4 +211,13 @@ config NET_DSA_TAG_YT921X
>  	  Say Y or M if you want to enable support for tagging frames for
>  	  Motorcomm YT921x switches.
> =20
> +config NET_DSA_TAG_HMS
> +	tristate "Tag driver for NXP Heterogeneous Multi-SoC switches"
> +	select NET_DSA_TAG_8021Q

Does the NET_DSA_TAG_8021Q config symbol exist? Looking through the tree, it
appears tag_8021q.c is compiled unconditionally as part of dsa_core-y rather
than having its own Kconfig symbol. Selecting a non-existent symbol can lead
to unmet dependency warnings or silent build failures.

> +	help
> +	  Say Y or M if you want to enable support for tagging frames for
> +	  NXP Heterogeneous Multi-SoC switch family. This driver uses a

[ ... ]

> diff --git a/net/dsa/tag_hms.c b/net/dsa/tag_hms.c
> new file mode 100644
> --- /dev/null
> +++ b/net/dsa/tag_hms.c

[ ... ]

> +static struct sk_buff *hms_imprecise_xmit(struct sk_buff *skb,
> +					  struct net_device *netdev)
> +{
> +	struct dsa_port *dp =3D dsa_user_to_port(netdev);
> +	unsigned int bridge_num =3D dsa_port_bridge_num_get(dp);
> +	struct net_device *br =3D dsa_port_bridge_dev_get(dp);
> +	u16 tx_vid;

[ ... ]

> +	if (unlikely(skb_vlan_tag_present(skb))) {
> +		skb =3D __vlan_hwaccel_push_inside(skb);
> +		if (!skb) {
> +			WARN_ONCE(1, "Failed to push VLAN tag to payload!\n");
> +			return NULL;

Could returning NULL here lead to a double free?=20

If __vlan_hwaccel_push_inside() fails, it consumes and frees the original s=
kb.
However, returning NULL back up to the DSA core (dsa_user_xmit) usually
signals that the tagger did not consume the skb, which leads the DSA core to
call kfree_skb() on the original pointer again.

> +		}
> +	}
> +
> +	return dsa_8021q_xmit(skb, netdev, hms_xmit_tpid(dp), tx_vid);
> +}

[ ... ]

> +static struct sk_buff *hms_rcv_meta_cmd(struct sk_buff *skb, u16 rx_head=
er)
> +{
> +	u8 *buf =3D dsa_etype_header_pos_rx(skb) + HMS_HEADER_LEN;
> +	int switch_id =3D HMS_RX_HEADER_SWITCH_ID(rx_header);
> +	int source_port =3D HMS_RX_HEADER_PORT_ID(rx_header);
> +	struct hms_tagger_data *tagger_data;
> +	struct net_device *master =3D skb->dev;
> +	struct dsa_port *cpu_dp;
> +	struct dsa_switch *ds;
> +
> +	cpu_dp =3D master->dsa_ptr;
> +	ds =3D dsa_switch_find(cpu_dp->dst->index, switch_id);
> +	if (!ds) {
> +		net_err_ratelimited("%s: cannot find switch id %d\n",
> +				    master->name, switch_id);
> +		return NULL;
> +	}
> +
> +	tagger_data =3D ds->tagger_data;
> +	if (!tagger_data->meta_cmd_handler)
> +		return NULL;
> +
> +	if (skb_is_nonlinear(skb))
> +		if (skb_linearize(skb))
> +			return NULL;

If skb_linearize() reallocates the data buffer to make it contiguous, does =
the
buf pointer become dangling? It was initialized before the linearization and
might now point to freed memory.

> +
> +	tagger_data->meta_cmd_handler(ds, source_port, buf,
> +				skb->len - HMS_HEADER_LEN - 2 * ETH_ALEN);

Is this length calculation correct for the receive path?=20

Since the MAC header has usually already been pulled from the skb by the ti=
me
we reach the tagger, skb->len should simply be the payload size. Subtracting
an additional 2 * ETH_ALEN might cause an integer underflow if the metadata
payload is small, resulting in a huge size_t value being passed to the driv=
er
callback.

> +
> +	/* Discard the meta frame */
> +	return NULL;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509090632.2959=
553-1-minghuan.lian@nxp.com?part=3D2
