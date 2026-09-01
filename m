Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D6024501D
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 12:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788267226; cv=none; b=aTSLqanfMW6Xjvg9r40DqxbSXadPUp5JmDHPkq+XQtNyrm2O4Xjbu7kiMaIztFmAFQ5U0cXQlTOMM7v+Im5fiYr8BkRQVNu+qO2rdnOCPDadxMQkqymMUUbIAFXBdRTWflRLGiRFwD0QwLynL2aleFHOLc7k6F/lb0dkgt0J9JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788267226; c=relaxed/simple;
	bh=e+CzF0uTJocazi5eMfGHahlsQMtk0rWrfC7ys6F69KU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KD/abqC/XDbIsfsk9lh4Mips5phd/Jn2Gz4CXjTa7zU7yvUJmUZOELu+rMt99kWmMm9ri1HmtyleHXoyDKsj0RsMWF/8QTBovvTmnK0f1MMkHhY3VMKMkssaVd5UjYuhOUdUn3HJPw5kY8ZKy0CA4CFE55b8XPz+JM3XXGi3Y74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d++NW9fw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d++NW9fw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F841F000E9;
	Tue,  1 Sep 2026 12:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788267224;
	bh=eLZTOWHgG7CwkY0SDZETC+DWiR9pN4DGiVS5ICx3dqI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d++NW9fwxWgtIEVorP0JAOFaTivjbMsHdZ7cQLgQ85SNqzzAZoYQkHfCTvzq8d7Vv
	 KnyPwU0wTk7KBG3U6vT19jx8EXFbhNrWuOFHkyr2V6YdEWZ7Uf06x/VaK8tHGOXTxJ
	 7HpNHYDUAqbs1foRB8KyOo/zcrwaBdkUAH6+56rkMrRk1vbEHKyL6JUUn0EXxTQk1e
	 KOCnRNYlKrCOO18xW+zsrRpGRfvB5vPsEegqCHmIf5/r3/fNATDhCyC+jaYaV2x/Sa
	 ZmJekjRjxUWLdeYPMNVb9+UqJ5pR0Z50gSOgDOGX8CtqN/ml9a7K+7IohGjJtAdUxv
	 x5POgQ7eXuBRQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] phy: airoha: Add support for Airoha AN7583 USB
 PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, conor+dt@kernel.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20260901123933.15388-4-ansuelsmth@gmail.com>
References: <20260901123933.15388-1-ansuelsmth@gmail.com>
 <20260901123933.15388-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 12:53:43 +0000
Message-Id: <20260901125344.46F841F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Failure to propagate PHY lifecycle calls to the underlying SerDes =
PHY
- [High] USB PHY instances are inaccessible due to incorrect PHY provider r=
egistration
- [Medium] Use of uninitialized stack variable due to missing regmap_read r=
eturn check
- [Medium] Lockdep warning due to recursive locking of phy->mutex in set_mo=
de callbacks
- [Low] Missing select REGMAP_MMIO in Kconfig leading to link-time errors
- [Low] Missing explicit inclusion of <linux/delay.h>
--

commit 78bb8c49d95aeffce30cf8303d7ac8de16f47e67
Author: Christian Marangi <ansuelsmth@gmail.com>

    phy: airoha: Add support for Airoha AN7583 USB PHY
   =20
    Add support for USB PHY for Airoha AN7583 SoC, this share some U2 init
    from AN7581 but use a totally different init phase for PLL and
    calibration for U3. Also on AN7583 there is a single USB PHY that init 2
    U2 port and one U3 port. (the USB controller expose 2 hub, one with 2
    usb 2.0 port and one with one 3.0 port)
   =20
    A second USB PHY is used for PCIe Gen2 controller and follow the same
    calibration and setup logic of USB.

> diff --git a/drivers/phy/airoha/Kconfig b/drivers/phy/airoha/Kconfig
> new file mode 100644
> index 0000000000000..13e49ff947e3e
> --- /dev/null
> +++ b/drivers/phy/airoha/Kconfig
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config PHY_AIROHA_AN7583_USB
> +	tristate "Airoha AN7583 USB PHY Driver"
> +	depends on ARCH_AIROHA || COMPILE_TEST
> +	depends on OF
> +	select GENERIC_PHY

[Severity: Low]
Is a select for REGMAP_MMIO missing here? If COMPILE_TEST is enabled and no
other driver implicitly selects REGMAP_MMIO, couldn't this cause a link-time
error due to an undefined reference to __devm_regmap_init_mmio_clk?

> +	help
> +	  Say 'Y' here to add support for Airoha AN7583 USB PHY driver.

