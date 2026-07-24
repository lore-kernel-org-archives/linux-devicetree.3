Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A5338C410
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 19:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784919697; cv=none; b=JUxY/g8622fAlHmrtBIk5nNRmmXeOrW+CyPdTtimy8/AADcTGfLU6sM67jNeeWyuA5NSgiiepF7iT4zloeFIS3vwhnUaIC39+pFSpyk2qLsfKKRufXITr+tg0zdqiDos+pYilhkWCBuoL+suqpGgZnJzV+oTDSjNeXnVNkzxnoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784919697; c=relaxed/simple;
	bh=T8nxv+c+fCDehE2pdoSRoe7QvfJ5UNO316nHyAqvXqo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dro2SNMFIKv/t4IJYyxP4Ew14zZsoB0itkKF/RlScwHmM+FXN+1dcSvyIOksfFnFpZ6tUYQrlIZxL5qeZuhbsHbRytut1Snje7j6oSFvvc74+14gkVxS6wqWtZCL4u45WdDbdi8HHPH43FNbe91vY/3UcuxaXdM2yLn4Z7jzPnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Im382gLm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Im382gLm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B22051F000E9;
	Fri, 24 Jul 2026 19:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784919696;
	bh=b/2fAmPzybAY+X6MbMbrFn/6g3tSWxJ53kcCCGeEU34=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Im382gLmmjTwqpeViaLQR/Nb+E+w6w5zSHzoout8LChHLzDSSt0AT0GIfxo+iivhC
	 Hv0FOBQ5UStPUiS4AeblA4zC+2pVfVx+AUVI5Htl5LF9dwslBGfVL7MYNfm3lWHAp5
	 //55D1GPORi5V0Wl0lF69VjCnZI24h8ZSXsEuwLFicWOqiIbrTEz24VJjdbgj8F/Uj
	 IhXmXmqj5Vc2imQZSeRDhCVqEXE5vHd6awYeELTItGqZNsjb4nbnOeP3hNQiXb+zcy
	 iaVpBXigRn7TdLgYBfHpcy9iG+5IFJ6Taga3/zd0uRuif79fXrMHN5qhlz8gpsbxa2
	 XPQqQ/iaGL5Gw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 3/3] phy: airoha: Add support for Airoha AN7581 USB
 PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, robh@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, linux-phy@lists.infradead.org
In-Reply-To: <20260724184523.193661-4-ansuelsmth@gmail.com>
References: <20260724184523.193661-1-ansuelsmth@gmail.com>
 <20260724184523.193661-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 19:01:35 +0000
Message-Id: <20260724190135.B22051F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Missing PHY Initialization for SerDes PHY (API Violation)
- [High] Incorrect Register Update using regmap_set_bits with a multi-bit m=
ask
- [Medium] Semantic Mismatch: Hardcoding SerDes PHY to DEVICE mode ignores =
HOST controller capability
- [Low] Missing Header Files for Core Kernel APIs
--

--- Patch [3]: [PATCH v11 3/3] phy: airoha: Add support for Airoha AN7581 U=
SB PHY ---
commit 22b1a55f0db8cf42614375aa158b5f25ac5f97d6
Author: Christian Marangi <ansuelsmth@gmail.com>
Subject: phy: airoha: Add support for Airoha AN7581 USB PHY

This commit adds support for the Airoha AN7581 USB PHY driver, which suppor=
ts
up to 2 USB ports. USB 2.0 is always supported, while USB 3.0 mode is only
available if the Serdes port is correctly configured. The driver includes s=
lew
rate calibration logic using a selectable monitor clock.

