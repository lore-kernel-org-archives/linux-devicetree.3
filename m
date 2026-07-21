Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10056375F65
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784631452; cv=none; b=afjBQ3cXWJTMXSeiPlUZqHqCJaASLiDCRFkgSknpU7ofyq/STX93WYOLbmFk7mmxUzfPF+Z5gAkbFTC9l5CfpwB+SneTR1oN2/VI3FGjM+ew3yV/3IiAOSQ13E8Z7aEdGNR+gcym6UFzyPyR7GRumuadD439QAc0Oz1oJjIC6xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784631452; c=relaxed/simple;
	bh=PTW5ssrHFeoUt3AEZeFL6yK0bWeo9GJl0ADMwXOUSuA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MvEebSysTQ3ZNHgNM3IyhSDNEW/uS3077gauIiYJ5/hem38L1PhEdtph2+jB3wSdUZuW1KeXHktdIQE+7sdyHengaLhgukrWWd8xZ1oR+HG7w/Nta1yZprnb1izNkTtclv5AP/sylBxffO1thBrEm0BEoi6gnhnvN92VRsJvA10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ev1x8S3w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ev1x8S3w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 547CD1F000E9;
	Tue, 21 Jul 2026 10:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784631446;
	bh=w1ESGHj5JGGFYJKWL1ddOXP70xerOY+DZSnv3syxRZw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ev1x8S3wRHPTxQbb+A3sz7rY/4eqmlj6+w6tPqiO7ykDbmvap3QuznyL49RFXN6b5
	 ovB/TrOPT4JxyySJip5q79c1ik3gvP2aH3uxpzA9C1b/noyc4dCvobromulLX6kOsU
	 oApYSkseWA2sOMmFbSJjHZdD/xfHfWgL49buHxq09n+z9lghuOda1mJ92UVrWQkW6F
	 bn1p41z9TOgpVSCOwXDc2tz9lmOCuxJVK8uIbUMg9SwKqpzVzIlw3u9GpBWg/VYhLy
	 Ybp4O8tE5cpT4tHPT/ipG1iq7nrC9kl6WAaBGcz1PgtOV7HOYvS/EiA7KHh5MhXqeA
	 xFwPYV8YDLrRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] phy: rockchip-samsung-dcphy: add MIPI D-PHY
 receiver support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jason Yang" <jason98166@gmail.com>
Cc: linux-phy@lists.infradead.org, conor+dt@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, robh@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org
In-Reply-To: <20260721-dcphy-rx-v1-v1-4-4fc83c0ccac9@gmail.com>
References: <20260721-dcphy-rx-v1-v1-0-4fc83c0ccac9@gmail.com>
 <20260721-dcphy-rx-v1-v1-4-4fc83c0ccac9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:57:24 +0000
Message-Id: <20260721105725.547CD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The RX power-on sequence fails to toggle the `apb_rst` reset line,=
 potentially leaving the shared APB bus interface uninitialized if the RX d=
irection is powered on before TX.
- [High] If `samsung_mipi_dphy_rx_lane_enable()` fails (e.g., due to a PHY_=
READY timeout), it returns an error but leaves the `PHY_ENABLE` bits set in=
 the PHY registers and unconditionally deasserts the `s_phy_rst` core reset.
- [High] The `lanes` configuration field is shared between TX and RX, leadi=
ng to state corruption and incorrect lane cleanup if both directions are co=
nfigured independently.

Pre-existing issues:
- [High] Concurrent power_on calls for TX and RX can race due to a time-of-=
check to time-of-use (TOCTOU) vulnerability on the unprotected `peer->power=
_count`.
--

--- Patch [4]: [PATCH 4/4] phy: rockchip-samsung-dcphy: add MIPI D-PHY rece=
iver support ---
commit 1a7ff981a5098deb181df94fdb6e07f8dc4040a9
Author: Jason Yang <jason98166@gmail.com>
phy: rockchip-samsung-dcphy: add MIPI D-PHY receiver support

This commit implements the receiver (CSI) direction of the D-PHY. It adds t=
he
RX register layout, the HS-frequency settle table, and hooks the receiver
bring-up and teardown into the per-direction power and configuration paths.

> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/=
phy/rockchip/phy-rockchip-samsung-dcphy.c
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c

[ ... ]

