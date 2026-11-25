Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795642701;
	b=I+qiFRrNy7dgISqTGRNtfpfLJtQLDal1Yp2QYvDvWKNvgI8+kG6jDH+3cmKDMU6vM1/n
	 ot7Lt9KQofJhQ654hureTK2Qh4wPu0PPa8uXInhSaKa7teedQTMKKEi0fPtMI8mddHrD2
	 OLGanFTbquLohl5yMUsabroLzRHpooG+dgpkumFP/6t/BqYSkkjFDLXSyvEvMCiBHwFl5
	 yq5pb/OY6jFAcavMD+sBJtlRaEUQfmbmvV4Cfj5kjQyUgfZB88YrbrfL5PKQqkssM+P9R
	 LviHImlr0Ci1YK2fWSN423yQqLLbYFnTE+J7bNa1cUIwt5YvX3En60G1OVT1VL15ULw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795642701;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LCrgXMXnD6jSurHB14n5Y2wtuVtbkQn2EtMzPk2kfu0=;
	b=FLjbcm6cbmDP/ABHvu79Wgvv4tXVDi8NEQt+JMkrCghaNKWpz42q9V13gRFYLYDQrdJQ
	 b7cODtaKbn4ymbWvbSNjNJmYK2uSyR9VNI+x6qi9Whh1WVd0tba4KJ9zqPgB31vGUBBj0
	 lIAt21jUJ3/+U6sMnKOiQs4NJUmoqcPbJRQgj1BL93hzKv0/zLm3UR4S/vSa0fPudUy1h
	 TsxEdtH8HEq6t2UPSPQyu2X0inrwUe3ih34bAE1PyBP7NScRLxMtQIEqTGsYng5oKY0fM
	 7Ww/Abtnfy+0nwtlRuQJ2jNcsOUgKzTjcWiLdevdk0vfu/Xx++6rMaKoNAwvxiUNOOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OjDs6JRL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A7B606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 21:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OjDs6JRL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71D9D1F000E1;
	Wed, 25 Nov 2026 21:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795642700;
	bh=LCrgXMXnD6jSurHB14n5Y2wtuVtbkQn2EtMzPk2kfu0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OjDs6JRLRsrxfIRA9sRH2NXmA1GLAdrnaM722Oft4mZtiPLt/VzUxsc3ThcZkwXvo
	 J9WadSwfIg2YuXZm1W9TnTMc5qYGCjs0pFu9K7KskOyOGnxgNZ8Mc4j0VwV30uedvv
	 LL9Tt0lSA7btWKZb9Xj/NbS4W9uwIul43udhT0clKNee26gq4mZDd1QPfWQxHJCxsN
	 Fq91u00qwR/S/oAhDUofu89aVhzr+55n7FuLBKUIW9zcAcy7RJfGD6Gh6V1hCBLaEk
	 JoAeAjql883BGYwLc/F1rNgz13H4Ls3G1Tos2+uPnkaKjEYmr+1K1wKQpUg81oF8Fs
	 xp8XbKgXBHJbg==
Message-ID: <sashiko-outbox-234190@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/5] phy: apple: atc: Add initial M3 series support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261125-t8122-phy-v3-3-196e20b3537e@chaosmail.tech>
References: <20261125-t8122-phy-v3-0-196e20b3537e@chaosmail.tech>
 <20261125-t8122-phy-v3-3-196e20b3537e@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 21:38:20 +0000
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
- [Medium] phy: apple: atc: stale atcphy->mode on
  atcphy_wait_rcal1_done_t8122() failure
--

commit 5502f6b851712985ca558c7a0dd17a0358624746
Author: Sasha Finkelstein <k@chaosmail.tech>

phy: apple: atc: Add initial M3 series support

This commit adds initial support for the Apple t8122 (M3) Type-C PHY,
covering USB and Thunderbolt modes through a per-SoC hardware operations
structure.

> diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
> index 45f1280a6faa3..68fc93a88f41a 100644
> --- a/drivers/phy/apple/atc.c
> +++ b/drivers/phy/apple/atc.c
[ ... ]
> @@ -1792,18 +1929,93 @@ static int atcphy_configure(struct apple_atcphy *=
atcphy, enum atcphy_mode mode)
[ ... ]
> +static int atcphy_wait_rcal1_done_t8122(struct apple_atcphy *atcphy, enu=
m atcphy_mode mode)
> +{
> +	int ret =3D 0;
> +	u32 reg;
> +
> +	if (atcphy_modes[mode].pipehandler_state =3D=3D ATCPHY_PIPEHANDLER_STAT=
E_USB3) {
> +		ret =3D readl_poll_timeout(atcphy->regs.core + AUS_COMMON_DIG_RCAL1, r=
eg,
> +					 (reg & AUS_COMMON_DIG_RCAL1_ALL_CODES_DONE), 10, 100000);
> +		if (ret) {
> +			atcphy_power_off(atcphy);
> +			dev_err(atcphy->dev, "Failed to wait for RCAL1 done\n");
> +			return ret;
> +		}
> +	}
> +	return ret;
> +}
> +
> +static int atcphy_configure(struct apple_atcphy *atcphy, enum atcphy_mod=
e mode)
> +{
> +	int ret =3D 0;
> +
> +	lockdep_assert_held(&atcphy->lock);
> +
> +	if (mode =3D=3D APPLE_ATCPHY_MODE_OFF) {
> +		ret =3D atcphy_power_off(atcphy);
> +		atcphy->mode =3D mode;
> +		return ret;
> +	}
> +
> +	ret =3D atcphy_power_on(atcphy);
> +	if (ret)
> +		return ret;
> +
> +	atcphy_apply_tunables(atcphy, mode);
> +	atcphy->hw->configure_post_tunable(atcphy, mode);
> =20
>  	/* Setup AUX channel if DP altmode is requested */
>  	if (atcphy_modes[mode].enable_dp_aux)
>  		atcphy_enable_dp_aux(atcphy);
> =20
>  	/* Enable clocks and configure lanes */
> -	core_set32(atcphy, CIO3PLL_CLK_CTRL, CIO3PLL_CLK_PCLK_EN);
> -	core_set32(atcphy, CIO3PLL_CLK_CTRL, CIO3PLL_CLK_REFCLK_EN);
> +	if (atcphy->hw->enable_cio3pll_clk)
> +		atcphy->hw->enable_cio3pll_clk(atcphy);
> +
>  	atcphy_configure_lanes(atcphy, mode);
> =20
>  	/* Take the USB3 PHY out of reset */
>  	core_set32(atcphy, ATCPHY_POWER_CTRL, ATCPHY_POWER_PHY_RESET_N);
> +	/*
> +	 * NOTE: Not what macos does, it takes the phy out of reset right befor=
e writing to
> +	 * ACIOPHY_CFG0_COMMON_SMALL does lane configuration with phy out of re=
set, and the poll is
> +	 * right after AUS_COMMON_SHIM_BLK_BIAS_REG write. Does not seem to mat=
ter, but if something
> +	 * does not work, consider re-ordering things to macos order.
> +	 */
> +	if (atcphy->hw->wait_rcal1_done) {
> +		ret =3D atcphy->hw->wait_rcal1_done(atcphy, mode);
> +		if (ret)
> +			return ret;
> +	}
> =20
>  	atcphy->mode =3D mode;

[Severity: Medium]
Does failing in atcphy_wait_rcal1_done_t8122() leave atcphy->mode out of
sync with the hardware state?

When the RCAL1 poll times out, atcphy_wait_rcal1_done_t8122() calls
atcphy_power_off(), and atcphy_configure() returns early without updating
atcphy->mode.  If atcphy->mode was already a non-OFF mode (such as
APPLE_ATCPHY_MODE_USB2) before transitioning to a USB3 mode, atcphy->mode
retains that previous active mode while the PHY hardware is powered off
and held in reset.  A subsequent atcphy_mux_set() back to that previous
mode will then see atcphy->mode =3D=3D target_mode and return 0 without
powering the PHY back on.  Should atcphy->mode be reset to
APPLE_ATCPHY_MODE_OFF when atcphy_power_off() is called on this error
path?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-t8122-phy-=
v3-0-196e20b3537e@chaosmail.tech?part=3D3
