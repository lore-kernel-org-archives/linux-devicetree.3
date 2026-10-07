Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B6116F288
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 07:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791357673; cv=none; b=QH8EfDNdCcKszswUEU5dgF1+9sOW7MZDItK1DPc5g9bbd7kMMnRnX52zN8XyNvVlT+XoJ7jwjc6/sxeHlSxBo4A9bCoYZDTt608atKMzu2dygi0WfKAxSKTz62wREDFkRI12CzHrDN5OfM1aFvXiPw/GBXfKvtzkbcNPMnvytbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791357673; c=relaxed/simple;
	bh=lVCaGNaTcrNOx8J9MrNWbvHJfM2TMcA0W5X7KK84PeA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=OwPrSsJxB/z2f38JpQ+/a6NOPegmorK1GSLCn7eh+yUyZY47pHCTOfQ9jkpSWscOWwJIcnHmynrCQV6NADxJBysHxhnaEolJcdyhsSVxw52sw8qe5eeSwwaSern9Th4Vm6xkfA/fE2mylJip+cC8rX4flDOiEz5++UxmpBxXAFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kf/ieOHD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kf/ieOHD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD16F1F0089D;
	Wed,  7 Oct 2026 07:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791357672;
	bh=w/xIbGyXXDFcK5Zwf8ISCr2Ok2U1lumQ3QUYE9Mt1dg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kf/ieOHDF3Qj7TIooY/haDeFRGLwJekpIxKiTNzuz3a63joKGVl9uoMb/YAuPk7Jv
	 aCZww4iO2OmyBZxQez8GT6heLgc3Gpwc2ExClYCwe618pF2rmmmsTQEk0pcAQKRbu/
	 Uy3n8DacVNs0p95atcChi2967O8NEDDASzrlNGv5CPCTHiiy6IyQKsnFVaeSHDG/8U
	 U+wszulBsSjQ2eOiAP+i8JdtOJBHr7oV4WFpSoz51fwkc0C8qQtvtzK9bMSZlg+dxd
	 4Pxj3Jpr8YHIpVX83etIGkROy/Uo/4ifcpzEmtg2/P6OUUzqJJ/j+zw99+bS2+0iO6
	 Ze0USUsGg5lPg==
Message-ID: <sashiko-outbox-162706@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 3/6] net: ftgmac100: Enable AST2700 RMII
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacky Chou" <jacky_chou@aspeedtech.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261006-support_ast2700-v2-3-36de51fb8066@aspeedtech.com>
References: <20261006-support_ast2700-v2-0-36de51fb8066@aspeedtech.com>
 <20261006-support_ast2700-v2-3-36de51fb8066@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 07:21:11 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: ftgmac100: NULL pointer dereference in ftgmac100_start_hw() o=
n missing PHY
--

commit 9ce856b5087337010253eb3a985d1756ba877130
Author: Jacky Chou <jacky_chou@aspeedtech.com>

net: ftgmac100: Enable AST2700 RMII support

This commit adds a match-data quirk to set the RMII enable bit when an AST2=
700
port uses RMII. This ensures the MAC is programmed correctly for the select=
ed
interface mode.

> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ether=
net/faraday/ftgmac100.c
> index 67b1fa464a421..b835472da3604 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
[ ... ]
> @@ -355,6 +359,7 @@ static void ftgmac100_init_hw(struct ftgmac100 *priv)
>  static void ftgmac100_start_hw(struct ftgmac100 *priv)
>  {
>  	u32 maccr =3D ioread32(priv->base + FTGMAC100_OFFSET_MACCR);
> +	struct phy_device *phydev =3D priv->netdev->phydev;
> =20
>  	/* Keep the original GMAC and FAST bits */
>  	maccr &=3D (FTGMAC100_MACCR_FAST_MODE | FTGMAC100_MACCR_GIGA_MODE);
> @@ -383,6 +388,11 @@ static void ftgmac100_start_hw(struct ftgmac100 *pri=
v)
>  	if (priv->netdev->features & NETIF_F_HW_VLAN_CTAG_RX)
>  		maccr |=3D FTGMAC100_MACCR_RM_VLAN;
> =20
> +	if ((priv->quirks & FTGMAC100_QUIRK_RMII_ENABLE) &&
> +	    phydev->interface =3D=3D PHY_INTERFACE_MODE_RMII) {

[Severity: High]
Could phydev be NULL here?

If the driver probes an AST2700 device tree that lacks a phy-handle (or
fixed-link / use-ncsi) but contains an mdio child node, ftgmac100_probe_dt()
will exit successfully while leaving priv->netdev->phydev as NULL.

When the interface is subsequently brought up (e.g., via ip link set up),
ftgmac100_open() calls ftgmac100_start_hw() prior to verifying if a PHY exi=
sts.
Since the AST2700 quirk is enabled, could evaluating phydev->interface caus=
e a
NULL pointer dereference and kernel panic?

> +		maccr |=3D FTGMAC100_MACCR_RMII_ENABLE;
> +	}
> +
>  	/* Hit the HW */
>  	iowrite32(maccr, priv->base + FTGMAC100_OFFSET_MACCR);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006-support_as=
t2700-v2-0-36de51fb8066@aspeedtech.com?part=3D3
