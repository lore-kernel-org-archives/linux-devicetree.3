Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435039;
	b=asClPbH48tA7JZj21VI5ttyBl628c16i+0AVMkW1GKJLu3ltXEzXk8EqDi+ZVi42C12L
	 Oj6c0T6+Tbs+GaDGAz4iA+OPmDK+PXNY8xX810xfQSXhJvqCC2IeTh/i5YeM4OQxbG+3U
	 wlKD4iT5Vd6eOMIuAhx+zB0X4DLUeElHf7LEnwdJmnyp4HiZkWCwh8HCgVcm/rXyOCpUZ
	 yyshOxfnOlFTtuUi7qjcNsuZhd3PpFPgCpEWPGs2na8o5bZUXQ9ePxL4Ohou/qwqz+nV4
	 N38lzEYsQgiKsF0Fmcbzo3SP+7ZJa1lFZq5R/oQYNJyUWZgttVhVS46Xe2lq7tvMQRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435039;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=6fEkPWmHsE1FBTbolVguk9F6xOB/+sWczlTwhCw0V+c=;
	b=c/YMcC4DlboSSrXXjVJIOOXug36af7KqcNEpbaxOMKnpYOdgLw2z5Cdk1Ozhm4HryRHU
	 o0/RBXI//m7Gwm8UH9hNL6+6E7z8TwKcgTU1+dLHpi3GegqFgx4B+YnVPYKvn8hZBwa02
	 QTULjavxpjJRoaysRSyyLscZIpVEULYZvvqPJXlj4QiGkMpa+l7RkpJ0+BOcjyurl5xyz
	 BuDDDQCHPz0TX6JIICmz2bD68VVCMR9PxQNrnE/NuWQiXJ2Ak+QcR6RgXDqKygcwEgGLe
	 dpnuvk/sietEed2lTXdEv+akIa+kNDlnJfgmW4ZAZaWeapv4q4zZJ9gITCjamhpdMUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QEm8CySf;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75741606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75741606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QEm8CySf
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 24643C69149;
	Mon, 23 Nov 2026 11:57:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18B34601E1;
	Mon, 23 Nov 2026 11:57:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 00D7111E6A292;
	Mon, 23 Nov 2026 12:57:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795435034; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=6fEkPWmHsE1FBTbolVguk9F6xOB/+sWczlTwhCw0V+c=;
	b=QEm8CySfaxHG78ZPs8oBzHwLlwWSTKT9teqadOb69wiEzSGroYsFWW6BGoAuCrjEGRoW6p
	OF/c4eDaLYJhUggLvbvY7mCz5x1++RjNYRGcXi6Je+uHkfVLCUFNVEtjypjc93WtEIZHhN
	repOzx6fwrb87HU3YNT1e1J752BXvnCRpn2PnlSuDJ0W7sGqDnI7kKWg4x9yHi/4ZsIbPj
	OWNf8Vc9b8VYDdRVa07v1YPLaSdhcriBWKfpOUoXN6onS9OV9ECW1GttbDpzcUyMPKaIqa
	DxtBNLUu9TJZ0pl0aZIn9QkrPhcYiY/cDk9zwJ7KJXrJsj0Bsm3Wh8Jr30JZ3Q==
Message-ID: <4f1c4180-3a00-4b17-a27b-e61b307d3e5f@bootlin.com>
Date: Mon, 23 Nov 2026 12:57:06 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] net: stmmac: Add glue layer for Synaptics SL2610 SoC
To: Jisheng Zhang <jszhang@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261116135442.4827-1-jszhang@kernel.org>
 <20261116135442.4827-5-jszhang@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261116135442.4827-5-jszhang@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 11/16/26 14:54, Jisheng Zhang wrote:
