Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB6B37F8B3
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 06:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791440788; cv=none; b=eTdF7F2tERve3Zz8JsYOQyR4ncWBcExXuK6N9nUhsL1XnJ2PxRzPLuwWlp06YQd0XXUIKhxmeBDifUwEj0b+YsceJ9L1/Iu3ARGZI82XS00EplIIypIK7rbHaym89euDzEsudhdrG1PlNaaKx20NjZvir2lbKYLFoEfHhn1h7Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791440788; c=relaxed/simple;
	bh=1tzUXemJd2eq5aiF5NYpYzqrp/ZoYNTwc+vmceMlM2c=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=TTiNFSA9BF45Nn61LjmshTf1+o/ON+pthnS+jOh9NGF8CuNW+5NIwPaTICDQ8c2s2JE7TJmOk93kY1FuUJiNBLW59QHWrM6n8VLN/UQpRHjMh5SN1OUSF/ticXQUu6I4Cd7DcvZhQo8KCUGbhHplXp+MZxUZ50N0JKaO1PhU2oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g09x8D+M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g09x8D+M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA7C51F000FF;
	Thu,  8 Oct 2026 06:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791440787;
	bh=i3qB9gopBGLMCT1FLzuKhYQYgBZIVEV8TkWEDxSOQSo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g09x8D+MghJESuDVvqH2XQfUhhKRrY/1By/x27fOF/Oj0M/nNPtGKK3ntuGRdQR+l
	 5YYUE4aeoYELjL5RxE0ttII+M5h1MGUVsL6eDOYLjivRxnxFrMNGn+PmqT+wHXNWAI
	 c0u983R1X6pjgzPlotx/5scAtzSEZAthTDGRh6gaIT+5myYmAhtMYLGl6tbubpMy0W
	 tgReuizSRcRAXczOV7l/ocuLnQerV0W1wAnXFm4kj6GMDixXxTj5VdXBQ4BLTQ7gQh
	 JV1+SYsLdYf036NUvRMKulQ8V/veQZyS0j6bg+o1uTXYjXKsmaRpFOww3npPZsTJ6f
	 CfS3VXyd9CkRw==
Message-ID: <sashiko-outbox-163689@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/4] phy: nuvoton: phy-ma35d1-usb2: extend to
 dual-port with OTG support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, olteanv@gmail.com, vkoul@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261008060629.2736806-5-a0987203069@gmail.com>
References: <20261008060629.2736806-1-a0987203069@gmail.com>
 <20261008060629.2736806-5-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 06:26:26 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] phy: Kconfig missing USB_ROLE_SWITCH dependency causes built-in li=
nk failure
- [High] phy: DT backward compatibility regression for over-current polarity
- [Medium] phy: ignored regmap_read return values cause uninitialized varia=
ble usage and info leak
- [Medium] phy: regression in PHY reset fallback when clock polling fails
- [Medium] PM/clock: PHY permanently holds HUSBH0_GATE preventing USB suspe=
nd
--

commit dce53df5cfe4dcfac8af16f8b29743a3f4e147e0
Author: Joey Lu <a0987203069@gmail.com>

    phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support
   =20
    PHY0 and PHY1 use the same power-on/reset sequence in USBPMISCR, with
    PHY1 control bits shifted 16 positions relative to PHY0.  A separate
    driver for PHY1 would duplicate this logic, so the existing driver is
    extended to manage both ports.

