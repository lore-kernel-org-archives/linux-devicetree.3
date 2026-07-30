Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF3A35B636
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785430569; cv=none; b=tFAXUcJL9TdPe/52T/EWxRtBpZNweoa3hounGlXbLctT/yZ8Rf6BWryc7f0apPR0KFuTIce5PV14vSuOPXJiEJyrluHPZPlz9TazJ2B0ZekGvj4TvzZPYd0TUCnUfkm7u8nY8A7TSh+aykukeBTKZkUh2Anvxk1AyeRmSPI0If0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785430569; c=relaxed/simple;
	bh=lBsIPDLrdsF3Or/wVIWuWO//I4DAINk0keRQLfjBcVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwyodqcd4Denj5/1hky5/RdGPACd0lBFWn/WcN7fsBVReguxU5dQyhF00tC5WxzD3QhTVuToWf1yWUCH0som/5d2SCcCKs/Vm49x7yzc4YXsd4603PZI/c1fWwoLPlIG/OwWTi9j+XWIE5LbNOvg2HyGrxCoD+bSG4+e3CdQOJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QFi1Qd25; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sx1AAtxV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QFi1Qd25";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sx1AAtxV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785430566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W0D6aNdXcDuOmXMxLvCN0Nd57j+uSSynSX566kWvt88=;
	b=QFi1Qd25A+PW5MWUhTTVM2qMGz9YrIRYK8mkJ5y/h1ZgQJ9jWqAqzRzLlEhQ6Qapz/qy7V
	ipoOVIaDnzbnj6QANGjbP6uQhIKzvzYiSkg4SZzCloykmigohw659d93AVfmcpAmn8J5S+
	tKtmM4s9upkBXEUKMsWP8ejitftooPw=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-gvvFdl11Ove65bj-yLCxLw-1; Thu, 30 Jul 2026 12:56:03 -0400
X-MC-Unique: gvvFdl11Ove65bj-yLCxLw-1
X-Mimecast-MFC-AGG-ID: gvvFdl11Ove65bj-yLCxLw_1785430563
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-80ee3cb097eso1246207b3.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785430562; x=1786035362; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=W0D6aNdXcDuOmXMxLvCN0Nd57j+uSSynSX566kWvt88=;
        b=sx1AAtxVpp+fg6/EwLlHfH8JRyBNKMoSrBnaOdi5CugsRsJGxbPBw4+v+mQc7tKDC4
         8O8VawPVoYx7BILHl2rriHGoqrBJX7cqDD558/oQAeLXDAezjZqHkBEEy/GMKLtiOkYn
         tnftl4rfQpV9T8KovtzFsqnOkNOxPJn+t9+i8QXXGq1E2ANECQE/9AvUvz/w5pgvYg+k
         3Z5MrKi/t7C4sJ1auyT7Js3S9yeqrH0HxgDZVfevrdYGPgD6XyTBJzWBVCDUJmUbTJA3
         FheBc188eIv6Ma9ufeTa9M14gzvDRQTopX+qzdeZ+JmyAp+CsJiOqEAb1oCkp+PvRHVU
         my7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785430562; x=1786035362;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W0D6aNdXcDuOmXMxLvCN0Nd57j+uSSynSX566kWvt88=;
        b=s7R/+6GQZJMGLDg81UMvLW2UOzjaGE7bp6ZZZ9blpXpwnMxCWQsdht7XviYBQ29lXx
         a21AftjDtlEnOoOsBs6QPo+kzyPDUSgXIu+salTgQKI8tE+jVyLuRCo8+DBiWAXZcvY8
         +yogUrKVvr6Zcj/zXTKIH5pkbmYWn2mD0H03Sjy51e052lxQgRD68c+x03JpPLKQyMZL
         je06RWr5Dc0250CiAVr3k/BiMSsQF3h/ta4boOLUK9BjR2KtDSADLrUeHwclU4rwn7g+
         YGP78RKVSXgWE/dlVOvQNpRW9QDKS1Ft5OyE00xLjFjZftBvSKQkzHuqAg0QXERJ6WrW
         pPdQ==
