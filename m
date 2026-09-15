Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BE64A2A6B
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475192; cv=none; b=Nu+IARPCvb6Enfgs09ySU1S31jjUFLp+onQC281rLJeK730hZFRWbl1FFlyHgQAJQFrQUVyjIjXG/xkqTkDJtdjbc29t2fkd5jvS+uCPXvuMKIdalDEynDQuU17O7FUweKIe1pJCOFg/i4WFKQpVj6zwHP4ozGtGMNA/pXxlCj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475192; c=relaxed/simple;
	bh=/ZojfrfW2IBmBEs/62KEYt1EejWBbGxWHSboAcJDbR0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=pN0eSDSRmDqaQvlug6mJeuV+bhWn34Bh3P2p/FRO8D3VmBAcnQmYOMJoosvSTSZEeAKT+1YZ5sNyF633Z60DC3YcVWvONxHzsGMPmgjt0+15wJXmkZxciR6H1s6iNXvpZBakcGjaUYUMmVwqH0/Qb2psCXkBgh1zDmT/+fEqXRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=KxfxcSnW; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="KxfxcSnW"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso30064255e9.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 05:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789475186; x=1790079986; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rl6JhS65mEEXMmU5m1MLq7qtdOHWcdMQWYuFmQvPLeI=;
        b=KxfxcSnWWTuskUVDRoMr5Iz/IlLu/EaZjDEQc+t557vUMS31qTDTBkkY5IvNmRo2GD
         VHEJwZGugFqeZTInH8eCWrkt0m5++bv0C/TiR+dReDt9q3mD0sJIw6+tacyItAuy5bTK
         u++Vg4mK2b+eHc7B2z5tHRXd//KmdlnHhJ3vQnaMjcMZdI0ygWHOdvmivP8UD6V5DTdm
         ikD5fN77hISPMrknX7MjMZnNEYH+AhnPMQo52bJvMHUvV+BAEdzmkzkvLFB6tiBP+eMO
         qPfGOi7VA1wZqMqVqytW4BpBHijfQBb77WdXxk3vPWUHYxqwFABNPmURI5MGvkZIbBOB
         PlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475186; x=1790079986;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rl6JhS65mEEXMmU5m1MLq7qtdOHWcdMQWYuFmQvPLeI=;
        b=mI6410S6c5o/JfuUCRm+u9CnPjtuX3ba9Kk072WI1qZLWUx/8k66zmA3E4m+qo81TW
         kppgGi08i2PMd4XeSAGOREq2Pd3uDXIUxrr9gsrHbN0Vqt8QQPrhqTC2E/F6Ht+NnY+e
         R9TMDxTWaWoqZcyMci4K6z4DFlgSfGzyZcSX86HCH/bQz+W7ldO8RQN8KALQCoFWF9YD
         LhyYQqBfRAS15AR1Pi0dYyJmEdpY2d2ZcO4QVbOmbdhp8s3Bq3HOI9IuS0wpZbnqF7dZ
         QA4FBu4j/yfGZQlTsD3XyZMyzjOV3TUo2kueP7+4vtResTYjFmN3zOrIYUcT18oX0auO
         l5zA==
X-Forwarded-Encrypted: i=1; AKwUvByeOr+YOoI4Z3ifAWmmd7G37Gt3Zot5so9i3Pm7x5p3p+jCWbczVVkb5YEArMYBVfVNnhUQR3T3cHwJ@vger.kernel.org
X-Gm-Message-State: AFuF++kOb2EbNs4vSlHW8l0CMFC/Ikld70Ft4EItj13QqH/BlsV2PRnH
	eYzijzm7Xj15L0gxRwEDWpZ5uOU1SabtmaWrmLl3yl6CrsLEPfexwx0TKJaBiiEC43o=
X-Gm-Gg: AYBFou0RSdDtzNlxH4WXUYakXkkmJZOo1AU2t3ZZzzhUUKpOx8kol8ZrY7Q55Kubcir
	SEyY2LuPoFxxT9hGQZX7HeoWM3gN1mXN6C1QKUBnKVI9MnizrlNTiLGgDLHhqE7K4WlBSOBz4MF
	EYTEZHHeLgupUacbGQbwpMO5GBknZFCA66u6criv7xDaCcyu4BpGi+KFdzK8hq6gR645Sx6Kpit
	jhLA1NOF22bgIdtlB8/k7lCWLogTThUaV205q0TbIBt3coanGzsCFEpmsmmfKbqG7KUeZSD/4/x
	gUA2zkIqy6+32YvAV3Y2EqgEuJBvcCWtLH2ZJNLho5AiSORLqAvEEjUa4UrqlH73KhK2mmVGxyj
	vZdWzcVK0MkLTrZeMhaphFdS23gULbkxucp0ttHJqXsSJ3pkp2JmY8unGeOv16tR9uQmMGWZ63v
	fET1OWO8GMrq2YTKugGL6+QhBObz0AMjV9BshXPGndz2h6qHu8O81W69WBwaDMzXGpaigSCUujR
	j+sOKqL0xUkr6t3Dm9gRceC9J4c
X-Received: by 2002:a05:600c:3146:b0:49c:c0d4:53d9 with SMTP id 5b1f17b1804b1-49e7a668896mr82505995e9.14.1789475186101;
        Tue, 15 Sep 2026 05:26:26 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb36e4a6sm35902151f8f.37.2026.09.15.05.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:26:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v14 04/11] clk: realtek: Introduce common probe()
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, cylee12@realtek.com, afaerber@suse.com, 
 jyanchou@realtek.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
 cy.huang@realtek.com, stanley_chang@realtek.com, 
 Brian Masney <bmasney@redhat.com>
