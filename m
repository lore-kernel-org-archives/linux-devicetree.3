Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794153413;
	b=kWdHdi4KEVUT54qdrAQgjcoi/96PXHWqpoGA08uCOcNlCcl7yG9w9UcoSTOQB98hGv3w
	 rrP7VVLwEjKEMdqBBuyFffCME5/tl0X06KOoHJ3UeBd+jZGYYlFcrMzfuVO+W1WZmesKd
	 Oa9eG/TG9JxTb9UGqcbCaE9wmIurB2qyfFa/wx6yX4V8j9DUtR+4ZGDf31xaTnAFPPjA8
	 gIXubjFm+cqIC7egqBAwXnGLoS0LbJPYElrq1LOgC2IsyOadDLawa8D6yBsNn5y/vl+ga
	 9fA1z6WhN2viiXvBuEjpp1NTRDdC+juzVHQVpPpdqihIT3T0qeQ6u3NHTKzRJWyMIVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794153413;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iFumVZw/KTs0udQHVgqzZMBcP5AsfpB1o8cnS5VmbTM=;
	b=DcR+sgvmeXKLn9NXDOysDrfSkm4yHrBB5DsYgLtiUD6JH5j7c33aPv54kAgOa4G9b0NV
	 RBxLhOl4+IF8kDN1f2VQ3gggw1yS/zbltYw2JnPLCoLx9CeCGZ+cA0sIk3VE0jUlJ5A2K
	 BFsif/fu4Kv6+5zPxSa++BxBDPXmbbdU9DDZkGSd5FQgtpxPkPcPeGp5AWYHDycmaSh+i
	 0hJAKE/sbrfo2x0gPuOr5NPwpS5HSLJSOq1yziewDRRoViNodc3i4cjveNF0CvbObCVpM
	 MeFbAUR7fMNovej6GhjfqRwE0JhnIgGEd8I9Uz4Ykwdn1VDf390jlaT4GBnS06DJiWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AzxNPZd3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF85E606A320
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 15:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AzxNPZd3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D847A1F008A1;
	Sun,  8 Nov 2026 15:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794153412;
	bh=iFumVZw/KTs0udQHVgqzZMBcP5AsfpB1o8cnS5VmbTM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AzxNPZd3KoZXc+lHrwK2QfO+/5naa/QymHOjVXqasnqTBq7hsdXM5LsYPUt4zTDOn
	 Z/6ADgXQuNQuEcPutOgTZ9dRjepo1cTxi5LyeNfnvgeCYhlF7r+2+48dQpaCYrZRzK
	 m/PXWmaBaqSUuE2G0jzbv+UpXf/GDitniZsTR2q7MdGw4rzSwi2RB2hHCe/mMVqrfK
	 7t2d+JY2qLUXWPH1OLJqJeKldjjrrAIkxouQopDm+1UDaaIuYn16dXdxdPoYvpv5QL
	 8pgTRFHLpm8dVksjz8d/Uj+xHllViOcOHeN1Z7p56Cl+aTuy62/LdKONbKI7A5c6qM
	 xpXxWjUp2nz3w==
Message-ID: <sashiko-outbox-203866@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] phy: apple: atc: Add initial M3 series support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261108-t8122-phy-v1-3-c2783b2a53a8@chaosmail.tech>
References: <20261108-t8122-phy-v1-0-c2783b2a53a8@chaosmail.tech>
 <20261108-t8122-phy-v1-3-c2783b2a53a8@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 15:56:51 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] phy: apple: atc: missing power off on RCAL1 timeout in
  atcphy_configure()
- [Low] phy: apple: atc: missing @hw kernel-doc entry in struct
  apple_atcphy
--

commit 70e818649e5b1dc004594c72a6012be4bd8cf369
Author: Sasha Finkelstein <k@chaosmail.tech>

phy: apple: atc: Add initial M3 series support

This commit adds initial USB and Thunderbolt PHY support for the Apple
M3 series (t8122).

> diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
> index 45f1280a6faa3..256a084996469 100644
> --- a/drivers/phy/apple/atc.c
> +++ b/drivers/phy/apple/atc.c

[ ... ]

> @@ -599,9 +647,10 @@ struct apple_atcphy {
>  		struct apple_tunable *lane_usb4[2];
>  	} tunables;
> =20
> +	const struct atcphy_hw *hw;
>  	enum atcphy_mode mode;
> -	bool swap_lanes;
>  	int dp_link_rate;
> +	bool swap_lanes;
>  	bool pipehandler_up;
> =20
>  	struct {

[Severity: Low]
struct apple_atcphy has a kernel-doc comment block, so adding hw without
a matching @hw entry triggers a W=3D1 kernel-doc warning (and later commit
"phy: apple: atc: Add T8122 DisplayPort support" also leaves @hw
undocumented).

[ ... ]

> +static int atcphy_configure(struct apple_atcphy *atcphy, enum atcphy_mod=
e mode)
> +{
> +	int ret =3D 0;
> +	u32 reg;
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
> +	if (atcphy->hw->gen =3D=3D ATCPHY_GENERATION_T8103) {
> +		core_set32(atcphy, CIO3PLL_CLK_CTRL, CIO3PLL_CLK_PCLK_EN);
> +		core_set32(atcphy, CIO3PLL_CLK_CTRL, CIO3PLL_CLK_REFCLK_EN);
> +	}
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
> +	if (atcphy->hw->gen =3D=3D ATCPHY_GENERATION_T8122 &&
> +	    atcphy_modes[mode].pipehandler_state =3D=3D ATCPHY_PIPEHANDLER_STAT=
E_USB3) {
> +		ret =3D readl_poll_timeout(atcphy->regs.core + AUS_COMMON_DIG_RCAL1, r=
eg,
> +					 (reg & AUS_COMMON_DIG_RCAL1_ALL_CODES_DONE), 10, 100000);
> +		if (ret) {
> +			dev_err(atcphy->dev, "Failed to wait for RCAL1 done\n");
> +			return ret;
> +		}
> +	}

[Severity: Medium]
Should this error path call atcphy_power_off(atcphy) before returning?

When readl_poll_timeout() fails here, the PHY has already been powered
on and taken out of reset (ATCPHY_POWER_PHY_RESET_N), while atcphy->mode
remains APPLE_ATCPHY_MODE_OFF.  Because teardown in
atcphy_usb3_power_off() and atcphy_mux_set() (for TYPEC_STATE_SAFE) only
powers down the PHY when atcphy->mode !=3D APPLE_ATCPHY_MODE_OFF, the PHY
and DP AUX stay powered on after disconnect and ATCPHY_POWER_PHY_RESET_N
remains deasserted when tunables are applied on the next connection.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-t8122-phy-=
v1-0-c2783b2a53a8@chaosmail.tech?part=3D3