> diff --git a/drivers/phy/airoha/phy-an7583-usb.c b/drivers/phy/airoha/phy=
-an7583-usb.c
> new file mode 100644
> index 0000000000000..46b5f09582cfd
> --- /dev/null
> +++ b/drivers/phy/airoha/phy-an7583-usb.c
> @@ -0,0 +1,2023 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Author: Christian Marangi <ansuelsmth@gmail.com>
> + */
> +
> +#include <dt-bindings/phy/phy.h>
> +#include <linux/bitfield.h>
> +#include <linux/math.h>
> +#include <linux/module.h>
> +#include <linux/phy.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>

[Severity: Low]
Does this code rely on linux/delay.h for mdelay() and usleep_range() without
including it? This could lead to compilation failures on architectures or
configurations where it isn't implicitly included by other headers.

[ ... ]

> +static bool an7583_usb_phy_u3_kband_is_calibrated(struct an7583_usb_phy_=
priv *priv)
> +{
> +	u32 val, res;

[ ... ]

> +	regmap_read(priv->regs[AIROHA_USB_PHY_PMA],
> +		    AIROHA_USB_PMA_INTF_STS_9, &val);
> +	res =3D FIELD_GET(AIROHA_USB_PMA_ADDR_INTF_STS_PLL_VCOCAL, val) << 4;

[Severity: Medium]
If the regmap_read() fails, wouldn't the uninitialized stack variable val be
accessed here? Could this result in undefined behavior and potentially bypa=
ss
the KBand calibration loop?

[ ... ]

> +static int an7583_usb_phy_init(struct phy *phy)
> +{
> +	struct an7583_usb_phy_instance *instance =3D phy_get_drvdata(phy);

[Severity: High]
Does this initialization omit a call to phy_init(instance->serdes_phy)? Sin=
ce
the wrapper PHY intercepts the init call, failing to forward it might leave
the physical SerDes lines uninitialized and the PCIe and USB 3.0 interfaces
non-functional.

> +
> +	switch (instance->type) {
> +	case PHY_TYPE_USB2:

[ ... ]

> +static int an7583_usb_phy_power_on(struct phy *phy)
> +{
> +	struct an7583_usb_phy_instance *instance =3D phy_get_drvdata(phy);

[Severity: High]
Similarly, does this fail to call phy_power_on(instance->serdes_phy)? This
seems to leave the physical SerDes disabled when a consumer attempts to pow=
er
on the PHY.

> +
> +	switch (instance->type) {
> +	case PHY_TYPE_USB2:

[ ... ]

> +static int an7583_usb_phy_u3_set_mode(struct phy *phy, enum phy_mode mod=
e,
> +				      int submode)
> +{
> +	struct an7583_usb_phy_instance *instance =3D phy_get_drvdata(phy);
> +	int ret;
> +
> +	switch (mode) {

[ ... ]

> +	}
> +
> +	ret =3D phy_set_mode_ext(instance->serdes_phy, mode, submode);

[Severity: Medium]
Can this nested call to phy_set_mode_ext() on the child SerDes PHY cause a
lockdep warning?

Since the parent PHY's mutex is already held by the framework, and all PHY
mutexes are initialized with the same lockdep key, this might trigger a
possible recursive locking deadlock warning. This pattern also appears in
an7583_usb_phy_pcie_set_mode().

[ ... ]

> +static struct phy *an7583_usb_phy_xlate(struct device *dev,
> +					const struct of_phandle_args *args)
> +{
> +	struct an7583_usb_phy_priv *priv =3D dev_get_drvdata(dev);
> +	const struct an7583_usb_phy_match_data *data;
> +	struct device_node *phy_np =3D args->np;
> +	struct phy *phy =3D NULL;
> +	int type, index;
> +
> +	data =3D of_device_get_match_data(dev);
> +
> +	if (args->args_count !=3D 1) {
> +		dev_err(dev, "invalid number of cells in 'phy' property\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	for (index =3D 0; index < data->max_instance; index++) {
> +		if (!priv->phys[index])
> +			continue;
> +
> +		if (phy_np =3D=3D priv->phys[index]->dev.of_node) {
> +			phy =3D priv->phys[index];
> +			break;
> +		}
> +	}

[ ... ]

> +static int an7583_usb_phy_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	phy_provider =3D devm_of_phy_provider_register(dev, an7583_usb_phy_xlat=
e);

[Severity: High]
Does this incorrectly isolate the subnodes from the PHY core?

By registering the provider with devm_of_phy_provider_register(dev, ...)
instead of using a variant that checks the children tree, the PHY core might
fail to traverse to the child nodes when looking up the PHY.

Furthermore, in an7583_usb_phy_xlate(), comparing the parent node (args->np)
against the child node stored in priv->phys[index]->dev.of_node would
guarantee a mismatch. Would this make the USB PHY instances completely
inaccessible to any consumer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901123933.1538=
8-1-ansuelsmth@gmail.com?part=3D3