In-Reply-To: <20260901072446.2563145-5-eleanor.lin@realtek.com>
References: <20260901072446.2563145-1-eleanor.lin@realtek.com>
 <20260901072446.2563145-5-eleanor.lin@realtek.com>
Date: Tue, 15 Sep 2026 14:26:17 +0200
Message-Id: <178947517742.448573.7975580808033616494.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8639; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=/ZojfrfW2IBmBEs/62KEYt1EejWBbGxWHSboAcJDbR0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqqTlp3tsdp4MPJHxbixeJs86XTBzouL9QFlD0n
 NgQqhlviAmJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqk5aQAKCRDm/A8cN/La
 hVcqEAC06hi67ejmVN0pfal7W+Ank37EH6X16+Vg0CoMR3Pq/l7qoxRk54s/dggclfphngsEJu5
 mVN37m4pUeCSoDB9CGjiINgNOFsun7jILbGph/+qXO7myjAyg4OKrWw7CqJBVs2tk8umrkflQgm
 MEZw+vfJ6otkFvZ1N+c5P3OC84J7hX8afjyPgOJBzMIre67Z28iDVDoyagVoB/DNy51eRAlt691
 iiVODXcW9ZW/xGSsC8REGVE9YJXIWRp25y84Vq/nmDwtTxX5jjTtSUaNHf6vbKQ1NjNzPdOxnnH
 Jw3ah04M+P3BTSi1hTyl8A7ilQwACqyg0QlTN2lbbPJeXYM+74JAoQ2C5mj88fZAR0FW36RvU/S
 NqfAoJZEL+L6IeiFtYMg3+3F5laPUwbZZbrfaOXUhvTFcw3d5qH05/qrEIpy8UcBLm5IWsBXkYO
 +PWcCASubDTPEmpGzcAc2r/KLdRSzIzAFG3vd8w6H16VKdhLbivuUw0Q2C4u+DfItBphRDdp+5f
 9TplNL8t8Nyp8YbPFIMPJyp7qXhDWsba8r9sEj+22JHLeAqRkT3ausAzFi9a4qr/+g7SJeblcrQ
 LIZ/ZZO4vkeLla1qucfBa2gOOVW6B5UAv78BEG5hbgfzSYbKwo46T9bbTKVg1HE6zWGVAc2jxUO
 er+YctuH4W4zpHg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-09-01 15:24 +0800, Yu-Chun Lin wrote:
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
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v14:
> - Move Reviewed-by tags to the correct position.
> - Use devm_platform_ioremap_resource() + devm_regmap_init_mmio() instead
> of device_node_to_regmap().
> - Drop rtk_clk_remove().
> ---
>  MAINTAINERS                          |  1 +
>  drivers/clk/Kconfig                  |  1 +
>  drivers/clk/Makefile                 |  1 +
>  drivers/clk/realtek/Kconfig          | 30 ++++++++++
>  drivers/clk/realtek/Makefile         |  4 ++
>  drivers/clk/realtek/clk-rtk-common.c | 82 ++++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-rtk-common.h | 37 +++++++++++++
>  7 files changed, 156 insertions(+)
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
> index 000000000000..778f5b4a967a
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
> +	select REGMAP_MMIO
> +	select RESET_RTK_COMMON

Is there compile time dependency with reset that I missed ?
The point of the aux bus is to remove such dep

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
> index 000000000000..493f2d5588d0
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtk-common.c
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2019-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/device.h>
> +#include <linux/export.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
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
> +static const struct regmap_config rtk_clk_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +};
> +
> +int rtk_clk_probe(struct platform_device *pdev, const struct rtk_clk_desc *desc)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regmap *regmap;
> +	void __iomem *base;
> +	struct clk_hw *hw;
> +	int i, ret;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	regmap = devm_regmap_init_mmio(dev, base, &rtk_clk_regmap_config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
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

sashiko report on Patch 10 is actually not a prexisting issue. it is here.
Could you address it ?

> +}
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_probe, "CLK_REALTEK");
> +
> +MODULE_DESCRIPTION("Realtek clock infrastructure");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/realtek/clk-rtk-common.h b/drivers/clk/realtek/clk-rtk-common.h
> new file mode 100644
> index 000000000000..de3f23120b53
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
> +#define __rtk_clk_regmap_hw(_p) ((_p)->hw)
> +
> +struct device;
> +struct platform_device;
> +struct regmap;
> +
> +struct rtk_clk_regmap {
> +	struct clk_hw hw;
> +	struct regmap *regmap;
> +};
> +
> +struct rtk_clk_desc {
> +	struct clk_hw_onecell_data *clk_data;
> +	struct rtk_clk_regmap **clks;
> +	size_t num_clks;
> +	char *aux_name;
> +};
> +
> +static inline struct rtk_clk_regmap *to_rtk_clk_regmap(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct rtk_clk_regmap, hw);
> +}
> +
> +int rtk_clk_probe(struct platform_device *pdev, const struct rtk_clk_desc *desc);
> +
> +#endif /* __CLK_REALTEK_COMMON_H */
> -- 
> 2.43.0
> 
> 


