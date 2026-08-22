Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8A533260B
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 07:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787385494; cv=none; b=OfSZa7YROwAEC54GG6szuaRns27BCKKqrq35eFm1OW39gjpnrm0Z8ck4y1VoOBF3d7/M/HKaivtFkwjQE8HApP96grpOwBloomKDZl3vDD+lQIOaaOx7mHPgvJ7SKVDIf0PG3+PlNLxII00g9QHt5jbUzhtCbRX4WYioeP7A0pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787385494; c=relaxed/simple;
	bh=EHucexFU/+v0SjzjcV6eqkbnFWW0dXnb6CniN9JC6S4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZYbVqeL1q3Ky/BL2k596jD5zNPQLuhcxBJ9gsXEBHh6vbFUmRW8VI1DBGXwfpg7MaNajz+QMGSYhPWaBiPx7bQH9MfEfp6ifacVpOzwiTLXIJKHZDjVNNUglY9SUIemr2/L4KgqPhdu/OyYbLtpSg7MDqhCt0LPNRkdCe3M2s3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPnEDt0Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPnEDt0Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C5821F000E9;
	Sat, 22 Aug 2026 07:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787385493;
	bh=r0Ou1mJ25+t3uOSRI0g9QVcAjwgpi/RIQmkvEzEbMGc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PPnEDt0QwVBMb29ljioHk3HV5lyuRDJ29ryEmYDiryhT1qZoKpVZoA7C8eGFs7Y/Z
	 CJwEg8GP+YhXfrqLguYgCakCc3Z0SmussJknRf40aT3NnLedenbzzGSDNsUGGheRys
	 7VQqO1U1iNZPPuPDdmM+ZpLdhRo2f1nFGaH26hcl/sg8h3ubGVlnaTjkGpGeGsrg/I
	 DaxGmP9SdlBeRDhxhwcEszwox6XQTGF7X3LFQFtkGhpLyvUwys02SAhwo45COH+mt8
	 T6pQjZuVt7p+Uto1ki6AxLBElCd11hOFI4+iZF28xz/weBrtxTzpZO474KbHNvBKJP
	 8rsCd40vMKGuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/9] phy: stm32: Add support for ST STM32MP25
 USB2-FEMTO PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, vkoul@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260822074816.548662-3-marex@nabladev.com>
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-3-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 22 Aug 2026 07:58:12 +0000
Message-Id: <20260822075812.9C5821F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Error paths in `stm32_usb2phy_enable` and `stm32_usb2phy_disable` =
fail to correctly rollback the `en_refcnt` atomic counter, leading to perma=
nent state lockup or leaked resources.
- [High] Lack of serialization in hardware initialization allows concurrent=
 callers to bypass initialization and access unready hardware.
- [High] `stm32_usb2phy_set_mode()` fails to clear `SYSCFG_USB2PHY2CR_VBUSV=
LDEXTSEL` when switching from device mode to host mode.
- [High] The driver inappropriately treats an optional regulator as mandato=
ry by unconditionally failing probe on `-ENODEV`.
- [Medium] `stm32_usb2phy2_init` hardcodes `USB_ROLE_NONE`, erasing submode=
 state across re-init cycles.
- [Medium] Uncoordinated access to the `SYSCFG_USB2PHY2CR_USB2PHY2CMN` bit =
between the PHY mode setting and the Clock prepare/unprepare operations.
--

--- Patch [2]: [PATCH v3 2/9] phy: stm32: Add support for ST STM32MP25 USB2=
-FEMTO PHY ---
commit 6743b66f90992ce83291ec2073d75b9d6849c462
Author: Pankaj Dev <pankaj.dev@st.com>
Subject: phy: stm32: Add support for ST STM32MP25 USB2-FEMTO PHY

This commit adds the USB2 PHY driver for STM32MP25 USB2 controllers. It
supports the USB 2.0 host-only controller and the USB 2.0 part of the DWC3
controller.

