Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0127D3191BA
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 23:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779233029; cv=none; b=Le7y6uurHRHt2tXw2qC88X5NmMgE1ki9gKu7oIq6IEmCwypf63iSwcWqOVgxPzCNWy2x8pB1HNLHeBxb8uuP4cjTd+MwsGodhf557hYAqFLFaEfkYv+W/9ELURJJxU4/Q04lucswWQG+ijcTyTWpX4iH6urePkWdZkpDBXG9h5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779233029; c=relaxed/simple;
	bh=7bfQY2iKl8bGpxEmQ5Y4yHVDMPsaXXvCdzc6Yw47tDg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cylo9Kjd7TaYCE58+PVYVmptxNndmFuy3UmlbQO6drUf4eeyHvVP7RT9gJhJwGZa4/q0IDiCGNKCxLXtnekVjz+xmfvxIQjGRFxZ42qK2Iuk76QSBdMiA8f0n2PwPWK6YJlnj18DAC/pgG16MGUoxaIcsfdP9i8+0CwlS/i65PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pr+DwcyU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pr+DwcyU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 627351F000E9;
	Tue, 19 May 2026 23:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779233027;
	bh=xDYvsgh0WVc8xHu7PLSnhKuOFUZffVVzdaQVfEtry+o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pr+DwcyUiYkV2ijTjoo/bCjdTEfkR/eD66jCyWCtCQA5RF/dLuoLhD5SvL+FDb/em
	 dF/J6jBBiea/WUfEQ8lECk08LfkdP59RjQ5oGGkfM6lTvRcn4UDREfefls5sHXGOtO
	 2J7/2nYmo0Ge5Az37ot8pgHwkVOn+d70AxvK1n3VxmX2CI0+kvFg2tiG61m6bHuwL/
	 BE1hxKw76U9c+sIDQrCi8FZPpTaVbWiL3u4BiZtncGuWpWTZYbDk2zJsweBX2Inyr9
	 ikAVifdiSm8wlzMvZNFAwNer69GKZbGCp00GLA8b+p1L32QMxpPetPt5P3yffXgYOg
	 H4dpZ44oEm/TA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 6/6] phy: airoha: Add support for Airoha AN7581 USB
 PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: olteanv@gmail.com, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, robh@kernel.org, vkoul@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260519220813.28468-7-ansuelsmth@gmail.com>
References: <20260519220813.28468-7-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 23:23:46 +0000
Message-Id: <20260519232347.627351F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] `dev_err_probe` is called with `IS_ERR()` instead of `PTR_ERR()`, =
breaking error propagation and probe deferral.
- [High] Incorrect configuration of `FORCE_IDDIG` in `PHY_MODE_USB_DEVICE` =
due to a missing flag.
- [Medium] `fm_out` may be used uninitialized if `regmap_read_poll_timeout`=
 fails.
- [Medium] Missing `select REGMAP_MMIO` dependency in Kconfig.
- [Low] Dead code in `an7581_usb_phy_power_on` checking the USB PHY's mode =
instead of the SerDes PHY's mode.
- [Low] Assigning generic `PHY_TYPE_USB2` values to a variable typed as a l=
ocal internal enum.
--

commit a54da44fe952522b06761e81fb643efff0dad77a
Author: Christian Marangi <ansuelsmth@gmail.com>

phy: airoha: Add support for Airoha AN7581 USB PHY

Add support for Airoha AN7581 USB PHY driver. AN7581 supports up to 2
USB port with USB 2.0 mode always supported and USB 3.0 mode available
only if the Serdes port is correctly configured for USB 3.0.

