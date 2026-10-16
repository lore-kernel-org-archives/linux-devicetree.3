Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DAE45C70A
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141789; cv=none; b=gPYn0Ktc/8rYKhB4lx3GJCz8SJz+cNqJeBGBWfM139du5TCWdPrQwniOa8qQPdRq8W96JYD8V2YdbTPJAu5xS0CXPfswZKTg7GNlK7duPMhEp4z2t2NLwm1dpKFV+h13WTcWXCT3F7zvEdv6E13pGI5QZm5wgCUcuAPLGa/CaWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141789; c=relaxed/simple;
	bh=okaqFpl6hflwl3tgUEbSCH/7wwTcyVLb87qs7QWILTA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=CxyA4KZAigT9KglhRPII+Sk3lMwqhyKYXZv1rmlCdKSce8hr88Yznxmnnt9G2zv6igajEL06HKFCOJDhb2tXadNYmMR54v0LDOVArDOj8VW5IqzSfX6jEGDNWmgUcTlcyA5k+FdsH4R+LJa8kDkTpEo0aQrWnlRXZgRqRiPFZ3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mK4P8GvT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mK4P8GvT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0AA11F000C5;
	Fri, 16 Oct 2026 09:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792141787;
	bh=au5NZ+uww3QWwRsPTibFWYI4OmwUlU9DRbnVjOMpM94=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mK4P8GvTaB9JQANCXJvbCOgytSroeCfQBVFJiKMamobKbpzqSsUAEq+z6v6/uW88d
	 5l/D3oi6bnTb7yGyPIsWk7I1mR22YcEqDpvIWodIJq74G6FGPgzNccP+yVZoEvOf8N
	 v9K4X+GCqelXKaz7UNjy6ZHNAm06uUUenISpmuQXs6pThlyBL2kKI4cAZIWr9lans+
	 NNVDsHuhMxznG8ltVn67NqwgZYrFTxYRP0t9WSnc5/siX5qUUoS6zNwDoMHttRH7gq
	 Ac1Imyr6/TVW0515oh/5Ftqyl+1UwJX3zE4okg8TR0CJ0kp1AnH1NOCWuENNoDgaQT
	 jB0XYbn8hiuVA==
Message-ID: <sashiko-outbox-174059@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/8] phy: rockchip-samsung-dcphy: Move block-level
 setup to runtime resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jason Yang" <jason98166@gmail.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261016-dcphy-rx-v1-v5-3-e63b49eabe2d@gmail.com>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-3-e63b49eabe2d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 09:09:46 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] phy: dcphy: PLL left enabled on lock failure, preventing recovery
--

commit 0436bfe5522a31ef65724b71dd2f683f01ebeaa1
Author: Jason Yang <jason98166@gmail.com>

phy: rockchip-samsung-dcphy: Move block-level setup to runtime resume

This commit moves the block-level APB reset and BIAS configuration
from the power-on path to runtime resume. This prevents resetting
the block underneath a PHY that is already running when multiple
consumers are present.

> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/=
phy/rockchip/phy-rockchip-samsung-dcphy.c
> index 7382043e1f319..1471a1563d2a1 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c

[ ... ]

> @@ -1362,10 +1361,6 @@ static int samsung_mipi_dcphy_power_on(struct phy =
*phy)
>  {
>  	struct samsung_mipi_dcphy *samsung =3D phy_get_drvdata(phy);
> =20
> -	reset_control_assert(samsung->apb_rst);
> -	udelay(1);
> -	reset_control_deassert(samsung->apb_rst);
> -

[Severity: Medium]
If samsung_mipi_dcphy_pll_enable() fails to lock, it returns without cleari=
ng
the PLL_EN bit in PLL_CON0:

drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c:samsung_mipi_dcphy_pll_en=
able() {
	regmap_update_bits(samsung->regmap, PLL_CON0, PLL_EN, PLL_EN);

	ret =3D regmap_read_poll_timeout(samsung->regmap, PLL_STAT0,
				       sts, (sts & PLL_LOCK), 1000, 20000);
	if (ret < 0)
		dev_err(samsung->dev, "DC-PHY pll failed to lock\n");

	return ret;
}

Because this patch removes the apb_rst sequence from the power_on path, the
stale PLL_EN bit is no longer cleared by the hardware reset on subsequent
retries.

Does this leave the hardware in an active but failed state, potentially
causing undefined behavior or preventing the PLL from locking during the
next power_on attempt?

>  	switch (samsung->type) {
>  	case PHY_TYPE_DPHY:
>  		return samsung_mipi_dphy_power_on(samsung);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-dcphy-rx-v=
1-v5-0-e63b49eabe2d@gmail.com?part=3D3