> +static int samsung_mipi_dphy_rx_lane_enable(struct samsung_mipi_dcphy *s=
amsung)
> +{
> +	u32 sts;
> +	int ret, i;
> +
> +	regmap_update_bits(samsung->regmap, DPHY_SC_GNR_CON0, PHY_ENABLE, PHY_E=
NABLE);
> +	for (i =3D 0; i < samsung->lanes; i++)
> +		regmap_update_bits(samsung->regmap, rx_data_lane_gnr_con0[i],
> +				   PHY_ENABLE, PHY_ENABLE);
> +
> +	ret =3D regmap_read_poll_timeout(samsung->regmap, DPHY_SC_GNR_CON0,
> +				       sts, sts & PHY_READY, 200, 4000);
> +	if (ret) {
> +		dev_err(samsung->dev, "RX clock lane not ready\n");
> +		return ret;
> +	}

[Severity: High]
If regmap_read_poll_timeout() fails here, do we leak the previously set
PHY_ENABLE bits?

Returning early leaves the PHY_ENABLE bits set in the PHY registers.
The caller catches the error and propagates it, meaning the framework
will not call power_off() to clean up. On subsequent retries, writing
PHY_ENABLE to a register where it is already 1 will fail to produce the
0 -> 1 edge transition required by the PHY state machine to start, breaking
future attempts to initialize the RX lanes.

[ ... ]

> +static int samsung_mipi_dphy_rx_power_on(struct samsung_mipi_dcphy *sams=
ung,
> +					 struct phy *peer)
> +{
> +	bool first =3D peer->power_count =3D=3D 0;

[Severity: High]
This is a pre-existing issue, but is it safe to rely on peer->power_count
here to determine if shared initialization is needed?

The PHY core framework increments phy->power_count outside the driver's loc=
k,
only after the power_on() callback returns. If Thread A (RX) and Thread B
(TX) call phy_power_on() concurrently:

Thread A configures RX, drops samsung->lock, but is preempted before
rx_phy->power_count is incremented.
Thread B acquires samsung->lock, sees rx_phy->power_count is still 0, and
executes its 'first' initialization sequence.

For TX, this involves explicitly asserting the shared APB bus reset
(apb_rst), which would wipe out the entire RX configuration Thread A just
applied. Should the driver track the initialization state internally instead
of relying on power_count?

> +	int ret;
> +
> +	if (!samsung->hs_clk_rate)
> +		return -EINVAL;
> +
> +	reset_control_assert(samsung->s_phy_rst);
> +
> +	if (first)
> +		samsung_mipi_dcphy_bias_block_enable(samsung);

[Severity: High]
If the PHY is used in a receive-first or receive-only role, does this seque=
nce
omit the apb_rst hardware initialization for the shared APB bus?

Looking at the TX power-on sequence, it toggles apb_rst when first is true =
to
ensure the shared APB bus interface is properly initialized. If RX powers on
first, the apb_rst toggle is skipped here, and a subsequent TX power-on will
see first =3D=3D false and also skip it. Can this leave the shared APB bus
interface uninitialized and potentially cause system hangs during regmap
accesses?

> +	samsung_mipi_dphy_rx_config_common(samsung);
> +
> +	ret =3D samsung_mipi_dphy_rx_config_settle(samsung);
> +	if (ret)
> +		goto out_deassert;
> +
> +	ret =3D samsung_mipi_dphy_rx_lane_enable(samsung);
> +
> +out_deassert:
> +	reset_control_deassert(samsung->s_phy_rst);
> +
> +	return ret;
> +}

[Severity: High]
Does this unconditionally commit the leaked PHY_ENABLE state to the hardwar=
e?

If samsung_mipi_dphy_rx_lane_enable() fails due to the timeout mentioned
earlier, it drops through to here and deasserts s_phy_rst. Combined with the
missing PHY_ENABLE cleanup, this commits the broken hardware state.

[ ... ]

> @@ -1525,13 +1831,17 @@ static int samsung_mipi_dcphy_configure(struct ph=
y *phy,
>  	struct samsung_mipi_dcphy *samsung =3D pd->parent;
>  	unsigned long long target_rate =3D opts->mipi_dphy.hs_clk_rate;
> =20
> +	mutex_lock(&samsung->lock);
>  	samsung->lanes =3D opts->mipi_dphy.lanes > 4 ? 4 : opts->mipi_dphy.lane=
s;

[Severity: High]
Does sharing the samsung->lanes variable between TX and RX lead to state
corruption?

Since the driver models TX and RX as two independent PHY instances, either
instance will blindly overwrite samsung->lanes here. If a consumer configur=
es
TX with 4 lanes and a second consumer configures RX with 2 lanes,
samsung->lanes becomes 2. A subsequent TX power_off() will read this state
and only disable 2 lanes, leaking the other 2 active TX lanes. Should lanes
be tracked per-direction?

> -	if (pd->dir =3D=3D RK_DCPHY_DIR_RX)
> -		return -EOPNOTSUPP;
> -
> -	samsung_mipi_dcphy_pll_calc_rate(samsung, target_rate);
> -	opts->mipi_dphy.hs_clk_rate =3D samsung->pll.rate;
> +	if (pd->dir =3D=3D RK_DCPHY_DIR_RX) {
> +		/* The sensor supplies the link clock; the PLL stays off. */
> +		samsung->hs_clk_rate =3D target_rate;
> +	} else {
> +		samsung_mipi_dcphy_pll_calc_rate(samsung, target_rate);
> +		opts->mipi_dphy.hs_clk_rate =3D samsung->pll.rate;
> +	}
> +	mutex_unlock(&samsung->lock);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-dcphy-rx-v=
1-v1-0-4fc83c0ccac9@gmail.com?part=3D4
