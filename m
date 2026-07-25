Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F10734AAE9
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 05:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784956595; cv=none; b=iXq/FxittacAUK0cRkXyI5gd3KtpHmE/K7vUQiubxzKo0clo1ldZ/fSkpa2M8G1Pu2Qt2YWlylmgiSBZSSjIOCjj45kFppx7GIC2PMgU6L8jYi9rPwbO82Edb8SnY8TJfrkytBpYcSUx7fZWyDq20Z0i046DyGmA4NjWSXNzFSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784956595; c=relaxed/simple;
	bh=LmLXazHSFBIR8ZPmfygcyt1cf6laNKsTyTYc8CmtLqA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rGagH2Zz1lsKG2M8SjyOzCZLASreB0T+zkIbC6UwGHtlx1+ypaV5eMolRrC5tQhJsy1zQgFNpN0Ac+c2Ze75QnLpkyMDXDWLlkJNZJ6mJbT601XFXIyenqvmKFfAqNIcZw22uCcvjYmHBE4W8x76s/WcRmmIY6sDutlvc+MLLus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AizyW1Td; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AizyW1Td"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B26341F000E9;
	Sat, 25 Jul 2026 05:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784956593;
	bh=XAKNe4Xav4AmQ2UV4OyG/MZDDnkWslDHAQDtv/PFkF4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AizyW1TdCvHMzpFE/YJ3JQvqRsixlMU3M8G6Hp84PzvB+/uwR3lPJTXws93Bcz5Tp
	 uXTWdidghy/+ZsdWLcxSfl8ZprTW25vAhrtrOTMXDymYWTJegD5F4BoaJeHpM1NiFm
	 IemDLqDkNaIwWQVGNaIaMYzMxX7dK29tJdmZ528VRZ9bpXtQ7+DBvgg27mueTXxqEM
	 aS7egEIGtoO1cJM/Kid+NX/PHutMduPNLcmQRlC7t41PniosLilfNh5sx3AP3lhiTj
	 hjx1eRXM9wLPgsFYz+zoRV9Sy4t958KXAub+MoJSkQKRg7AADke2SSX3IIsCmSgRT3
	 s9rYYB++/0jdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/17] phy: spacemit: add Innosilicon DP TX PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cody Kang" <codykang.hk@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, vkoul@kernel.org, neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260724-k3-display-v1-5-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
 <20260724-k3-display-v1-5-f22a10a52867@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 05:16:32 +0000
Message-Id: <20260725051632.B26341F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Hardware state (PREPLL) is accessed concurrently without protectio=
n across PHY and CCF frameworks.
- [Medium] The driver fails to power off the core DP link PLL (MPLL) when t=
he PHY is disabled, causing a power leak.
- [Medium] Missing cleanup in the `k3_inno_dp_phy_power_on` error paths lea=
ves PHY components actively consuming power.
- [Medium] Dynamically reducing the lane count via `phy_configure()` does n=
ot disable the unused transmit lane drivers.
- [Medium] Unconditional PLL power-up during rate configuration overrides t=
he PHY power state.
- [Medium] Missing bounds check on `opts->lanes` causes out-of-bounds array=
 reads and undefined shift behavior in `k3_inno_dp_phy_set_voltages`.
- [Medium] The pixel clock (`pxclk`) is registered with the CCF without `.p=
repare`/`.unprepare` or `.enable`/`.disable` hooks, yet its power state is =
manipulated implicitly.
--

--- Patch [5]: [PATCH 05/17] phy: spacemit: add Innosilicon DP TX PHY drive=
r ---
commit 46b764d91a977bdc796e404d7eaabb0362e753b0
Author: Cody Kang <codykang.hk@gmail.com>
Subject: phy: spacemit: add Innosilicon DP TX PHY driver

This commit adds support for the Innosilicon DisplayPort transmit PHY
integrated in the SpacemiT K3 SoC. The PHY shares its MMIO window with its
parent DP/eDP controller and exposes lane, rate, and voltage control. It
also registers its pixel PLL as a clock provider.

> diff --git a/drivers/phy/spacemit/phy-k3-inno-dp.c b/drivers/phy/spacemit=
/phy-k3-inno-dp.c
> new file mode 100644
> index 0000000000000..9dd62edb7a5af
> --- /dev/null
> +++ b/drivers/phy/spacemit/phy-k3-inno-dp.c

[ ... ]

