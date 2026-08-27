Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96D647426A
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 13:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787837221; cv=none; b=pjD7Qzo7ohRYLKqDaHrdfEM4hvjqkMERfqpP/fGTlCLNMwgIkYO4VXPaBoc1i9EuMOBDfuBpbDjBB/2y2LbEu97HHy+DE4i8to0SpDz7J5kf+1N45jWzB6ZFklKzzp7ogSj+E28T+4wN93G4wt+Edx+F8NuIxKQi6rz2hflg8Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787837221; c=relaxed/simple;
	bh=3q+VUn9NaYhAmskuQyNSDF6I2dtW4rB/VBzFtDR+Pg4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qLyOMM8Nyk/j7u4CVC3jFQ0/1REuqnBZa2gV/vTtVuiMt0stOaa3zkERGk4PnYMrmJmBbwWADglSMw7Z+SFzJCXayLlLpJYOZLV0tOYe/f2ot2R09rzkJpmWXjJqfL4Kewl7QxhnoVtijZS7IiK3VGqK9pLJm4uyo3gCWV1Y208=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nqp2Ey3H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nqp2Ey3H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E137A1F000E9;
	Thu, 27 Aug 2026 13:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787837211;
	bh=LtCVUJazwoQ7zB+f+5caGH5GuyOSXRHlJB94JFJRrRQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nqp2Ey3H2N+AvEeoNj9EMhb2kkHtZGqfqohACnnpFuqxV+XKGXbi20J8uicY3A1Ns
	 b+agFO8fnObcFSxBHfsLCdDYp+xIkwubLztB+Irh8nuAaPUlk6xnRz2LaI+XKfkO8R
	 CZp8GnnsFl/AD6am9X6U6mDl/OuRSPgWTcWsAblYkzC5+iXG88JO+6V2Odv9kPqIZr
	 bcXilQSJudPDhb3PPtOpME+mMfkWg6sorKGvGUAN259kGCdiXW1PW8N45ElGjPOJTe
	 kTd6kQ6E9OqBkbw22OnjJgsk7IpYK/HIebyV5/OLBgW5ob0D6iqcLCvT70dwq4f4FB
	 Yy0zBO/k4/RDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] phy: airoha: Add support for Airoha AN7583 USB
 PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: vkoul@kernel.org, olteanv@gmail.com, conor+dt@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org
In-Reply-To: <20260827131551.26725-4-ansuelsmth@gmail.com>
References: <20260827131551.26725-1-ansuelsmth@gmail.com>
 <20260827131551.26725-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 13:26:50 +0000
Message-Id: <20260827132650.E137A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] Off-by-one error in array bounds check allows out-of-bounds array =
write.
- [High] Incorrect device node is used to fetch the per-port serdes PHY.
- [High] Missing per-port register offset in `an7583_usb_phy_u2_set_mode` c=
auses cross-instance state corruption.
- [Medium] Uninitialized variable `ret` is used as an error return code in =
`an7583_usb_phy_parse_ports`.
- [Medium] `fm_out` may be evaluated uninitialized if the regmap polling ma=
cro fails.
- [Medium] The PHY initialization error codes for USB3 and PCIe are silentl=
y ignored.
- [Medium] Nested acquisition of same-class PHY mutex triggers lockdep warn=
ing.
- [Medium] Excessive busy-waiting using mdelay() in PHY initialization loop=
s.
- [Low] Missing `fallthrough;` annotation in switch statements triggers imp=
licit fallthrough warnings.
--

commit e08eb2476fb864bd66e0895961c95bf0fbc89352
Author: Christian Marangi <ansuelsmth@gmail.com>

phy: airoha: Add support for Airoha AN7583 USB PHY

Adds support for USB PHY on Airoha AN7583 SoC, supporting two U2 ports and
one U3 port via a single USB PHY instance, plus a second instance for
PCIe Gen2.