X-Forwarded-Encrypted: i=1; AHgh+RqyWhUbXx1hBoyVnFeEKZZ4CEaNFml1aFEfqsCHWnm0fJK6WCtUmSr98E17L5xequ4FePbV7BxbHbqA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj1d8iWsyQQS1kUeoQD5lpc0Pvu9hix6qjsQN+N2rywAhD32NQ
	cTuhAGbFFbY7EbCDCNIRImAq5CAPGt8lmpt0hSOplR7vLtfIYS4cGQqds+3X9oM1bRJwdCtku+l
	4Tnkz+ILpPhE3FVJyFim4nLcKpdtpS/+uh5NQp61ejwHWRB8fAVv0/Urcu4+dfbI=
X-Gm-Gg: AR+sD114A/MLEwpLydCI00bPHrKX2PHIOzsW+RN5i9JAZDBk3zyVLufNtTyDhLBMAtJ
	7tdVagbpWpyYj/i/EBHQ3vBXKgxW7WvMZOPjsTaIGnnWw3uLGURP98tVR/LhDynT10MHhyA8LH3
	uZ7kkMTZ4C659x6ILeEDhusG2qBHw63IaWhvAoauFx7+Kxgb5t/pz2oeH+KbdWFRIdm1vq602tO
	k2lpF1sIeTutzT3zD12Z032YYwTcWu6QGKTfwJj5myZtP5iYZ6KC3l7mVY0+GX0ghM2lyV2ZVrh
	bEaL4BqOkd/kY/l23s9TUGmOkWILPhUhbjJnSQuFMuyqSKTyQXJHDMXTlmnWg7DG9m/NupNhrqL
	hAJchdgyyZ1ZkWKihZPMRH8s0K8vNO0m+aXE=
X-Received: by 2002:a05:690c:63c2:b0:81f:a9e8:f7ef with SMTP id 00721157ae682-81fb88c61bamr24950887b3.1.1785430562455;
        Thu, 30 Jul 2026 09:56:02 -0700 (PDT)
X-Received: by 2002:a05:690c:63c2:b0:81f:a9e8:f7ef with SMTP id 00721157ae682-81fb88c61bamr24950527b3.1.1785430561816;
        Thu, 30 Jul 2026 09:56:01 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb88c4a92sm13487757b3.7.2026.07.30.09.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:56:01 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:55:58 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, jyanchou@realtek.com, afaerber@suse.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v11 10/11] clk: realtek: Add RTD1625-ISO clock controller
 driver
Message-ID: <amuCHnDAvLpdN9Sv@redhat.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-11-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728142806.1954638-11-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Yu-Chun,