> diff --git a/drivers/phy/airoha/phy-an7581-usb.c b/drivers/phy/airoha/phy=
-an7581-usb.c
> new file mode 100644
> index 0000000000000..92c5e5c2fbf3b
> --- /dev/null
> +++ b/drivers/phy/airoha/phy-an7581-usb.c
> @@ -0,0 +1,559 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Author: Christian Marangi <ansuelsmth@gmail.com>
> + */
> +
> +#include <dt-bindings/phy/phy.h>
> +#include <dt-bindings/soc/airoha,scu-ssr.h>
> +#include <linux/bitfield.h>
> +#include <linux/math.h>
> +#include <linux/module.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>

[Severity: Low]
Does this file need to include linux/delay.h for usleep_range(), linux/of.h
for of_property_read_u32(), and linux/err.h for PTR_ERR_OR_ZERO() to avoid
potential build breaks on other architectures if implicit inclusions change?

[ ... ]
> +static void an7581_usb_phy_u3_init(struct an7581_usb_phy_priv *priv)
> +{
[ ... ]
> +	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_U3_PHYA_REG0,
> +			   AIROHA_USB_PHY_SSUSB_BG_DIV,
> +			   AIROHA_USB_PHY_SSUSB_BG_DIV_4);
> +
> +	regmap_set_bits(priv->regmap, AIROHA_USB_PHY_U3_PHYA_REG1,
> +			FIELD_PREP(AIROHA_USB_PHY_SSUSB_XTAL_TOP_RESERVE, 0x600));

[Severity: High]
Is it intentional to use regmap_set_bits() here with a multi-bit mask?
This performs a logical OR, which sets the desired bits but will not clear =
any
pre-existing bits in the mask from the bootloader. Should this be
regmap_update_bits() instead to ensure a clean state?

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

[Severity: High]
This calls phy_set_mode() on priv->serdes_phy, but does the underlying
serdes PHY hardware ever get initialized? It appears phy_init() is missing
before this call, which could leave the serdes PHY in an uninitialized stat=
e.

[Severity: Medium]
Additionally, is it correct to hardcode the serdes PHY mode to
PHY_MODE_USB_DEVICE_SS here? The commit message mentions xHCI which is a ho=
st
controller, so forcing device mode might cause initialization failures if t=
he
serdes PHY driver distinguishes between host and device operational modes.

> +		if (ret)
> +			return ret;
> +
> +		an7581_usb_phy_u3_init(priv);
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

[Severity: High]
Does priv->serdes_phy need to be powered on here as well? The wrapper
powers on its USB3 instance, but it looks like phy_power_on(priv->serdes_ph=
y)
is never called.

> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
[ ... ]
> +static int an7581_usb_phy_set_mode(struct phy *phy, enum phy_mode mode, =
int submode)
> +{
> +	struct an7581_usb_phy_instance *instance =3D phy_get_drvdata(phy);
> +	struct an7581_usb_phy_priv *priv =3D dev_get_drvdata(phy->dev.parent);
> +
> +	switch (instance->type) {
> +	case PHY_TYPE_USB2:
> +		return an7581_usb_phy_u2_set_mode(priv, mode);
> +	default:
> +		return 0;

[Severity: Medium]
Does this code silently ignore the consumer's requested mode for
PHY_TYPE_USB3? Since an7581_usb_phy_init() forces PHY_MODE_USB_DEVICE_SS,
should this function handle propagating the requested mode to the serdes PHY
instead of hardcoding it during initialization?

> +	}
> +}
[ ... ]
> +static const struct phy_ops airoha_phy =3D {
> +	.init		=3D an7581_usb_phy_init,
> +	.power_on	=3D an7581_usb_phy_power_on,
> +	.power_off	=3D an7581_usb_phy_power_off,
> +	.set_mode	=3D an7581_usb_phy_set_mode,
> +	.owner		=3D THIS_MODULE,
> +};

[Severity: High]
Is the .exit callback intentionally omitted here? Without an .exit hook,
there doesn't seem to be a way to call phy_exit() on the serdes PHY, which
might lead to resource leaks when the PHY is released.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724184523.1936=
61-1-ansuelsmth@gmail.com?part=3D3
