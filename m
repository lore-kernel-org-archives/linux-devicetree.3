Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440248;
	b=ZX71RPx2rzejcSYCaLVc346sqgAfTo4Kgds8CK8y6IxwRwJQfGgUOQaJ4BEhp9A7x7io
	 9bsOyEqlEWWMmc5hZovuKLJCTsNWNM8u3YazAyzbrBDMsxe4MjwqvEK5jH+WnPVoOBufQ
	 KIAtO7W9+4XW9xGw+Djt1cXi52KJlG6HeELkmOb1ia8dw1CLZcp2AH8pncMLL8q31RCo2
	 uETV26G31a4uT4tIvCiJ4WLoZtxfLqSWjQLnzXqu71U40HEs9wwmphqFAjS437Y2j2RSf
	 UIEGR2rI4KOTaIxNkRRlw20rhqI682aCSQdwQnrPho4OXDz695QLF5KC8tG12dnEWaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440248;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mvYDAmTPND065bEyMUQdFya2DyZKAiR6PvyK6Q17Cwk=;
	b=nYTAp8CXP2xcvoSyOajWEUIBCQuBzwyJpK8PvwiMMqCBz2T0lVjf99OWcQTJr5UyQ8oP
	 DfmfnvsENrm8gx57txF8NOm3RNo6wGcHsFXCdEg1wv9qOmLKrNGLU5yFcQCEsmgr5OKWz
	 tDhNoSyfKPBjuTqVjFqP5lh3IgSPJXAuvV9JOsDssATX4A4Sn+fCpKtDklsbZn6gygOkA
	 NUvI1ZIZP0M/loHDODe3SksM6ImPi4i3PJTr72rmoGOK+ymdOoSroAKOAJxrpNNsdagfs
	 a0msAKInGP6ZQBIa4f5BWbrYiVZsJ/rm105tPUnFfz384rtnDoRpjaOwsN2ej3HUBtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T+0djCW7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E04606A31A;
	Mon, 23 Nov 2026 13:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T+0djCW7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB0CE1F000D2;
	Mon, 23 Nov 2026 13:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795440247;
	bh=mvYDAmTPND065bEyMUQdFya2DyZKAiR6PvyK6Q17Cwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T+0djCW7dr/ynsSXYMgJn6R5Dl91QlBCh+TcSiMGPYIbXagqvOYKjIC/LqIKJIgVh
	 2tsRenK8/vfzdGWeHGahRSnb451bLxXc9xXAo/gLuPnnRa/xnoe1EoX54fGV4iXZ9E
	 kz4VgkOo4cTPP04Vwc32qERrb8x/HKIXnjuN5XHbbIWblFOwTjAqTE07P8bzqrt3YF
	 EJbq3R8OFhttE2WXN2QcIjmpa2X6erPzeJjtQuIBQW4LY+zme38htbGcGefYQjZedX
	 UJxBxBd8Mqr6E+S1TX5FgF5sgRMmr84L1JYc4NtQDI1n2RysHzx/G6B+BuWJLQjfDC
	 1t2Dma2vfEGkQ==
Date: Mon, 23 Nov 2026 21:03:41 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/8] net: stmmac: Add glue layer for Synaptics SL2610 SoC
Message-ID: <awQ5raWYlMBpCqIl@xhacker>
References: <20261116135442.4827-1-jszhang@kernel.org>
 <20261116135442.4827-5-jszhang@kernel.org>
 <4f1c4180-3a00-4b17-a27b-e61b307d3e5f@bootlin.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4f1c4180-3a00-4b17-a27b-e61b307d3e5f@bootlin.com>

