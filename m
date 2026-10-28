Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202361;
	b=HtjueurNsd3x/g9RDzyzkjKc+2T1NTCIAhpqhTXvJeFTS5GOWNgH+YAdBuue5pRtFy63
	 KoGUcESNFFWrhd24he/pOBqvUvkye0VSMhRSAn2M1/zRx2qxG+ON0YKxE/yS8dEsv1LFs
	 G9pHGv2idUe8kqOAk7zfpX3C1MmsmKW0VLrrajUaYejJlAXhMYM/bJncUJ+UXDuYOI2F6
	 sJ9z48w0cEkJ7K1tnl5GoVNzKDzaDWBk8mKUzBJbk/j7Hfns7rH7BUs3FM21KJ8UcB3cd
	 pzn4spMjnhfR8bGNi0vYs6OcXM8Q3p5h+eySB+XiKSwYOhodXwqnktZc2KuMdJLNdRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202361;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HvHC2Ot2Ch3mXIf1DlX2QOM69UyxffuDNqpJNIhZ6TY=;
	b=Nu2UDW6sSENua6POy4skcDQJ9dSyUCb7cTg+sthxoY+9wVHRT5Bw0eadQwYYq76A593b
	 4hGbwOPXm3Sj+TdtQPy++2HBXXydDh8zRKyytO0xBmVprZEzgm+Rtniyoxh/drSy6WLn8
	 Rdo7PSyXd+Fo+/H8CcYcmx269moF5umjJGJ2x1uPdplRWn6hea1ta9/QHo9QJIVWq1O91
	 cnHfgGnBEYeKk6trvmxzTxDqWVZ2PWajOYPBqIoPG/Ko2v6jpz8oOqnfNfycnakzU4wIb
	 bUAaGd7Ga1BJkZUEIHMNTwZLYmECxWDH4g1i9dUOcbYDe9+EcTUWYrV5fnAVMjmoIhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="B1C/xRZl";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD07606A32C
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B1C/xRZl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7D31F01828;
	Wed, 28 Oct 2026 15:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793202360;
	bh=HvHC2Ot2Ch3mXIf1DlX2QOM69UyxffuDNqpJNIhZ6TY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B1C/xRZljz/YnBrL3OzjwDSAWCJYD/pFXdS4MlTuqRmfLA+GfNZXkUBWE/EqKC14g
	 t/XxH+9E3wPy1OXiYkjuHYXqbhY16MYE4GaI5nIEnDFiYSD3OK0oGxQK6q2goyGY0k
	 WR5icFvWOF+TsgRKyqalVXKKolsnoZOxNG3JGd1FFbRaNu4Ihllko35iBdyg6FK+2h
	 G13tZ7+fLwVh8Xa/mOZj5UZNKWOpMz+vSDwVtlf/qQJlUCJcWR9f6GKzmGaGKeuifv
	 DeAq+i21Aakf1h5b12bKDEaohg2Bbjte/jGdw+FMTd8DtrGJNVsLUQuTtstXxIAi0E
	 cC74vdi/0/I1w==
Message-ID: <sashiko-outbox-188071@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/5] phy: starfive: Add jh7110-inno-hdmi-phy driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261028-jh7110-inno-hdmi-phy-v6-4-f3379684d97e@samsung.com>
References: <20261028-jh7110-inno-hdmi-phy-v6-0-f3379684d97e@samsung.com>
 <CGME20261028152230eucas1p20b3b47e178cb688903098eba0ec0a32b@eucas1p2.samsung.com>
 <20261028-jh7110-inno-hdmi-phy-v6-4-f3379684d97e@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 15:46:00 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] phy: starfive: hdmi: fix rate cache and BIAS/RX state across disab=
le/enable
- [High] phy: starfive: jh7110-inno-hdmi: invalid pre_pll_cfg_table divider=
 values
