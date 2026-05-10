Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F3B39A06F
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 14:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778421905; cv=none; b=Xn2oEMFsUjRUZqxxwbeFV02QzK9tbhX7GouvaNe5XlLn7sgu0pQWJ1R5syTsKGj6U3qCcYsBtuB4o+fR41V83Iaf4lerGLUGOvIHt9nQ/9nLAIPZHPt3+oEdUxP4G9qhRcM3qroklEFmmrdlB9vt1bYgI7821FGsnvdJXl0qPKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778421905; c=relaxed/simple;
	bh=xPwyWbLB+7u5/qMnKEkEocopV1u3+G2ndtIxNlROTy0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JyQw7E5Xk+A1LRHpkp4SqYEdev6D6novKrTMtt8pdoI90CzYuHRyH+YxvLH4kL67K7ufF7F8cpXqnZ89NlHLLNkHJJeDfyQf9Mo3/FshYb4+WthF7uwS0B/ZPDs4Oyg+8ninphBAY0kL1CZhGONzS4wzM8cXXqiLxEcnSamIll4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UUO/E60O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UUO/E60O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C772C2BCF6;
	Sun, 10 May 2026 14:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778421905;
	bh=xPwyWbLB+7u5/qMnKEkEocopV1u3+G2ndtIxNlROTy0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=UUO/E60Ox961MTAL2TIzDlDoN0uwulPcFtozs/+G6lAb3lJ/PIjjOw8Uccx6UCiEz
	 RscB3JkgLKXoSXjgzei7bnvDptSOAFAxrK5PalcgCbSdPvlUxmu7AQT5wBHmUaJK1v
	 PhA4BAh57Vpn2MBZwq1t7Z7LNYD+wM4U0LtdYs9QfYBDH7tLn5AhB4a4GH1TdFYvO6
	 iSWZQGFwS2/QMBzjdiTFzr9Un8X1kPUYCqxVlVJUcdcSOzA6tO+gZCvB+nReI9KpBA
	 vofpXVw28mBaBJ7+tkp5EVElXAWyW4mgV7i+IXYHO98hxTmr/4rLK/B0OESpjx65Ac
	 IH4z0fD9vWN6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 09/12] net: airoha: Do not stop GDM port if
 it is shared
Reply-To: sashiko@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260509-airoha-eth-multi-serdes-v5-9-805e38edc2aa@kernel.org>
References: <20260509-airoha-eth-multi-serdes-v5-9-805e38edc2aa@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 May 2026 14:05:04 +0000
Message-Id: <20260510140505.2C772C2BCF6@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `GDM_STAG_EN_MASK` configuration is port-global but is modifie=
d unconditionally per net_device, leading to silent clobbering when multipl=
e devices share a port.
- [Medium] The hardware MTU (`REG_GDM_LEN_CFG`) is not recalculated when a =
device sharing the port is stopped, leaving the MAC configured to accept in=
appropriately large frames.
--

commit b896e320dcf0d56db7e0654191126c23e6f485fd
Author: Lorenzo Bianconi <lorenzo@kernel.org>
net: airoha: Do not stop GDM port if it is shared

This commit introduces a users counter to the GDM port structure to allow
multiple independent net_device instances to share the same hardware port
without prematurely stopping it. It also conditionally updates the MTU so
that the largest MTU requested by any sharing device is used.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index be31f639f4be3..ebb24e60f1de3 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1733,10 +1733,20 @@ static int airoha_dev_open(struct net_device *net=
dev)
>  		airoha_fe_clear(qdma->eth, REG_GDM_INGRESS_CFG(port->id),
>  				GDM_STAG_EN_MASK);

Since GDM_STAG_EN_MASK is a port-global configuration, will this clear the=
=20
flag for the entire port if a secondary non-DSA net_device is brought up?

If the primary master device relies on this hardware tag parsing, it appears
a secondary device could silently break it by clearing the mask during
its open routine. Should this configuration be protected or refcounted when
multiple devices share a port?

> -	airoha_fe_rmw(qdma->eth, REG_GDM_LEN_CFG(port->id),
> -		      GDM_SHORT_LEN_MASK | GDM_LONG_LEN_MASK,
> -		      FIELD_PREP(GDM_SHORT_LEN_MASK, 60) |
> -		      FIELD_PREP(GDM_LONG_LEN_MASK, len));
> +	cur_len =3D airoha_fe_get(qdma->eth, REG_GDM_LEN_CFG(port->id),
> +				GDM_LONG_LEN_MASK);
> +	if (!port->users || len > cur_len) {
> +		/* Opening a sibling net_device with a larger MTU updates the
> +		 * MTU of already running devices. This is required to allow
> +		 * multiple net_devices wht different MTUs to share the same
> +		 * QDMA block.
> +		 */
> +		airoha_fe_rmw(qdma->eth, REG_GDM_LEN_CFG(port->id),
> +			      GDM_SHORT_LEN_MASK | GDM_LONG_LEN_MASK,
> +			      FIELD_PREP(GDM_SHORT_LEN_MASK, 60) |
> +			      FIELD_PREP(GDM_LONG_LEN_MASK, len));
> +	}
> +	port->users++;

[ ... ]

> @@ -1766,8 +1776,10 @@ static int airoha_dev_stop(struct net_device *netd=
ev)
>  	for (i =3D 0; i < netdev->num_tx_queues; i++)
>  		netdev_tx_reset_subqueue(netdev, i);
> =20
> -	airoha_set_gdm_port_fwd_cfg(qdma->eth, REG_GDM_FWD_CFG(port->id),
> -				    FE_PSE_PORT_DROP);
> +	if (!--port->users)
> +		airoha_set_gdm_port_fwd_cfg(qdma->eth,
> +					    REG_GDM_FWD_CFG(port->id),
> +					    FE_PSE_PORT_DROP);

If multiple devices are sharing the port and the device with the largest MTU
is stopped, the hardware MTU in REG_GDM_LEN_CFG doesn't appear to be
recalculated or shrunk.

Since the MTU is only expanded in airoha_dev_open() and airoha_dev_change_m=
tu(),
does this leave the MAC configured to accept inappropriately large frames
for the remaining devices indefinitely?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509-airoha-eth=
-multi-serdes-v5-0-805e38edc2aa@kernel.org?part=3D9
