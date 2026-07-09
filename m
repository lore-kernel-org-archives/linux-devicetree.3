Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3158743935A;
	Thu,  9 Jul 2026 02:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783563360; cv=none; b=XGpYR1u7+IN26+8nqf3VL+ZOlDcKPsGbKFTfsECjeoXtDt1t1TMXSSAGCqZG0BIZa+PCLb0zxccT2UKOeUt0+9v8K/1eDKgyFNzkf4Cr3Q1NTderew7IlnJf6Mv8Mk8ecXdkoUvKbKJsOhs08pqzudEKp7XPaIUIGlu4kLOLysU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783563360; c=relaxed/simple;
	bh=1W/jN5MATUKphhVI/5TFutLNeb2i+ne7yq33wlAuY+k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VcihXAejmVNxUtJ6fUzYkZmKtCPZpohccs8qAjKd1q8X2rpnlCE93HFpPnPJ0SG3aoiWx9KahxZC9i8G64Q4zuHf7W8F8p8QttO/fy3cQHAsiBugrQDicSTakj+7OGJLjcIvgZz+8Kkkx93CecJEoz2VLsUAW7RCm+WZ21BumbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=ftms0R3l; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="ftms0R3l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1783563355;
	bh=tH41RNED5+clJ8bDU3yrsPjDBxC2yWIilI8EOLE574U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ftms0R3l1Hxi9KJ9589VO97Frg6kN7OeNXibsjqRd65pV+OUowKvaK4G4y+TYgTcP
	 uB8ZX8+0DdAGA9lY46OHDqUkT6OKe9E+U6Qv3eAvvB2EFuX83vJgLY32mW9W7R2I3G
	 +bdp1eQu07nsN0ZxcHvRxL+ScRsJuX6dFWeI1ii/hsUmk6FVy6+KDGykQo2oHiHIm9
	 4FEHkiIC5/XDz69xWmYZ9N8Ig7zcnjVc4pCi+OBHq3yDJBRjbDDph0P556SoViAXfd
	 92Bij0zFycrY5a3rYKvMIzMD5MaGxwK7jNQEI3u5uDKgKDeiaeMte/jhozACIZDuW1
	 4PMwao+akqDRQ==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4823960288;
	Thu,  9 Jul 2026 10:15:53 +0800 (AWST)
Message-ID: <ddb133ca1a3be605ee776b2276c1907c9ad32491.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/3] phy: add AST2700 usb3.2 phy driver
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>, Philipp Zabel
 <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 09 Jul 2026 11:45:52 +0930
In-Reply-To: <20260116-upstream_usb3phy-v2-2-0b0c9f3eb6f4@aspeedtech.com>
References: <20260116-upstream_usb3phy-v2-0-0b0c9f3eb6f4@aspeedtech.com>
	 <20260116-upstream_usb3phy-v2-2-0b0c9f3eb6f4@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Ryan,

On Fri, 2026-01-16 at 10:53 +0800, Ryan Chen wrote:


...

> diff --git a/drivers/phy/aspeed/phy-aspeed-usb3.c b/drivers/phy/aspeed/ph=
y-aspeed-usb3.c
> new file mode 100644
> index 000000000000..872d2163fcf5
> --- /dev/null
> +++ b/drivers/phy/aspeed/phy-aspeed-usb3.c
> @@ -0,0 +1,236 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2026 Aspeed Technology Inc.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +
> +#define PHY3S00		0x00
> +#define PHY3S00_INIT_DONE		BIT(15)
> +#define PHY3S00_SRAM_BYPASS		BIT(7)
> +#define PHY3S00_SRAM_EXT_LOAD	BIT(6)
>=20

...

> +
> +static int aspeed_usb3_phy_init(struct phy *phy)
> +{
> +	struct aspeed_usb3_phy *aspeed_phy =3D phy_get_drvdata(phy);
> +	u32 val;
> +	int ret;
> +
> +	ret =3D clk_prepare_enable(aspeed_phy->clk);
> +	if (ret) {
> +		dev_err(aspeed_phy->dev, "Failed to enable clock %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D reset_control_deassert(aspeed_phy->rst);
> +	if (ret) {
> +		clk_disable_unprepare(aspeed_phy->clk);
> +		return ret;

Nit: Given we have to do this below if the reset_control_deassert()
succeeds, perhaps add a label below and use goto here?

> +	}
> +
> +	/* Wait for USB3 PHY internal SRAM initialization done */
> +	ret =3D readl_poll_timeout(aspeed_phy->regs + PHY3S00, val,
> +				 val & PHY3S00_INIT_DONE,
> +				 USEC_PER_MSEC, 10 * USEC_PER_MSEC);
> +	if (ret) {
> +		dev_err(aspeed_phy->dev, "SRAM init timeout\n");
> +		goto err_assert_reset;
> +	}
> +
> +	val =3D readl(aspeed_phy->regs + PHY3S00);
> +	val |=3D PHY3S00_SRAM_BYPASS;
> +	writel(val, aspeed_phy->regs + PHY3S00);

According to the datasheet PHY3S00[15] (PHY3S00_INIT_DONE above)
indicates that the PHY internal SRAM initialisation is complete. The
datasheet reports the SRAM is used for configuration of calibration
among other things. PHY3S00[6] instructs the PHY that software has
completed loading the configuration data into SRAM, however
PHY3S00_SRAM_BYPASS (PHY3S00[7]) tells the PHY to load configuration
from "hard wired" values.

Is it necessary to wait for SRAM initialisation to complete if we're
bypassing it? Or are there other side-effects involved in the setting
of PHY3S00[15]?

> +
> +	/* Set protocol1_ext signals as default PHY3 settings based on SNPS doc=
uments.
> +	 * Including PCFGI[54]: protocol1_ext_rx_los_lfps_en for better compati=
bility
> +	 */
> +	writel(PHY3P00_DEFAULT, aspeed_phy->regs + PHY3P00);
> +	writel(PHY3P04_DEFAULT, aspeed_phy->regs + PHY3P04);
> +	writel(PHY3P08_DEFAULT, aspeed_phy->regs + PHY3P08);
> +	writel(PHY3P0C_DEFAULT, aspeed_phy->regs + PHY3P0C);
> +
> +	return 0;
> +
> +err_assert_reset:
> +	reset_control_assert(aspeed_phy->rst);
> +	clk_disable_unprepare(aspeed_phy->clk);
> +	return ret;
> +}
>=20

...

>=20
> +static struct platform_driver aspeed_usb3_phy_driver =3D {
> +	.probe		=3D aspeed_usb3_phy_probe,
> +	.driver		=3D {
> +		.name	=3D KBUILD_MODNAME,
> +		.of_match_table	=3D aspeed_usb3_phy_match_table,
> +	},
> +};
> +module_platform_driver(aspeed_usb3_phy_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("ASPEED USB3.0 PHY Driver");

MODULE_AUTHOR()?

Andrew