- [Medium] phy: starfive: jh7110-inno-hdmi: broken Pre-PLL power and lock s=
equencing in clk_ops
- [Low] phy: starfive: unused inno_read() helper and register macros in hdm=
i phy
--

commit de90e248a2b1a2d110bed58fd3d5de2e75a01d3d
Author: Michal Wilczynski <m.wilczynski@samsung.com>

phy: starfive: Add jh7110-inno-hdmi-phy driver

This commit adds the Innosilicon HDMI PHY driver for the StarFive JH7110 So=
C.
The driver acts as both a clock provider for the variable pixel clock via t=
he
Pre-PLL and a PHY provider configuring the Post-PLL and analog blocks.

> diff --git a/drivers/phy/starfive/phy-jh7110-inno-hdmi.c b/drivers/phy/st=
arfive/phy-jh7110-inno-hdmi.c
> new file mode 100644
> index 0000000000000..ebda363e50a3e
> --- /dev/null
> +++ b/drivers/phy/starfive/phy-jh7110-inno-hdmi.c
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
> +
> +/* REG: 0x1af */
> +#define STF_INNO_POST_PLL_LOCK_STATUS		0x1af
> +#define STF_INNO_POST_PLL_LOCK		BIT(0)
> +
> +/* REG: 0x1b0 */
> +#define STF_INNO_BIAS_CONTROL			0x1b0
> +#define STF_INNO_BIAS_ENABLE			BIT(2)
> +
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
[ ... ]
> +	{ 78750000, 78750000, 1, 78, 2, 1, 1, 3, 0, 3, 4, 0, 0xcfffff },
[ ... ]
> +	{ 85750000, 85750000, 1, 85, 2, 1, 1, 3, 0, 3, 4, 0, 0xcfffff },
> +	{ 85800000, 85800000, 1, 85, 2, 1, 1, 3, 0, 3, 4, 0, 0xcccccc },
> +	{ 88750000, 88750000, 1, 88, 2, 1, 1, 3, 0, 3, 4, 0, 0xcfffff },
[ ... ]
> +	{ 136750000, 136750000, 1, 136, 2, 1, 1, 3, 0, 3, 4, 0, 0xcfffff },
[ ... ]
> +	{ 262750000, 262750000, 1, 262, 2, 1, 1, 3, 0, 3, 4, 0, 0xcfffff },

[Severity: High]
Do these eight entries in pre_pll_cfg_table generate the wrong pixel clock
and cause starfive_hdmi_phy_power_on() to fail with -EINVAL?

With the 24 MHz reference clock:
- 25175000 has div =3D 1 * 12 * 4 * 2 =3D 96, so 24 MHz * (100 + 0xf55555 /=
 2^24)
  / 96 yields 25,239,583 Hz, which inno_hdmi_phy_pre_pll_recalc_rate()
  recalculates as 25240000 Hz.
- 25200000 has div =3D 96 and fracdiv =3D 0, so 24 MHz * 100 / 96 yields
  25000000 Hz.
- 33750000, 78750000, 85750000, 88750000, 136750000, and 262750000 have
  div =3D 1 * 3 * 4 * 2 =3D 24 and fracdiv =3D 0xcfffff (~0.8125 instead of
  0xc00000 =3D 0.75), which adds 812.5 kHz instead of 750 kHz and recalcula=
tes
  to 33812000, 78812000, 85812000, 88812000, 136812000, and 262812000 Hz.

When hdmi_pclk is prepared and starfive_hdmi_phy_clk_recalc_rate() runs:

    clk_change_rate()
      clk_recalc()
        starfive_hdmi_phy_clk_recalc_rate()
          inno_hdmi_phy_pre_pll_recalc_rate()

the clock framework caches the recalculated rate in core->rate. When
starfive_hdmi_phy_power_on() then calls:

    tmdsclock =3D clk_get_rate(inno->phyclk);
    pre_cfg =3D inno_hdmi_phy_pre_pll_lookup(&inno->pre_pll, tmdsclock,
                                           tmdsclock);

