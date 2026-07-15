Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC0044839E;
	Wed, 15 Jul 2026 15:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784127688; cv=none; b=oEiDLVpMmk1v1XSah1dKlD2l/DbDYTn+se5aovFZUP4aLWpGsFxUmwXpUizYpPY04lBEvlORfLi8YdtTSzGMssfRj5qaV0w0NoUZWFzxKxPTuS7bczJqAXr5a78Frhluer/6NtmjaY7cWk93ymn3/xusiVKQLlqkhXv1vbvT8X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784127688; c=relaxed/simple;
	bh=9B8mJW78aKeY26YNWzJNj0aTbMWSb6IGklsxm96nXnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c86u7b4CehoRLZjLbizVbkLu5qfNIwHIV9CLFoD6wo4AToXPRzcidVaWqu8d+kkY6mo7sC2Jut9PMiHrVA/P5UfsWRU8ee08wG27ZSD8cBu4Ud8/1GZXuq8csnSBd0/hrfNi7IhgdsZ6SMRzJUBea/sSbxgZ4bxJtiQcLHF3L2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 9A94B201CD0;
	Wed, 15 Jul 2026 17:01:11 +0200 (CEST)
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1wk16l-001xBS-1i;
	Wed, 15 Jul 2026 17:01:11 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1wk16l-0000000BlOO-1dv7;
	Wed, 15 Jul 2026 17:01:11 +0200
Date: Wed, 15 Jul 2026 17:01:11 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Wei Xu <xuwei5@hisilicon.com>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, devicetree@vger.kernel.org, Tom Rini <trini@konsulko.com>, 
	imx@lists.linux.dev, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, Peter Robinson <pbrobinson@gmail.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/7] Import optee node from u-boot device trees
Message-ID: <f225zh7v6z2a2lwbtk3lhw3mcsttneba364de5vjl4pcj5gr65@ckuo6hyj46vx>
References: <20260715-mathieu-uboot-dts-import-v2-0-bc931417bd0e@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-mathieu-uboot-dts-import-v2-0-bc931417bd0e@bootlin.com>

Hi Mathieu,

On 26-07-15, Mathieu Dubois-Briand wrote:
> In a recent discussion on the U-Boot mailing list [1], it was found out
> that several platforms were adding the OP-TEE device tree-node thanks to
> some U-Boot specific dtsi. This was deemed as a bad solution, as this
> should instead be added in the DTS files hosted in Linux sources,
> particularly for platforms already using the "upstream" (Linux) device
> tree.
> 
> Most i.MX8 and i.MX9 platforms are already using OF_UPSTREAM
> configuration in U-Boot. Some are not, but are fairly new, so we can
> expect them to use the Linux device tree once their support is a bit
> more stable. So they will benefit from these changes once upstream
> device trees are refreshed in U-Boot.
> 
> STM32MP157 platforms are using OF_UPSTREAM, with similar consequences.
> 
> The two other platforms are using an U-Boot specific device tree, yet
> adding these nodes on the kernel side will help to reduce the
> differences.
> 
> The zynqmp platform was ignored, as a similar change was previously
> reverted [2]. I also ignored a few platforms without direct match
> between U-Boot and Linux dts files.

We do the same in barebox bootloader for all OP-TEE supported i.MX
platforms. Therefore this change would cause a regression for barebox as
well.

Furthermore, this change would cause an anyoing dmesg warning on
platforms which don't use OP-TEE at all, because it's not ensured that
the OP-TEE firmware was actually loaded.

Therefore the bootloader adds the OP-TEE nodes only if the OP-TEE binary
was actually loaded.

Therefore I vote for dynamic adding the nodes and not this static
approach.

Furthermore OP-TEE can provide a DTB overlay fragment with all the
required nodes, which you only need to apply within the bootloader. This
is cleanest way. You only need to provide OP-TEE the DTB location during
runtime.

Regards,
  Marco

> Also add the OP-TEE node on the imx93 FRDM platform device tree: while
> this is not part of U-Boot code today, it is the change that triggered
> the U-Boot discussion.
> 
> [1]: https://lore.kernel.org/all/20260706145906.GW749385@bill-the-cat/
> [2]: https://lore.kernel.org/all/20251125-revert-zynqmp-optee-v1-1-d2ce4c0fcaf6@vaisala.com/
> 
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> ---
> Changes in v2:
> - Splitting i.MX8 SoC changes in a separate commit.
> - Adding bootph-pre-ram on stm32mp157c-ed1 reserved memory.
> - Rebased on v7.2-rc3.
> - Link to v1: https://lore.kernel.org/r/20260710-mathieu-uboot-dts-import-v1-0-ffe0210e50c9@bootlin.com
> 
> ---
> Mathieu Dubois-Briand (7):
>       arm64: dts: freescale: Import optee node from u-boot i.MX91 and i.MX93 device trees
>       arm64: dts: freescale: Import optee node from u-boot i.MX8 device trees
>       arm: dts: st: Import optee node from u-boot device trees
>       arm: dts: st: stm32mp157c-ed1: Add bootph-pre-ram tag on optee reserved memory
>       arm64: dts: hisilicon: hi3798cv200-poplar: Import optee node from u-boot device tree
>       arm64: dts: nuvoton: npcm845-evb: Import optee node from u-boot device tree
>       arm64: dts: freescale: imx93-frdm: Add OP-TEE device tree node
> 
>  arch/arm/boot/dts/st/stm32mp157a-dk1.dts                | 17 +++++++++++++++++
>  arch/arm/boot/dts/st/stm32mp157c-ed1.dts                | 14 ++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi               |  7 +++++++
>  arch/arm64/boot/dts/freescale/imx8mn.dtsi               |  7 +++++++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi               |  7 +++++++
>  arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts       |  7 +++++++
>  arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts      |  7 +++++++
>  arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts  |  7 +++++++
>  arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts       |  7 +++++++
>  arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts      |  7 +++++++
>  arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts         |  7 +++++++
>  .../arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts |  7 +++++++
>  arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts  |  7 +++++++
>  .../arm64/boot/dts/freescale/imx93-var-som-symphony.dts |  7 +++++++
>  arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts    |  7 +++++++
>  arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts     |  7 +++++++
>  16 files changed, 129 insertions(+)
> ---
> base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
> change-id: 20260710-mathieu-uboot-dts-import-69f51bc097d7
> 
> Best regards,
> -- 
> Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> 
> 
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
