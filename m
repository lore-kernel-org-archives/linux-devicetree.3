Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BF027603A
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 15:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787930421; cv=none; b=oRXyP63KI1n01CS6KwWnSOjm7R2GIoDJgyUyrBx2BCTYKY4tOh1btsubnpVTC9KYTGQDngAKaS+rVQEqEIO+PZ+7/e83pnUj0nZOKqkzd/Cj0emkiFpddKPL+s+nkMR/zXpFoLMEKeYfWzCCDm2HG08Jy+fK9QJZg9dxqILI9Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787930421; c=relaxed/simple;
	bh=neBNNvuOg0vanzHMJ9JS4ewUdsCee5scaLXQJekNBPo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GyIUtiii6rPq3ON4Lxggsi88/4Ya+j4ceyTkKbW9+KD+n7gkNTV4gXFkLOUAKQicCz0+TiQEgJ+3EaI8PW6UWdmtJ5g75ynQITSt9MdApuZks9u9NaD9JSJ4BpZ97otq8lZjh7glMM86leZPNwNyi9wlT3y85YQKj9Cqb5kTQK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AueBkt6a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AueBkt6a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A851A1F000E9;
	Fri, 28 Aug 2026 15:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787930420;
	bh=RhtuiZawvEMOVSZQH7OGbAHCiJt4pDI7yoZcJ5uggs8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AueBkt6asdz9vCrzNUorkSxdcLrO0yvLgRDanVU31DI6LMlFEvXbyde9tYYVANNRl
	 T4Ye0t9ll3M8QZ4vpHkhkjZ6B3N5sA23VSdVsC7aFxcxmuC7rIS0biWUv08eqCdsKq
	 liidh+nl6/eOCRihGPzK7iFEcpAktKB8qocKoWtOfOIPil1itrwPhwd0HZ8+umfGBy
	 WtNZJwjiTiGVHBaxZxB9wmwBI2pkq51uG/3AlXHu9pwUC5Ci+OiBdxzCMjyrvviZ8H
	 qUJIqtlS8iCUXz/Fv6DTYumhv1qQZjOj/9cDNrccCVF7s8+VT5vShKZYAkamX+pg6G
	 9spaK09Z89hHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] phy: stm32: Add support for ST STM32MP25
 USB2-FEMTO PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: robh@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20260828150739.174460-2-marex@nabladev.com>
References: <20260828150739.174460-1-marex@nabladev.com>
 <20260828150739.174460-2-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 15:20:19 +0000
Message-Id: <20260828152019.A851A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Missing decrement of en_refcnt on error paths in stm32_usb2phy_ena=
ble.
- [High] Concurrent enablement from PHY and Clock subsystems lacks mutual e=
xclusion.
- [High] Probe fails if the optional vdd33 regulator is legitimately absent=
 in the device tree.
- [High] Conflicting logical management of the SYSCFG_USB2PHY2CR_USB2PHY2CM=
N bit between the PHY mode and Clock provider callbacks.
- [High] Broken system suspend/resume state machine due to lockless en_refc=
nt behavior.
- [Medium] Abort on reset_control_assert failure in stm32_usb2phy_disable l=
eaves clocks and regulators enabled.
- [Medium] Incomplete base mask in stm32_usb2phy_set_mode() leads to a stic=
ky bit state across mode transitions.
- [Medium] The commit message incorrectly describes which PHY lacks set_mod=
e ops.
--

commit 383d4473f65eff71d72d78c3fdee1332b1fea490
Author: Pankaj Dev <pankaj.dev@st.com>

    phy: stm32: Add support for ST STM32MP25 USB2-FEMTO PHY
   =20
    Add USB2 PHY driver for STM32MP25 USB2 controllers, which includes the
    USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
    Two such PHYs in total are present in STM32MP25 SoC, they both are
    slightly different, therefore they use different compatible string
    to discern them.

> ---
> V2: - Fix up Sob/Cdb lines
>     - Operate PHY as a syscon subnode
> V3: - Update copyright years
>     - Register two sets of clock, one 480 MHz PLL and one CMN
>     - Split PHY ops per PHY, since the PHY2 does not have set mode ops

[Severity: Medium]
Is this description accurate? Looking at the code, it seems `stm32_usb2phy2=
_data`
(PHY2) actually defines `.set_mode =3D stm32_usb2phy_set_mode`, while
`stm32_usb2phy1_data` (PHY1) omits it.

> diff --git a/drivers/phy/st/phy-stm32-usb2phy.c b/drivers/phy/st/phy-stm3=
2-usb2phy.c
> new file mode 100644
> index 0000000000000..8c68b2d208d73
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
Does this atomic check lack mutual exclusion for concurrent callers?