> diff --git a/drivers/phy/st/phy-stm32-usb2phy.c b/drivers/phy/st/phy-stm3=
2-usb2phy.c
> new file mode 100644
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
Can concurrent callers bypass hardware initialization here? If two threads
call stm32_usb2phy_enable() at the same time, it seems the second caller
will observe the incremented counter and return immediately, while the first
thread is still executing the setup sequence. Would it be safer to use a
driver-level mutex to serialize initialization instead of an atomic check?

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
If stm32_usb2phy_enable() returns -EINVAL for an unsupported clock rate,
does en_refcnt remain incremented? It looks like subsequent calls might see
an inflated count and return success without doing any hardware initializat=
ion.

> +
> +	ret =3D regmap_update_bits(phy_dev->regmap,
[ ... ]
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

[Severity: High]
If reset_control_assert() fails, does the early return leave en_refcnt
decremented while resources are still enabled? This might lead to a state
mismatch and resource leaks if the hardware is out of sync with the referen=
ce
count.

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

[Severity: High]
When switching back to host mode, is the SYSCFG_USB2PHY2CR_VBUSVLDEXTSEL bit
left set? It appears omitted from this default mask.

If it was set during a switch to PHY_MODE_USB_DEVICE, it looks like it won't
be cleared when returning to PHY_MODE_USB_HOST, which might leave the
hardware multiplexer stuck on external VBUS sensing.

> +	u32 val =3D 0;
> +	int ret;
> +
> +	if (mode =3D=3D PHY_MODE_USB_HOST) {
> +		if (submode !=3D USB_ROLE_NONE)
> +			val =3D SYSCFG_USB2PHY2CR_VBUSVALID;
> +	} else if (mode =3D=3D PHY_MODE_USB_DEVICE) {
> +		val =3D SYSCFG_USB2PHY2CR_USB2PHY2CMN |
> +		      SYSCFG_USB2PHY2CR_VBUSVLDEXTSEL;

[Severity: Medium]
Can toggling the CMN clock corrupt the mode configuration? The PHY framework
sets the SYSCFG_USB2PHY2CR_USB2PHY2CMN bit here, but the clock framework
clears this exact same bit in stm32_usb2phy_clkcmn_prepare(). This
uncoordinated access might step on the PHY's expected state.

> +		if (submode !=3D USB_ROLE_NONE)
> +			val |=3D SYSCFG_USB2PHY2CR_VBUSVLDEXT;
> +		mask |=3D SYSCFG_USB2PHY2CR_VBUSVLDEXTSEL;
> +	} else {
> +		return -EINVAL;
> +	}
[ ... ]
> +static int stm32_usb2phy2_init(struct phy *phy)
> +{
> +	struct stm32_usb2phy *phy_dev =3D phy_get_drvdata(phy);
> +	int ret;
> +
> +	ret =3D stm32_usb2phy_enable(phy_dev);
> +	if (ret)
> +		return ret;
> +
> +	if (phy_dev->mode !=3D PHY_MODE_INVALID) {
> +		ret =3D stm32_usb2phy_set_mode(phy, phy_dev->mode, USB_ROLE_NONE);

[Severity: Medium]
Does hardcoding USB_ROLE_NONE erase the previously configured submode state?
If the PHY was previously configured with a valid submode, calling phy_init=
()
again might explicitly clear the VBUSVALID and VBUSVLDEXT bits, leading to
a silent loss of VBUS detection state.

> +		if (ret) {
> +			stm32_usb2phy_disable(phy_dev);
> +			return ret;
> +		}
> +	}
> +
> +	phy_dev->is_init =3D true;
> +
> +	return 0;
> +}
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

[Severity: High]
Does returning PTR_ERR() unconditionally here defeat the purpose of using
an optional regulator? devm_regulator_get_optional() returns -ENODEV if the
regulator is absent in the device tree, which would cause the probe to fail
unconditionally on platforms without it.

> +
> +	phy_dev->regmap =3D syscon_node_to_regmap(dev->of_node->parent);
> +	if (IS_ERR(phy_dev->regmap))
> +		return dev_err_probe(dev, PTR_ERR(phy_dev->regmap), "Failed to get reg=
map\n");
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260822074816.5486=
62-1-marex@nabladev.com?part=3D2
