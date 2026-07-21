Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768373AF643
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 23:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784676835; cv=none; b=YAfudupUCx7R7dfvfdgPpjXYchNf1j8qWq8+UXCOC2XLjyrWlafC8K8Jx1cwgScoXyZsPm5Qs4mdZjqGAjmFd55y5dUSn1Zx7sbWbwErC/3qotcjhl14ZV2efFYzR+Ll4gaVBorzITaMurx53DgcJhTI6HKPlFb1adTz7QfxFto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784676835; c=relaxed/simple;
	bh=jmHkekrqCTRVBjNf/RdIQ8U8/EnKEcv18sVhKF2efiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NwGzIIFBZoWP7/KxmcIXR8Bd1kQ+A/KJpDFx2c7fDv0liUGXhurhe5rwS9Cmeluu8Jis9MgBXVbWlsKUJxNo3OHGyN79pwvT7XgmfW/+6/S55yDSEg/2eS4JqFruR4eBrxOjvFfeyE2FoG/MxDvQUF7IQQYOq8Iq2nfl6biMDYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dp9chIdO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QZitEJ9A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dp9chIdO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QZitEJ9A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784676832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=auMz2LN5tHJag03mf+TQgvTRqEM9EzBNH8krKUgiijs=;
	b=Dp9chIdOXIML/8DmN4j62mf/5irX2HDKruX9LU7TNq2jsp7H8bDrk65vEWbBqfehDLBTwe
	t83ihASJ3hFCAj75H8k0pCtcrPr9tvQ+iXbRc3Nye7vbgHiwYoSi19V2MtpzBgrnTkWpy6
	DIhck4i2Asi8m4RLSadG8hukqXgPsoM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-BZF6ANjrN7CnKlDvgvLe2A-1; Tue, 21 Jul 2026 19:33:50 -0400
X-MC-Unique: BZF6ANjrN7CnKlDvgvLe2A-1
X-Mimecast-MFC-AGG-ID: BZF6ANjrN7CnKlDvgvLe2A_1784676830
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e820609d9so1530385185a.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 16:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784676830; x=1785281630; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=auMz2LN5tHJag03mf+TQgvTRqEM9EzBNH8krKUgiijs=;
        b=QZitEJ9AkmeHCOdJBF46fe7TVyISpvljb87/rFdOUmzzDzxXr0ClnrR9HawRfHEzLU
         fcN7PBGOtk1rvlZuC/JyXpQ3xWHD75FXdadzrQIjmo0HX1z5zdWeOo+3U+QWrkQ0bCbp
         F7/YfsSRTeqDkvMRLNxkTbAOn8mqwn/PEyk7ZCqXUUdZcGgXGU/R0NW9mZP24EP0riWN
         9TGwrK1UX2ZZQNGIkNY8NFYirjZdHoBJFQ9JEqHEMwJ1NBnGPf2AIf+9zYZjdNLzpx0b
         iKfMGCf6WbQ8SiOTtIJPgOJEUvUtA9Bb0m5gF96JZ5Yj5GJyDEeOWXXdWrsCShR3Patp
         ZgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784676830; x=1785281630;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auMz2LN5tHJag03mf+TQgvTRqEM9EzBNH8krKUgiijs=;
        b=sqovaTo9reeIHHOjOUrhUC3WJWVthqkCdtAozaz6CIhSBDAi/NLeVvTlvfN/EeLxvP
         sHUH2M+1D4G/MW92eQWEQ+9yH6PQd9KcJT1hyAmkKAd2tew6PJ4rmisPcRssFpI+2Rov
         jjG4Ka9KRUaD5POszMq+Jy/MiQo679UTYu8p1f+X5TnJ9tWHnbM8jWEJg4jHwSQPBYLo
         wdDRFeNmIG7L6NXEE8mX8ChozvrpIOm6BWrexd7HgV7RJfEaRbKtY65vIZgOpnNCyacJ
         bo+Efb7Z5s3QBc5WZWEC9dNNQ2g6Hj7KBnoIB2OV92m9CuMjG2G/2vhblio1Ngi+Pj91
         3z2Q==
X-Forwarded-Encrypted: i=1; AHgh+RqoPgNm+8vf82ML5czei5Wuh8HmvGBeicjP+NTT7+MRi03UIaZXcKLH6Uue37r7B0uWuxXMXiN0U6iw@vger.kernel.org
X-Gm-Message-State: AOJu0YzcOoK1gQjVjUltoihMh4sXCOUQhWaxKSI6+/c47oaCDQbGxPzd
	qGd1MEB9l3a9rW96CVdRHL3hJGAXdgti7+JxeQk7sebWOH7IhMjg3fIATtcTQV4pSsy+DxCC+lI
	QmvXX8C0t35kz59oh86pq7TcIFTM0BqBbZgugegQC+1E6qSd3cJmQZcni9FVpKG4=
