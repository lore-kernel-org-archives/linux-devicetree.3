Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792961;
	b=mEroOgrwEdIKhLlIc8V3H38w6aGzErIdmb/jyH7lk1DmPI/ntzWQP2kriHWQf7Pb4FNZ
	 MqDnf5YS/Eph42sYZ1xpTyeArlW8hb685daYqT6QaSzPOGaG2vYm4SHKRnLONFUT+1CeG
	 8tqsWCHN/xowqJsf/IYMq8jVQ/JLtX96jV+e7LMIOZ8qa8iZfXH1mPBtIv96qFLaYrcAr
	 jX7Jy+3ButwOUK6W21unaUtunAsByxwyfD16i0FCTViLTCEG1HOoOVCouUpHfbjeJ/arH
	 tzgFfT+f/uPRs8Mu/vurlxubvBJw0/KscWywfcoOZW11EaEyLQ5Zvh7izN9aQ64Ei8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792961;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Q4dVyA5jVsFxpaf/m2uJ94bDxkS8jUdcj0Roq+GgR9s=;
	b=4/DOHvzXpV7/jPrz46acdL+7aN1s6oZtCh2eXa9uoB8Yn8BRVBCkvUYYM5MEVVTLYcJs
	 Qo0//RG5ANPlNsMRwi3ZkyaGwIu2dgLuOHuHKwbACxV9gdNULz3k5Bq7hVmX1z218BP+d
	 qO4o9/CFSNsk1FqzJgKUpiffkENNKrXnGGktDUf4WPphSbUmUij3nUoOjYvIS405Kn58y
	 PtEjMuUcE2XkblnjeyoIAlrI9R2cd+F4IoI4+DrFSirs9IM4eVljQz0zpLDOMceWSuYqK
	 Vn/zxr96VowddU76UpfivwGPXfCb3cxYeWjIeB1y3XPobtS0SzhH5ksBq7d6JIeot0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LsyK15+z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1A4606A31F;
	Fri, 27 Nov 2026 15:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LsyK15+z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B95F31F00893;
	Fri, 27 Nov 2026 15:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795792960;
	bh=Q4dVyA5jVsFxpaf/m2uJ94bDxkS8jUdcj0Roq+GgR9s=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=LsyK15+zonOeS9qdTFwuZpB9ZJtIK5b9c3ff4/Ch+R45ndu3MfNPIfXDdPpedY+0p
	 ieIp9Bm47gt7hhTZBKBxkPxfl7WMEFU0cFgG79tbuZOQweLaJ85cnRXgOVuC54QJx2
	 r/27TGEAZJaRysOSGGRpX0+XsptrLeNAL8ZKolZkGwL7th4uR8w/scoszvXKaolTJo
	 D0BK/2Tke2jHHHb8P5jxbwduWmbjtIFQS4jl1tqLMZMux3uPf/2e7L0cMM7MKD2hkh
	 5VUPV1qeee3bebY/s4qU7H2gIsjpTVBbo/+EdM1gIwYmv8bc+vT3PWDkJWC48DRAuh
	 BTHywwVjy4lJg==
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 2/2] phy: cix: Add CIX Sky1 USB3 PHY driver
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hongliang Yang <hongliang.yang@cixtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Gary Yang <Gary.Yang@cixtech.com>, Fugang Duan <fugang.duan@cixtech.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 cix-kernel-upstream@cixtech.com
In-Reply-To: <20261117022858.2210212-3-hongliang.yang@cixtech.com>
References: <20261117022858.2210212-1-hongliang.yang@cixtech.com>
 <20261117022858.2210212-3-hongliang.yang@cixtech.com>
