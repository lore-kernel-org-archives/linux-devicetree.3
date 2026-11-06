Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975187;
	b=DPtfFeZIjGvgUFJFH6uWq+oXbX1wlQid9N/0Au1mR8++v0FiGNcxJUar0vPoKKMjJ86K
	 rJTyPvNbOu+jztci2TQJLqwOrHGNiP8/PcJLcGRCLCZNzqeVv22UUu23P6A39/g9PykIR
	 7V3aDmPpq1cxEtocKahJZMJ7j5vQz+ARXAHWnrFJnH24PGSKYzBQJvSH0Sv7iqyQk37Fa
	 CWIbt1KZ+Z8e++0RloxS895VC6lNuLZWQECcDhbBHguPaNYZwJzLC35BpakuI5xZYoswW
	 NEs6bg3IZEeRPanEqEhKPbi/n94fTCX4s48kPPXIP5FfnOzRrZ6T7FHijFz6ZgOvxtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975187;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ec5T7VXUYsH5PVk/KzDKxhy1sXMynhaZ+V9bOG+hk58=;
	b=ayRxp68tBdRcBl/RPFgB87Q4j86FwmDn0XzGxaFzbtrOUzbCtuikXMyWX7tKaFEnVddw
	 bZ45YqaLSH0dkadLu3hFMs7GiGc8EDV92LoDnzQDmuYynQbZcgOyBCDP69IjzyFE2ary0
	 0G4XGdxhYUSZ3yygLFK6VE8btjPXFpAAzsKJzUTqliHOiMDKtTioUKxOLMF/thmryxHZy
	 VWMwBJJB78FNLAGPrWtgytlFnZFtc7r6xl4In3vw2fCZgWr5LYL6pSV+R5rzGm3oVmZ+e
	 btJR8r4+qmwJeTDhRNhW3q12iwMzZm7XFkR6emLwYYdDbpO4BPe/XSAlSwi1d2OrIPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H2Uo6dSE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6589606A32F
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 14:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H2Uo6dSE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E247D1F0089F;
	Fri,  6 Nov 2026 14:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793975186;
	bh=Ec5T7VXUYsH5PVk/KzDKxhy1sXMynhaZ+V9bOG+hk58=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H2Uo6dSE8XCf34uhOPBOpvkADepbnTYlRKjqfM/zw1c9mIb3wlSSwhszlvfulDGRJ
	 e5SVGq6oPg4HKwo+hGqN/FkdICR9EwnbSKXhyWpDYI8c2Q46kS8vBjnR43pLrOZFvt
	 tyJyvakWz5xhdxkMMDBK5/p/GKOgvbTQNXbdHCqdAaq2H8+GmzzsFCAm+DXnWYwKu3
	 WWbNJVvnbFkV9XsH+AFkIDwulM9j4hIAKF1Gr/EkGInUsxPcrtYKGITZWHHTOm07Sb
	 3im9MuMpmOfUSRWtfemXfdmmwv69IUOfHrd0UO1maSCAD/d81nTju2UvvKSGm3uRKx
	 SqiajBz0ARraQ==
Message-ID: <sashiko-outbox-201576@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/5] phy: starfive: Add jh7110-inno-hdmi-phy driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261106-jh7110-inno-hdmi-phy-v7-4-d49368303800@samsung.com>
References: <20261106-jh7110-inno-hdmi-phy-v7-0-d49368303800@samsung.com>
 <CGME20261106135508eucas1p27cce9d6dbb87522c9bfc0f39995c2755@eucas1p2.samsung.com>
 <20261106-jh7110-inno-hdmi-phy-v7-4-d49368303800@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 14:26:25 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [High] phy: starfive: rate cache and BIAS/RX state broken across
  disable/enable
- [High] phy: starfive: invalid pre_pll_cfg_table dividers break 8
  display modes
- [Medium] phy: starfive: starfive_hdmi_phy_clk_set_rate() skips Pre-PLL
  lock wait