> diff --git a/drivers/phy/airoha/phy-an7583-usb.c b/drivers/phy/airoha/phy=
-an7583-usb.c
> new file mode 100644
> index 0000000000000..33915c9f4a0de
> --- /dev/null
> +++ b/drivers/phy/airoha/phy-an7583-usb.c
> @@ -280,18 +280,18 @@ static int an7583_usb_phy_u2_slew_rate_calibration(=
struct phy *phy)
>  	/* Timeout can happen and we will apply workaround at the end */
>  	regmap_read_poll_timeout(priv->regs[AIROHA_USB_PHY_PHY],
>  				 AIROHA_USB_PHY_FMMONR0 + offset,
>  				 fm_out, fm_out, AIROHA_USB_PHY_FREQDET_SLEEP,
>  				 AIROHA_USB_PHY_FREQDET_TIMEOUT);
> =20
>  	/* Disable Frequency meter */
>  	regmap_clear_bits(priv->regs[AIROHA_USB_PHY_PHY],
>  			  AIROHA_USB_PHY_FMCR0 + offset,
>  			  AIROHA_USB_PHY_FREQDET_EN);
> =20
>  	/* Disable Free run clock */
>  	regmap_clear_bits(priv->regs[AIROHA_USB_PHY_PHY],
>  			  AIROHA_USB_PHY_FMMONR1 + offset,
>  			  AIROHA_USB_PHY_FRCK_EN);
> =20
>  	/* Disable HS TX SR calibration */
>  	regmap_clear_bits(priv->regs[AIROHA_USB_PHY_PHY],
>  			  AIROHA_USB_PHY_USBPHYACR5 + offset,
>  			  AIROHA_USB_PHY_USB20_HSTX_SRCAL_EN);
> =20
>  	usleep_range(1000, 1500);
> =20
>  	/* Frequency was not detected, use default SR calibration value */
>  	if (!fm_out) {

[Severity: Medium]
If the regmap read returns an error here in
an7583_usb_phy_u2_slew_rate_calibration(), regmap_read_poll_timeout()
will terminate early without initializing fm_out.

Will this cause the subsequent check if (!fm_out) to evaluate garbage data?

[ ... ]

> @@ -340,11 +340,11 @@ static bool an7583_usb_phy_u3_kband_is_calibrated(s=
truct an7583_usb_phy_priv *pr
>  	/* Read KBand */
>  	regmap_clear_bits(priv->regs[AIROHA_USB_PHY_ANA],
>  			  AIROHA_USB_ANA_TDC_FT_CK_EN,
>  			  AIROHA_USB_ANA_PLL_DEBUG_SEL);
> =20
>  	mdelay(5);

[Severity: Medium]
Can this delay in an7583_usb_phy_u3_kband_is_calibrated() cause excessive
CPU stalling?

It uses mdelay(5) twice per loop, and is called up to 50 times in
an7583_usb_phy_u3_init(). Because mdelay spins the CPU instead of sleeping,
this could freeze the CPU for up to 500ms during hardware initialization
failures.

Should this be using usleep_range() or msleep() instead?

[ ... ]

> @@ -1020,16 +1020,16 @@ static int an7583_usb_phy_init(struct phy *phy)
>  	struct an7583_usb_phy_instance *instance =3D phy_get_drvdata(phy);
> =20
>  	switch (instance->type) {
>  	case PHY_TYPE_USB2:
>  		an7583_usb_phy_u2_init(phy);
>  		break;
>  	case PHY_TYPE_USB3:
>  		if (phy_get_mode(phy) =3D=3D PHY_MODE_ETHERNET)
>  			return 0;
> =20
>  		an7583_usb_phy_u3_init(phy);
>  		break;
>  	case PHY_TYPE_PCIE:
>  		if (phy_get_mode(phy) =3D=3D PHY_MODE_ETHERNET)
>  			return 0;
> =20
>  		an7583_usb_phy_pcie_init(phy);

[Severity: Medium]
Both an7583_usb_phy_u3_init() and an7583_usb_phy_pcie_init() return an
error code (-EINVAL) when calibration fails, but those values are ignored
here.

Does this falsely notify the PHY framework of a successful initialization?

>  		break;
>  	default:
>  		return -EINVAL;
>  	}

[ ... ]

> @@ -1176,8 +1176,8 @@ static int an7583_usb_phy_u2_set_mode(struct phy *p=
hy, enum phy_mode mode)
>  	case PHY_MODE_USB_HOST:
>  		val |=3D AIROHA_USB_PHY_FORCE_IDDIG;
>  		break;
>  	case PHY_MODE_USB_OTG:
>  		break;
>  	default:
>  		return 0;
>  	}
> =20
>  	regmap_update_bits(priv->regs[AIROHA_USB_PHY_PHY], AIROHA_USB_PHY_U2PHY=
DTM1,

[Severity: High]
Does this code in an7583_usb_phy_u2_set_mode() write to the base register
space of port 0 instead of the correct port?

Unlike other functions (e.g., power_on or init), this directly accesses
AIROHA_USB_PHY_U2PHYDTM1 without adding instance->offset. If mode
configuration is applied to a secondary port, it seems like this will corru=
pt
port 0's state.

>  			   AIROHA_USB_PHY_FORCE_IDDIG |
>  			   AIROHA_USB_PHY_IDDIG, val);

[ ... ]

> @@ -1193,12 +1193,12 @@ static int an7583_usb_phy_u3_set_mode(struct phy =
*phy, enum phy_mode mode,
>  				      int submode)
>  {
>  	struct an7583_usb_phy_instance *instance =3D phy_get_drvdata(phy);
>  	int ret;
> =20
>  	switch (mode) {
>  	case PHY_MODE_ETHERNET:
>  		if (submode !=3D PHY_INTERFACE_MODE_SGMII &&
>  		    submode !=3D PHY_INTERFACE_MODE_1000BASEX &&
>  		    submode !=3D PHY_INTERFACE_MODE_2500BASEX)
>  			return -EOPNOTSUPP;
>  	case PHY_MODE_USB_DEVICE_SS:

[Severity: Low]
Is this an intentional fallthrough?

If so, this switch block needs a fallthrough annotation to prevent compiler
warnings.

>  		break;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> =20
>  	ret =3D phy_set_mode_ext(instance->serdes_phy, mode, submode);

[Severity: Medium]
Will this nested call to phy_set_mode_ext() in an7583_usb_phy_u3_set_mode()
trigger a lockdep warning?

The core PHY framework invokes the driver's set_mode callback with the
primary phy->mutex held. Calling phy_set_mode_ext() on the secondary PHY
attempts to acquire the secondary PHY's mutex, which belongs to the same
lock class.

[ ... ]

> @@ -1215,12 +1215,12 @@ static int an7583_usb_phy_pcie_set_mode(struct ph=
y *phy, enum phy_mode mode,
>  					int submode)
>  {
>  	struct an7583_usb_phy_instance *instance =3D phy_get_drvdata(phy);
>  	int ret;
> =20
>  	switch (mode) {
>  	case PHY_MODE_ETHERNET:
>  		if (submode !=3D PHY_INTERFACE_MODE_SGMII &&
>  		    submode !=3D PHY_INTERFACE_MODE_1000BASEX &&
>  		    submode !=3D PHY_INTERFACE_MODE_2500BASEX)
>  			return -EOPNOTSUPP;
>  	case PHY_MODE_PCIE:

[Severity: Low]
Is this an intentional fallthrough?

If so, this switch block needs a fallthrough annotation to prevent compiler
warnings.

>  		break;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> =20
>  	ret =3D phy_set_mode_ext(instance->serdes_phy, mode, submode);

[Severity: Medium]
Will this nested call to phy_set_mode_ext() in an7583_usb_phy_pcie_set_mode=
()
trigger a lockdep warning?

The core PHY framework invokes the driver's set_mode callback with the
primary phy->mutex held. Calling phy_set_mode_ext() on the secondary PHY
attempts to acquire the secondary PHY's mutex, which belongs to the same
lock class.

[ ... ]

> @@ -1297,29 +1297,29 @@ static int an7583_usb_phy_parse_ports(struct devi=
ce *dev,
>  				      struct an7583_usb_phy_priv *priv,
>  				      int index, struct device_node *subnode)
>  {
>  	const struct an7583_usb_phy_match_data *data;
>  	struct an7583_usb_phy_instance  *instance;
>  	struct phy *phy;
>  	int ret;
> =20
>  	data =3D of_device_get_match_data(dev);
> =20
>  	if (index > data->max_instance)

[Severity: High]
Should this bounds check use >=3D instead of > in an7583_usb_phy_parse_port=
s()?

The max_instance is the size of the array (3 for USB), so allowing index to
equal max_instance will cause an out-of-bounds write when priv->phys[index]
is assigned later.

>  		return -EINVAL;
> =20
>  	if (!of_device_is_available(subnode))
>  		return 0;
> =20
>  	instance =3D devm_kzalloc(dev, sizeof(*instance), GFP_KERNEL);
>  	if (!instance)
>  		return -ENOMEM;
> =20
>  	instance->serdes_phy =3D devm_phy_optional_get(dev, NULL);

[Severity: High]
Does devm_phy_optional_get() fetch the per-port serdes PHY from the parent
device node rather than the specific port subnode?

Because it uses dev and not subnode, it appears all subnodes will resolve to
the exact same PHY instance, which would misclassify every port as
PHY_TYPE_USB3 and break USB2 port initialization.

Should this use devm_of_phy_optional_get(dev, subnode, NULL)?

>  	if (IS_ERR(instance->serdes_phy))
>  		return dev_err_probe(dev, PTR_ERR(instance->serdes_phy), "error on ser=
des phy for USB 3.0\n");
> =20
>  	if (!instance->serdes_phy &&
>  	    !of_property_present(subnode, "airoha,usb2-monitor-clk-sel"))
>  		return dev_err_probe(dev, ret, "monitor clock selection or serdes PHY =
is mandatory for USB PHY\n");

[Severity: Medium]
If the subnode lacks both the serdes_phy and the airoha,usb2-monitor-clk-sel
properties, the error path returns the uninitialized ret variable.

Can this return a garbage error code (or 0) leading to silent initialization
failures?

> =20
>  	if (instance->serdes_phy) {
>  		instance->type =3D PHY_TYPE_USB3;
>  	} else {
>  		ret =3D of_property_read_u32(subnode, "airoha,usb2-monitor-clk-sel",
>  					   &instance->monclk_sel);
>  		if (ret)
>  			return dev_err_probe(dev, ret, "failed to parse Monitor clock selecti=
on\n");
> =20
>  		ret =3D of_property_read_u32(subnode, "reg",
>  					   &instance->offset);
>  		if (ret)
>  			return dev_err_probe(dev, ret, "missing reg for U2 PHY\n");
> =20
>  		instance->type =3D PHY_TYPE_USB2;
>  	}
> =20
>  	phy =3D devm_phy_create(dev, subnode, &airoha_phy);
>  	if (IS_ERR(phy))
>  		return dev_err_probe(dev, PTR_ERR(phy), "failed to create phy\n");
> =20
>  	priv->phys[index] =3D phy;

[ ... ]

> @@ -1341,12 +1341,12 @@ static int airoha_pcie_phy_parse_ports(struct dev=
ice *dev,
>  				       struct an7583_usb_phy_priv *priv,
>  				       int index, struct device_node *subnode)
>  {
>  	const struct an7583_usb_phy_match_data *data;
>  	struct an7583_usb_phy_instance  *instance;
>  	struct phy *phy;
> =20
>  	data =3D of_device_get_match_data(dev);
> =20
>  	if (index > data->max_instance)

[Severity: High]
Should this bounds check use >=3D instead of > in airoha_pcie_phy_parse_por=
ts()?

The max_instance is the size of the array (1 for PCIe), so allowing index to
equal max_instance will cause an out-of-bounds write when priv->phys[index]
is assigned later.

>  		return -EINVAL;
> =20
>  	if (!of_device_is_available(subnode))
>  		return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827131551.2672=
5-1-ansuelsmth@gmail.com?part=3D3