If the PHY framework and the Clock framework concurrently call this functio=
n,
one thread could increment the counter, see it > 1, and return 0 before the
first thread has finished deasserting reset or enabling clocks, leading to
uninitialized hardware usage.

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
> +
> +	ret =3D regmap_update_bits(phy_dev->regmap,
> +				 phy_dev->cr_offset,
> +				 phy_data->phyrefsel_mask,
> +				 field_prep(phy_data->phyrefsel_mask, refsel));
> +	if (ret)
> +		return ret;
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
> +}

[Severity: High]
Do the error paths in this function miss decrementing `en_refcnt`?

If any of these steps (`clk_get_rate`, `regmap_update_bits`,
`regulator_enable`, `clk_prepare_enable`, or `reset_control_deassert`) fail,
`en_refcnt` remains permanently inflated. Subsequent calls to
`stm32_usb2phy_enable` will observe `en_refcnt > 1` and immediately return
success (0). The driver will falsely report that the hardware is initialize=
d.

> +static int stm32_usb2phy_disable(struct stm32_usb2phy *phy_dev)
> +{
> +	int ret;
> +
> +	/* Check if a phy is still init or clkpll in use */
> +	if (atomic_dec_return(&phy_dev->en_refcnt) > 0)
> +		return 0;
> +
> +	ret =3D reset_control_assert(phy_dev->rstc);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Does aborting on `reset_control_assert` failure here permanently leak the
enable counts for the clocks and regulators?

Since `en_refcnt` was already decremented to 0 at the top of the function,
returning here skips `clk_disable_unprepare` and `regulator_disable`.=20
Re-enabling the PHY later will increment the framework usage counts for the=
se=20
resources again, leaking their reference counts.

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
> +		if (submode !=3D USB_ROLE_NONE)
> +			val |=3D SYSCFG_USB2PHY2CR_VBUSVLDEXT;
> +		mask |=3D SYSCFG_USB2PHY2CR_VBUSVLDEXTSEL;

[Severity: Medium]
Does expanding the base mask only for DEVICE mode lead to a sticky bit state
across mode transitions?

When switching from DEVICE mode to HOST mode, `VBUSVLDEXTSEL` is excluded
from the mask. As a result, `regmap_update_bits` will ignore this bit,
leaving it persistently set to 1 from the previous mode.

> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	ret =3D regmap_update_bits(phy_dev->regmap, phy_dev->cr_offset, mask, v=
al);

[Severity: High]
Can this forcibly set `SYSCFG_USB2PHY2CR_USB2PHY2CMN`, conflicting with the
clock provider's management of the same bit?

In `stm32_usb2phy_clkcmn_prepare()` below, the Clock API explicitly clears
this bit. Since these operations run across independent subsystems with no
software coordination, one API can silently overwrite the logical state
set by the other, causing unpredictable clock or PHY behavior.

[ ... ]

> +static int stm32_usb2phy_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	phy_dev->vdd33 =3D devm_regulator_get_optional(dev, "vdd33");
> +	if (IS_ERR(phy_dev->vdd33))
> +		return dev_err_probe(dev, PTR_ERR(phy_dev->vdd33), "Failed to get vdd3=
v3 supply\n");

[Severity: High]
Does this cause the probe to fail if the optional `vdd33` regulator is
legitimately absent in the device tree?

If omitted from the DT, `devm_regulator_get_optional` correctly returns=20
`-ENODEV`. However, this check unconditionally passes it to=20
`dev_err_probe`, failing the probe. Should `-ENODEV` be ignored and the=20
pointer set to NULL instead?

[ ... ]

> +static int stm32_usb2phy_suspend(struct device *dev)
> +{
> +	struct stm32_usb2phy *phy_dev =3D dev_get_drvdata(dev);
> +
> +	if (phy_dev->is_init)
> +		return stm32_usb2phy_disable(phy_dev);
> +
> +	return 0;
> +}
> +
> +static int stm32_usb2phy_resume(struct device *dev)
> +{
> +	struct stm32_usb2phy *phy_dev =3D dev_get_drvdata(dev);
> +
> +	if (phy_dev->is_init)
> +		return stm32_usb2phy_enable(phy_dev);
> +
> +	return 0;
> +}

[Severity: High]
Can the system suspend/resume state machine break due to the lockless
`en_refcnt` behavior?

If both the clock and PHY are enabled (`en_refcnt` =3D=3D 2), and the system
suspends, `stm32_usb2phy_disable` will decrement `en_refcnt` from 2 to 1
and return 0 without touching the hardware. Upon resume,
`stm32_usb2phy_enable` will bump it back to 2 and return 0, completely
bypassing actual hardware re-initialization.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828150739.1744=
60-1-marex@nabladev.com?part=3D2