- [Low] phy: starfive: starfive_hdmi_phy_remove() disables refoclk
  before devres
- [Low] phy: starfive: unused inno_read() helper and register bitfield
  macros
- [Low] phy: starfive: power down Post-PLL before configuring dividers
--

commit 2168c08835d9e45c448ec75b42c52dc66537032b
Author: Michal Wilczynski <m.wilczynski@samsung.com>

phy: starfive: Add jh7110-inno-hdmi-phy driver

This commit adds the StarFive JH7110 Innosilicon HDMI PHY driver, which
acts as a clock provider for the pixel clock via the Pre-PLL and a PHY
provider for the Post-PLL and analog blocks.

> diff --git a/drivers/phy/starfive/phy-jh7110-inno-hdmi.c b/drivers/phy/st=
arfive/phy-jh7110-inno-hdmi.c
> new file mode 100644
> index 0000000000000..ebda363e50a3e
> --- /dev/null
> +++ b/drivers/phy/starfive/phy-jh7110-inno-hdmi.c
> @@ -0,0 +1,587 @@

[ ... ]

> +/* REG: 0x1aa */
> +#define STF_INNO_POST_PLL_DIV_1		0x1aa
> +#define STF_INNO_POST_PLL_POST_DIV_ENABLE	GENMASK(3, 2)
> +#define STF_INNO_POST_PLL_REFCLK_SEL_TMDS	BIT(1)
> +#define STF_INNO_POST_PLL_POWER_DOWN		BIT(0)
> +
> +/* REG: 0x1ab */
> +#define STF_INNO_POST_PLL_DIV_2		0x1ab
> +#define STF_INNO_POST_PLL_PRE_DIV(x)		FIELD_PREP(GENMASK(5, 0), x)
> +#define STF_INNO_POST_PLL_FB_DIV_8(x)		FIELD_PREP(BIT(7), (x) >> 8)
> +
> +/* REG: 0x1ac */
> +#define STF_INNO_POST_PLL_DIV_3		0x1ac
> +#define STF_INNO_POST_PLL_FB_DIV_7_0(x)	FIELD_PREP(GENMASK(7, 0), x)
> +
> +/* REG: 0x1ad */
> +#define STF_INNO_POST_PLL_DIV_4		0x1ad
> +#define STF_INNO_POST_PLL_POST_DIV_MASK	GENMASK(1, 0)

[ ... ]

> +/* REG: 0x1b2 */
> +#define STF_INNO_TMDS_CONTROL			0x1b2
> +#define STF_INNO_TMDS_CLK_DRIVER_EN		BIT(3)
> +#define STF_INNO_TMDS_D2_DRIVER_EN		BIT(2)
> +#define STF_INNO_TMDS_D1_DRIVER_EN		BIT(1)
> +#define STF_INNO_TMDS_D0_DRIVER_EN		BIT(0)
> +#define STF_INNO_TMDS_DRIVER_ENABLE		(STF_INNO_TMDS_CLK_DRIVER_EN | \
> +						 STF_INNO_TMDS_D2_DRIVER_EN | \
> +						 STF_INNO_TMDS_D1_DRIVER_EN | \
> +						 STF_INNO_TMDS_D0_DRIVER_EN)

[ ... ]

