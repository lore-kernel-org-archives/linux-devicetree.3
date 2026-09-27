Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558BC3B1EFC
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 23:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790550114; cv=none; b=tuiex92Nwu4viVBpUInA4z+zteOadnsoXK7c7fEs4bu6Immay/e9U1010sUwWLf4l5mSCG/6F0noriS7skVHpezw2nF/WDD3ONmc3D8aT1voXXq3D0pvqMdBpzPU/QHscWFZfa95mBQ/L1jMDWotvqRYYsAsh3apVpxhVMxmKpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790550114; c=relaxed/simple;
	bh=MVZ3fBzTxtK3uq3Rk5S9RQYX/lMDXhchMazE4GBDFzc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FrJ3YmEYYQy8W5j6uokCdpi8r1LoMLrthpckb6lKC787WI0oVAtr8gBaj1ANEUFCfhbYRIcI+H51eYtXlP78tL741dfAt/M93t2J6t11aVu2oQNcSKSq9BZ75uz7nNnkha+CgZFFOUSA7BKU1vPWe/KkzlnNQiQpo6Mu1lajqr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2Ba1mtS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2Ba1mtS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E497E1F000FF;
	Sun, 27 Sep 2026 23:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790550109;
	bh=J1X5/DDVoQuhhCtBjTLMt0rKIk4/2cQoX3DuNZReprI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P2Ba1mtSfXpcb6a1Ot1B27ahdje7A5W8T07mpvrvgv85FzMYj+tRPGmut/uIDAlEZ
	 kWHVomM3qpzgxWZI4Ym+9UcIHd/ugLIa38Pgnh3Cr5xk2slsf1rAGwwv3I+up/W1WU
	 kNYdenacq+krPJ2ZmpEiZ4m+HshoDkYPLNi5YXb3Y+l1s/+SP7iXnaEQDR92fBJZPQ
	 7cbwD0xb9Bf7NOmIXxqpOp5rMDnCF2oFeN4BsHBTBmUWh8YCp3M5ADH4/+37eN9GWM
	 c2eBbbJew/yC3QQe4hk0f2B2MwKhalYlkXP6wb6BBe2mEBzoGwRYRy9jcrFS5UeNn3
	 YSNlqHf/lBCDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 2/5] net: phy: Add support for the Maxio
 MAE0621A
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260926225625.25969-3-andre.przywara@arm.com>
References: <20260926225625.25969-1-andre.przywara@arm.com>
 <20260926225625.25969-3-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 23:01:48 +0000
Message-Id: <20260927230148.E497E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: phy: maxio: potential configuration loss from soft reset
--

commit fe4e6c1e8992faa353fc23228a8b3ebe634a12dd
Author: Liu Changjie <liucj1228@outlook.com>

net: phy: Add support for the Maxio MAE0621A

This commit adds a new driver for the Maxio MAE0621A Gigabit Ethernet PHY.
It introduces exact PHY ID matching and an optional configuration to enable
a 125 MHz clock on the CLKOUT pin based on device properties.

> diff --git a/drivers/net/phy/maxio.c b/drivers/net/phy/maxio.c
> new file mode 100644
> index 0000000000000..d2cb238956460
> --- /dev/null
> +++ b/drivers/net/phy/maxio.c
[ ... ]
> +static int maxio_mae0621a_config_init(struct phy_device *phydev)
> +{
> +	struct maxio_priv *priv =3D phydev->priv;
> +	int ret;
> +
> +	if (!priv->clk_out_125m)
> +		return 0;
> +
> +	ret =3D phy_modify_paged_changed(phydev, MAXIO_MAE0621A_PHYCR2_PAGE,
> +				       MAXIO_MAE0621A_PHYCR2,
> +				       MAXIO_MAE0621A_CLKOUT_ENABLE |
> +				       MAXIO_MAE0621A_CLKOUT_125M,
> +				       MAXIO_MAE0621A_CLKOUT_ENABLE |
> +				       MAXIO_MAE0621A_CLKOUT_125M);
> +	if (ret <=3D 0)
> +		return ret;
> +
> +	return genphy_soft_reset(phydev);

[Severity: Medium]
Does this soft reset potentially clear the vendor-specific paged register
configuration that was just applied?

IEEE 802.3 Clause 22 states that BMCR_RESET resets control registers to
their default values. While some PHYs retain their paged vendor configurati=
ons
across a soft reset, others wipe all registers. If the MAE0621A PHY clears
vendor pages during a soft reset, the newly applied
MAXIO_MAE0621A_CLKOUT_125M configuration in maxio_mae0621a_config_init()
might be silently reverted to its default state.

Could you confirm if this specific hardware retains the PHYCR2 register sta=
te
after genphy_soft_reset()?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926225625.2596=
9-1-andre.przywara@arm.com?part=3D2