> @@ -103,45 +103,45 @@ static int k3_inno_dp_phy_power_on(struct phy *phy)
> +	struct k3_inno_dp_phy *p =3D phy_get_drvdata(phy);
> +	u32 lane_en;
> +	u32 val;
> +	int ret;
> +
> +	switch (p->lanes) {
> +	case 1:
> +		lane_en =3D 0x1;
> +		break;
> +	case 2:
> +		lane_en =3D 0x3;
> +		break;
> +	case 4:
> +	default:
> +		lane_en =3D 0xf;
> +		break;
> +	}
> +
> +	ret =3D regmap_write_bits(p->regmap, DPTX_ANA_MPLL, DPTX_ANA_MPLL_PD, 0=
);
> +	if (ret)
> +		return ret;
> +	ret =3D regmap_write_bits(p->regmap, DPTX_ANA_PREPLL,
> +				DPTX_ANA_PREPLL_PD, 0);
> +	if (ret)
> +		return ret;

[Severity: High]
Are there potential concurrency issues between the CCF and PHY frameworks w=
hen=20
accessing the PREPLL?

The CCF calls k3_inno_dp_pxclk_set_rate() holding the prepare_lock, which=20
powers down the PREPLL, sleeps, and programs registers. Meanwhile, the PHY=
=20
framework calls k3_inno_dp_phy_power_on() holding phy->mutex.=20

Could a concurrent phy_power_on() clear the PREPLL_PD bit during the sleep=
=20
window, causing the clock framework to write configuration values to a=20
running PLL?

> +	usleep_range(2000, 4000);
> +
> +	ret =3D regmap_write_bits(p->regmap, DPTX_PHY_CTRL,
> +				DPTX_PHY_CTRL_XMIT_EN,
> +				FIELD_PREP(DPTX_PHY_CTRL_XMIT_EN, lane_en));
> +	if (ret)
> +		return ret;
> +	usleep_range(2000, 4000);
> +
> +	ret =3D regmap_read_poll_timeout(p->regmap, DPTX_ANA_MPLL, val,
> +				       val & DPTX_ANA_MPLL_LOCKED,
> +				       2000, 10 * 1000);
> +	if (ret) {
> +		dev_err(p->dev, "DP PHY core PLL lock timed out\n");
> +		return ret;
> +	}

[Severity: Medium]
If regmap_read_poll_timeout() times out here or on the PREPLL lock, we retu=
rn=20
an error without reverting the powered-up hardware state.

Since the PHY core framework doesn't invoke phy_power_off() if phy_power_on=
()=20
fails, does this leave the MPLL, PREPLL, and transmit lanes indefinitely=20
powered on in an error state?

> +
> +	ret =3D regmap_read_poll_timeout(p->regmap, DPTX_ANA_PREPLL, val,
> +				       val & DPTX_ANA_PREPLL_LOCKED,
> +				       2000, 10 * 1000);
> +	if (ret)
> +		dev_err(p->dev, "DP PHY pixel PLL lock timed out\n");
> +
> +	return ret;
> +}
> +
> +static int k3_inno_dp_phy_power_off(struct phy *phy)
> +{
> +	struct k3_inno_dp_phy *p =3D phy_get_drvdata(phy);
> +
> +	regmap_write_bits(p->regmap, DPTX_PHY_CTRL, DPTX_PHY_CTRL_XMIT_EN, 0);
> +	usleep_range(2000, 4000);
> +
> +	regmap_write_bits(p->regmap, DPTX_ANA_PREPLL, DPTX_ANA_PREPLL_PD,
> +			  DPTX_ANA_PREPLL_PD);
> +	usleep_range(2000, 4000);
> +
> +	return 0;
> +}

[Severity: Medium]
This powers down the pixel PLL and disables the transmit lanes, but it
appears to skip powering down the core DP link PLL.

Does this leave the MPLL running indefinitely and leaking power when the PH=
Y=20
is meant to be disabled? Should we also be setting DPTX_ANA_MPLL_PD here?

[ ... ]

> +static int k3_inno_dp_phy_set_lanes(struct k3_inno_dp_phy *p, u8 lanes)
> +{
> +	u32 val;
> +	int ret;

[ ... ]

> +	ret =3D regmap_write_bits(p->regmap, DPTX_PHY_CTRL,
> +				DPTX_PHY_CTRL_NUM_LANES,
> +				FIELD_PREP(DPTX_PHY_CTRL_NUM_LANES, val));
> +	if (ret)
> +		return ret;
> +
> +	p->lanes =3D lanes;
> +	return 0;
> +}

