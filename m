Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64462BE034
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 01:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786497163; cv=none; b=C9q113Ozweg/+ENMFOgr8/ioXnll46VQOsauyNotQRdaM63ZNlPQDTpecobA2M9ZD+RiF0I/BtEHiZiOFgUlaYKtL2m/Exgo7jgyHx1HLvGcAq2n9xHm5XkTVKQ9LqOxswcyCSyaa/jP/Xl50dVQG/Kyxwuwhky71PL8kMLNeSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786497163; c=relaxed/simple;
	bh=rU1kwpjMQSB4ifyUfbQGYvWQQdRQG7a2UaEamrvtuKk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ep8h9P7NLlfEDlELgySrXUf9MUPsyviU2IPHw+KhoGUK3TgIDbe3KrHdH9FoJPtM0NAV6gxEWY/IJfrVMDvqGaKUFrupA9j+cE1CCkpIMdcBrHrqbwzUkHbUC2ZZiL9XzEN6uNDCl/L9vSvGjltj3wwDYyUCpiVDPfFi5r5sRUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O55lGvys; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O55lGvys"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C7D41F00A3A;
	Wed, 12 Aug 2026 01:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786497161;
	bh=1nASlmuS+v0jwRQC+UuinvC4MnCWsadWTWifB+SK38k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O55lGvysKAoyApyyk9+lgSWZ84r9gRh6DbpgDka+io+0zA23Tm2z58Ka6YbgYXAMu
	 2x+Ce9eRGpcmPewY/OrnuZHIxfIRItAQ6DW4bWaaGH+474FtlJy6pCcGNYaf8/6nqV
	 y3yYHgTwLFbVTuFpiVltstkPAK7qiN5T70sXLbfipT5gUXxTJCtRHLqiRx4GCd6iA7
	 +0AT2qZK4FqIhWEdS3dVmGFjpDE7l0tKv9f4wvtv7CyecHJxwTllv4OYXQS/0IKupR
	 6p3PF2US8lvEr/xShiOprfu7Bwenu2yscRRdFzgDKLVC/wAm2sJElE4se6GTHrVee+
	 akMA/FjTJx/gw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/8] phy: stm32: Add support for ST STM32MP25 USB2-FEMTO
 PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260812010157.1772849-3-marex@nabladev.com>
References: <20260812010157.1772849-1-marex@nabladev.com>
 <20260812010157.1772849-3-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 01:12:40 +0000
Message-Id: <20260812011241.2C7D41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Error paths in `stm32_usb2phy_enable` and `stm32_usb2phy_disable` =
fail to balance the `en_refcnt` reference counter.
- [High] Concurrent hardware initialization between the PHY framework and t=
he Clock framework is not serialized.
- [High] System suspend/resume logic fails to correctly suspend and restore=
 hardware state.
- [Medium] Configuring the host-only PHY into device mode physically corrup=
ts the reference clock selection register.
- [Low] Missing validation of `device_get_match_data()` return value leads =
to a NULL pointer dereference.
--

--- Patch [2]: [PATCH 2/8] phy: stm32: Add support for ST STM32MP25 USB2-FE=
MTO PHY ---
commit f2add7ff621e9f11087271861a198a27e1da818a
Author: Pankaj Dev <pankaj.dev@st.com>
phy: stm32: Add support for ST STM32MP25 USB2-FEMTO PHY

This commit adds the USB2 PHY driver for STM32MP25 USB2 controllers. It
supports both the USB2.0 host-only controller and the USB 2.0 part of the
DWC3 controller by differentiating them via compatible strings.

