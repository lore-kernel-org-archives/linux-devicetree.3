Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436043148CF
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753461; cv=none; b=VjIy9TWpktUxmmJ1ZGHgaHTIZyuPvNIeBn2sCUCYG3nOUdT9A9/xSTjvu2UaBSuLK71VrCuMMNgXSOlSGvl1PS62/5QL6bGBeXgiyflLgH4cHAUtQUlHcQrZBIbe+t12a8pgqnabGOwolrDMu15wwWY+eiPICeq6cr0R2TQsLP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753461; c=relaxed/simple;
	bh=eYdHJeanoytOvHxOiexMx85+NrozDctGZegzcIuMN5s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tEjHuGIduLf7q2dg6AGG8F6cj/p3pjf1F6/fBF5z+Z4N6la3FvOB7he+8jR6HFn7YTlMm6w5iSjN0OmhBtakIRaxNYzuYBuPXGc52StXecNHPnnTp5llpIICw4/tx0yPJhMsf5Sz653LNvMh8MIPz63NZNB4DpplgYpjVxTIhr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VGT5vV8c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VGT5vV8c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8373D1F000FF;
	Wed, 30 Sep 2026 07:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790753460;
	bh=X4MFlg9iQNr1WSjE1OVvLSYFm1fkVX5AH3CfVM/UAqk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VGT5vV8cjjlSBMAYRLHsxdNPmyubH31LxdWPEXg36I3iCjXOR2MOyG4oPgH/bCRxW
	 m0JVPgqBnWW1Ae0U7ElEeTW5J0++GclTkHeE0w2k6Kf2TT2aLpanyAjCI5DCdq6AqR
	 QhxcjJCBRdURTmGGhMzfnUs2iTtHSSc0DHzshEkIR0C+7sM6yufyS8bXwiMA6+iTMF
	 YRP1fML6YmXl32O4qQ0WUPO5jIEBS3bIbAYgKEGAD931IdxvqMiHx3uF6gTkwuQLJI
	 JeucUwx/04Lka6S19NnvQdWqJarQ9XGmg5U+aer+TXlj3uBW8MSKpAghWhCBuiFXpv
	 AlF9K6dARiF7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 3/3] phy: airoha: Add support for Airoha AN7581 USB
 PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, olteanv@gmail.com, vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20260930071826.48811-4-ansuelsmth@gmail.com>
References: <20260930071826.48811-1-ansuelsmth@gmail.com>
 <20260930071826.48811-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 07:30:59 +0000
Message-Id: <20260930073059.8373D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] phy: airoha: Missing phy_init() and phy_power_on() for serdes_phy
- [Medium] phy: airoha: regmap_set_bits() fails to clear multi-bit field
- [Low] phy: airoha: Silent truncation of dynamic srctrl calibration value
--

commit 4a0c27f02fe4864e660c9a34276ee9067ec33998
Author: Christian Marangi <ansuelsmth@gmail.com>

phy: airoha: Add support for Airoha AN7581 USB PHY

Add support for Airoha AN7581 USB PHY driver. AN7581 supports up to 2
USB port with USB 2.0 mode always supported and USB 3.0 mode available
only if the Serdes port is correctly configured for USB 3.0.

> diff --git a/drivers/phy/airoha/phy-an7581-usb.c b/drivers/phy/airoha/phy=
-an7581-usb.c
> new file mode 100644
> index 0000000000000..92c5e5c2fbf3b
> --- /dev/null
> +++ b/drivers/phy/airoha/phy-an7581-usb.c

[ ... ]

