Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26F545D1B9
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 16:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787588606; cv=none; b=MggGwH8GkPLB2QdtktgITVGmJYwvigbnEG3v3DSLol021ZpIVbp3vpqHGhStkhg6tCifoEyaeufI1MVRzsAVoWPL5a5lokkJEispNUskVD4tY5ylrQJ5yD7QDZTDrYNBXdmXuDD4kLsXM1HJm3s4rMVDWpf/s9MiQyg4UACrr9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787588606; c=relaxed/simple;
	bh=g86GFMo22RqGpuNAu0ACt3z6ULhxI5U10ygM+zkRgX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L4xKA07nIQLc+//HRD2pLbdFyy4S7pkTMQE6bmmtblcRCft/7rstINZQG5MWjcdHMHu0Wq9qmq3cYfeeBu7TSI6DIDr488igdJuBCMlbjr2bw1yiUUcwicFXEmU2QR9bBR4yD84fKw35ZVbAQH3lnSXYczH4Zt8CoO7tBrUMYBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LibFhyhl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eJmCMxT8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LibFhyhl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eJmCMxT8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787588603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uT29tK1X+zzdSzlTrvlxuqbFiFhBRPSANstyBBDVrSw=;
	b=LibFhyhl8r0nsMLC2jhmcTwfnszmYONk5N+Igy+HFJDrRBq0OOe/n85lIW+5aSCsvsvbC3
	t7YaMfJwvDMgWEzoKqMy/cStGDlU+wWZzeXgIc4YkvsF7+upjmpSgecPTVclpznpj3D0Jr
	/b0aWq0YlXhyqHOPmTyzQ5TFLdYlP7k=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-EqVHvVzqNCeoH6fh3ZY0Ow-1; Mon, 24 Aug 2026 12:23:20 -0400
X-MC-Unique: EqVHvVzqNCeoH6fh3ZY0Ow-1
X-Mimecast-MFC-AGG-ID: EqVHvVzqNCeoH6fh3ZY0Ow_1787588600
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52827090cc5so962501cf.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787588600; x=1788193400; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uT29tK1X+zzdSzlTrvlxuqbFiFhBRPSANstyBBDVrSw=;
        b=eJmCMxT8CqjS7zpDO3eXpIgUF1KFA5GDJL8feSB8j49/dGYe1esr3t5YgyvCrrGQmI
         MG5DV2jyHOSrYyEBGHN6PMh3XwghznZy1a8EARhKHRl+Y9amDjugsfniVsj/bEioDJNh
         cId5EQLw3VkDPdfb9Yi1JWrXsS2NodQR7myyzpRJI7F6tnTYKxJcvRG5MAGVRU9bmRPp
         lodbQnsUnw3kzvrOK48kO3Xw0HDPrIsr+yxJqedTBWFweVmQeOW6bHrN7JoVTMwsueHL
         n5xf5ekPcf6dnId2LmmLmldhjxXq1uBDAFWGpsMUy5CtugtHN4Jmith71siz6/uEKaDF
         Okeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787588600; x=1788193400;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uT29tK1X+zzdSzlTrvlxuqbFiFhBRPSANstyBBDVrSw=;
        b=rLk/YiMH24UN/xMsWIEh+himZXLGo0cFkY1PvP9KYRVkS5w/zCTGQCkc+Z/LGWltSv
         Q2ddATNdHAPUFzIuLj5OX9+H2nWoF/5GsJTQMYjLUEX32kMVrOWqcCyAR3t52AQcUHlh
         l1x2XUgmRy8yg5rf2lNIHUQrtW1Ovix/LqxpLVsgEDP1poWOSIwigZdTIRvSlz956Ci+
         CijeywEAEOazkh0B5Z6MyFpq31wyYSoGCuC0nPX1kzalzLLgVjJUjrdE4PXSC/f9gx5f
         rv0qbODEG0tkuyMPbM/YNBvgeFFg965oRNmwMSw9vysn3Bv76+wQTyE9Ga41b6fciNdJ
         L4Gw==
X-Forwarded-Encrypted: i=1; AHgh+RoNszhVxPZnUqnf6iIetQPE14hoky4ajBYvoUZe7nndITOzqiLTURMr9EOa+tfvZTYcAdpdQFgPk0g+@vger.kernel.org
X-Gm-Message-State: AFuF++m3uRrj1jYkNf9VePh0Tk7CtYjXq2TYg2p2blPQYSqCv9W0cpT3
	PT7NQP+hCG30czEeLg1nBeQuU/BmdcInS5IS1Zk3DkNijbZINrV3HbItytTlqHXjcvnQofRJm/I
	xi15QQ/i5kBz3AskqLvaWjTv6dmFwlsfUTVtlLCOodPWjWjaGH9/Prp+nHojPmAQ=