X-Gm-Gg: AR+sD11XjyU6/PjsE/D30P/+EKU/L26zEeAMvR/QIn4Wo+hoTKMCEsUzKNTnM2CuqNC
	vKVwkbKHr2J6OIZ0ViYtB4SpsejDc4K2SIiuYkktsVHMVbyXXBfYeHXLB6DmuaHAg3GprTOQiPv
	3UxCurTfSeO+RCS46EC1rTBhOwkiG9JlJysZF26EdpYLGkCsd6pH2aCvXIkNIJaOT5jf2fQZPZH
	cmNI0HSPmQtdKr6pfKMkvp4DpOrNzaCDF1cU8h1ezzK4B/fL0iRb+Uco2qzmF7MBGY9QCs2o2X0
	0z1GAptCj4rz2SpaUmhk20KIaWhg7QrJCqmDiFXW+wmzcXGx2KHAuEpqKxCljAE6KHm2Qlx3SaM
	x9r7h7amYm9H2ri999yg73uoh9eI6ZlEZ3dE=
X-Received: by 2002:a05:620a:1711:b0:916:1a02:1965 with SMTP id af79cd13be357-930b41b1a22mr2261451785a.50.1784676830148;
        Tue, 21 Jul 2026 16:33:50 -0700 (PDT)
X-Received: by 2002:a05:620a:1711:b0:916:1a02:1965 with SMTP id af79cd13be357-930b41b1a22mr2261448185a.50.1784676829600;
        Tue, 21 Jul 2026 16:33:49 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f6a88b88sm15993885a.42.2026.07.21.16.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:33:48 -0700 (PDT)
Date: Tue, 21 Jul 2026 19:33:46 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v10 04/11] clk: realtek: Introduce a common probe()
Message-ID: <amAB2rr8UxY7QsCn@redhat.com>
References: <20260713155630.3054636-1-eleanor.lin@realtek.com>
 <20260713155630.3054636-5-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713155630.3054636-5-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Mon, Jul 13, 2026 at 11:56:23PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add rtk_clk_probe() to set up the shared regmap, register clock hardware,
> and add the clock provider.
> 
> Additionally, if the "#reset-cells" property is present in the device tree,
> it creates and registers an auxiliary device using the provided aux_name.
> This allows the dedicated reset driver to bind to this device, enabling
> both clock and reset drivers to share the same regmap.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v10:
> Add 'aux_name' to 'struct rtk_clk_desc'
> ---
>  MAINTAINERS                          |  1 +
>  drivers/clk/Kconfig                  |  1 +
>  drivers/clk/Makefile                 |  1 +
>  drivers/clk/realtek/Kconfig          | 30 ++++++++++++
>  drivers/clk/realtek/Makefile         |  4 ++
>  drivers/clk/realtek/clk-rtk-common.c | 70 ++++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-rtk-common.h | 37 +++++++++++++++
>  7 files changed, 144 insertions(+)
>  create mode 100644 drivers/clk/realtek/Kconfig
>  create mode 100644 drivers/clk/realtek/Makefile
>  create mode 100644 drivers/clk/realtek/clk-rtk-common.c
>  create mode 100644 drivers/clk/realtek/clk-rtk-common.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 02b34a53b258..1fffb1fc5de1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22742,6 +22742,7 @@ L:	devicetree@vger.kernel.org
>  L:	linux-clk@vger.kernel.org
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
> index 000000000000..cea7d94313da
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtk-common.c
> @@ -0,0 +1,70 @@
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
> +
> +	if (!adev)

Remove extra newline

> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +int rtk_clk_probe(struct platform_device *pdev, const struct rtk_clk_desc *desc)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regmap *regmap;
> +	int i, ret;
> +
> +	regmap = device_node_to_regmap(dev->of_node);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "failed to get regmap\n");
> +
> +	for (i = 0; i < desc->num_clks; i++)
> +		desc->clks[i]->regmap = regmap;
> +
> +	for (i = 0; i < desc->clk_data->num; i++) {
> +		struct clk_hw *hw = desc->clk_data->hws[i];
> +
> +		if (!hw)

Remove extra newline.

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
> +	return rtk_reset_controller_register(dev, desc->aux_name, regmap);
> +}
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_probe, "REALTEK_CLK");
> +
> +MODULE_DESCRIPTION("Realtek clock infrastructure");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/realtek/clk-rtk-common.h b/drivers/clk/realtek/clk-rtk-common.h
> new file mode 100644
> index 000000000000..d2aee7f421b4
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtk-common.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2016-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#ifndef __CLK_REALTEK_COMMON_H
> +#define __CLK_REALTEK_COMMON_H
> +
> +#include <linux/clk-provider.h>
> +
> +#define __clk_regmap_hw(_p) ((_p)->hw)
> +
> +struct device;
> +struct platform_device;
> +struct regmap;
> +
> +struct clk_regmap {

Please rename this to clk_rtk_regmap. drivers/clk/qcom/clk-regmap.h
already has this name, and they won't collide, but it makes things like
grep less ambiguous with a unique name.

Brian

