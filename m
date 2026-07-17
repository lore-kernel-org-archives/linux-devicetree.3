Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A633EDADA
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784288326; cv=none; b=r6bJJRA3FbnVerPreUzwaTgXF8vD+HBLBgfeA+Yu9IrQrp4cDxhIX1Pd+KGnEFkpIjGqRRpkz/N9rLNmhhxY1yYwUEdthRFm6HSh/pS7/+27x2t6Qelh/Zqf2O6BCGCZ5F/NlBu3mNoQ7zUrmkDYMUYWKQRBhXs5Md/DIYHtRM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784288326; c=relaxed/simple;
	bh=+wEo/6rVE/QUoVcS+xAK0BcK4FtC616MZ1qaeltLB/I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lsIjy6x7eNl51/P3sRsbRdgNCRKZ1q4cr3vxLKnn6k+PyKmMS833MDOv1FSPHQIeO/GkKqqaZXdJBGmZJ5QD7IUyPPTFndpDU6nfWt5uaGtDQ4sLxgTySvS+lS0Y3ZVDz4UQdJekle8F+7/PaK34hJyJinXGdGzCZyL+VZ8J8to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GdM/9G5i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GdM/9G5i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EACA21F00A3A;
	Fri, 17 Jul 2026 11:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784288324;
	bh=3+eD5dHHj6GR+I3O9ST9lIJ8xb6zbuRQpo8+qkIhJKU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GdM/9G5iehiEZzwIa1ucM+MRd/kiggPnKAUzGR819LyVXJf3tOpWJbHCKyyqyYpfb
	 WTdEb3xI2EMJymEz673OV8xRq8sXCcAHNVhEUUQ6mgpq6GHDl/pEnO8nMkaJy+OtdB
	 hnjiuQaHTyrYWF0ci/NoUYwDiPDWcFEudlZP5FxwL66HgoyYlu7ZajkyqfHU1L9Kau
	 iunCADkfSK1yK9PTc0qEY3+BAQfG/PFCSSPlI2CnSo4cIUB4sW40SSYdGz0nlNBdA4
	 mOaIbI2F0OKN4VgNRKJTkl7XAQznR5EGw+p8P47oORj1UnSg9RtesgMlgoIK4paYS8
	 +L4AuCAHYuH2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 2/2] net: phy: add DAPU Telecom DAP8210R(I)
 Gigabit Ethernet PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Shimko" <a.shimko.dev@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260716113805.593215-3-a.shimko.dev@gmail.com>
References: <20260716113805.593215-1-a.shimko.dev@gmail.com>
 <20260716113805.593215-3-a.shimko.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 11:38:43 +0000
Message-Id: <20260717113843.EACA21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Unconfigured RGMII delays are not explicitly disabled, leaking har=
dware state.
- [High] Software reset is triggered before RGMII settings are written.
- [Medium] Invalid RGMII delay values in the Device Tree are silently ignor=
ed instead of failing probe.
- [Low] The Kconfig help text claims support for an 'internal packet genera=
tor' that is not implemented.
- [Low] The <linux/delay.h> header is not explicitly included despite using=
 fsleep().
--

--- Patch [2]: [PATCH net-next v2 2/2] net: phy: add DAPU Telecom DAP8210R(=
I) Gigabit Ethernet PHY driver ---
commit a12532ee64a58b8261da15777e57b6a0bb7a0bc4
Author: Artem Shimko <a.shimko.dev@gmail.com>

net: phy: add DAPU Telecom DAP8210R(I) Gigabit Ethernet PHY driver

This commit adds a new PHY driver for the DAPU Telecom DAP8211R(I) Gigabit
Ethernet PHY. It implements extended register access and provides device
tree support for RGMII delay configuration and TX clock phase shifting.

> diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
> index 099f25dceabbc..4576f707ac944 100644
> --- a/drivers/net/phy/Kconfig
> +++ b/drivers/net/phy/Kconfig
[ ... ]
> @@ -237,6 +237,16 @@ config DAVICOM_PHY
>  	help
>  	  Currently supports dm9161e and dm9131
> =20
> +config DAP8211R_PHY
> +	tristate "DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY"
> +	depends on OF
> +	help
> +	  Support for the DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY.
> +	  This PHY is designed for enterprise and industrial networking
> +	  applications, supporting 10/100/1000 Mbps operation.
> +	  RGMII with: configurable TX/RX clock delays, optional flag to enable
> +	  180-degree TX clock phase shift and internal packet generator.

[Severity: Low]
Is this help text accurate regarding the internal packet generator?

The description mentions an internal packet generator, but there doesn't
appear to be any functionality for it implemented in the driver itself.

> diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
> new file mode 100644
> index 0000000000000..e1e6a322ef0c4
> --- /dev/null
> +++ b/drivers/net/phy/dap8211r.c
> @@ -0,0 +1,281 @@
> +// SPDX-License-Identifier: GPL
> +/*
> + * Driver for the DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY.
[ ... ]
> +#include <linux/bitfield.h>
> +#include <linux/errno.h>
> +#include <linux/ethtool.h>

[Severity: Low]
Does this file need to include <linux/delay.h>?

The code uses fsleep() in dap8211r_config_init(), but the delay header
is not explicitly included. This might cause build failures on some
architectures or configs.

[ ... ]
> +static int dap8211r_delay_ps_to_sel(u32 ps)
> +{
> +	for (int i =3D 0; i < DAP8211R_DELAY_COUNT; i++)
> +		if (ps =3D=3D delay_config[i].ps)
> +			return delay_config[i].sel;
> +
> +	return -EINVAL;
> +}
[ ... ]
> +static int dap8211r_get_rgmii_delay(struct phy_device *phydev, const cha=
r *prop_name, bool is_id)
> +{
> +	struct device_node *np =3D phydev->mdio.dev.of_node;
> +	u32 ps =3D 0;
> +	int ret;
> +
> +	ret =3D of_property_read_u32(np, prop_name, &ps);
> +	if (ret =3D=3D -EINVAL)
> +		return (is_id) ? DAP8211R_DEFAULT_DELAY_SEL : ret;
> +	if (ret < 0)
> +		return ret;
> +
> +	return dap8211r_delay_ps_to_sel(ps);
> +}
[ ... ]
> +static int dap8211r_config_init(struct phy_device *phydev)
> +{
> +	struct device_node *phydev_node =3D phydev->mdio.dev.of_node;
> +	u16 mask =3D 0, set =3D 0;
> +	int ret, retries =3D 10;
> +
> +	switch (phydev->interface) {
> +	case PHY_INTERFACE_MODE_RGMII:
> +		ret =3D dap8211r_get_rgmii_delay(phydev, "rx-internal-delay-ps", false=
);
> +		if (ret >=3D 0) {
> +			set =3D FIELD_PREP(DAP8211R_RGMII_RX_DEL_MASK, ret);
> +			mask =3D DAP8211R_RGMII_RX_DEL_MASK;
> +		} else if ((ret < 0) && (ret !=3D -EINVAL)) {
> +			return ret;
> +		}

[Severity: Medium]
Does this logic unintentionally skip invalid delay values in the device tre=
e?

Because dap8211r_get_rgmii_delay() returns -EINVAL when a property is
entirely missing, and dap8211r_delay_ps_to_sel() also returns -EINVAL for
an invalid out-of-bounds value (like rx-internal-delay-ps =3D <200>), the
check here treats both conditions exactly the same.

This means if an invalid delay is provided in the device tree, it will be
silently ignored instead of failing probe.

[Severity: High]
Will this leave stale hardware default delays enabled if properties are mis=
sing?

In PHY_INTERFACE_MODE_RGMII, if the delay properties are not provided,
the mask bits remain empty. The driver doesn't explicitly clear the
DAP8211R_RGMII_RX_DEL_MASK or DAP8211R_RGMII_TX_DEL_MASK bits in the mask.
If the bootloader or hardware defaults left these delays active, they will
not be disabled, violating the requested PHY_INTERFACE_MODE_RGMII mode.

> +
> +		ret =3D dap8211r_get_rgmii_delay(phydev, "tx-internal-delay-ps", false=
);
> +		if (ret >=3D 0) {
> +			set |=3D FIELD_PREP(DAP8211R_RGMII_TX_DEL_MASK, ret);
> +			mask |=3D DAP8211R_RGMII_TX_DEL_MASK;
> +		} else if ((ret < 0) && (ret !=3D -EINVAL)) {
> +			return ret;
> +		}
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +		ret =3D dap8211r_get_rgmii_delay(phydev, "rx-internal-delay-ps", true);
> +		if (ret < 0)
> +			return ret;
> +
> +		set =3D FIELD_PREP(DAP8211R_RGMII_RX_DEL_MASK, ret);
> +		mask =3D DAP8211R_RGMII_RX_DEL_MASK;
> +		break;

[Severity: High]
Similarly, in PHY_INTERFACE_MODE_RGMII_RXID, the TX delay mask is never add=
ed
to the 'mask' variable. Could this leave the TX delay active if it was
previously configured by the bootloader?

[ ... ]
> +	if (of_property_read_bool(phydev_node, "dapu,tx-inverted-clk"))
> +		set |=3D DAP8211R_RGMII_CLK_INVERT;
> +
> +	mask |=3D DAP8211R_RGMII_CLK_INVERT;
> +
> +	ret =3D dap8211r_modify_ext(phydev, DAP8211R_PHY_CON, DAP8211R_PHY_SW_R=
ST, 0);
> +	if (ret)
> +		return ret;
> +
> +	/* Wait for reset self-clear */
> +	do {
> +		fsleep(20);
> +		ret =3D dap8211r_read_ext(phydev, DAP8211R_PHY_CON);
> +		if (ret < 0)
> +			return ret;
> +	} while (!(ret & DAP8211R_PHY_SW_RST) && --retries);
> +
> +	if (!retries)
> +		return -ETIMEDOUT;
> +
> +	ret =3D dap8211r_modify_ext(phydev, DAP8211R_RGMII_CON, mask, set);
> +	if (ret)
> +		return ret;

[Severity: High]
Are the RGMII settings applied correctly here?

The comment earlier in dap8211r_config_init() mentions "Software reset to
apply settings", but the software reset is executed and waited upon before
writing to DAP8211R_RGMII_CON.

Because the software reset happens before the new delay configuration is wr=
itten,
does this mean the newly programmed RGMII delays and clock inversions will =
not
be latched into the PHY's datapath?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716113805.5932=
15-1-a.shimko.dev@gmail.com?part=3D2