X-Gm-Gg: AR+sD10oTeQFwyMKDSggz8JTy5Yydqr7PtmdHh5HoBGY5xAk4GbErejoxIKXK38kIuv
	/lnve1dff2Z2cSSm4PQkFF9pTwSLN8XGaCe2WuoAcvYdPFgNzL2IW0mUEV0n6k4YNZ/yCSZxcj4
	yNkQw1LK/0hk41rO0fO3J6kLTurTCdRbL7F0PKZWla2QEoW7uLlgvLR30iF8UUopxHb2uZmET/r
	ZU78LWkgf44ju2hWsZbcs1/BXIGrEtzLWFP28W2RNUqamthQvWi5OsTgbgQy4NvVcHbOJCEgYYV
	N0mYja9+qF7UFJasO2ycEI65omKucuad/L0wVuivT6YpYN9tEnEnrwb3/GOTU1AV/HLIgp+nYpK
	V0XjIxz8hiSGwzCbet7PoYXHiKRu52RqCWqo=
X-Received: by 2002:a05:622a:11cf:b0:51b:fcc1:a0b7 with SMTP id d75a77b69052e-52e2ec51619mr4730671cf.8.1787588599997;
        Mon, 24 Aug 2026 09:23:19 -0700 (PDT)
X-Received: by 2002:a05:622a:11cf:b0:51b:fcc1:a0b7 with SMTP id d75a77b69052e-52e2ec51619mr4729811cf.8.1787588599474;
        Mon, 24 Aug 2026 09:23:19 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c935e1768sm65958086d6.3.2026.08.24.09.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 09:23:18 -0700 (PDT)
Date: Mon, 24 Aug 2026 12:23:16 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v13 04/11] clk: realtek: Introduce common probe() and
 remove()
Message-ID: <aoxv9PJd6r_8DaNA@redhat.com>
References: <20260812020009.3480538-1-eleanor.lin@realtek.com>
 <20260812020009.3480538-5-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812020009.3480538-5-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Yu-Chun,