Date: Fri, 27 Nov 2026 20:52:30 +0530
Message-Id: <179579295051.13164.2928946553647011501.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13651; i=mani@kernel.org;
 h=from:subject:message-id; bh=ztc1BZKiqbmnzHYCZIt02Sue+56DcZbYNwDm2xpMGpU=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCaA6uLEiqwmKmkkbfPcOqfLhgrCNqG2DLt0Q+
 CUorNx2D8KJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawmgOgAKCRBVnxHm/pHO
 9SfRB/4yH6adoeQdH2db6iqUG2mMx2+zB2D2BirRUaF9JJ/s6z76SkxarS81qiayGoza6LnUIsC
 8fKbcRQX4MzJl/iChrBhZWmnmWORT81BQC+sFDD4pybO/YTeSRhhZ5OXEIKnJMlCtGpThXp9CQi
 40jZoM3s19Uw+G9j1cjajBANLYHL4dNNWYT1+6xUIbYm1T7GUpr1zk3DWLjUsf4aCTNoo+/yaFc
 STYcwIKkcTworMQ8cp64hwX/I1KytsrPo5UCbqZq2E8aoV5aaLEVYAEW9MQMKcLsI76eEGeBwRF
 ka3VGDFJyWQjDlKWlxcqtsqu5uOJ3E5NCcHGZo31KGs9Pe0O
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-17 10:28 +0800, Hongliang Yang wrote:
> Add a driver for the Cadence SD0803 USB3 PHY integrated in the CIX
> Sky1 SoC. The driver enables the APB and reference clocks, releases the
> resets, programs the register sequence of the PHY, and exports a single
> PHY instance for the two lanes of the block. The PHY core reference
> counts phy_init() and phy_exit(), so the sequence is programmed once and
> the block stays powered while any of its consumers is active.
> 
> Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
> ---
> Changes in v8:
> - Rely on the PHY core for serialization and reference counting instead
>   of a driver-local mutex and counter, and call the Sky1 init and exit
>   functions directly from the PHY operations: the per-SoC callback
>   structure and its duplicate error messages are gone.
> - Drop the register macros that the initialization sequence does not use
>   from the private header.
> 
> Changes in v7:
> - Rename the register header to phy-cix-usb3.h: it is the register map
>   of the USB3 PHY, and the old usbdp name suggested a USB/DP combo PHY.
> - Fix the module description and the Kconfig help text.
> 
> Changes in v6:
> - Select REGMAP in the Kconfig.
> - Use dev_err_probe() for the reset, clock and regmap acquisition
>   failures in the probe path.
> - Assert the resets before registering the PHY provider, disable the
>   clocks in LIFO order, and fix the error unroll path so that clocks
>   which were never enabled are not disabled.
> ---
>  MAINTAINERS                    |   1 +
>  drivers/phy/Kconfig            |   1 +
>  drivers/phy/Makefile           |   1 +
>  drivers/phy/cix/Kconfig        |  21 +++
>  drivers/phy/cix/Makefile       |   6 +
>  drivers/phy/cix/phy-cix-usb3.c | 313 +++++++++++++++++++++++++++++++++
>  drivers/phy/cix/phy-cix-usb3.h | 180 +++++++++++++++++++
>  7 files changed, 523 insertions(+)
>  create mode 100644 drivers/phy/cix/Kconfig
>  create mode 100644 drivers/phy/cix/Makefile
>  create mode 100644 drivers/phy/cix/phy-cix-usb3.c
>  create mode 100644 drivers/phy/cix/phy-cix-usb3.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 73783abe027e..b857e529e5e2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2906,6 +2906,7 @@ F:	Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
>  F:	Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml
>  F:	arch/arm64/boot/dts/cix/
>  F:	drivers/mailbox/cix-mailbox.c
> +F:	drivers/phy/cix/
>  K:	\bcix\b
>  
>  ARM/CLKDEV SUPPORT
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 105fbe408aa2..876e5857634c 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -176,6 +176,7 @@ source "drivers/phy/axiado/Kconfig"
>  source "drivers/phy/broadcom/Kconfig"
>  source "drivers/phy/cadence/Kconfig"
>  source "drivers/phy/canaan/Kconfig"
> +source "drivers/phy/cix/Kconfig"
>  source "drivers/phy/eswin/Kconfig"
>  source "drivers/phy/freescale/Kconfig"
>  source "drivers/phy/hisilicon/Kconfig"
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index c6dd02003bbe..5a31c5df1746 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_GENERIC_PHY)		+= allwinner/	\
>  					   broadcom/	\
>  					   cadence/	\
>  					   canaan/	\
> +					   cix/		\
>  					   eswin/	\
>  					   freescale/	\
>  					   hisilicon/	\
> diff --git a/drivers/phy/cix/Kconfig b/drivers/phy/cix/Kconfig
> new file mode 100644
> index 000000000000..24452144ff78
> --- /dev/null
> +++ b/drivers/phy/cix/Kconfig
> @@ -0,0 +1,21 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# PHY drivers for CIX PHYs
> +#
> +
> +if ARCH_CIX || COMPILE_TEST
> +
> +config PHY_CIX_USB3
> +	tristate "CIX Sky1 USB3 Type-A PHY support"
> +	depends on OF && HAS_IOMEM
> +	select GENERIC_PHY
> +	select REGMAP
> +	help
> +	  Enable this to support the USB3 SuperSpeed PHY of the Type-A
> +	  ports on CIX Sky1 SoCs. The PHY provides the SuperSpeed lanes
> +	  used by the two Cadence USBSSP controllers (USB4 and USB5) of
> +	  the SoC, and is shared between them.
> +
> +	  If unsure, say N.
> +
> +endif # ARCH_CIX || COMPILE_TEST
> diff --git a/drivers/phy/cix/Makefile b/drivers/phy/cix/Makefile
> new file mode 100644
> index 000000000000..58ec925a4425
> --- /dev/null
> +++ b/drivers/phy/cix/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for the CIX PHY drivers.
> +#
> +
> +obj-$(CONFIG_PHY_CIX_USB3)	+= phy-cix-usb3.o
> diff --git a/drivers/phy/cix/phy-cix-usb3.c b/drivers/phy/cix/phy-cix-usb3.c
> new file mode 100644
> index 000000000000..ca6a0e764e90
> --- /dev/null
> +++ b/drivers/phy/cix/phy-cix-usb3.c
> @@ -0,0 +1,313 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * phy driver for cdn_sd0803_t7g_typea