[Severity: Medium]
If a caller dynamically reduces the lane count via phy_configure() (for=20
instance, falling back from 4 lanes to 2 during DP link training), this=20
updates the logical lane count but doesn't synchronize the=20
DPTX_PHY_CTRL_XMIT_EN register bits.

Will this leave the unused physical transmit lane drivers actively driven?

[ ... ]

> +static void k3_inno_dp_phy_program_mpll(struct k3_inno_dp_phy *p,
> +					const struct k3_inno_dp_mpll_cfg *cfg)
> +{
> +	struct regmap *rm =3D p->regmap;

[ ... ]

> +	regmap_write_bits(rm, DPTX_ANA_PREPLL_CTRL, DPTX_ANA_PREPLL_LOCK_BYPEN,
> +		FIELD_PREP(DPTX_ANA_PREPLL_LOCK_BYPEN, 1));
> +
> +	regmap_write_bits(rm, DPTX_ANA_MPLL, DPTX_ANA_MPLL_PD,
> +		FIELD_PREP(DPTX_ANA_MPLL_PD, 0));
> +	usleep_range(2000, 4000);
> +}

[Severity: Medium]
When configuring the PLL rate, this clears the power down bit=20
(DPTX_ANA_MPLL_PD) at the end of the programming sequence.

If a rate configuration occurs while the PHY is intentionally suspended, wi=
ll=20
this force the PLLs on and override the PHY's intended power state?

[ ... ]

> +static int k3_inno_dp_phy_set_voltages(struct k3_inno_dp_phy *p,
> +				       struct phy_configure_opts_dp *opts)
> +{
> +	u8 lane;
> +	int ret;
> +
> +	for (lane =3D 0; lane < opts->lanes; lane++) {
> +		unsigned int shift =3D lane * DPTX_PHY_LANE_BITS_PER;
> +		u32 mask =3D DPTX_PHY_LANE_FIELD_MASK << shift;
> +		u32 val  =3D (((opts->voltage[lane] & 0x3) << DPTX_PHY_LANE_VSWING_SHI=
FT) |
> +			    (opts->pre[lane] & 0x3)) << shift;

[Severity: Medium]
Could an unvalidated or uninitialized opts->lanes cause an out-of-bounds
array read on opts->voltage and opts->pre, as well as undefined bit shifts
here?

In k3_inno_dp_phy_configure(), k3_inno_dp_phy_set_lanes() is only called if=
=20
opts->dp.set_lanes is true. If a caller passes opts->dp.set_lanes =3D 0 but=
=20
opts->dp.set_voltages =3D 1, opts->dp.lanes skips validation.

[ ... ]

> +static void k3_inno_dp_program_prepll(struct k3_inno_dp_phy *p,
> +				      const struct k3_inno_dp_prepll_cfg *cfg)
> +{
> +	regmap_write_bits(p->regmap, DPTX_ANA_PREPLL, DPTX_ANA_PREPLL_PD,
> +		FIELD_PREP(DPTX_ANA_PREPLL_PD, 1));
> +	usleep_range(2000, 4000);
> +

[ ... ]

> +	regmap_write_bits(p->regmap, DPTX_ANA_PREPLL, DPTX_ANA_PREPLL_PD,
> +		FIELD_PREP(DPTX_ANA_PREPLL_PD, 0));
> +	usleep_range(2000, 4000);
> +}

[Severity: Medium]
Similar to the MPLL configuration, this unconditionally clears the PREPLL=20
power down bit at the end of programming, potentially overriding the intend=
ed=20
power state of the PHY.

[ ... ]

> +static const struct clk_ops k3_inno_dp_pxclk_ops =3D {
> +	.recalc_rate	=3D k3_inno_dp_pxclk_recalc_rate,
> +	.determine_rate	=3D k3_inno_dp_pxclk_determine_rate,
> +	.set_rate	=3D k3_inno_dp_pxclk_set_rate,
> +};

[Severity: Medium]
The pixel clock is registered with the Common Clock Framework without=20
.prepare/.unprepare or .enable/.disable hooks.

Since the CCF tracks the clock state purely in software while phy_power_off=
()=20
physically powers down the PREPLL, can this cause a mismatch where downstre=
am=20
consumers lose their clock unexpectedly while the CCF thinks it is still=20
running?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-k3-display=
-v1-0-f22a10a52867@gmail.com?part=3D5