> +static const struct inno_hdmi_phy_pre_pll_config pre_pll_cfg_table[] =3D=
 {
> +	{ 25175000, 25175000, 1, 100, 2, 3, 3, 12, 3, 3, 4, 0, 0xf55555 },
> +	{ 25200000, 25200000, 1, 100, 2, 3, 3, 12, 3, 3, 4, 0, 0 },
> +	{ 27000000, 27000000, 1, 90, 3, 2, 2, 10, 3, 3, 4, 0, 0 },
> +	{ 27027000, 27027000, 1, 90, 3, 2, 2, 10, 3, 3, 4, 0, 0x170a3d },
> +	{ 28320000, 28320000, 1, 28, 2, 1, 1, 3, 0, 3, 4, 0, 0x51eb85 },
> +	{ 30240000, 30240000, 1, 30, 2, 1, 1, 3, 0, 3, 4, 0, 0x3d70a3 },
> +	{ 31500000, 31500000, 1, 31, 2, 1, 1, 3, 0, 3, 4, 0, 0x7fffff },
> +	{ 33750000, 33750000, 1, 33, 2, 1, 1, 3, 0, 3, 4, 0, 0xcfffff },
> +	{ 36000000, 36000000, 1, 36, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
> +	{ 40000000, 40000000, 1, 80, 2, 2, 2, 12, 2, 2, 2, 0, 0 },
> +	{ 46970000, 46970000, 1, 46, 2, 1, 1, 3, 0, 3, 4, 0, 0xf851eb },
> +	{ 49500000, 49500000, 1, 49, 2, 1, 1, 3, 0, 3, 4, 0, 0x7fffff },
> +	{ 49000000, 49000000, 1, 49, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
> +	{ 50000000, 50000000, 1, 50, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
> +	{ 54000000, 54000000, 1, 54, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
> +	{ 54054000, 54054000, 1, 54, 2, 1, 1, 3, 0, 3, 4, 0, 0x0dd2f1 },
> +	{ 57284000, 57284000, 1, 57, 2, 1, 1, 3, 0, 3, 4, 0, 0x48b439 },
> +	{ 58230000, 58230000, 1, 58, 2, 1, 1, 3, 0, 3, 4, 0, 0x3ae147 },
> +	{ 59341000, 59341000, 1, 59, 2, 1, 1, 3, 0, 3, 4, 0, 0x574bc6 },
> +	{ 59400000, 59400000, 1, 99, 3, 1, 1, 1, 3, 3, 4, 0, 0 },
> +	{ 65000000, 65000000, 1, 130, 2, 2, 2, 12, 0, 2, 2, 0, 0 },
> +	{ 68250000, 68250000, 1, 68, 2, 1, 1, 3, 0, 3, 4, 0, 0x3fffff },
> +	{ 71000000, 71000000, 1, 71, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
> +	{ 74176000, 74176000, 1, 98, 1, 2, 2, 1, 2, 3, 4, 0, 0xe6ae6b },
> +	{ 74250000, 74250000, 1, 99, 1, 2, 2, 1, 2, 3, 4, 0, 0 },
> +	{ 75000000, 75000000, 1, 75, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
> +	{ 78750000, 78750000, 1, 78, 2, 1, 1, 3, 0, 3, 4, 0, 0xcfffff },
> +	{ 79500000, 79500000, 1, 79, 2, 1, 1, 3, 0, 3, 4, 0, 0x7fffff },
> +	{ 83500000, 83500000, 2, 167, 2, 1, 1, 1, 0, 0, 6, 0, 0 },
> +	{ 83500000, 104375000, 1, 104, 2, 1, 1, 1, 1, 0, 5, 0, 0x600000 },
> +	{ 85500000, 85500000, 1, 85, 2, 1, 1, 3, 0, 3, 4, 0, 0x7fffff },
> +	{ 85750000, 85750000, 1, 85, 2, 1, 1, 3, 0, 3, 4, 0, 0xcfffff },
> +	{ 85800000, 85800000, 1, 85, 2, 1, 1, 3, 0, 3, 4, 0, 0xcccccc },
> +	{ 88750000, 88750000, 1, 88, 2, 1, 1, 3, 0, 3, 4, 0, 0xcfffff },
> +	{ 89910000, 89910000, 1, 89, 2, 1, 1, 3, 0, 3, 4, 0, 0xe8f5c1 },
> +	{ 90000000, 90000000, 1, 90, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
> +	{ 101000000, 101000000, 1, 101, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
> +	{ 102250000, 102250000, 1, 102, 2, 1, 1, 3, 0, 3, 4, 0, 0x3fffff },
> +	{ 106500000, 106500000, 1, 106, 2, 1, 1, 3, 0, 3, 4, 0, 0x7fffff },
> +	{ 108000000, 108000000, 1, 90, 3, 0, 0, 5, 0, 2, 2, 0, 0 },
> +	{ 119000000, 119000000, 1, 119, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
> +	{ 131481000, 131481000, 1, 131, 2, 1, 1, 3, 0, 3, 4, 0, 0x7b22d1 },
> +	{ 135000000, 135000000, 1, 135, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
> +	{ 136750000, 136750000, 1, 136, 2, 1, 1, 3, 0, 3, 4, 0, 0xcfffff },
> +	{ 147180000, 147180000, 1, 147, 2, 1, 1, 3, 0, 3, 4, 0, 0x2e147a },
> +	{ 148352000, 148352000, 1, 98, 1, 1, 1, 1, 2, 2, 2, 0, 0xe6ae6b },
> +	{ 148500000, 148500000, 1, 99, 1, 1, 1, 1, 2, 2, 2, 0, 0 },
> +	{ 154000000, 154000000, 1, 154, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
> +	{ 156000000, 156000000, 1, 156, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
> +	{ 157000000, 157000000, 1, 157, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
> +	{ 162000000, 162000000, 1, 162, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
> +	{ 174250000, 174250000, 1, 145, 3, 0, 0, 5, 0, 2, 2, 0, 0x355555 },
> +	{ 174500000, 174500000, 1, 174, 2, 1, 1, 3, 0, 3, 4, 0, 0x7fffff },
> +	{ 174570000, 174570000, 1, 174, 2, 1, 1, 3, 0, 3, 4, 0, 0x91eb84 },
> +	{ 175500000, 175500000, 1, 175, 2, 1, 1, 3, 0, 3, 4, 0, 0x7fffff },
> +	{ 185590000, 185590000, 1, 185, 2, 1, 1, 3, 0, 3, 4, 0, 0x970a3c },
> +	{ 187000000, 187000000, 1, 187, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
> +	{ 201000000, 201000000, 1, 134, 1, 1, 1, 1, 2, 2, 2, 0, 0 },
> +	{ 235690000, 235690000, 1, 235, 2, 1, 1, 3, 0, 3, 4, 0, 0xb0a3d6 },
> +	{ 241500000, 241500000, 1, 161, 1, 1, 1, 4, 0, 2, 2, 0, 0 },
> +	{ 241700000, 241700000, 1, 241, 2, 1, 1, 3, 0, 3, 4, 0, 0xb33332 },
> +	{ 262750000, 262750000, 1, 262, 2, 1, 1, 3, 0, 3, 4, 0, 0xcfffff },
> +	{ 296500000, 296500000, 1, 296, 2, 1, 1, 3, 0, 3, 4, 0, 0x7fffff },
> +	{ 296703000, 296703000, 1, 98, 0, 1, 1, 1, 0, 2, 2, 0, 0xe6ae6b },
> +	{ 297000000, 297000000, 1, 99, 0, 1, 1, 1, 0, 2, 2, 0, 0 },
> +	{ 594000000, 594000000, 1, 99, 0, 2, 0, 1, 0, 1, 1, 0, 0 },
> +	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
> +};

[Severity: High]
Are the fractional dividers in pre_pll_cfg_table[] accurate for 25175000,
25200000, and the six *750000 Hz entries (33750000, 78750000, 85750000,
88750000, 136750000, and 262750000)?

With a 24 MHz reference oscillator and div =3D 96, 25175000 Hz (fracdiv
0xf55555) and 25200000 Hz (fracdiv 0) recalculate via
inno_hdmi_phy_pre_pll_recalc_rate() to 25240000 Hz and 25000000 Hz instead
of using fracdiv 0xb33333 (100.7) and 0xcccccc (100.8).  The six *750000 Hz
entries have div =3D 24 and use fracdiv 0xcfffff (0.8125) instead of
0xc00000 (0.75), recalculating to *813000 Hz.

Whenever starfive_hdmi_phy_clk_recalc_rate() runs while the clock is
prepared, it updates inno->pixclock and the clock core's cached rate to
those recalculated values, which do not exist in pre_pll_cfg_table[].
starfive_hdmi_phy_power_on() then passes clk_get_rate(inno->phyclk) to
inno_hdmi_phy_pre_pll_lookup(), which requires an exact match and fails
with -EINVAL.

[ ... ]

> +static inline void inno_write(struct starfive_hdmi_phy *inno, u32 reg, u=
8 val)
> +{
> +	regmap_write(inno->regmap, reg * 4, val);
> +}
> +
> +static inline u8 inno_read(struct starfive_hdmi_phy *inno, u32 reg)
> +{
> +	u32 val;
> +
> +	regmap_read(inno->regmap, reg * 4, &val);
> +	return val;
> +}

[Severity: Low]
inno_read() is unused (and would return an uninitialized stack value if
regmap_read() failed).  In addition, STF_INNO_POST_PLL_POST_DIV_ENABLE,
STF_INNO_POST_PLL_REFCLK_SEL_TMDS, STF_INNO_POST_PLL_FB_DIV_8,
STF_INNO_POST_PLL_FB_DIV_7_0, STF_INNO_POST_PLL_POST_DIV_MASK, and
STF_INNO_TMDS_DRIVER_ENABLE are defined above but unused while
starfive_hdmi_phy_power_on() open-codes raw hex constants.

[ ... ]

> +static int starfive_hdmi_phy_clk_prepare(struct clk_hw *hw)
> +{
> +	struct starfive_hdmi_phy *inno =3D to_starfive_hdmi_phy(hw);
> +	int ret;
> +
> +	inno_hdmi_phy_pre_pll_power_down(&inno->pre_pll, false);
> +
> +	if (inno_hdmi_phy_pre_pll_is_locked(&inno->pre_pll))
> +		return 0;
> +
> +	ret =3D inno_hdmi_phy_pre_pll_wait_locked(&inno->pre_pll, 100000);
> +	if (ret) {
> +		dev_err(inno->dev, "Timeout waiting for pre-PLL lock\n");
> +		inno_hdmi_phy_pre_pll_power_down(&inno->pre_pll, true);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void starfive_hdmi_phy_clk_unprepare(struct clk_hw *hw)
> +{
> +	struct starfive_hdmi_phy *inno =3D to_starfive_hdmi_phy(hw);
> +
> +	inno_hdmi_phy_pre_pll_power_down(&inno->pre_pll, true);
> +	inno->pixclock =3D 0; /* Invalidate cached rate */
> +}
> +
> +static unsigned long starfive_hdmi_phy_clk_recalc_rate(struct clk_hw *hw,
> +						       unsigned long parent_rate)
> +{
> +	struct starfive_hdmi_phy *inno =3D to_starfive_hdmi_phy(hw);
> +
> +	/*
> +	 * Reading the PLL back requires the HDMI controller's system clock,
> +	 * which the sibling controller driver holds and this driver cannot
> +	 * request without creating a probe cycle with voutcrg. The clock
> +	 * framework walks every registered clock regardless of which drivers
> +	 * have bound, so fall back to the cached rate whenever this clock is
> +	 * not prepared; an unclocked access to the shared register window
> +	 * wedges the bus hard enough that the CPU stops taking NMIs.
> +	 */
> +	if (!clk_hw_is_prepared(hw))
> +		return inno->pixclock;
> +
> +	inno->pixclock =3D inno_hdmi_phy_pre_pll_recalc_rate(&inno->pre_pll,
> +							   parent_rate);
> +
> +	return inno->pixclock;
> +}
> +
> +static int starfive_hdmi_phy_clk_determine_rate(struct clk_hw *hw,
> +						struct clk_rate_request *req)
> +{
> +	struct starfive_hdmi_phy *inno =3D to_starfive_hdmi_phy(hw);
> +
> +	return inno_hdmi_phy_pre_pll_determine_rate(&inno->pre_pll, req);
> +}
> +
> +static int starfive_hdmi_phy_clk_set_rate(struct clk_hw *hw, unsigned lo=
ng rate,
> +					  unsigned long parent_rate)
> +{
> +	struct starfive_hdmi_phy *inno =3D to_starfive_hdmi_phy(hw);
> +	const struct inno_hdmi_phy_pre_pll_config *cfg;
> +
> +	/*
> +	 * The JH7110 only drives 8bpc, so the TMDS clock always matches the
> +	 * pixel clock.
> +	 */
> +	cfg =3D inno_hdmi_phy_pre_pll_lookup(&inno->pre_pll, rate, rate);
> +	if (IS_ERR(cfg))
> +		return PTR_ERR(cfg);
> +
> +	dev_dbg(inno->dev, "%s rate %lu tmdsclk %lu\n",
> +		__func__, rate, cfg->tmdsclock);
> +
> +	if (inno->pixclock =3D=3D rate && inno->tmdsclock =3D=3D cfg->tmdsclock)
> +		return 0;
> +
> +	inno_update_bits(inno, STF_INNO_BIAS_CONTROL,
> +			 STF_INNO_BIAS_ENABLE, STF_INNO_BIAS_ENABLE);
> +	inno_write(inno, STF_INNO_RX_CONTROL, STF_INNO_RX_ENABLE);
> +
> +	inno_hdmi_phy_pre_pll_power_down(&inno->pre_pll, true);
> +	inno_hdmi_phy_pre_pll_configure(&inno->pre_pll, cfg);
> +	inno_hdmi_phy_pre_pll_power_down(&inno->pre_pll, false);
> +
> +	inno->pixclock =3D rate;
> +	inno->tmdsclock =3D cfg->tmdsclock;
> +
> +	return 0;
> +}

[Severity: Medium]
Should starfive_hdmi_phy_clk_set_rate() wait for the Pre-PLL to lock when
the clock is prepared, and avoid powering it up when the clock is
unprepared?

When clk_set_rate() is called while hdmi_pclk is already prepared,
starfive_hdmi_phy_clk_set_rate() powers the Pre-PLL down and back up
without calling inno_hdmi_phy_pre_pll_wait_locked(), so
starfive_hdmi_phy_power_on() can enable the Post-PLL against an unlocked
Pre-PLL reference clock.  Conversely, when clk_set_rate() is called while
hdmi_pclk is unprepared, this powers on STF_INNO_BIAS_ENABLE,
STF_INNO_RX_ENABLE, and the Pre-PLL before clk_prepare() is called.

> +
> +static const struct clk_ops starfive_hdmi_phy_clk_ops =3D {
> +	.prepare =3D starfive_hdmi_phy_clk_prepare,
> +	.unprepare =3D starfive_hdmi_phy_clk_unprepare,
> +	.recalc_rate =3D starfive_hdmi_phy_clk_recalc_rate,
> +	.determine_rate =3D starfive_hdmi_phy_clk_determine_rate,
> +	.set_rate =3D starfive_hdmi_phy_clk_set_rate,
> +};
> +
> +static void starfive_hdmi_phy_power_down(struct starfive_hdmi_phy *inno)
> +{
> +	inno_write(inno, STF_INNO_TMDS_CONTROL, 0x00);
> +	inno_write(inno, STF_INNO_SERIALIER_CONTROL, 0x00);
> +	inno_write(inno, STF_INNO_LDO_CONTROL, 0x00);
> +	inno_update_bits(inno, STF_INNO_BIAS_CONTROL,
> +			 STF_INNO_BIAS_ENABLE, 0x00);
> +	inno_write(inno, STF_INNO_RX_CONTROL, 0x00);
> +
> +	/* Power down Post-PLL */
> +	inno_update_bits(inno, STF_INNO_POST_PLL_DIV_1,
> +			 STF_INNO_POST_PLL_POWER_DOWN,
> +			 STF_INNO_POST_PLL_POWER_DOWN);
> +
> +	inno->tmdsclock =3D 0;
> +	inno->pixclock =3D 0;
> +}

[Severity: High]
Does clearing inno->pixclock, STF_INNO_BIAS_ENABLE, and STF_INNO_RX_CONTROL
across disable/unprepare break re-enabling the display at the same pixel
clock rate?

When the display is disabled, starfive_hdmi_phy_power_down() clears
STF_INNO_BIAS_ENABLE and STF_INNO_RX_CONTROL and zeroes inno->pixclock and
inno->tmdsclock (under phy->mutex rather than the clock core's
prepare_lock), and starfive_hdmi_phy_clk_unprepare() also zeroes
inno->pixclock.  However, clk_core_unprepare() does not clear the clock
core's cached core->rate.

On a subsequent re-enable at the same rate, clk_core_set_rate_nolock() sees
rate =3D=3D core->rate and returns early without calling
starfive_hdmi_phy_clk_set_rate(), so starfive_hdmi_phy_clk_prepare() tries
to power up and lock the Pre-PLL while STF_INNO_BIAS_ENABLE and
STF_INNO_RX_ENABLE are still disabled.  Conversely, if
starfive_hdmi_phy_clk_recalc_rate() is called while hdmi_pclk is unprepared
(for example via clk_summary), it returns inno->pixclock (0) and overwrites
core->rate with 0, causing clk_get_rate(inno->phyclk) in
starfive_hdmi_phy_power_on() to return 0 and fail with -EINVAL when
re-enabling without a mode change.

[ ... ]

> +	inno_write(inno, STF_INNO_POST_PLL_DIV_2,
> +		   STF_INNO_POST_PLL_PRE_DIV(cfg->prediv));
> +	inno_write(inno, STF_INNO_POST_PLL_DIV_3, cfg->fbdiv & 0xff);
> +	inno_write(inno, STF_INNO_POST_PLL_DIV_4, reg_1ad_value);
> +
> +	/* Power up Post-PLL */
> +	inno_write(inno, STF_INNO_POST_PLL_DIV_1, reg_1aa_value);

[Severity: Low]
Should starfive_hdmi_phy_power_on() assert STF_INNO_POST_PLL_POWER_DOWN in
STF_INNO_POST_PLL_DIV_1 before writing the Post-PLL divider registers?  If
the bootloader left the PHY powered on at boot, this updates the dividers
while the Post-PLL is running, unlike starfive_hdmi_phy_clk_set_rate() and
inno_hdmi_phy_rk3328_power_on().

[ ... ]

> +	/* We must prepare/enable refoclk here so .set_rate/.recalc_rate work */
> +	ret =3D clk_prepare_enable(inno->refoclk);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable refoclk: %d\n", ret);
> +		return ret;
> +	}

[ ... ]

> +static void starfive_hdmi_phy_remove(struct platform_device *pdev)
> +{
> +	struct starfive_hdmi_phy *inno =3D platform_get_drvdata(pdev);
> +
> +	of_clk_del_provider(pdev->dev.of_node);
> +	clk_disable_unprepare(inno->refoclk);
> +}

[Severity: Low]
Does starfive_hdmi_phy_remove() disable inno->refoclk before devres
unregisters the PHY provider, PHY, and clock registered with
devm_of_phy_provider_register(), devm_phy_create(), and
devm_clk_register()?  Using devm_clk_get_enabled() (or
devm_add_action_or_reset()) for refoclk would keep teardown in reverse
probe order.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-jh7110-inn=
o-hdmi-phy-v7-0-d49368303800@samsung.com?part=3D4