On Tue, Jul 28, 2026 at 10:28:05PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add support for the ISO (Isolation) domain clock controller on the Realtek
> RTD1625 SoC. This controller manages clocks in the always-on power domain,
> ensuring essential services remain functional even when the main system
> power is gated.
> 
> Because the reset controller shares the same register space with this ISO
> clock controller, this driver also acts as the parent device and registers
> the reset controller as an auxiliary device on the auxiliary bus.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v11:
> - Drop the unused two MACRO.
> - Add 'rtk_' prefix into struct names and function names.
> ---
>  drivers/clk/realtek/Makefile          |   1 +
>  drivers/clk/realtek/clk-rtd1625-iso.c | 145 ++++++++++++++++++++++++++
>  2 files changed, 146 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-rtd1625-iso.c
> 
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 15b9eec74e36..fbf8cb0db2f0 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -9,3 +9,4 @@ clk-rtk-y += clk-regmap-mux.o
>  
>  clk-rtk-$(CONFIG_RTK_CLK_PLL_MMC) += clk-pll-mmc.o
>  obj-$(CONFIG_CLK_RTD1625) += clk-rtd1625-crt.o
> +obj-$(CONFIG_CLK_RTD1625) += clk-rtd1625-iso.o
> diff --git a/drivers/clk/realtek/clk-rtd1625-iso.c b/drivers/clk/realtek/clk-rtd1625-iso.c
> new file mode 100644
> index 000000000000..cd328d3961c5
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtd1625-iso.c
> @@ -0,0 +1,145 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2024-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <dt-bindings/clock/realtek,rtd1625-clk.h>
> +#include <linux/array_size.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include "clk-regmap-gate.h"
> +
> +#define RTD1625_ISO_CLK_MAX	19
> +#define RTD1625_ISO_S_CLK_MAX	5
> +
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_usb_p4, 0, 0x4, 0, 0);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_usb_p3, 0, 0x4, 1, 0);
> +static RTK_CLK_REGMAP_GATE(clk_en_misc_cec0, "clk_en_misc", 0, 0x4, 2, 0);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_cbusrx_sys, 0, 0x4, 3, 0);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_cbustx_sys, 0, 0x4, 4, 0);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_cbus_sys, 0, 0x4, 5, 0);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_cbus_osc, 0, 0x4, 6, 0);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_i2c0, 0, 0x4, 9, 0);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_i2c1, 0, 0x4, 10, 0);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_etn_250m, 0, 0x4, 11, 0);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_etn_sys, 0, 0x4, 12, 0);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_usb_drd, 0, 0x4, 13, 0);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_usb_host, 0, 0x4, 14, 0);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_usb_u3_host, 0, 0x4, 15, 0);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_usb, 0, 0x4, 16, 0);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_vtc, 0, 0x4, 17, 0);
> +static RTK_CLK_REGMAP_GATE(clk_en_misc_vfd, "clk_en_misc", 0, 0x4, 18, 0);
> +
> +static struct rtk_clk_regmap * const rtd1625_clk_regmap_list[] = {
> +	&clk_en_usb_p4.clkr,
> +	&clk_en_usb_p3.clkr,
> +	&clk_en_misc_cec0.clkr,
> +	&clk_en_cbusrx_sys.clkr,
> +	&clk_en_cbustx_sys.clkr,
> +	&clk_en_cbus_sys.clkr,
> +	&clk_en_cbus_osc.clkr,
> +	&clk_en_i2c0.clkr,
> +	&clk_en_i2c1.clkr,
> +	&clk_en_etn_250m.clkr,
> +	&clk_en_etn_sys.clkr,
> +	&clk_en_usb_drd.clkr,
> +	&clk_en_usb_host.clkr,
> +	&clk_en_usb_u3_host.clkr,
> +	&clk_en_usb.clkr,
> +	&clk_en_vtc.clkr,
> +	&clk_en_misc_vfd.clkr,
> +};
> +
> +static struct clk_hw_onecell_data rtd1625_iso_clk_data = {
> +	.num = RTD1625_ISO_CLK_MAX,
> +	.hws = {
> +		[RTD1625_ISO_CLK_EN_USB_P4]      = &__rtk_clk_regmap_gate_hw(&clk_en_usb_p4),
> +		[RTD1625_ISO_CLK_EN_USB_P3]      = &__rtk_clk_regmap_gate_hw(&clk_en_usb_p3),
> +		[RTD1625_ISO_CLK_EN_MISC_CEC0]   = &__rtk_clk_regmap_gate_hw(&clk_en_misc_cec0),
> +		[RTD1625_ISO_CLK_EN_CBUSRX_SYS]  = &__rtk_clk_regmap_gate_hw(&clk_en_cbusrx_sys),
> +		[RTD1625_ISO_CLK_EN_CBUSTX_SYS]  = &__rtk_clk_regmap_gate_hw(&clk_en_cbustx_sys),
> +		[RTD1625_ISO_CLK_EN_CBUS_SYS]    = &__rtk_clk_regmap_gate_hw(&clk_en_cbus_sys),
> +		[RTD1625_ISO_CLK_EN_CBUS_OSC]    = &__rtk_clk_regmap_gate_hw(&clk_en_cbus_osc),
> +		[RTD1625_ISO_CLK_EN_I2C0]        = &__rtk_clk_regmap_gate_hw(&clk_en_i2c0),
> +		[RTD1625_ISO_CLK_EN_I2C1]        = &__rtk_clk_regmap_gate_hw(&clk_en_i2c1),
> +		[RTD1625_ISO_CLK_EN_ETN_250M]    = &__rtk_clk_regmap_gate_hw(&clk_en_etn_250m),
> +		[RTD1625_ISO_CLK_EN_ETN_SYS]     = &__rtk_clk_regmap_gate_hw(&clk_en_etn_sys),
> +		[RTD1625_ISO_CLK_EN_USB_DRD]     = &__rtk_clk_regmap_gate_hw(&clk_en_usb_drd),
> +		[RTD1625_ISO_CLK_EN_USB_HOST]    = &__rtk_clk_regmap_gate_hw(&clk_en_usb_host),
> +		[RTD1625_ISO_CLK_EN_USB_U3_HOST] = &__rtk_clk_regmap_gate_hw(&clk_en_usb_u3_host),
> +		[RTD1625_ISO_CLK_EN_USB]         = &__rtk_clk_regmap_gate_hw(&clk_en_usb),
> +		[RTD1625_ISO_CLK_EN_VTC]         = &__rtk_clk_regmap_gate_hw(&clk_en_vtc),
> +		[RTD1625_ISO_CLK_EN_MISC_VFD]    = &__rtk_clk_regmap_gate_hw(&clk_en_misc_vfd),
> +	},
> +};
> +
> +static const struct rtk_clk_desc rtd1625_iso_desc = {
> +	.clk_data = &rtd1625_iso_clk_data,
> +	.clks     = rtd1625_clk_regmap_list,
> +	.num_clks = ARRAY_SIZE(rtd1625_clk_regmap_list),
> +	.aux_name = "rtd1625_iso_rst",
> +};
> +
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_irda, 0, 0x4, 6, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_ur10, 0, 0x4, 8, 1);
> +
> +static struct rtk_clk_regmap * const rtd1625_iso_s_clk_regmap_list[] = {
> +	&clk_en_irda.clkr,
> +	&clk_en_ur10.clkr,
> +};
> +
> +static struct clk_hw_onecell_data rtd1625_iso_s_clk_data = {
> +	.num = RTD1625_ISO_S_CLK_MAX,
> +	.hws = {
> +		[RTD1625_ISO_S_CLK_EN_IRDA] = &__rtk_clk_regmap_gate_hw(&clk_en_irda),
> +		[RTD1625_ISO_S_CLK_EN_UR10] = &__rtk_clk_regmap_gate_hw(&clk_en_ur10),
> +	},
> +};
> +
> +static const struct rtk_clk_desc rtd1625_iso_s_desc = {
> +	.clk_data = &rtd1625_iso_s_clk_data,
> +	.clks     = rtd1625_iso_s_clk_regmap_list,
> +	.num_clks = ARRAY_SIZE(rtd1625_iso_s_clk_regmap_list),
> +	.aux_name = "rtd1625_iso_s_rst",
> +};
> +
> +static int rtd1625_iso_probe(struct platform_device *pdev)
> +{
> +	const struct rtk_clk_desc *desc;
> +
> +	desc = of_device_get_match_data(&pdev->dev);

Same comment as previous patch. This function is deprecated.

> +	if (!desc)
> +		return -EINVAL;
> +
> +	return rtk_clk_probe(pdev, desc);
> +}
> +
> +static const struct of_device_id rtd1625_iso_match[] = {
> +	{.compatible = "realtek,rtd1625-iso-clk", .data = &rtd1625_iso_desc},
> +	{.compatible = "realtek,rtd1625-iso-s-clk", .data = &rtd1625_iso_s_desc},

Add space after the { and before the closing }

> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rtd1625_iso_match);
> +
> +static struct platform_driver rtd1625_iso_driver = {
> +	.probe = rtd1625_iso_probe,
> +	.driver = {
> +		.name = "rtk-rtd1625-iso-clk",
> +		.of_match_table = rtd1625_iso_match,
> +		.suppress_bind_attrs = true,
> +	},
> +};
> +
> +static int __init rtd1625_iso_init(void)
> +{
> +	return platform_driver_register(&rtd1625_iso_driver);
> +}
> +subsys_initcall(rtd1625_iso_init);

Same comment as previous patch about whether or not this can use
module_platform_driver()?

> +
> +MODULE_DESCRIPTION("Realtek RTD1625 ISO Clock Controller Driver");
> +MODULE_AUTHOR("Cheng-Yu Lee <cylee12@realtek.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("REALTEK_CLK");

CLK_REALTEK

Brian


> -- 
> 2.43.0
> 