What is cdn_sd0803_t7g_typea?

> + *
> + * Author: Hongliang Yang <hongliang.yang@cixtech.com>
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include "phy-cix-usb3.h"
> +
> +/*
> + * Cadence SD0803 Type-A USB3 PHY initialization sequence for the CIX
> + * Sky1 SoC, taken from the vendor-provided PHY register programming
> + * sequence for this SoC.
> + */
> +static const struct reg_sequence sky1_u3phy_conf[] = {
> +	{CMN_SSM_BIAS_TMR,                  0x0018},
> +	{CMN_PLLSM0_PLLPRE_TMR,             0x0030},
> +	{CMN_PLLSM0_PLLLOCK_TMR,            0x00f0},
> +	{CMN_PLLSM1_PLLPRE_TMR,             0x0030},
> +	{CMN_PLLSM1_PLLLOCK_TMR,            0x00f0},
> +	{CMN_BGCAL_INIT_TMR,                0x0078},
> +	{CMN_BGCAL_ITER_TMR,                0x0078},
> +	{CMN_IBCAL_INIT_TMR,                0x0018},
> +	{CMN_TXPUCAL_INIT_TMR,              0x001d},
> +	{CMN_TXPDCAL_INIT_TMR,              0x001d},
> +	{CMN_RXCAL_INIT_TMR,                0x02d0},
> +	{CMN_SD_CAL_PLLCNT_START,           0x0137},
> +	{RX_SDCAL0_INIT_TMR_LANE0,          0x0018},
> +	{RX_SDCAL0_INIT_TMR_LANE1,          0x0018},
> +	{RX_SDCAL0_ITER_TMR_LANE0,          0x0078},
> +	{RX_SDCAL0_ITER_TMR_LANE1,          0x0078},
> +	{RX_SDCAL1_INIT_TMR_LANE0,          0x0018},
> +	{RX_SDCAL1_INIT_TMR_LANE1,          0x0018},
> +	{RX_SDCAL1_ITER_TMR_LANE0,          0x0078},
> +	{RX_SDCAL1_ITER_TMR_LANE1,          0x0078},
> +	{TX_RCVDET_ST_TMR_LANE0,            0x0960},
> +	{TX_RCVDET_ST_TMR_LANE1,            0x0960},
> +
> +	{PHY_PLL_CFG_0803,                  0x0000},
> +	{CMN_PDIAG_PLL0_CLK_SEL_M0,         0x8600},
> +	{XCVR_DIAG_HSCLK_SEL_LANE0,         0x0000},
> +	{XCVR_DIAG_HSCLK_SEL_LANE1,         0x0000},
> +	{XCVR_DIAG_HSCLK_DIV_LANE0,         0x0001},
> +	{XCVR_DIAG_HSCLK_DIV_LANE1,         0x0001},
> +	{XCVR_DIAG_PLLDRC_CTRL_LANE0,       0x0041},
> +	{XCVR_DIAG_PLLDRC_CTRL_LANE1,       0x0041},
> +	{CMN_PLL0_DSM_DIAG_M0,              0x0004},
> +	{CMN_PLL1_DSM_DIAG_M0,              0x0004},
> +	{CMN_PDIAG_PLL1_ITRIM_M0,           0x003f},
> +	{CMN_PDIAG_PLL0_CP_PADJ_M0,         0x0b17},
> +	{CMN_PDIAG_PLL1_CP_PADJ_M0,         0x0b17},
> +	{CMN_PDIAG_PLL0_CP_IADJ_M0,         0x0e01},
> +	{CMN_PDIAG_PLL1_CP_IADJ_M0,         0x0e01},
> +	{CMN_PDIAG_PLL0_FILT_PADJ_M0,       0x0d05},
> +	{CMN_PDIAG_PLL1_FILT_PADJ_M0,       0x0d05},
> +	{CMN_PLL0_INTDIV_M0,                0x01a0},
> +	{CMN_PLL1_INTDIV_M0,                0x01a0},
> +	{CMN_PLL0_FRACDIVL_M0,              0xaaab},
> +	{CMN_PLL1_FRACDIVL_M0,              0xaaab},
> +	{CMN_PLL0_FRACDIVH_M0,              0x0002},
> +	{CMN_PLL1_FRACDIVH_M0,              0x0002},
> +	{CMN_PLL0_HIGH_THR_M0,              0x0116},
> +	{CMN_PLL1_HIGH_THR_M0,              0x0116},
> +	{CMN_PDIAG_PLL0_CTRL_M0,            0x1002},
> +	{CMN_PDIAG_PLL1_CTRL_M0,            0x1002},
> +	{CMN_PLL0_SS_CTRL1_M0,		    0x0001}, /* SSC enabled */
> +	{CMN_PLL0_VCOCAL_INIT_TMR,          0x00f0},
> +	{CMN_PLL1_VCOCAL_INIT_TMR,          0x00f0},
> +	{CMN_PLL0_VCOCAL_ITER_TMR,          0x0004},
> +	{CMN_PLL1_VCOCAL_ITER_TMR,          0x0004},
> +	{CMN_PLL0_VCOCAL_REFTIM_START,      0x02f8},
> +	{CMN_PLL1_VCOCAL_REFTIM_START,      0x02f8},
> +	{CMN_PLL0_VCOCAL_PLLCNT_START,      0x02f8},
> +	{CMN_PLL1_VCOCAL_PLLCNT_START,      0x02f8},
> +	{CMN_PLL0_VCOCAL_TCTRL,             0x0003},
> +	{CMN_PLL1_VCOCAL_TCTRL,             0x0003},
> +	{CMN_PLL0_LOCK_REFCNT_START,        0x00bf},
> +	{CMN_PLL1_LOCK_REFCNT_START,        0x00bf},
> +	{CMN_PLL0_LOCK_PLLCNT_START,        0x00bf},
> +	{CMN_PLL1_LOCK_PLLCNT_START,        0x00bf},
> +	{CMN_PLL0_LOCK_PLLCNT_THR,          0x0003},
> +	{CMN_PLL1_LOCK_PLLCNT_THR,          0x0003},
> +	{PHY_PIPE_USB3_GEN2_PRE_CFG0_0803,  0x0a0a},
> +	{PHY_PIPE_USB3_GEN2_POST_CFG0_0803, 0x1000},
> +	{PHY_PIPE_USB3_GEN2_POST_CFG1_0803, 0x0010},
> +	{CMN_CDIAG_CDB_PWRI_OVRD,           0x8200},
> +	{CMN_CDIAG_XCVRC_PWRI_OVRD,         0x8200},
> +	{TX_PSC_A0_LANE0,                   0x02ff},
> +	{TX_PSC_A0_LANE1,                   0x02ff},
> +	{TX_PSC_A1_LANE0,                   0x06af},
> +	{TX_PSC_A1_LANE1,                   0x06af},
> +	{TX_PSC_A2_LANE0,                   0x06ae},
> +	{TX_PSC_A2_LANE1,                   0x06ae},
> +	{TX_PSC_A3_LANE0,                   0x06ae},
> +	{TX_PSC_A3_LANE1,                   0x06ae},
> +	{RX_PSC_A0_LANE0,                   0x0d1d},
> +	{RX_PSC_A0_LANE1,                   0x0d1d},
> +	{RX_PSC_A1_LANE0,                   0x0d1d},
> +	{RX_PSC_A1_LANE1,                   0x0d1d},
> +	{RX_PSC_A2_LANE0,                   0x0d00},
> +	{RX_PSC_A2_LANE1,                   0x0d00},
> +	{RX_PSC_A3_LANE0,                   0x0500},
> +	{RX_PSC_A3_LANE1,                   0x0500},
> +	{TX_TXCC_CTRL_LANE0,                0x2a82},
> +	{TX_TXCC_CTRL_LANE1,                0x2a82},
> +	{TX_TXCC_CPOST_MULT_01_LANE0,       0x0014},
> +	{TX_TXCC_CPOST_MULT_01_LANE1,       0x0014},
> +	{TX_TXCC_MGNFS_MULT_000_LANE0,      0x0002},
> +	{TX_TXCC_MGNFS_MULT_000_LANE1,      0x0002},
> +	{RX_SIGDET_HL_FILT_TMR_LANE0,       0x0013},
> +	{RX_SIGDET_HL_FILT_TMR_LANE1,       0x0013},
> +	{RX_REE_GCSM1_CTRL_LANE0,           0x0000},
> +	{RX_REE_GCSM1_CTRL_LANE1,           0x0000},
> +	{RX_REE_ATTEN_THR_LANE0,            0x0c02},
> +	{RX_REE_ATTEN_THR_LANE1,            0x0c02},
> +	{RX_REE_SMGM_CTRL1_LANE0,           0x0330},
> +	{RX_REE_SMGM_CTRL1_LANE1,           0x0330},
> +	{RX_REE_SMGM_CTRL2_LANE0,           0x0300},
> +	{RX_REE_SMGM_CTRL2_LANE1,           0x0300},
> +	{XCVR_DIAG_PSC_OVRD_LANE0,          0x0003},
> +	{XCVR_DIAG_PSC_OVRD_LANE1,          0x0003},
> +	{RX_DIAG_SIGDET_TUNE_LANE0,         0x1004},
> +	{RX_DIAG_SIGDET_TUNE_LANE1,         0x1004},
> +	{RX_DIAG_NQST_CTRL_LANE0,           0x00f9},
> +	{RX_DIAG_NQST_CTRL_LANE1,           0x00f9},
> +	{RX_DIAG_DFE_AMP_TUNE_2_LANE0,      0x0c01},
> +	{RX_DIAG_DFE_AMP_TUNE_2_LANE1,      0x0c01},
> +	{RX_DIAG_DFE_AMP_TUNE_3_LANE0,      0x0002},
> +	{RX_DIAG_DFE_AMP_TUNE_3_LANE1,      0x0002},
> +	{RX_DIAG_PI_CAP_LANE0,              0x0000},
> +	{RX_DIAG_PI_CAP_LANE1,              0x0000},
> +	{RX_DIAG_PI_RATE_LANE0,             0x0031},
> +	{RX_DIAG_PI_RATE_LANE1,             0x0031},
> +	{RX_CDRLF_CNFG_LANE0,               0x018c},
> +	{RX_CDRLF_CNFG_LANE1,               0x018c},
> +	{RX_CDRLF_CNFG3_LANE0,              0x0003},
> +	{RX_CDRLF_CNFG3_LANE1,              0x0003}
> +};
> +
> +struct cix_u3phy {
> +	struct device *dev;
> +	void __iomem *base;
> +	struct regmap *phy_regmap;
> +	struct reset_control *preset;
> +	struct reset_control *reset;
> +	struct clk *apb_clk;
> +	struct clk *ref_clk;

The driver always handles these clocks at the same time. So switch to bulk APIs
for simplicity.

Nit: Use devm_clk_bulk_get_all().

> +};
> +
> +static int cix_u3phy_exit(struct phy *phy)
> +{
> +	struct cix_u3phy *u3phy = phy_get_drvdata(phy);
> +
> +	reset_control_assert(u3phy->reset);
> +	reset_control_assert(u3phy->preset);
> +	clk_disable_unprepare(u3phy->ref_clk);
> +	clk_disable_unprepare(u3phy->apb_clk);
> +	return 0;
> +}
> +
> +static int cix_u3phy_init(struct phy *phy)
> +{
> +	struct cix_u3phy *u3phy = phy_get_drvdata(phy);
> +	int ret;
> +
> +	/* usb rcsu reset is default deassert */
> +	reset_control_assert(u3phy->reset);
> +	reset_control_assert(u3phy->preset);
> +
> +	ret = clk_prepare_enable(u3phy->apb_clk);
> +	if (ret) {
> +		dev_err(u3phy->dev, "failed to enable the APB clock\n");
> +		return ret;
> +	}
> +	ret = clk_prepare_enable(u3phy->ref_clk);
> +	if (ret) {
> +		dev_err(u3phy->dev, "failed to enable the reference clock\n");
> +		goto disable_apb_clk;
> +	}
> +	reset_control_deassert(u3phy->preset);
> +	ret = regmap_multi_reg_write(u3phy->phy_regmap, sky1_u3phy_conf,
> +				     ARRAY_SIZE(sky1_u3phy_conf));
> +	if (ret) {
> +		dev_err(u3phy->dev, "failed to write the PHY register sequence\n");
> +		goto assert_reset_preset;
> +	}
> +	reset_control_deassert(u3phy->reset);

Newline before 'return' statement here and everywhere.

> +	return 0;
> +
> +assert_reset_preset:
> +	reset_control_assert(u3phy->preset);
> +	reset_control_assert(u3phy->reset);
> +	clk_disable_unprepare(u3phy->ref_clk);
> +disable_apb_clk:
> +	clk_disable_unprepare(u3phy->apb_clk);
> +	return ret;
> +}
> +

[...]

> +#define PHY_PLL_CFG_0803              0xC00E

Use lower case for hex please.

- Mani


