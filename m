Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB7E4A3843
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 14:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359071; cv=none; b=XTtCWL13mevAvWcwmwE8xJ/4d3se0rjF+8z2FWDOgwNV+TFatbwILeuDa7YugGSHhbGitknp9XKZ6MfccD/vvfsvTG7fs9GOZKL8BnmWfpdbow9KfTLp1Cwkxi7HiYkLck1/eE5eZo0oTZYoazr2hJ3s3/aSuWp7uyAIYM4+d2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359071; c=relaxed/simple;
	bh=g4y1dz6cy86SQQvkvMMRWFtslcd5Keg5vCQhDkhFffo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Egq3nkGgn6U3MQIlES/eRhnT3vwli8qy0tNih79Hch5SrN70sJ6HqQTkiKLYtyPL8oxS0s5lnjh/FeMowMgYZr9qNls1lOkvSnrcl5XTqzZ2vzoG6gJ3Rs2/Va1ztH2OHzAcK2jZjUAchND6aBjLr9xVBZlVIbsRKaH4XVb4w2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LsVMR1jN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LsVMR1jN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 543CB1F000E9;
	Wed,  2 Sep 2026 14:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788359069;
	bh=i2+dIzpSFaCz+LgLzdaac9dB+sniaTlOkA964JKf8Vg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LsVMR1jNVMb7AG4AbVTOgVdTTTaH8wzah0/IZ8taxHPEMTEeqvTpILP80rm0euNgN
	 MBdfXE7gYscRp8uKArnBcDQA3e7OFr+XdVPMoyfIjT/9/tuD2XLTzCreZOsZIzTDtn
	 EkXAUcfrkaMBpy7B6nE+lLXqm04KxCjvjG97RqnhQ3G+TmtmzrFnulZEfj34k5mMx4
	 nV4Jk78KCN72yr3NJfmaMp1rXUnUQcgb73dbOxohuh107HfYcXDokXDFWqU5FzjHZq
	 V+3Vgsavtk8xmV0L9eQhZ0G3ZenpFnTIQdE5UIHpf/53Z/A0xy3DELkYUDlLu0C6as
	 HTMAFWLexFhVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] phy: stm32: Add support for ST STM32MP25
 USB2-FEMTO PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: olteanv@gmail.com, neil.armstrong@linaro.org, robh@kernel.org, vkoul@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260902141312.649406-2-marex@nabladev.com>
References: <20260902141312.649406-1-marex@nabladev.com>
 <20260902141312.649406-2-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 14:24:28 +0000
Message-Id: <20260902142429.543CB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [High] Lockless atomic counter allows concurrent callers to access uninit=
ialized hardware.
- [High] Missing decrement of `en_refcnt` on error paths permanently bricks=
 hardware initialization.
- [High] Inconsistent PM suspend/resume logic fails to power down hardware =
if the clock provider is actively used.
- [High] Logical conflict between Clock Framework and PHY set_mode over the=
 CMN register bit causes state desynchronization.
- [High] Incorrect parsing of `reg` property using `of_get_address()` poten=
tially corrupts syscon register 0 on 64-bit platforms.
- [Medium] Failure to assert reset in `stm32_usb2phy_disable` leaves clock =
and regulator permanently enabled.
- [Medium] Driver strictly fails probe if the ostensibly 'optional' vdd33 r=
egulator is missing, breaking the `_optional` contract.
- [Medium] Inconsistent masking in `stm32_usb2phy_set_mode` prevents cleari=
ng `VBUSVLDEXTSEL` on transition to HOST mode.
- [Medium] Blind dereferences of `dev->of_node` and `device_get_match_data(=
)` will crash if bound manually.
- [Low] Build failure due to passing a non-constant mask to `field_prep()`.
- [Low] Commit message contradicts code regarding PHY2 set_mode support.
--

commit 291cd4f88294f76f9e6908ba105bb434b48f3830
Author: Pankaj Dev <pankaj.dev@st.com>

phy: stm32: Add support for ST STM32MP25 USB2-FEMTO PHY

This commit adds a USB2 PHY driver for STM32MP25 USB2 controllers. It
supports two slightly different PHYs on the SoC, each requiring a
different compatible string. The driver handles initialization, clocks,
resets, and regulators for these PHYs.

> V3: - Update copyright years
>     - Register two sets of clock, one 480 MHz PLL and one CMN
>     - Split PHY ops per PHY, since the PHY2 does not have set mode ops

[Severity: Low]
This isn't a bug, but does PHY2 actually support set mode ops?
The commit message indicates PHY2 does not have set mode ops, but they are
assigned in the code for stm32_usb2phy2_data.