> diff --git a/drivers/phy/nuvoton/phy-ma35d1-usb2.c b/drivers/phy/nuvoton/=
phy-ma35d1-usb2.c
> index 0b9976fb15c17..25bd0a7a1314b 100644
> --- a/drivers/phy/nuvoton/phy-ma35d1-usb2.c
> +++ b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
[ ... ]
> -static int ma35_usb_phy_power_on(struct phy *phy)
> +static int ma35_usb_phy_init(struct phy *phy)
>  {
> -	struct ma35_usb_phy *p_phy =3D phy_get_drvdata(phy);
> +	struct ma35_phy_port *port =3D phy_get_drvdata(phy);
> +	struct ma35_usb_phy *p =3D container_of(port - port->idx,
> +					      struct ma35_usb_phy, port[0]);
> +	unsigned int n =3D port->idx;
>  	unsigned int val;
>  	int ret;
> =20
> -	ret =3D clk_prepare_enable(p_phy->clk);
> -	if (ret < 0) {
> -		dev_err(p_phy->dev, "Failed to enable PHY clock: %d\n", ret);
> -		return ret;
> +	regmap_read(p->sysreg, MA35_SYS_USBPMISCR, &val);
> +
> +	if (!(val & USBPMISCR_PHY_SUSPEND(n))) {

[Severity: Medium]
Is this code branching on uninitialized stack memory?

If regmap_read() fails, the return value is ignored and val is left
uninitialized, leading to non-deterministic PHY state handling.

[Severity: Medium]
Could this strict condition remove the fallback reset sequence?

The original driver would reset the PHY if the clock failed to stabilize du=
ring
polling. By encapsulating the reset strictly inside this block, it skips the
reset entirely if the PHY is already running.

If the subsequent clock polling times out, the driver immediately returns an
error. Can this cause a regression where the PHY fails initialization perma=
nently
if it was left running but unstable by the bootloader or a prior kexec?

> +		regmap_update_bits(p->sysreg, MA35_SYS_USBPMISCR,
> +				   USBPMISCR_PHY_CTL_MASK(n),
> +				   USBPMISCR_PHY_POR(n) | USBPMISCR_PHY_SUSPEND(n));
> +		udelay(20);
> +
> +		regmap_update_bits(p->sysreg, MA35_SYS_USBPMISCR,
> +				   USBPMISCR_PHY_CTL_MASK(n),
> +				   USBPMISCR_PHY_SUSPEND(n));
>  	}
[ ... ]
> -static int ma35_usb_phy_power_off(struct phy *phy)
> -{
> -	struct ma35_usb_phy *p_phy =3D phy_get_drvdata(phy);
> +static const struct phy_ops ma35_usb_phy_ops =3D {
> +	.init		=3D ma35_usb_phy_init,
> +	.owner		=3D THIS_MODULE,
> +};

[Severity: Medium]
Will the removal of dynamic clock toggling in .power_on and .power_off cause
a power regression?

Since the clock is now acquired permanently via devm_clk_get_enabled() duri=
ng
probe, the USB host clock gate (HUSBH0_GATE) remains open permanently,
preventing it from closing and consuming unnecessary power when the USB host
controller (EHCI0/OHCI0) suspends.

> +
> +static int ma35_role_sw_set(struct usb_role_switch *sw, enum usb_role ro=
le)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static enum usb_role ma35_role_sw_get(struct usb_role_switch *sw)
> +{
> +	struct ma35_usb_phy *p =3D usb_role_switch_get_drvdata(sw);
> +	u32 val;
> +
> +	regmap_read(p->sysreg, MA35_SYS_PWRONOTP, &val);
> +
> +	return (val & PWRONOTP_USBP0ID) ? USB_ROLE_HOST : USB_ROLE_DEVICE;
> +}

[Severity: Medium]
Can this leak uninitialized stack memory to userspace?

If regmap_read() fails, the return value is ignored and val remains
uninitialized. This uninitialized data determines the returned USB role,
inadvertently leaking 1 bit of kernel stack state to userspace via the sysfs
role attribute.

> +
> +static int ma35_role_switch_init(struct platform_device *pdev,
> +				 struct ma35_usb_phy *p)
> +{
> +	struct usb_role_switch_desc sw_desc =3D {0};
> +
> +	sw_desc.set =3D ma35_role_sw_set;
> +	sw_desc.get =3D ma35_role_sw_get;
> +	sw_desc.allow_userspace_control =3D true;
> +	sw_desc.driver_data =3D p;
> +	sw_desc.fwnode =3D dev_fwnode(&pdev->dev);
> +
> +	p->role_sw =3D usb_role_switch_register(&pdev->dev, &sw_desc);

[Severity: High]
Would this introduce a built-in link failure if the driver is built-in
(CONFIG_PHY_MA35_USB=3Dy) and the role switch framework is modular
(CONFIG_USB_ROLE_SWITCH=3Dm)?

In this configuration, IS_ENABLED(CONFIG_USB_ROLE_SWITCH) evaluates to true,
so include/linux/usb/role.h declares the external functions instead of prov=
iding
inline stubs, causing an undefined reference to usb_role_switch_register.

Should drivers/phy/nuvoton/Kconfig be updated to include
depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH for PHY_MA35_USB to prevent
this invalid Kconfig combination?

> +	if (IS_ERR(p->role_sw)) {
[ ... ]
>  static int ma35_usb_phy_probe(struct platform_device *pdev)
>  {
>  	struct phy_provider *provider;
> -	struct ma35_usb_phy *p_phy;
> -	struct phy *phy;
> +	struct ma35_usb_phy *p;
> +	struct clk *clk;
> +	int n, ret;
> +	u32 code;
[ ... ]
> +	regmap_update_bits(p->sysreg, MA35_SYS_MISCFCR0, MISCFCR0_UHOVRCURH,
> +			   of_property_read_bool(pdev->dev.of_node,
> +						 "nuvoton,oc-active-high") ?
> +			   MISCFCR0_UHOVRCURH : 0);

[Severity: High]
Does this unconditional write break device tree backward compatibility?

If the optional property nuvoton,oc-active-high is absent, this explicitly
writes 0 to the bit, forcing the over-current polarity to active-low. The
original driver relied on the bootloader's configuration.

Will this cause a regression in over-current detection on existing boards t=
hat
use active-high hardware configured by the bootloader but lack this new
property in their older device tree?

> +
> +	for (n =3D 0; n < MA35_PHY_NUM; n++) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008060629.2736=
806-1-a0987203069@gmail.com?part=3D4
