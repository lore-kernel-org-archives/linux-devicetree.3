Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5F03793CA
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 20:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782766737; cv=none; b=PyoNUY4Rb1DC1sYWpoR6eyM046fel2f7GJfd2JnCrvlNuPSg9RzpB5IGIGG/yedg7kfk2sZzgGElQBXel4HZkn4MCbqEX5pPYuLOhHv783DVIlzs6IuJEV7TtT3nyoGchubjop/DlLarV7Htko0qzT3WuOob/9m9f5NHD7rXqC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782766737; c=relaxed/simple;
	bh=tnCPLFyTDiiNTVv+XC+oXI58RNeNgPi4SDjHqCmUR20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hMRTqDCcChsRho/ztLGFP0pVSY8mnIH7S/zxbHxbXK8Y4NRJuBCXATQ/9uM9bF0i1nAeA1uonpjjJEyJA6Lh2NcoRJFnIjz3vIXpCbkfin1wWpMz5EjuhUOqhF0CAdZh6WB7ka453EjBAasE/D0T5GrDT7np9qN/gCGY4XYuQF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e2yGQ4sl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KvKUcMyK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e2yGQ4sl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KvKUcMyK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782766735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vc9TcsGqvwP2sCjfxbHhvEp3jEIy9e292sjunigOY5E=;
	b=e2yGQ4slYzsYwC2bHPfh0Y0r+5JZyP+rRJOgM6JMPSdT0MKRHHCduhGNbfh7Bf9zL04kz6
	9vIvhCctxXb65JPuq6W0Ympr3k3Hk/6L+heBwmTNghib8Ibironq52LR7l57Xv6d21onQY
	66W6322pYcjCCTgEUKMIOdayNP+VmyY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-bYlKSKFrMNajDKGtMGs53A-1; Mon, 29 Jun 2026 16:58:54 -0400
X-MC-Unique: bYlKSKFrMNajDKGtMGs53A-1
X-Mimecast-MFC-AGG-ID: bYlKSKFrMNajDKGtMGs53A_1782766733
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ec3314f65fso55515306d6.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 13:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782766733; x=1783371533; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vc9TcsGqvwP2sCjfxbHhvEp3jEIy9e292sjunigOY5E=;
        b=KvKUcMyKMuJJxOP6sPVRRFL+A1IpLAzH/dPoHvyuvi7PmrlWStW2w3Xj6bG1o5n1Ow
         TK0db6tLNSyI+mJzppzV+bLVuzQ7KU56HmI1DxN7K4ee4GNr+mGkCdsOhEsz4pDZwLLl
         UyukMe7nFYpwRxcKdJclFHWPOawuM5U99aECf7HisIXPEodlBhsjv7QgvKCWHz9gjZAc
         VCqd0ATbBsrC8XNT+pq6P9VPfX4w3TIp9FRCe6rUkgr2R8uHltOqX1LhoGS8Jvwv8f72
         0jZrYVL7SAecmllm/4iHZv530zvwSDYIxTGJQc2/OlT5Tzywo42HGEiu2xFPChs05MdM
         05Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782766733; x=1783371533;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vc9TcsGqvwP2sCjfxbHhvEp3jEIy9e292sjunigOY5E=;
        b=MyPeBqic3IbNbAfakfRT5TJgpiWnbC3oHYsDW+uIgalJ2c6Bt3TxlnzOIPxVbKHNuP
         m9gSlMy6m5d8z4v1SJgEQWhKeNbEjSuZa0teZull/7sF/fTUhUIHLMSLGbnwKuONbS/p
         zysN9ORwid5kOwL+Nql5rsQLqgYb/AU1oSdaD2mFhQtUh+gBViOG2aIJj8qmM76S2ZhD
         Wp/V2/pffreuf4hvH+vF7aeYjPifet6apOY4fTdQ91R0Pnef5oRkrxEKVsNjJHVu6DL5
         /o14IfHwrtKsyrpV30GEjuGjceBnZQxv95y6HSQfIhfe5GGy9Ysz6t/oUolClFb0eQXA
         sDIw==