> diff --git a/drivers/phy/st/phy-stm32-usb2phy.c b/drivers/phy/st/phy-stm3=
2-usb2phy.c
> index 0000000000000..e173557a3cb59
> --- /dev/null
> +++ b/drivers/phy/st/phy-stm32-usb2phy.c

[ ... ]

> +static int stm32_usb2phy_enable(struct stm32_usb2phy *phy_dev)
> +{
> +	const struct stm32mp2_usb2phy_hw_data *phy_data =3D phy_dev->hw_data;
> +	unsigned int refsel;
> +	unsigned long rate;
> +	int ret;
> +
> +	/* Check if a phy is already init or clkpll in use */
> +	if (atomic_inc_return(&phy_dev->en_refcnt) > 1)
> +		return 0;

[Severity: High]
Does this lockless early return allow a concurrent caller to proceed with
hardware access while initialization is still in flight?

If the PHY and Clock frameworks concurrently invoke stm32_usb2phy_enable(),
such as phy_init() from one driver and clk_prepare() from another, could
thread A increment the counter to 1 and begin enabling regulators, while
thread B increments to 2 and returns success immediately, using the
uninitialized hardware?

> +
> +	rate =3D clk_get_rate(phy_dev->phyref);
> +	if (rate =3D=3D 19200000)
> +		refsel =3D 0;
> +	else if (rate =3D=3D 20000000)
> +		refsel =3D 1;
> +	else if (rate =3D=3D 24000000)
> +		refsel =3D 2;
> +	else
> +		return -EINVAL;

[Severity: High]
Is it possible this error path permanently bricks hardware initialization?

By returning an error without decrementing the en_refcnt, the reference cou=
nt
becomes artificially elevated. Subsequent initialization attempts might byp=
ass
initialization entirely while the hardware remains broken.

> +
> +	ret =3D regmap_update_bits(phy_dev->regmap,
> +				 phy_dev->cr_offset,
> +				 phy_data->phyrefsel_mask,
> +				 field_prep(phy_data->phyrefsel_mask, refsel));

[Severity: Low]
Will this cause a build failure?=20

field_prep() strictly requires a compile-time constant mask, but
phy_data->phyrefsel_mask is resolved at runtime via a pointer dereference.

> +	if (ret)
> +		return ret;

[Severity: High]
Could this error return leave the en_refcnt artificially elevated, preventi=
ng
subsequent initialization attempts from ever succeeding?

> +
> +	ret =3D regulator_enable(phy_dev->vdd33);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D clk_prepare_enable(phy_dev->phyref);
> +	if (ret)
> +		goto error_regdis;
> +
> +	ret =3D reset_control_deassert(phy_dev->rstc);
> +	if (ret)
> +		goto error_clkdis;
> +
> +	return 0;
> +
> +error_clkdis:
> +	clk_disable_unprepare(phy_dev->phyref);
> +error_regdis:
> +	regulator_disable(phy_dev->vdd33);
> +
> +	return ret;

[Severity: High]
Does this final cleanup error path also leave the en_refcnt incremented?

> +}
> +
> +static int stm32_usb2phy_disable(struct stm32_usb2phy *phy_dev)
> +{
> +	int ret;
> +
> +	/* Check if a phy is still init or clkpll in use */
> +	if (atomic_dec_return(&phy_dev->en_refcnt) > 0)
> +		return 0;

[Severity: High]
Does this lockless early return also allow teardown races?

> +
> +	ret =3D reset_control_assert(phy_dev->rstc);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Will failing to assert the reset here leak the clock and regulator resource=
s,
leaving them permanently enabled?

> +
> +	clk_disable_unprepare(phy_dev->phyref);
> +
> +	return regulator_disable(phy_dev->vdd33);
> +}
> +
> +static int stm32_usb2phy_set_mode(struct phy *phy, enum phy_mode mode, i=
nt submode)
> +{
> +	struct stm32_usb2phy *phy_dev =3D phy_get_drvdata(phy);
> +	u32 mask =3D SYSCFG_USB2PHY2CR_USB2PHY2CMN |
> +		   SYSCFG_USB2PHY2CR_VBUSVALID |
> +		   SYSCFG_USB2PHY2CR_VBUSVLDEXT;
> +	u32 val =3D 0;
> +	int ret;
> +
> +	if (mode =3D=3D PHY_MODE_USB_HOST) {
> +		if (submode !=3D USB_ROLE_NONE)
> +			val =3D SYSCFG_USB2PHY2CR_VBUSVALID;
> +	} else if (mode =3D=3D PHY_MODE_USB_DEVICE) {
> +		val =3D SYSCFG_USB2PHY2CR_USB2PHY2CMN |
> +		      SYSCFG_USB2PHY2CR_VBUSVLDEXTSEL;

[Severity: High]
Is there a logical conflict over the SYSCFG_USB2PHY2CR_USB2PHY2CMN bit?

The Clock Framework's internal state could become desynchronized if
stm32_usb2phy_clkcmn_prepare() clears this bit, but stm32_usb2phy_set_mode()
is concurrently called to switch to DEVICE mode and directly sets this exact
same bit via regmap_update_bits().

> +		if (submode !=3D USB_ROLE_NONE)
> +			val |=3D SYSCFG_USB2PHY2CR_VBUSVLDEXT;
> +		mask |=3D SYSCFG_USB2PHY2CR_VBUSVLDEXTSEL;

[Severity: Medium]
Does adding the VBUSVLDEXTSEL bit to the mask dynamically here instead of in
the base mask prevent clearing it on subsequent transitions to HOST mode?

If it is omitted from the mask during a transition to PHY_MODE_USB_HOST,
regmap_update_bits() won't be able to clear it.

> +	} else {
> +		return -EINVAL;
> +	}

[ ... ]

> +static int stm32_usb2phy_probe(struct platform_device *pdev)
> +{
> +	struct phy_provider *phy_provider;
> +	struct device *dev =3D &pdev->dev;
> +	struct stm32_usb2phy *phy_dev;
> +	char *pllname, *cmnname;
> +	const __be32 *offset;
> +	struct phy *phy;
> +	int ret;

[ ... ]

> +	phy_dev->phyref =3D devm_clk_get(dev, NULL);
> +	if (IS_ERR(phy_dev->phyref))
> +		return dev_err_probe(dev, PTR_ERR(phy_dev->phyref), "Failed to get phy=
ref clk\n");
> +
> +	phy_dev->vdd33 =3D devm_regulator_get_optional(dev, "vdd33");
> +	if (IS_ERR(phy_dev->vdd33))
> +		return dev_err_probe(dev, PTR_ERR(phy_dev->vdd33), "Failed to get vdd3=
v3 supply\n");

[Severity: Medium]
Since this propagates -ENODEV when the regulator is absent in the DT, does
this strictly fail probe for platforms legitimately lacking the optional
vdd33 regulator, breaking the _optional contract?

> +
> +	phy_dev->regmap =3D syscon_node_to_regmap(dev->of_node->parent);

[Severity: Medium]
Will this unconditionally dereference dev->of_node?=20

If the device is instantiated manually, such as via sysfs bind without a
backing Device Tree node, dev->of_node will be NULL, leading to a kernel
panic.

> +	if (IS_ERR(phy_dev->regmap))
> +		return dev_err_probe(dev, PTR_ERR(phy_dev->regmap), "Failed to get reg=
map\n");
> +
> +	offset =3D of_get_address(dev->of_node, 0, NULL, NULL);
> +	if (!offset)
> +		return dev_err_probe(dev, -EINVAL, "Failed to get regmap offset\n");
> +
> +	phy_dev->cr_offset =3D be32_to_cpu(*offset);

[Severity: High]
Does this logic incorrectly parse the reg property on 64-bit platforms?

If the parent node uses 2 address cells, which is common on STM32MP25,
*offset contains the high 32 bits of the address, which is typically 0.
This could cause the driver to incorrectly extract 0 and overwrite syscon
register 0 instead of the intended PHY control register.

> +
> +	phy_dev->hw_data =3D device_get_match_data(dev);
> +
> +	phy =3D devm_phy_create(dev, NULL, phy_dev->hw_data->phy_ops);

[Severity: Medium]
Could this unconditionally dereference phy_dev->hw_data if
device_get_match_data(dev) returns NULL when the device is bound manually?

> +	if (IS_ERR(phy))
> +		return dev_err_probe(dev, PTR_ERR(phy), "Failed to create PHY\n");

[ ... ]

> +static int stm32_usb2phy_suspend(struct device *dev)
> +{
> +	struct stm32_usb2phy *phy_dev =3D dev_get_drvdata(dev);
> +
> +	if (phy_dev->is_init)
> +		return stm32_usb2phy_disable(phy_dev);

[Severity: High]
Does this conditional logic incorrectly assume is_init and disable()
correctly account for all framework consumers?

If the hardware was enabled via the Clock API, en_refcnt is 1 but is_init
is false, so suspend does nothing. If enabled via both, calling
stm32_usb2phy_disable() merely decrements en_refcnt to 1 and returns early
without powering off the hardware. Could this fail to shut down the hardware
if the CCF clock is in use?

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902141312.6494=
06-1-marex@nabladev.com?part=3D2
