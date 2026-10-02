Received: from mail-ed2-f33.google.com (mail-ed2-f33.google.com [74.125.228.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC0F5012A4
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 16:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790959635; cv=none; b=VjENpCPqpVosnf/36mxE+4V3cqwIIuqFBX0Aoq44nPLtEDihDXNfM7Q01aM7/a6INqgpLS+WO3mNx2Yv4pePBjomgUdA21cgkACPOJ4W9S8rxRqOGzJktA1Lo4WN3biOfL4LvlUmX3P710655RJq6SbLAp7B765jGnUkjVHkhnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790959635; c=relaxed/simple;
	bh=lxRMV4WNZd97e9NA1Vo8JkTiV00PFppU+2Bzmt97/gM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SMOOl/CyPS0wYrACn4Xes86+kPcxAhGtQfxg9r7VujFLBdegBeYVpV1sLl7u8q5Uc8MXuNjGrE5UiW+LpiWHE7j9NBt03xYOkkDVH87MaP5J6cs8aXbcbBkOr0NdaGGwLFNW03nyL3TXGYqtwOmMwVkZsRKVFxVZG5WJBR+qt54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=SiKTrJ9Y; arc=none smtp.client-ip=74.125.228.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="SiKTrJ9Y"
Received: by mail-ed2-f33.google.com with SMTP id 4fb4d7f45d1cf-6ac768bda6aso10051124a12.0
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 09:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1790959631; x=1791564431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gQxZFNe1rWBibsrSm2fJpFRrCL8XwGmShlpoXQZ+uig=;
        b=SiKTrJ9YTKJhBX8hlQa8yHSGAbwVhMMRoQGyzB5OAa+RFnBeHvSGhhsCfxyR57P25q
         sDKZcxqO4wiU08bJ1JBgSvZDRyqZyiMKxmPYHFZT7IzlE3eOWh5nV3BVLev2jFHNkBqx
         WMMYoCotcTLAUqZx72aJ5bqToV3H/WKx4SoAAmJfMcrjR4fDnlTmFPzIGUdGkgSCyyeH
         3WzdcQR3vYDG+qUGRrf+Ip52LHDB+48vOVnb8p2XOkU/UxNzNxci2FHUsJjn5fIwnKRV
         p3WE2FUoBfHGU4m05xg7wm71t6ix7qNm02RP5lwYQtXURjOaRTtG13XKlSO8ugTM6drf
         WCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790959631; x=1791564431;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gQxZFNe1rWBibsrSm2fJpFRrCL8XwGmShlpoXQZ+uig=;
        b=xGUW9Lba2rShc2ir97+73BBBpmdNskyBiL/AkB9L4iqIrcWyhXReJw+2NpSxNI34Vj
         lLSpkG9D3wMMCJXZHaKz//QIasa0h6pZElPimGC5dP/afw965gU6llOOlB+DpIClYyYj
         uo4ir0p6OwBOhXT7v5eUardIBTInE8rZGY8AAbGWomOW6pZ5lXna+iANy/1TECWzO8MN
         cJuYsWHlajFItNDo+9NF/U/xKHEkE/4uncJ0LKUK26o8Qtoh5ukJHTD6n6zVz95Qs/zr
         +q8BWXwTUhjqBJUQc6QD1/zNf45KwPWdDwgH2DUkh+BJmFVcqMNP39WmJlLIFj1UbCdI
         tTyw==
X-Gm-Message-State: AFq9FYITMg9v/BtQqZf5mN3CzF46pzlm14nQ1ia8Ih8sGvMbJ7gcOoR5
	5CNk/tnOIeGT69+V4znVtGxg4wUsG6kx60qCPnWzCiLmb9qfcpB5Inlmf2AChNnDOQw=
X-Gm-Gg: AYBFou0u9MTHUToTVaqWBtxwmxfCbNMklt4fuBg/tTBEeamnMtZqiNb0bQpALMrYk+F
	S5L9Biz+1n9U942e5qEI4EzwVwNsQ76rygzMXF23pO7R6veq6PQ3JiJEb7pz/6H/gWDIQSorvc/
	FUjeGDqYocOLUug3fQFgfN4JgHdFRn4nsJQC+kDNNHe7HRhSL2NlZC1BY7sf9ouJ3996+aix8I0
	QaAgpBLC4J9h+CVFHra4s2uNVe+BESJBibvAWs66Mm6wFZuKKrjG5Wi43t9eT8f3zRnFEX0HKln
	pBenzui3V6lA4+OjsGsbshnxCZr+XqVha2GepGI217TOAxIJXzI2VFlukfSKkYztGGZi2FiN9Bm
	zwHK/ZQUdF54bu888q/zoiw/8H7KlgO87e/+BWqY8831YVOaqLvRhNaD9B66rVQ2Qn+T01WClgc
	cP9MoGMIs8ZmA/HV/zr7VxumDxM8VuSSYWaru9k4n1jznjdSTh22l1QQDCbj3AVJWfS//1eZr2m
	UFbxV4kBLciuOgseHK7UTIJmJTPVObvOQuSJedLuYknR+XFVBU=
X-Received: by 2002:a17:907:c02:b0:c2e:4292:d268 with SMTP id a640c23a62f3a-c2e4aac822amr274357466b.16.1790959631108;
        Fri, 02 Oct 2026 09:47:11 -0700 (PDT)
Received: from ?IPV6:2a01:599:841:224a:bb33:b9f8:dc3b:fc30? ([2a01:599:841:224a:bb33:b9f8:dc3b:fc30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf680ddsm101999566b.52.2026.10.02.09.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 09:47:10 -0700 (PDT)
Message-ID: <9cfcd3e7-bbc3-47c6-ad43-72b595a90110@9elements.com>
Date: Fri, 2 Oct 2026 18:47:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] soc: aspeed: Add B650D4U power passthrough support
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, joel@jms.id.au, ryan_chen@aspeedtech.com,
 Andrew Jeffery <andrew@codeconstruct.com.au>
References: <20261002131634.113680-1-prasanth.padarthi10@gmail.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <20261002131634.113680-1-prasanth.padarthi10@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/2/26 3:16 PM, Prasanth Kumar Padarthi wrote:
> Add the AST2600 SCU passthrough selector support used by the
> ASRock Rack B650D4U host power-control circuit. This RFC includes
> the driver, Devicetree binding, and board node to discuss the final
> kernel-facing interface.
> 
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>

This is definitely not the way how to solve this. I've already said on 
linux-aspeed as well as off-the-list, requesting the GPIO lines is 
enough and enabling GPIOP passthrough here does not make any sense, as 
it would be disabled by pinctrl anyways.
There's a whole implementation in userspace to solve this issue (at 
least if you use OpenBMC). The issue you're facing here is, from my 
point of view, a configuration error, and you'll not solve it with a 
kernel driver that literally just enables GPIOP passthrough...

So my answer to this patch is:
NACKed-by: Tan Siewert <tan.siewert@9elements.com>

> ---
>   .../asrock,b650d4u-power-passthrough.yaml     |  23 ++++
>   .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  |   5 +
>   drivers/soc/aspeed/Kconfig                    |   9 ++
>   drivers/soc/aspeed/Makefile                   |   1 +
>   drivers/soc/aspeed/aspeed-b650d4u-power.c     | 110 ++++++++++++++++++
>   5 files changed, 148 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4u-power-passthrough.yaml
>   create mode 100644 drivers/soc/aspeed/aspeed-b650d4u-power.c
> 
> diff --git a/Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4u-power-passthrough.yaml b/Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4u-power-passthrough.yaml
> new file mode 100644
> index 000000000000..e6451d17955c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4u-power-passthrough.yaml
> @@ -0,0 +1,23 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/aspeed/asrock,b650d4u-power-passthrough.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASRock Rack B650D4U power passthrough
> +
> +maintainers:
> +  - Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: asrock,b650d4u-power-passthrough
> +
> +  aspeed,scu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +required:
> +  - compatible
> +  - aspeed,scu
> +
> +additionalProperties: false
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> index a4e384588a54..86291c250562 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> @@ -32,6 +32,11 @@ gfx_memory: framebuffer {
>   			size = <0x01000000>;
>   		};
>   	};
> +
> +	host-power-passthrough {
> +		compatible = "asrock,b650d4u-power-passthrough";
> +		aspeed,scu = <&syscon>;
> +	};
>   };
>   
>   &fmc {
> diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
> index 11e4db998c06..1b0281e0bfb0 100644
> --- a/drivers/soc/aspeed/Kconfig
> +++ b/drivers/soc/aspeed/Kconfig
> @@ -58,6 +58,15 @@ config ASPEED_SBC
>   	  Say yes to provide information about the secure boot controller in
>   	  debugfs.
>   
> +config ASPEED_B650D4U_POWER
> +	tristate "ASRock B650D4U host power passthrough"
> +	select REGMAP
> +	select MFD_SYSCON
> +	default ARCH_ASPEED
> +	help
> +	  Enable the AST2600 GPIO passthrough selector used by the
> +	  ASRock Rack B650D4U host power-control circuit. This selector routes the host power pulse through the board's passthrough logic during power sequencing.
> +
>   config ASPEED_XDMA
>   	tristate "ASPEED XDMA Engine Driver"
>   	select REGMAP
> diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
> index 5f61bb4cc36c..3e9618d1eafc 100644
> --- a/drivers/soc/aspeed/Makefile
> +++ b/drivers/soc/aspeed/Makefile
> @@ -5,4 +5,5 @@ obj-$(CONFIG_ASPEED_UART_ROUTING)	+= aspeed-uart-routing.o
>   obj-$(CONFIG_ASPEED_P2A_CTRL)		+= aspeed-p2a-ctrl.o
>   obj-$(CONFIG_ASPEED_SOCINFO)		+= aspeed-socinfo.o
>   obj-$(CONFIG_ASPEED_SBC)		+= aspeed-sbc.o
> +obj-$(CONFIG_ASPEED_B650D4U_POWER)	+= aspeed-b650d4u-power.o
>   obj-$(CONFIG_ASPEED_XDMA)		+= aspeed-xdma.o
> diff --git a/drivers/soc/aspeed/aspeed-b650d4u-power.c b/drivers/soc/aspeed/aspeed-b650d4u-power.c
> new file mode 100644
> index 000000000000..22a6925539dc
> --- /dev/null
> +++ b/drivers/soc/aspeed/aspeed-b650d4u-power.c
> @@ -0,0 +1,110 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/mutex.h>
> +#include <linux/kstrtox.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/bits.h>
> +
> +#define ASPEED_SCU_PROTECTION        0x000
> +#define ASPEED_SCU_GPIO_PASSTHROUGH  0x4bc
> +#define ASPEED_SCU_GPIO_ACTION       0x51c
> +#define ASPEED_SCU_UNLOCK_KEY        0x1688a8a8
> +#define ASPEED_B650D4U_POWER_MASK    GENMASK(27, 26)
> +
> +static struct regmap *b650d4u_scu;
> +static DEFINE_MUTEX(b650d4u_lock);
> +
> +static int b650d4u_set_passthrough(bool enable)
> +{
> +	int ret;
> +
> +	mutex_lock(&b650d4u_lock);
> +
> +	ret = regmap_write(b650d4u_scu, ASPEED_SCU_PROTECTION,
> +			   ASPEED_SCU_UNLOCK_KEY);
> +	if (ret) {
> +		pr_err("B650D4U: SCU unlock failed: %d\n", ret);
> +		goto out;
> +	}
> +
> +	ret = regmap_update_bits(b650d4u_scu,
> +				 ASPEED_SCU_GPIO_PASSTHROUGH,
> +				 ASPEED_B650D4U_POWER_MASK,
> +				 enable ? ASPEED_B650D4U_POWER_MASK : 0);
> +	if (ret) {
> +		pr_err("B650D4U: passthrough update failed: %d\n", ret);
> +		goto out;
> +	}
> +
> +	if (!enable)
> +		ret = regmap_write(b650d4u_scu,
> +				   ASPEED_SCU_GPIO_ACTION, 0);
> +
> +out:
> +	mutex_unlock(&b650d4u_lock);
> +	return ret;
> +}
> +
> +static ssize_t passthrough_store(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf, size_t count)
> +{
> +	bool enable;
> +	int ret;
> +
> +	ret = kstrtobool(buf, &enable);
> +	if (ret)
> +		return ret;
> +
> +	ret = b650d4u_set_passthrough(enable);
> +	return ret ? ret : count;
> +}
> +static DEVICE_ATTR_WO(passthrough);
> +
> +static int aspeed_b650d4u_power_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	b650d4u_scu = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
> +						      "aspeed,scu");
> +	if (IS_ERR(b650d4u_scu))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(b650d4u_scu),
> +				     "failed to get AST2600 SCU regmap\n");
> +
> +	ret = b650d4u_set_passthrough(true);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to enable power GPIO passthrough\n");
> +
> +	ret = device_create_file(&pdev->dev, &dev_attr_passthrough);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to create passthrough control\n");
> +
> +	dev_info(&pdev->dev, "enabled GPIO passthrough selector 1\n");
> +	return 0;
> +}
> +
> +static const struct of_device_id aspeed_b650d4u_power_of_match[] = {
> +	{ .compatible = "asrock,b650d4u-power-passthrough" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, aspeed_b650d4u_power_of_match);
> +
> +static struct platform_driver aspeed_b650d4u_power_driver = {
> +	.probe = aspeed_b650d4u_power_probe,
> +	.driver = {
> +		.name = "aspeed-b650d4u-power",
> +		.of_match_table = aspeed_b650d4u_power_of_match,
> +	},
> +};
> +module_platform_driver(aspeed_b650d4u_power_driver);
> +
> +MODULE_DESCRIPTION("ASRock Rack B650D4U host power GPIO passthrough");
> +MODULE_LICENSE("GPL");