> Add dwmac glue driver to support the DesignWare-based GMAC controllers
> in the Synaptics SL2610 SoC.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  MAINTAINERS                                   |   2 +
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>  .../net/ethernet/stmicro/stmmac/dwmac-syna.c  | 116 ++++++++++++++++++
>  4 files changed, 130 insertions(+)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-syna.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 430758242906..dba0288bf4da 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3808,12 +3808,14 @@ M:	Jisheng Zhang <jszhang@kernel.org>
>  M:	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/net/syna,sl2610-dwmac.yaml
>  F:	Documentation/devicetree/bindings/soc/synaptics/
>  F:	arch/arm/boot/dts/synaptics/
>  F:	arch/arm/mach-berlin/
>  F:	arch/arm64/boot/dts/synaptics/
>  F:	drivers/clk/berlin/*sl2610*
>  F:	drivers/clk/berlin/sl-*
> +F:	drivers/net/ethernet/stmicro/stmmac/dwmac-syna.c
>  F:	drivers/pinctrl/berlin/pinctrl-sl2610.c
>  F:	drivers/reset/reset-sl2610.c
>  F:	drivers/soc/synaptics/
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index c6559e749c0c..79ffebcaba0e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -310,6 +310,17 @@ config DWMAC_SUN55I
>  	  stmmac device driver. This driver is used for A523/T527
>  	  GMAC200 ethernet controller.
>  
> +config DWMAC_SYNA
> +	tristate "Synaptics SL2610 DWMAC support"
> +	depends on OF && HAS_DMA && (ARCH_BERLIN || COMPILE_TEST)
> +	select MFD_SYSCON
> +	help
> +	  Support for the Synaptics SL2610 DesignWare Ethernet MAC glue.
> +	  This configures the PHY interface through the system controller.
> +
> +	  To compile this driver as a module, choose M here. The module
> +	  will be called dwmac-syna.
> +
>  config DWMAC_THEAD
>  	tristate "T-HEAD dwmac support"
>  	depends on OF && (ARCH_THEAD || COMPILE_TEST)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> index b16a456b730e..d132353e9403 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> @@ -35,6 +35,7 @@ obj-$(CONFIG_DWMAC_STM32)	+= dwmac-stm32.o
>  obj-$(CONFIG_DWMAC_SUNXI)	+= dwmac-sunxi.o
>  obj-$(CONFIG_DWMAC_SUN8I)	+= dwmac-sun8i.o
>  obj-$(CONFIG_DWMAC_SUN55I)	+= dwmac-sun55i.o
> +obj-$(CONFIG_DWMAC_SYNA)	+= dwmac-syna.o
>  obj-$(CONFIG_DWMAC_THEAD)	+= dwmac-thead.o
>  obj-$(CONFIG_DWMAC_ULTRARISC)	+= dwmac-ultrarisc.o
>  obj-$(CONFIG_DWMAC_DWC_QOS_ETH)	+= dwmac-dwc-qos-eth.o
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-syna.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-syna.c
> new file mode 100644
> index 000000000000..c4bc895b29da
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-syna.c
> @@ -0,0 +1,116 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Synaptics DWMAC platform driver
> + *
> + * Copyright (C) 2026 Jisheng Zhang <jszhang@kernel.org>
> + *
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/module.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_net.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include "stmmac_platform.h"
> +
> +#define CTL_PHY_INTF_SEL	GENMASK(4, 1)
> +#define CTL_PHY_INTF_RGMII	FIELD_PREP(CTL_PHY_INTF_SEL, 1)
> +#define CTL_PHY_INTF_RMII	FIELD_PREP(CTL_PHY_INTF_SEL, 4)

Please use PHY_INTF_SEL_RGMII and PHY_INTF_SEL_RMII from "common.h"

> +
> +struct syna_dwmac {
> +	struct plat_stmmacenet_data *plat;
> +	struct regmap *regmap;
> +	u32 rgmii_ctl;
> +	struct device *dev;
> +};
> +
> +static int syna_dwmac_set_phy_if(struct plat_stmmacenet_data *plat)
> +{
> +	struct syna_dwmac *dwmac = plat->bsp_priv;
> +	u32 phyif;
> +
> +	switch (plat->phy_interface) {
> +	case PHY_INTERFACE_MODE_RMII:
> +		phyif = CTL_PHY_INTF_RMII;
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +		phyif = CTL_PHY_INTF_RGMII;
> +		break;
> +	default:
> +		dev_err(dwmac->dev, "unsupported phy interface %s\n",
> +			phy_modes(plat->phy_interface));
> +		return -EINVAL;
> +	}
> +
> +	return regmap_update_bits(dwmac->regmap, dwmac->rgmii_ctl, CTL_PHY_INTF_SEL, phyif);
> +}
> +
> +static int syna_dwmac_init(struct device *dev, void *priv)
> +{
> +	struct syna_dwmac *dwmac = priv;
> +
> +	return syna_dwmac_set_phy_if(dwmac->plat);
> +}

Can you implement .set_phy_intf_sel() instead ? that should simplify that quite a lot.

Thanks,

Maxime