> diff --git a/drivers/phy/st/phy-stm32-usb2phy.c b/drivers/phy/st/phy-stm3=
2-usb2phy.c
> new file mode 100644
> index 0000000000000..d902354f88b69
> --- /dev/null
> +++ b/drivers/phy/st/phy-stm32-usb2phy.c
[ ... ]
> +static int stm32_usb2phy_enable(struct stm32_usb2phy *phy_dev)
> +{
> +	const struct stm32mp2_usb2phy_hw_data *phy_data =3D phy_dev->hw_data;
> +	unsigned long rate;
> +	int refsel, ret;
> +
> +	/* Check if a phy is already init or clk48 in use */
> +	if (atomic_inc_return(&phy_dev->en_refcnt) > 1)
> +		return 0;

[Severity: High]
Is there a race condition here if both the PHY and Clock frameworks
attempt to enable the hardware concurrently?

If Thread A calls stm32_usb2phy_enable() via phy_init and Thread B calls
it via clk_prepare concurrently:

Thread A increments en_refcnt to 1 and proceeds with initialization.
Thread B increments en_refcnt to 2 and returns success immediately.

Since no mutex is held during the multi-step hardware initialization,
could Thread B start using the hardware before Thread A has finished
configuring it?

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

[Severity: High]
If regmap_update_bits() fails, does this return early without decrementing
en_refcnt?

This looks like it could leave the reference counter permanently incremente=
d,
preventing future attempts to initialize the PHY or clock if a resource
allocation fails here or in subsequent steps like regulator_enable().

> +
> +	if (phy_data->is_usb2_host_only) {
[ ... ]
> +static int stm32_usb2phy_disable(struct stm32_usb2phy *phy_dev)
> +{
> +	int ret;
> +
> +	/* Check if a phy is still init or clk48 in use */
> +	if (atomic_dec_return(&phy_dev->en_refcnt) > 0)
> +		return 0;
> +
> +	ret =3D reset_control_assert(phy_dev->rstc);
> +	if (ret)
> +		return ret;

[Severity: High]
If reset_control_assert() fails, does this skip the remaining hardware disa=
ble
steps while leaving en_refcnt already decremented?

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
> +	const struct stm32mp2_usb2phy_hw_data *phy_data =3D phy_dev->hw_data;
> +	u32 val, mask =3D SYSCFG_USB2PHY2CR_USB2PHY2CMN;
> +	int ret;
> +
> +	if (mode =3D=3D PHY_MODE_USB_HOST) {
[ ... ]
> +	} else if (mode =3D=3D PHY_MODE_USB_DEVICE) {
> +		val =3D SYSCFG_USB2PHY2CR_USB2PHY2CMN |
> +		      SYSCFG_USB2PHY2CR_VBUSVLDEXTSEL;
> +		mask |=3D SYSCFG_USB2PHY2CR_VBUSVALID |
> +			SYSCFG_USB2PHY2CR_VBUSVLDEXTSEL |
> +			SYSCFG_USB2PHY2CR_VBUSVLDEXT;
> +		if (submode !=3D USB_ROLE_NONE)
> +			val |=3D SYSCFG_USB2PHY2CR_VBUSVLDEXT;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	ret =3D regmap_update_bits(phy_dev->regmap, phy_dev->cr_offset, mask, v=
al);

[Severity: Medium]
If device mode is mistakenly requested on the host-only PHY variant, does
this unconditionally write the device-mode configuration to bits 4, 5, and 6
of SYSCFG_USB2PHY2CR?

Looking at the hardware data definition for the host-only PHY:

static const struct stm32mp2_usb2phy_hw_data stm32mp25_usb2phy1_hwdata =3D {
    .phyrefsel_mask =3D GENMASK(6, 4),
    .is_usb2_host_only =3D true,
};

Since those exact bits are used for the reference clock selection, could
this silently corrupt the PHY clock configuration?

> +	if (ret)
> +		return ret;
[ ... ]
> +static int stm32_usb2phy_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	phy_dev->regmap =3D syscon_regmap_lookup_by_phandle_args(dev->of_node, =
"st,syscfg", 1,
> +							       &phy_dev->cr_offset);
> +	if (IS_ERR(phy_dev->regmap)) {
> +		return dev_err_probe(dev, PTR_ERR(phy_dev->regmap),
> +				     "No st,syscfg phandle specified\n");
> +	}
> +
> +	phy_dev->hw_data =3D device_get_match_data(dev);

[Severity: Low]
If the driver is manually bound via sysfs to a device that does not match
the OF compatible strings, device_get_match_data() could return NULL.

Since the return value is not validated here, could this lead to a NULL
pointer dereference when phy_data->phyrefsel_mask is accessed later in
stm32_usb2phy_enable()?

> +
> +	phy =3D devm_phy_create(dev, NULL, &stm32_usb2phy_data);
> +	if (IS_ERR(phy))
> +		return dev_err_probe(dev, PTR_ERR(phy), "Failed to create PHY\n");
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
Does this system suspend/resume logic properly save and restore hardware
state when both the PHY and clock consumers are active?

If en_refcnt is 2, calling stm32_usb2phy_disable() during suspend will mere=
ly
decrement the counter to 1 and skip the actual hardware teardown. Conversel=
y,
on resume, stm32_usb2phy_enable() increments the counter to 2 and skips
hardware initialization.

If power is lost during suspend, could the hardware remain completely
uninitialized upon resume?

Additionally, stm32_usb2phy_resume() does not appear to call
stm32_usb2phy_set_mode(), which might mean the PHY mode configuration is lo=
st
after resuming.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812010157.1772=
849-1-marex@nabladev.com?part=3D2