> +static void an7581_usb_phy_u2_slew_rate_calibration(struct an7581_usb_ph=
y_priv *priv)
> +{
> +	u32 fm_out =3D 0;
> +	u32 srctrl;

[ ... ]

> +	/* Frequency was not detected, use default SR calibration value */
> +	if (!fm_out) {
> +		srctrl =3D AIROHA_USB_PHY_DEFAULT_SR_CALIBRATION;
> +		dev_err(priv->dev, "Frequency not detected, using default SR calibrati=
on.\n");
> +	} else {
> +		/* (1024 / FM_OUT) * REF_CK * U2_SR_COEF (round to the nearest digits)=
 */
> +		srctrl =3D AIROHA_USB_PHY_REF_CK * AIROHA_USB_PHY_U2_SR_COEF;
> +		srctrl =3D (srctrl * AIROHA_USB_PHY_U2_FM_DET_CYCLE_CNT) / fm_out;
> +		srctrl =3D DIV_ROUND_CLOSEST(srctrl, AIROHA_USB_PHY_U2_SR_COEF_DIVISOR=
);
> +		dev_dbg(priv->dev, "SR calibration applied: %x\n", srctrl);
> +	}
> +
> +	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR5,
> +			   AIROHA_USB_PHY_USB20_HSTX_SRCTRL,
> +			   FIELD_PREP(AIROHA_USB_PHY_USB20_HSTX_SRCTRL, srctrl));

[Severity: Low]
Does this dynamically calculated srctrl value need bounds checking?

If a glitchy or slow clock results in a small non-zero fm_out, srctrl
might exceed the 3-bit maximum (7) defined by
AIROHA_USB_PHY_USB20_HSTX_SRCTRL. Since it is passed to FIELD_PREP()
without clamping, the upper bits will be silently truncated, applying
a potentially incorrect slew rate calibration rather than a safe default.

[ ... ]

> +static void an7581_usb_phy_u3_init(struct an7581_usb_phy_priv *priv)
> +{
> +	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_U3_PHYA_REG8,
> +			   AIROHA_USB_PHY_SSUSB_CDR_RST_DLY,
> +			   AIROHA_USB_PHY_SSUSB_CDR_RST_DLY_32);
> +
> +	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_U3_PHYA_REG6,
> +			   AIROHA_USB_PHY_SSUSB_CDR_RESERVE,
> +			   FIELD_PREP(AIROHA_USB_PHY_SSUSB_CDR_RESERVE, 0xe));
> +
> +	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_U3_PHYA_REG0,
> +			   AIROHA_USB_PHY_SSUSB_BG_DIV,
> +			   AIROHA_USB_PHY_SSUSB_BG_DIV_4);
> +
> +	regmap_set_bits(priv->regmap, AIROHA_USB_PHY_U3_PHYA_REG1,
> +			FIELD_PREP(AIROHA_USB_PHY_SSUSB_XTAL_TOP_RESERVE, 0x600));

[Severity: Medium]
Should this be using regmap_update_bits() instead of regmap_set_bits()?

AIROHA_USB_PHY_SSUSB_XTAL_TOP_RESERVE is a 16-bit mask (GENMASK(25, 10)).
Using regmap_set_bits() with FIELD_PREP() performs a simple bitwise OR.
This will set the bits corresponding to 1s in 0x600, but it will fail to
clear any other bits across the rest of the 16-bit mask if they happen
to be set by default. This could leave stale bits in the register.

> +
> +	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_U3_PHYA_DA_REG19,
> +			   AIROHA_USB_PHY_SSUSB_PLL_SSC_DELTA1_U3,
> +			   FIELD_PREP(AIROHA_USB_PHY_SSUSB_PLL_SSC_DELTA1_U3, 0x43));
> +}
> +
> +static int an7581_usb_phy_init(struct phy *phy)
> +{
> +	struct an7581_usb_phy_instance *instance =3D phy_get_drvdata(phy);
> +	struct an7581_usb_phy_priv *priv =3D dev_get_drvdata(phy->dev.parent);
> +	int ret;
> +
> +	switch (instance->type) {
> +	case PHY_TYPE_USB2:
> +		an7581_usb_phy_u2_init(priv);
> +		break;
> +	case PHY_TYPE_USB3:
> +		ret =3D phy_set_mode(priv->serdes_phy, PHY_MODE_USB_DEVICE_SS);
> +		if (ret)
> +			return ret;
> +
> +		an7581_usb_phy_u3_init(priv);

[Severity: High]
Is a call to phy_init(priv->serdes_phy) missing here?

The serdes_phy mode is set, but the mandatory phy_init() lifecycle call
is omitted. The downstream controller (e.g., xHCI or DWC3) requests this
wrapper PHY and invokes phy_init(). The wrapper receives this call via
an7581_usb_phy_init() but completely fails to propagate it to its consumed
priv->serdes_phy, leaving the hardware unconfigured and breaking USB 3.0
functionality.

> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}

[ ... ]

> +static int an7581_usb_phy_power_on(struct phy *phy)
> +{
> +	struct an7581_usb_phy_instance *instance =3D phy_get_drvdata(phy);
> +	struct an7581_usb_phy_priv *priv =3D dev_get_drvdata(phy->dev.parent);
> +
> +	switch (instance->type) {
> +	case PHY_TYPE_USB2:
> +		an7581_usb_phy_u2_power_on(priv);
> +		break;
> +	case PHY_TYPE_USB3:
> +		an7581_usb_phy_u3_power_on(priv);
> +		break;

[Severity: High]
Does this function also need to call phy_power_on(priv->serdes_phy)?

The local USB3 registers are powered on via an7581_usb_phy_u3_power_on(),
but the driver fails to propagate the power_on call to the underlying
priv->serdes_phy. The PHY subsystem API strictly requires a consumer of a
PHY to call phy_init() and phy_power_on() before the PHY can be functional.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930071826.4881=
1-1-ansuelsmth@gmail.com?part=3D3