On Mon, Nov 23, 2026 at 12:57:06PM +0100, Maxime Chevallier wrote:
> Hi,
> 
> On 11/16/26 14:54, Jisheng Zhang wrote:
> > Add dwmac glue driver to support the DesignWare-based GMAC controllers
> > in the Synaptics SL2610 SoC.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  MAINTAINERS                                   |   2 +
> >  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
> >  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
> >  .../net/ethernet/stmicro/stmmac/dwmac-syna.c  | 116 ++++++++++++++++++
> >  4 files changed, 130 insertions(+)
> >  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-syna.c
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 430758242906..dba0288bf4da 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3808,12 +3808,14 @@ M:	Jisheng Zhang <jszhang@kernel.org>
> >  M:	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> >  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> >  S:	Maintained
> > +F:	Documentation/devicetree/bindings/net/syna,sl2610-dwmac.yaml
> >  F:	Documentation/devicetree/bindings/soc/synaptics/
> >  F:	arch/arm/boot/dts/synaptics/
> >  F:	arch/arm/mach-berlin/
> >  F:	arch/arm64/boot/dts/synaptics/
> >  F:	drivers/clk/berlin/*sl2610*
> >  F:	drivers/clk/berlin/sl-*
> > +F:	drivers/net/ethernet/stmicro/stmmac/dwmac-syna.c
> >  F:	drivers/pinctrl/berlin/pinctrl-sl2610.c
> >  F:	drivers/reset/reset-sl2610.c
> >  F:	drivers/soc/synaptics/
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > index c6559e749c0c..79ffebcaba0e 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > @@ -310,6 +310,17 @@ config DWMAC_SUN55I
> >  	  stmmac device driver. This driver is used for A523/T527
> >  	  GMAC200 ethernet controller.
> >  
> > +config DWMAC_SYNA
> > +	tristate "Synaptics SL2610 DWMAC support"
> > +	depends on OF && HAS_DMA && (ARCH_BERLIN || COMPILE_TEST)
> > +	select MFD_SYSCON
> > +	help
> > +	  Support for the Synaptics SL2610 DesignWare Ethernet MAC glue.
> > +	  This configures the PHY interface through the system controller.
> > +
> > +	  To compile this driver as a module, choose M here. The module
> > +	  will be called dwmac-syna.
> > +
> >  config DWMAC_THEAD
> >  	tristate "T-HEAD dwmac support"
> >  	depends on OF && (ARCH_THEAD || COMPILE_TEST)
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> > index b16a456b730e..d132353e9403 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> > +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> > @@ -35,6 +35,7 @@ obj-$(CONFIG_DWMAC_STM32)	+= dwmac-stm32.o
> >  obj-$(CONFIG_DWMAC_SUNXI)	+= dwmac-sunxi.o
> >  obj-$(CONFIG_DWMAC_SUN8I)	+= dwmac-sun8i.o
> >  obj-$(CONFIG_DWMAC_SUN55I)	+= dwmac-sun55i.o
> > +obj-$(CONFIG_DWMAC_SYNA)	+= dwmac-syna.o
> >  obj-$(CONFIG_DWMAC_THEAD)	+= dwmac-thead.o
> >  obj-$(CONFIG_DWMAC_ULTRARISC)	+= dwmac-ultrarisc.o
> >  obj-$(CONFIG_DWMAC_DWC_QOS_ETH)	+= dwmac-dwc-qos-eth.o
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-syna.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-syna.c
> > new file mode 100644
> > index 000000000000..c4bc895b29da
> > --- /dev/null
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-syna.c
> > @@ -0,0 +1,116 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Synaptics DWMAC platform driver
> > + *
> > + * Copyright (C) 2026 Jisheng Zhang <jszhang@kernel.org>
> > + *
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/module.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_net.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +
> > +#include "stmmac_platform.h"
> > +
> > +#define CTL_PHY_INTF_SEL	GENMASK(4, 1)
> > +#define CTL_PHY_INTF_RGMII	FIELD_PREP(CTL_PHY_INTF_SEL, 1)
> > +#define CTL_PHY_INTF_RMII	FIELD_PREP(CTL_PHY_INTF_SEL, 4)
> 
> Please use PHY_INTF_SEL_RGMII and PHY_INTF_SEL_RMII from "common.h"

I read this as "use SYNA_PHY_INTF_SEL_RGMII and SYNA_PHY_INTF_SEL_RMII",
correct me if there's misunderstanding.

> 
> > +
> > +struct syna_dwmac {
> > +	struct plat_stmmacenet_data *plat;
> > +	struct regmap *regmap;
> > +	u32 rgmii_ctl;
> > +	struct device *dev;
> > +};
> > +
> > +static int syna_dwmac_set_phy_if(struct plat_stmmacenet_data *plat)
> > +{
> > +	struct syna_dwmac *dwmac = plat->bsp_priv;
> > +	u32 phyif;
> > +
> > +	switch (plat->phy_interface) {
> > +	case PHY_INTERFACE_MODE_RMII:
> > +		phyif = CTL_PHY_INTF_RMII;
> > +		break;
> > +	case PHY_INTERFACE_MODE_RGMII:
> > +	case PHY_INTERFACE_MODE_RGMII_ID:
> > +	case PHY_INTERFACE_MODE_RGMII_TXID:
> > +	case PHY_INTERFACE_MODE_RGMII_RXID:
> > +		phyif = CTL_PHY_INTF_RGMII;
> > +		break;
> > +	default:
> > +		dev_err(dwmac->dev, "unsupported phy interface %s\n",
> > +			phy_modes(plat->phy_interface));
> > +		return -EINVAL;
> > +	}
> > +
> > +	return regmap_update_bits(dwmac->regmap, dwmac->rgmii_ctl, CTL_PHY_INTF_SEL, phyif);
> > +}
> > +
> > +static int syna_dwmac_init(struct device *dev, void *priv)
> > +{
> > +	struct syna_dwmac *dwmac = priv;
> > +
> > +	return syna_dwmac_set_phy_if(dwmac->plat);
> > +}
> 
> Can you implement .set_phy_intf_sel() instead ? that should simplify that quite a lot.
> 

Good idea. Thanks for the suggestion