X-Forwarded-Encrypted: i=1; AHgh+Rr52auujeHSYi5Wk82pnGQKbwZuPUnlO6vR4Jgp/EHmv29iqSuukPOY14hHIMJwUR1hy49m0x0rZekY@vger.kernel.org
X-Gm-Message-State: AOJu0YwqWSnOk3BTr+7Kt1lhqjj9vHcLowH/Ay+jyD6S/pHIERs1AEqJ
	hdOEvtleDabCMRxMmacIVc/g5PEwvDM4XNhwTgntJXLfE+q9pzkndE0OgIaq6Wo+lmUcEzffyVb
	BEWHGtFNGuz6E2mOSWzDpL7hUMJHlGTnELAhXn/lEasPAtwMquBSjNIsneMwLeU8=
X-Gm-Gg: AfdE7cm1mrc8n5hg5OidYcU+8xJHZez6YRCmhNoQG2ChEuTg62mLWDyHYLtl17MwLrL
	rYrGAUms+nTG30c+ZS1rT9a1g7qJ7k/+NHX7wbqM3KXxTPQMVAdOv6GYv6i6YpDlXdOXWl2sNQf
	LizcIs16W2dADcTPVHamwROuQWv2xybEG2QRykuuoIIP76E3/8Wvvo+CTfzH1pFM5ujA+SY1IAB
	gsz7Q4q1Lak9VwYMM8PvMDVjFNPEHaUkCFYUO0U/uRFRjk1UwzQMl1y1fF87bLSH6R7wm7P2D1B
	YEYspLCIo/TaOW6EHGKqMD/5fFQfLacRwdQYCFJ1SdpJsWoKgM8sS+DS30EOk1BvFgAECMQebDu
	aiU+0bLkhg+MfAumvzR7+PHnCaSviCgaWbsB2nMrHheCw8w==
X-Received: by 2002:a05:6214:4709:b0:8ef:aad6:dada with SMTP id 6a1803df08f44-8f1ba699fcemr14251696d6.20.1782766732935;
        Mon, 29 Jun 2026 13:58:52 -0700 (PDT)
X-Received: by 2002:a05:6214:4709:b0:8ef:aad6:dada with SMTP id 6a1803df08f44-8f1ba699fcemr14251346d6.20.1782766732468;
        Mon, 29 Jun 2026 13:58:52 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f1a328fed8sm7220026d6.16.2026.06.29.13.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:58:51 -0700 (PDT)
Date: Mon, 29 Jun 2026 16:58:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 4/6] reset: anlogic: add support for Anlogic DR1V90
 resets
Message-ID: <akLcbHYKJfvZzf27@redhat.com>
References: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
 <20260514-dr1v90-cru-v5-4-34f3021aab51@pigmoral.tech>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514-dr1v90-cru-v5-4-34f3021aab51@pigmoral.tech>
User-Agent: Mutt/2.3.2 (2026-04-26)

Hi Philipp,

On Thu, May 14, 2026 at 05:27:20PM +0800, Junhui Liu wrote:
> Add reset controller support for the Anlogic DR1V90 SoC, which is an
> auxiliary device associated with the Clock and Reset Unit (CRU). All
> resets are active-low.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

I don't see a Reviewed-by or Acked-by for you on the reset portion of
this driver.

I'm gathering a pull for Stephen for various clk drivers that were
missed during the last merge window. Does all of this usually go in via
one tree? Or Stephen merges the clk part, you merge the reset portion?
Who usually merges the dts changes?

Thanks,

Brian