inno_hdmi_phy_pre_pll_lookup() requires an exact match against
cfg->pixclock in pre_pll_cfg_table, which fails with -EINVAL for all eight
modes.

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
Is inno_read() needed here? It is never called in this file, and the
register bit macros STF_INNO_POST_PLL_POST_DIV_ENABLE,
STF_INNO_POST_PLL_REFCLK_SEL_TMDS, STF_INNO_POST_PLL_FB_DIV_8,
STF_INNO_POST_PLL_FB_DIV_7_0, STF_INNO_POST_PLL_POST_DIV_MASK, and
STF_INNO_TMDS_DRIVER_ENABLE defined at the top of the file are also unused
(while starfive_hdmi_phy_power_on() open-codes 0x0e, 0x02, cfg->fbdiv & 0xf=
f,
and 0x8f), which triggers compiler warnings under W=3D2 builds.

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
[ ... ]
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
Should starfive_hdmi_phy_clk_set_rate() wait for the Pre-PLL to lock or keep
it powered down when the clock is unprepared?

In starfive_hdmi_phy_clk_set_rate(), the driver powers down the Pre-PLL,
configures it, and powers it back up via
inno_hdmi_phy_pre_pll_power_down(&inno->pre_pll, false), returning 0 without
calling inno_hdmi_phy_pre_pll_wait_locked().

If clk_set_rate() is called while hdmi_pclk is already prepared,
starfive_hdmi_phy_clk_prepare() is not called again because prepare_count is
already non-zero, so nothing waits for the Pre-PLL to lock before
starfive_hdmi_phy_power_on() configures and enables the Post-PLL (which uses
the Pre-PLL TMDS clock as its reference).

Conversely, if clk_set_rate() is called while hdmi_pclk is unprepared,
starfive_hdmi_phy_clk_set_rate() leaves the Pre-PLL, STF_INNO_BIAS_ENABLE,
and STF_INNO_RX_ENABLE powered on in hardware while prepare_count is 0.

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
What happens when HDMI output is disabled and then re-enabled at the same
pixel clock rate?

When the display is disabled:
1. starfive_hdmi_phy_power_off() -> starfive_hdmi_phy_power_down() clears
   STF_INNO_BIAS_ENABLE and STF_INNO_RX_CONTROL to 0, and sets
   inno->tmdsclock =3D 0 and inno->pixclock =3D 0.
2. clk_disable_unprepare() -> starfive_hdmi_phy_clk_unprepare() powers down
   the Pre-PLL and sets inno->pixclock =3D 0.

However, clk_core_unprepare() in the clock framework does not clear
core->rate, so the clock framework still caches the previous rate R.

When the display is re-enabled at the same rate R:
1. clk_set_rate(phyclk, R) sees rate =3D=3D clk_core_get_rate_nolock(core) =
in
   clk_core_set_rate_nolock() and returns 0 early without calling
   starfive_hdmi_phy_clk_set_rate().
2. clk_prepare_enable(phyclk) calls starfive_hdmi_phy_clk_prepare() before
   phy_power_on(), powering up the Pre-PLL and polling
   inno_hdmi_phy_pre_pll_wait_locked() while STF_INNO_BIAS_ENABLE and
   STF_INNO_RX_ENABLE are still disabled at 0 (and without reprogramming the
   Pre-PLL if the shared register block was reset).

Additionally, if a clock tree walk invokes starfive_hdmi_phy_clk_recalc_rat=
e()
while phyclk is unprepared after inno->pixclock was zeroed, it returns 0 and
overwrites core->rate with 0. If the display is then re-enabled without a n=
ew
clk_set_rate() call, clk_get_rate(inno->phyclk) in
starfive_hdmi_phy_power_on() returns 0 and fails
inno_hdmi_phy_pre_pll_lookup() with -EINVAL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028-jh7110-inn=
o-hdmi-phy-v6-0-f3379684d97e@samsung.com?part=3D4