On Wed, Aug 12, 2026 at 10:00:02AM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add rtk_clk_probe() to set up the shared regmap, register clock hardware,
> and add the clock provider.
> 
> Add rtk_clk_remove() to clear the regmap pointers in the clock descriptors
> during driver unbind to prevent dangling pointers.
> 
> Additionally, if the "#reset-cells" property is present in the device tree,
> it creates and registers an auxiliary device using the provided aux_name.
> This allows the dedicated reset driver to bind to this device, enabling
> both clock and reset drivers to share the same regmap.
> 
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v13:
> - None.
> ---
>  MAINTAINERS                          |  1 +
>  drivers/clk/Kconfig                  |  1 +
>  drivers/clk/Makefile                 |  1 +
>  drivers/clk/realtek/Kconfig          | 30 ++++++++++
>  drivers/clk/realtek/Makefile         |  4 ++
>  drivers/clk/realtek/clk-rtk-common.c | 83 ++++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-rtk-common.h | 38 +++++++++++++
>  7 files changed, 158 insertions(+)
>  create mode 100644 drivers/clk/realtek/Kconfig
>  create mode 100644 drivers/clk/realtek/Makefile
>  create mode 100644 drivers/clk/realtek/clk-rtk-common.c
>  create mode 100644 drivers/clk/realtek/clk-rtk-common.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a752551f32f9..e55eb1c06119 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22746,6 +22746,7 @@ M:	Cheng-Yu Lee <cylee12@realtek.com>
>  M:	Yu-Chun Lin <eleanor.lin@realtek.com>
>  S:	Supported
>  F:	Documentation/devicetree/bindings/clock/realtek*
> +F:	drivers/clk/realtek/*
>  F:	drivers/reset/realtek/*
>  F:	include/dt-bindings/clock/realtek*
>  F:	include/dt-bindings/reset/realtek*
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 1717ce75a907..97ad817457db 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -525,6 +525,7 @@ source "drivers/clk/nuvoton/Kconfig"
>  source "drivers/clk/pistachio/Kconfig"
>  source "drivers/clk/qcom/Kconfig"
>  source "drivers/clk/ralink/Kconfig"
> +source "drivers/clk/realtek/Kconfig"
>  source "drivers/clk/renesas/Kconfig"
>  source "drivers/clk/rockchip/Kconfig"
>  source "drivers/clk/samsung/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index cc108a75a900..b1aa373e9f84 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -141,6 +141,7 @@ obj-$(CONFIG_COMMON_CLK_PISTACHIO)	+= pistachio/
>  obj-$(CONFIG_COMMON_CLK_PXA)		+= pxa/
>  obj-$(CONFIG_COMMON_CLK_QCOM)		+= qcom/
>  obj-y					+= ralink/
> +obj-$(CONFIG_COMMON_CLK_REALTEK)	+= realtek/
>  obj-y					+= renesas/
>  obj-$(CONFIG_COMMON_CLK_ROCKCHIP)	+= rockchip/
>  obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
> diff --git a/drivers/clk/realtek/Kconfig b/drivers/clk/realtek/Kconfig
> new file mode 100644
> index 000000000000..ed97531e321d
> --- /dev/null
> +++ b/drivers/clk/realtek/Kconfig
> @@ -0,0 +1,30 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config COMMON_CLK_REALTEK
> +	tristate "Clock driver for Realtek SoCs"
> +	depends on ARCH_REALTEK || COMPILE_TEST
> +	default ARCH_REALTEK
> +	help
> +	  Enable the common clock framework infrastructure for Realtek
> +	  system-on-chip platforms.
> +
> +	  This provides the base support required by individual Realtek
> +	  clock controller drivers to expose clocks to peripheral devices.
> +
> +	  If you have a Realtek-based platform, say Y.
> +
> +if COMMON_CLK_REALTEK
> +
> +config RTK_CLK_COMMON
> +	tristate "Realtek Clock Common"
> +	depends on RESET_CONTROLLER
> +	select AUXILIARY_BUS
> +	select MFD_SYSCON
> +	select RESET_RTK_COMMON
> +	help
> +	  Common helper code shared by Realtek clock controller drivers.
> +
> +	  This provides utility functions and data structures used by
> +	  multiple Realtek clock implementations, and include integration
> +	  with reset controllers where required.
> +
> +endif
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> new file mode 100644
> index 000000000000..13000ed4ba11
> --- /dev/null
> +++ b/drivers/clk/realtek/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
> +
> +clk-rtk-y += clk-rtk-common.o
> diff --git a/drivers/clk/realtek/clk-rtk-common.c b/drivers/clk/realtek/clk-rtk-common.c
> new file mode 100644
> index 000000000000..e8422ecbad79
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtk-common.c
> @@ -0,0 +1,83 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2019-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/device.h>
> +#include <linux/export.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include "clk-rtk-common.h"
> +
> +static int rtk_reset_controller_register(struct device *dev, const char *aux_name,
> +					 struct regmap *map)
> +{
> +	struct auxiliary_device *adev;
> +
> +	if (!of_property_present(dev->of_node, "#reset-cells"))
> +		return 0;
> +
> +	if (!aux_name) {
> +		dev_err(dev, "DTS requires reset controller, but aux_name is missing\n");
> +		return -EINVAL;
> +	}
> +
> +	adev = devm_auxiliary_device_create(dev, aux_name, (void *)map);
> +	if (!adev)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +int rtk_clk_probe(struct platform_device *pdev, const struct rtk_clk_desc *desc)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regmap *regmap;
> +	struct clk_hw *hw;
> +	int i, ret;
> +
> +	regmap = device_node_to_regmap(dev->of_node);

Looking at the Sashiko comments for this series. device_node_to_regmap()
has this note in drivers/mfd/syscon.c:

/**
 * device_node_to_regmap() - Get or create a regmap for specified device node
 * @np: Device tree node
 *
 * Get a regmap for the specified device node. If there's not an existing
 * regmap, then one is instantiated. This function should not be used if the
 * device node has a custom regmap driver or has resources (clocks, resets) to
 * be managed. Use syscon_node_to_regmap() instead for those cases.
 *
 * Return: regmap ptr on success, negative error code on failure.
 */

Should this be moved to syscon_node_to_regmap()?

> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "failed to get regmap\n");
> +
> +	for (i = 0; i < desc->num_clks; i++)
> +		desc->clks[i]->regmap = regmap;
> +
> +	for (i = 0; i < desc->clk_data->num; i++) {
> +		hw = desc->clk_data->hws[i];
> +		if (!hw)
> +			continue;
> +
> +		ret = devm_clk_hw_register(dev, hw);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to register hw of clk%d\n", i);
> +	}
> +
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> +					  desc->clk_data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to add clock provider\n");
> +
> +	platform_set_drvdata(pdev, (void *)desc);
> +
> +	return rtk_reset_controller_register(dev, desc->aux_name, regmap);
> +}
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_probe, "CLK_REALTEK");
> +
> +void rtk_clk_remove(struct platform_device *pdev)
> +{
> +	const struct rtk_clk_desc *desc = platform_get_drvdata(pdev);
> +
> +	if (!desc)
> +		return;
> +
> +	for (int i = 0; i < desc->num_clks; i++)
> +		desc->clks[i]->regmap = NULL;

Looking at the Sashiko comments, is this remove callback really needed?

Brian