> diff --git a/drivers/phy/airoha/Kconfig b/drivers/phy/airoha/Kconfig
> index 9a1b625a77012..bb4e3367baa58 100644
> --- a/drivers/phy/airoha/Kconfig
> +++ b/drivers/phy/airoha/Kconfig
[ ... ]
> @@ -11,3 +11,13 @@ config PHY_AIROHA_AN7581_PCIE
>  	  Say Y here to add support for Airoha AN7581 PCIe PHY driver.
>  	  This driver create the basic PHY instance and provides initialize
>  	  callback for PCIe GEN3 port.
> +
> +config PHY_AIROHA_AN7581_USB
> +	tristate "Airoha AN7581 USB PHY Driver"
> +	depends on ARCH_AIROHA || COMPILE_TEST
> +	depends on OF
> +	select GENERIC_PHY

[Severity: Medium]
Will this fail to link under COMPILE_TEST on architectures without REGMAP_M=
MIO?
The driver relies on devm_regmap_init_mmio(), so it might need to explicitly
select REGMAP_MMIO.

> +	help
> +	  Say 'Y' here to add support for Airoha AN7581 USB PHY driver.
> +	  This driver create the basic PHY instance and provides initialize
> +	  callback for USB port.
> diff --git a/drivers/phy/airoha/phy-an7581-usb.c b/drivers/phy/airoha/phy=
-an7581-usb.c
> new file mode 100644
> index 0000000000000..90fd2cbe68d42
> --- /dev/null
> +++ b/drivers/phy/airoha/phy-an7581-usb.c
[ ... ]
> +static void an7581_usb_phy_u2_slew_rate_calibration(struct an7581_usb_ph=
y_priv *priv)
> +{
> +	u32 fm_out;
> +	u32 srctrl;
[ ... ]
> +	/* Timeout can happen and we will apply workaround at the end */
> +	regmap_read_poll_timeout(priv->regmap, AIROHA_USB_PHY_FMMONR0, fm_out,
> +				 fm_out, AIROHA_USB_PHY_FREQDET_SLEEP,
> +				 AIROHA_USB_PHY_FREQDET_TIMEOUT);
> +
> +	/* Disable Frequency meter */
> +	regmap_clear_bits(priv->regmap, AIROHA_USB_PHY_FMCR0,
> +			  AIROHA_USB_PHY_FREQDET_EN);
> +
> +	/* Disable Free run clock */
> +	regmap_clear_bits(priv->regmap, AIROHA_USB_PHY_FMMONR1,
> +			  AIROHA_USB_PHY_FRCK_EN);
> +
> +	/* Disable HS TX SR calibration */
> +	regmap_clear_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR5,
> +			  AIROHA_USB_PHY_USB20_HSTX_SRCAL_EN);
> +
> +	usleep_range(1000, 1500);
> +
> +	/* Frequency was not detected, use default SR calibration value */
> +	if (!fm_out) {

[Severity: Medium]
If the underlying regmap_read() fails immediately (e.g., due to an I/O erro=
r),
does fm_out remain uninitialized?

Since the return value of regmap_read_poll_timeout() isn't checked, an
uninitialized stack value could bypass this check and cause unpredictable
behavior during the subsequent division.

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
> +		if (phy_get_mode(phy) =3D=3D PHY_MODE_PCIE ||
> +		    phy_get_mode(phy) =3D=3D PHY_MODE_ETHERNET)
> +			return 0;

[Severity: Low]
Is this check examining the wrong phy object?

It seems to be checking the USB PHY's mode instead of the shared SerDes com=
bo
PHY (priv->serdes_phy). Since the USB PHY's mode will presumably never be P=
CIe
or Ethernet, will this condition ever evaluate to true?

> +
> +		an7581_usb_phy_u3_power_on(priv);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
[ ... ]
> +static int an7581_usb_phy_power_off(struct phy *phy)
> +{
> +	struct an7581_usb_phy_instance *instance =3D phy_get_drvdata(phy);
> +	struct an7581_usb_phy_priv *priv =3D dev_get_drvdata(phy->dev.parent);
> +
> +	switch (instance->type) {
> +	case PHY_TYPE_USB2:
> +		an7581_usb_phy_u2_power_off(priv);
> +		break;
> +	case PHY_TYPE_USB3:
> +		if (phy_get_mode(phy) =3D=3D PHY_MODE_PCIE ||
> +		    phy_get_mode(phy) =3D=3D PHY_MODE_ETHERNET)
> +			return 0;

[Severity: Low]
Similar to the an7581_usb_phy_power_on() check above, does this check the
wrong phy object?

> +
> +		an7581_usb_phy_u3_power_off(priv);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int an7581_usb_phy_u2_set_mode(struct an7581_usb_phy_priv *priv,
> +				      enum phy_mode mode)
> +{
> +	u32 val;
> +
> +	/*
> +	 * For Device and Host mode, enable force IDDIG.
> +	 * For Device set IDDIG, for Host clear IDDIG.
> +	 * For OTG disable force and clear IDDIG bit while at it.
> +	 */
> +	switch (mode) {
> +	case PHY_MODE_USB_DEVICE:
> +		val =3D AIROHA_USB_PHY_IDDIG;

[Severity: High]
The comment mentions enabling force IDDIG for Device mode, but val is only
assigned AIROHA_USB_PHY_IDDIG here. Should AIROHA_USB_PHY_FORCE_IDDIG be
included as well?

> +		break;
> +	case PHY_MODE_USB_HOST:
> +		val =3D AIROHA_USB_PHY_FORCE_IDDIG |
> +		      AIROHA_USB_PHY_FORCE_IDDIG;

[Severity: Low]
This isn't a bug, but the AIROHA_USB_PHY_FORCE_IDDIG flag is duplicated her=
e.

> +		break;
> +	case PHY_MODE_USB_OTG:
> +		val =3D 0;
> +		break;
> +	default:
> +		return 0;
> +	}
> +
> +	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_U2PHYDTM1,
> +			   AIROHA_USB_PHY_FORCE_IDDIG |
> +			   AIROHA_USB_PHY_IDDIG, val);
> +
> +	return 0;
> +}
[ ... ]
> +static int an7581_usb_phy_probe(struct platform_device *pdev)
> +{
> +	struct phy_provider *phy_provider;
> +	struct an7581_usb_phy_priv *priv;
> +	struct device *dev =3D &pdev->dev;
> +	unsigned int index;
> +	void __iomem *base;
> +	int ret;
[ ... ]
> +	for (index =3D 0; index < AIROHA_PHY_USB_MAX; index++) {
> +		enum an7581_usb_phy_instance_type phy_type;
> +		struct an7581_usb_phy_instance *instance;
> +
> +		switch (index) {
> +		case AIROHA_PHY_USB2:
> +			phy_type =3D PHY_TYPE_USB2;
> +			break;
> +		case AIROHA_PHY_USB3:
> +			phy_type =3D PHY_TYPE_USB3;
> +			break;
> +		}

[Severity: Low]
Should phy_type be declared as an integer or u32?

The generic PHY_TYPE_USB2 macro evaluates to 3, but phy_type is typed as
enum an7581_usb_phy_instance_type which only defines values 0 to 2.

> +
> +		if (phy_type =3D=3D PHY_TYPE_USB3) {
> +			priv->serdes_phy =3D devm_phy_get(dev, NULL);
> +			if (IS_ERR(priv->serdes_phy))
> +				return dev_err_probe(dev, IS_ERR(priv->serdes_phy), "missing serdes =
phy for USB 3.0\n");

[Severity: High]
Does this inadvertently return 1 instead of a proper negative error code?

Since IS_ERR() returns a boolean, returning it breaks error propagation and
probe deferral (e.g. -EPROBE_DEFER). Should this be PTR_ERR() instead?

> +		}
> +
> +		instance =3D devm_kzalloc(dev, sizeof(*instance), GFP_KERNEL);
> +		if (!instance)
> +			return -ENOMEM;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519220813.2846=
8-1-ansuelsmth@gmail.com?part=3D6