> ---
>  drivers/reset/Kconfig        |  10 ++++
>  drivers/reset/Makefile       |   1 +
>  drivers/reset/reset-dr1v90.c | 140 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 151 insertions(+)
> 
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index d009eb0849a3..0bc1723224a4 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -73,6 +73,16 @@ config RESET_BRCMSTB_RESCAL
>  	  This enables the RESCAL reset controller for SATA, PCIe0, or PCIe1 on
>  	  BCM7216 or the BCM2712.
>  
> +config RESET_DR1V90
> +	tristate "Anlogic DR1V90 reset controller"
> +	depends on ARCH_ANLOGIC || COMPILE_TEST
> +	depends on ANLOGIC_DR1V90_CRU
> +	select AUXILIARY_BUS
> +	default ARCH_ANLOGIC
> +	help
> +	  This enables the reset controller driver for Anlogic DR1V90 SoCs
> +	  provided by the CRU unit.
> +
>  config RESET_EIC7700
>  	bool "Reset controller driver for ESWIN SoCs"
>  	depends on ARCH_ESWIN || COMPILE_TEST
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 3e52569bd276..ab2bbc917b73 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_RESET_BCM6345) += reset-bcm6345.o
>  obj-$(CONFIG_RESET_BERLIN) += reset-berlin.o
>  obj-$(CONFIG_RESET_BRCMSTB) += reset-brcmstb.o
>  obj-$(CONFIG_RESET_BRCMSTB_RESCAL) += reset-brcmstb-rescal.o
> +obj-$(CONFIG_RESET_DR1V90) += reset-dr1v90.o
>  obj-$(CONFIG_RESET_EIC7700) += reset-eic7700.o
>  obj-$(CONFIG_RESET_EYEQ) += reset-eyeq.o
>  obj-$(CONFIG_RESET_GPIO) += reset-gpio.o
> diff --git a/drivers/reset/reset-dr1v90.c b/drivers/reset/reset-dr1v90.c
> new file mode 100644
> index 000000000000..daa99c797b1a
> --- /dev/null
> +++ b/drivers/reset/reset-dr1v90.c
> @@ -0,0 +1,140 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Junhui Liu <junhui.liu@pigmoral.tech>
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/cleanup.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/reset-controller.h>
> +
> +#include <dt-bindings/reset/anlogic,dr1v90-cru.h>
> +
> +struct dr1v90_reset_map {
> +	u32 offset;
> +	u32 bit;
> +};
> +
> +struct dr1v90_reset_controller {
> +	struct reset_controller_dev rcdev;
> +	void __iomem *base;
> +	spinlock_t lock; /* protect register read-modify-write */
> +};
> +
> +static inline struct dr1v90_reset_controller *
> +to_dr1v90_reset_controller(struct reset_controller_dev *rcdev)
> +{
> +	return container_of(rcdev, struct dr1v90_reset_controller, rcdev);
> +}
> +
> +static const struct dr1v90_reset_map dr1v90_resets[] = {
> +	[RESET_OCM]		= { 0x74, BIT(4)},
> +	[RESET_QSPI]		= { 0x74, BIT(5)},
> +	[RESET_SMC]		= { 0x74, BIT(6)},
> +	[RESET_WDT]		= { 0x74, BIT(7)},
> +	[RESET_DMAC_AXI]	= { 0x74, BIT(8)},
> +	[RESET_DMAC_AHB]	= { 0x74, BIT(9)},
> +	[RESET_NPU]		= { 0x74, BIT(12)},
> +	[RESET_JPU]		= { 0x74, BIT(13)},
> +	[RESET_DDRBUS]		= { 0x74, BIT(14)},
> +	[RESET_NIC_HP0]		= { 0x78, BIT(0)},
> +	[RESET_NIC_HP1]		= { 0x78, BIT(1)},
> +	[RESET_NIC_GP0M]	= { 0x78, BIT(4)},
> +	[RESET_NIC_GP1M]	= { 0x78, BIT(5)},
> +	[RESET_GPIO]		= { 0x78, BIT(8)},
> +	[RESET_IPC]		= { 0x78, BIT(12)},
> +	[RESET_USB0]		= { 0x7C, BIT(0)},
> +	[RESET_USB1]		= { 0x7C, BIT(1)},
> +	[RESET_GBE0]		= { 0x7C, BIT(4)},
> +	[RESET_GBE1]		= { 0x7C, BIT(5)},
> +	[RESET_SDIO0]		= { 0x7C, BIT(8)},
> +	[RESET_SDIO1]		= { 0x7C, BIT(9)},
> +	[RESET_UART0]		= { 0x7C, BIT(12)},
> +	[RESET_UART1]		= { 0x7C, BIT(13)},
> +	[RESET_SPI0]		= { 0x7C, BIT(16)},
> +	[RESET_SPI1]		= { 0x7C, BIT(17)},
> +	[RESET_CAN0]		= { 0x7C, BIT(20)},
> +	[RESET_CAN1]		= { 0x7C, BIT(21)},
> +	[RESET_TTC0]		= { 0x7C, BIT(24)},
> +	[RESET_TTC1]		= { 0x7C, BIT(25)},
> +	[RESET_I2C0]		= { 0x7C, BIT(28)},
> +	[RESET_I2C1]		= { 0x7C, BIT(29)}
> +};
> +
> +static int dr1v90_reset_control_update(struct reset_controller_dev *rcdev,
> +				       unsigned long id, bool assert)
> +{
> +	struct dr1v90_reset_controller *rstc = to_dr1v90_reset_controller(rcdev);
> +	u32 offset = dr1v90_resets[id].offset;
> +	u32 bit = dr1v90_resets[id].bit;
> +	u32 reg;
> +
> +	guard(spinlock_irqsave)(&rstc->lock);
> +
> +	reg = readl(rstc->base + offset);
> +	if (assert)
> +		reg &= ~bit;
> +	else
> +		reg |= bit;
> +	writel(reg, rstc->base + offset);
> +
> +	return 0;
> +}
> +
> +static int dr1v90_reset_control_assert(struct reset_controller_dev *rcdev,
> +				       unsigned long id)
> +{
> +	return dr1v90_reset_control_update(rcdev, id, true);
> +}
> +
> +static int dr1v90_reset_control_deassert(struct reset_controller_dev *rcdev,
> +					 unsigned long id)
> +{
> +	return dr1v90_reset_control_update(rcdev, id, false);
> +}
> +
> +static const struct reset_control_ops dr1v90_reset_control_ops = {
> +	.assert = dr1v90_reset_control_assert,
> +	.deassert = dr1v90_reset_control_deassert,
> +};
> +
> +static int dr1v90_reset_probe(struct auxiliary_device *adev,
> +			      const struct auxiliary_device_id *id)
> +{
> +	struct dr1v90_reset_controller *rstc;
> +	struct device *dev = &adev->dev;
> +
> +	rstc = devm_kzalloc(dev, sizeof(*rstc), GFP_KERNEL);
> +	if (!rstc)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&rstc->lock);
> +
> +	rstc->base = dev->platform_data;
> +	rstc->rcdev.dev = dev;
> +	rstc->rcdev.nr_resets = ARRAY_SIZE(dr1v90_resets);
> +	rstc->rcdev.of_node = dev->parent->of_node;
> +	rstc->rcdev.ops = &dr1v90_reset_control_ops;
> +	rstc->rcdev.owner = THIS_MODULE;
> +
> +	return devm_reset_controller_register(dev, &rstc->rcdev);
> +}
> +
> +static const struct auxiliary_device_id dr1v90_reset_ids[] = {
> +	{
> +		.name = "anlogic_dr1_cru.reset"
> +	},
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(auxiliary, dr1v90_reset_ids);
> +
> +static struct auxiliary_driver dr1v90_reset_driver = {
> +	.probe = dr1v90_reset_probe,
> +	.id_table = dr1v90_reset_ids,
> +};
> +module_auxiliary_driver(dr1v90_reset_driver);
> +
> +MODULE_AUTHOR("Junhui Liu <junhui.liu@pigmoral.tech>");
> +MODULE_DESCRIPTION("Anlogic DR1V90 reset controller driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.54.0
> 

