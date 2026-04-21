Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E685F1CAA6C
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 15:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776784877; cv=none; b=BtZETIGmhl/kIpSl39bKMdb9FVvkEYBCp08F/X8txp7MqSykmEVbvL5FmNO4+LGhmI9ZucCSYamrP/z9lPLus2YpFcQgfCtSPrJDYo7KRuMAzf2duo0Vs77ligMdKgPEYK5bTXYZscUawhbYbApezydBqGYpyG6JPzobtUB9QfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776784877; c=relaxed/simple;
	bh=j23MWxMC1Q4KJkN7MQ9ZKHi37ryxlDpsFhX89zDztzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKE6qZyck3OP1sMXxQuFgqUeooddMEI/1Eh/EDW51AgK3qg+zWJul+pDEjXcfWRWQBtYHtZNeoYWc7/9/ZtR1q6o3T9beZQHUmnn+0w+3gF0ldIBZleBrJNlfWI8beqUCrVc9DgR5U0rqyN2qnD3vzRmDQ0zb3OyQ2hc2V9qU1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gQEdstuT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JEQ7KI5T; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gQEdstuT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JEQ7KI5T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776784875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BUAGAeOp951oYwbZjsZkGTBz5UuBwAzn8+DwAgWxNW4=;
	b=gQEdstuThEDxtfVY+tJ4pBu23YGOzkBUuSNOpinDSI36ytm77qxY5fOW40CaD5B0dfO5ch
	VRuIDm1IzcqUZK/hPXAvtD0e7WQcr9kdyY7WTHKvvl9fv1laGiJCY3NVoYq71O79iSLmEJ
	EB8JjgKVqyD1CyO5k0+toMOmvSMU074=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-AhJZdZk9Nye_uSlk7HhbSQ-1; Tue, 21 Apr 2026 11:21:11 -0400
X-MC-Unique: AhJZdZk9Nye_uSlk7HhbSQ-1
X-Mimecast-MFC-AGG-ID: AhJZdZk9Nye_uSlk7HhbSQ_1776784871
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8aca14d1faaso96605466d6.3
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 08:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776784871; x=1777389671; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUAGAeOp951oYwbZjsZkGTBz5UuBwAzn8+DwAgWxNW4=;
        b=JEQ7KI5TI2wdNTm6KiIvKePs/2vFuNhuUHDbTf5WOKcLHQt9exwPQYkFrSg5hOu2c1
         WPmw5ChrWIAcq3rfE2xoo8B4lLvzTfTmhbsCv3gwEqD84t5u14J1ge+aElB8FQDtlBlZ
         Bn8CtbJkq9X0fbxADXemP4H0AUcqdsG1jM7PL7gJPmbYvS5yue0y2Ch6vAAfEkTxhffL
         /TCiAU/q7P+dFjuHXfQSa09V9WM0zbSXhC4ab8wuBYz6WoRLCSDkJP9JVCjTxf6A8v3D
         4F+jFGak7m1bDCIYdLksFKyXFXAFHw22EIFQpnh8SgJXM1hN+Bf8XXmD9R1snLO5ho++
         2b6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776784871; x=1777389671;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BUAGAeOp951oYwbZjsZkGTBz5UuBwAzn8+DwAgWxNW4=;
        b=MkYV4pFY1OCnMH3LtrxcjZ/52h7EkzoDwmYylM9m65tzQ2pYaugp89FgWCQizbGcga
         D7KwzP7ouMJHLPphLUUf3lyMr82itW/Vqu3KpqtvekOhTQJIu4dPsIXgBPWIBbgZpPQf
         aDgM3Kl7Di+1YCACQnm3oNf7lnKvXjg2OGbO+yGrXXw86mOf++/k6iAvi7V/jpt8PFzT
         1iRhG/z4kP4Cabg3Cc5WeXq8ueao+vOH9If07jTJuGjvmZs7glCrJwCv6N+kPe/HEEMS
         Ou8/jynkTHWxUU4b3kgvUJPV05icXV+Tj78gPwbbl9JaMsjnczCFevGNtoZ2fREPXbe7
         dRJA==
X-Forwarded-Encrypted: i=1; AFNElJ/iMd3PlTjRXFn4f8VsRFGOqYzP+J8+4juZjM84xrJ+5VVWtO9sfl64sfmeCNXrRLGx10J7I1CYE3Ra@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9vz6f2I9AX4jkHcdrQfnL1sZNI2qaFZBkPf9xRK0ic3bY53me
	D9fM2yxMVTOFe72ShnRAth+jEtTapxwIbepMsWqrEVnHchbuQfs0mbHWTHzuAICebMYEQP8HZx5
	kIZawMLPN5M8At/rvRjqIeSPo9p7B7Ykif6Y6BUBAvZX6f2S+4R0xXU9VQJUPeKw=
X-Gm-Gg: AeBDiesU7Gv0l2cQzQ40ArEVgR0qwTQd5uKZ7dQQa3a2GicBug/1uaNgAraoQAc9pEz
	zqXuPZI3CBsuN+Y3PZzk1SkuFAeX5R4Z2lgQo+VBcFOyP6aoM2EtFzHHa/LbD5X7psbRk/bd17W
	E++p/6CcTqtPsv5HUIUGOc4xXsAllDTc9S+NV6z3cm+MqsHSwRC0c+Lqt8QM9CxmK3Kcj9aFtM/
	Tn4zOvoZv+eqPVEFu0I/YUp761LnF9KwNek6GIZGKAlb/bt2lplkxLLB2ddBYRz7mS0PSskQ+5Y
	1eRu6T3slpDO06iOpsFvV7cDMiBLM7ZN6TIsBTJvJRHRtZY0u0wUKgwpnNSLIvbSKGdwDdmaxKo
	zTGXB2lsl2Kxud7NuPUuFHItGeGa0NdTEjqK0LoMSNz8xoEsQEjYWKmLFoGhe/E88p10=
X-Received: by 2002:a05:6214:29e9:b0:89c:4cb3:4ea1 with SMTP id 6a1803df08f44-8b0280b40b1mr308736726d6.20.1776784871075;
        Tue, 21 Apr 2026 08:21:11 -0700 (PDT)
X-Received: by 2002:a05:6214:29e9:b0:89c:4cb3:4ea1 with SMTP id 6a1803df08f44-8b0280b40b1mr308736026d6.20.1776784870354;
        Tue, 21 Apr 2026 08:21:10 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae5ec2dsm109396226d6.29.2026.04.21.08.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:21:09 -0700 (PDT)
Date: Tue, 21 Apr 2026 11:21:07 -0400
From: Brian Masney <bmasney@redhat.com>
To: dongxuyang@eswincomputing.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de, huangyifeng@eswincomputing.com,
	benoit.monin@bootlin.com, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: [PATCH v2 2/3] clk: eswin: Add eic7700 HSP clock driver
Message-ID: <aeeV44LihyBpCd0T@redhat.com>
References: <20260420093929.1895-1-dongxuyang@eswincomputing.com>
 <20260420094734.2392-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420094734.2392-1-dongxuyang@eswincomputing.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Xuyang,

On Mon, Apr 20, 2026 at 05:47:34PM +0800, dongxuyang@eswincomputing.com wrote:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
> 
> Add driver for the ESWIN EIC7700 high-speed peripherals system
> clock controller and register an auxiliary device for system
> reset controller which is named as "hsp-reset".
> 
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
> ---
>  drivers/clk/eswin/Kconfig           |  12 +
>  drivers/clk/eswin/Makefile          |   1 +
>  drivers/clk/eswin/clk-eic7700-hsp.c | 385 ++++++++++++++++++++++++++++
>  3 files changed, 398 insertions(+)
>  create mode 100644 drivers/clk/eswin/clk-eic7700-hsp.c
> 
> diff --git a/drivers/clk/eswin/Kconfig b/drivers/clk/eswin/Kconfig
> index 0406ec499ec9..e6cc2a407bac 100644
> --- a/drivers/clk/eswin/Kconfig
> +++ b/drivers/clk/eswin/Kconfig
> @@ -13,3 +13,15 @@ config COMMON_CLK_EIC7700
>  	  SoC. The clock controller generates and supplies clocks to various
>  	  peripherals within the SoC.
>  	  Say yes here to support the clock controller on the EIC7700 SoC.
> +
> +config COMMON_CLK_EIC7700_HSP
> +	tristate "EIC7700 HSP Clock Driver"
> +	depends on ARCH_ESWIN || COMPILE_TEST
> +	select AUXILIARY_BUS
> +	select COMMON_CLK_EIC7700
> +	select RESET_EIC7700_HSP if RESET_CONTROLLER
> +	help
> +	  This driver provides support for clock controller on ESWIN EIC7700
> +	  HSP. The clock controller generates and supplies clocks to high
> +	  speed peripherals within the SoC.
> +	  Say yes here to support the clock controller on the EIC7700 HSP.
> diff --git a/drivers/clk/eswin/Makefile b/drivers/clk/eswin/Makefile
> index 4a7c2af82164..21a09a3396df 100644
> --- a/drivers/clk/eswin/Makefile
> +++ b/drivers/clk/eswin/Makefile
> @@ -6,3 +6,4 @@
>  obj-$(CONFIG_COMMON_CLK_ESWIN)		+= clk.o
> 
>  obj-$(CONFIG_COMMON_CLK_EIC7700)	+= clk-eic7700.o
> +obj-$(CONFIG_COMMON_CLK_EIC7700_HSP)	+= clk-eic7700-hsp.o
> diff --git a/drivers/clk/eswin/clk-eic7700-hsp.c b/drivers/clk/eswin/clk-eic7700-hsp.c
> new file mode 100644
> index 000000000000..d8f5493b45e7
> --- /dev/null
> +++ b/drivers/clk/eswin/clk-eic7700-hsp.c
> @@ -0,0 +1,385 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2026, Beijing ESWIN Computing Technology Co., Ltd..
> + * All rights reserved.
> + *
> + * ESWIN EIC7700 HSP Clock Driver
> + *
> + * Authors: Xuyang Dong <dongxuyang@eswincomputing.com>
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/eswin,eic7700-hspcrg.h>
> +
> +#include "common.h"
> +
> +#define EIC7700_HSP_SATA_REG		0x300
> +#define EIC7700_HSP_MSHC0_REG		0x510
> +#define EIC7700_HSP_MSHC1_REG		0x610
> +#define EIC7700_HSP_MSHC2_REG		0x710
> +#define EIC7700_HSP_USB0_REG		0x800
> +#define EIC7700_HSP_USB0_REF_REG	0x83c
> +#define EIC7700_HSP_USB1_REG		0x900
> +#define EIC7700_HSP_USB1_REF_REG	0x93c
> +
> +#define USB_REF_XTAL24M			0x2a
> +#define EIC7700_HSP_NR_CLKS		(EIC7700_HSP_CLK_GATE_SATA + 1)
> +
> +struct eic7700_hsp_clk_gate {
> +	struct clk_hw hw;
> +	unsigned int id;
> +	void __iomem *reg;
> +	void __iomem *ref_reg;
> +	const char *name;
> +	const struct clk_parent_data *parent_data;
> +	unsigned long flags;
> +	unsigned long offset;
> +	unsigned long ref_offset;
> +	u8 bit_idx;
> +	u8 gate_flags;

Is this used anywhere?

> +	spinlock_t *lock; /* protect register read-modify-write cycle */
> +};
> +
> +/*
> + * The USB clock gate (hsp_clk_gate_endisable) and the reset driver both
> + * perform read-modify-write cycles on registers 0x800 and 0x900. Use
> + * custom regmap lock callbacks so that regmap operations hold data->lock
> + * with IRQs disabled, the same lock the clock gate path uses, preventing
> + * concurrent RMW races on those shared registers.
> + */
> +struct eic7700_hsp_regmap_lock {
> +	spinlock_t *lock; /* protect register read-modify-write cycle */
> +	unsigned long flags;
> +};
> +
> +static void eic7700_hsp_regmap_lock_fn(void *arg)

You can add an __acquires to the declaration here. See
dio48e_regmap_lock() in drivers/gpio/gpio-104-dio-48e.c for an example.

> +{
> +	struct eic7700_hsp_regmap_lock *ctx = arg;
> +
> +	spin_lock_irqsave(ctx->lock, ctx->flags);
> +}
> +
> +static void eic7700_hsp_regmap_unlock_fn(void *arg)
> +{
> +	struct eic7700_hsp_regmap_lock *ctx = arg;
> +
> +	spin_unlock_irqrestore(ctx->lock, ctx->flags);
> +}
> +
> +static inline struct eic7700_hsp_clk_gate *to_gate_clk(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct eic7700_hsp_clk_gate, hw);
> +}
> +
> +#define EIC7700_HSP_GATE(_id, _name, _pdata, _flags, _offset, _idx,	\
> +			 _ref_offset)					\
> +	{								\
> +		.id		= _id,					\
> +		.name		= _name,				\
> +		.parent_data	= _pdata,				\
> +		.flags		= _flags,				\
> +		.offset		= _offset,				\
> +		.ref_offset	= _ref_offset,				\
> +		.bit_idx	= _idx,					\
> +	}
> +
> +static void hsp_clk_gate_endisable(struct clk_hw *hw, int enable)
> +{
> +	struct eic7700_hsp_clk_gate *gate = to_gate_clk(hw);
> +	u32 reg;
> +
> +	guard(spinlock_irqsave)(gate->lock);
> +
> +	reg = readl(gate->reg);
> +
> +	if (enable)
> +		reg |= BIT(gate->bit_idx);
> +	else
> +		reg &= ~BIT(gate->bit_idx);
> +
> +	/*
> +	 * Hardware bug: The reference clock is 24MHz, but the reference clock
> +	 * register reset to an incorrect default value.
> +	 * Workaround: Rewrite the correct value before enabling/disabling
> +	 * the gate clock.
> +	 */
> +	writel(USB_REF_XTAL24M, gate->ref_reg);
> +	writel(reg, gate->reg);

Does this only needed on the enable path? Or is this still needed on the
disable path if there are other clocks referencing the parent?

> +}
> +
> +static int hsp_clk_gate_enable(struct clk_hw *hw)
> +{
> +	hsp_clk_gate_endisable(hw, 1);
> +
> +	return 0;
> +}
> +
> +static void hsp_clk_gate_disable(struct clk_hw *hw)
> +{
> +	hsp_clk_gate_endisable(hw, 0);
> +}
> +
> +static int hsp_clk_gate_is_enabled(struct clk_hw *hw)
> +{
> +	struct eic7700_hsp_clk_gate *gate = to_gate_clk(hw);
> +	u32 reg;
> +
> +	reg = readl(gate->reg);
> +	reg &= BIT(gate->bit_idx);
> +
> +	return reg ? 1 : 0;

You can simplify this to:

  return !!(readl(gate->reg) & BIT(gate->bit_idx));                                                                                                                                                 

> +}
> +
> +static const struct clk_ops hsp_clk_gate_ops = {
> +	.enable = hsp_clk_gate_enable,
> +	.disable = hsp_clk_gate_disable,
> +	.is_enabled = hsp_clk_gate_is_enabled,
> +};
> +
> +static struct clk_hw *
> +hsp_clk_register_gate(struct device *dev, unsigned int id, const char *name,
> +		      const struct clk_parent_data *parent_data,
> +		      unsigned long flags, void __iomem *reg,
> +		      void __iomem *ref_reg, u8 bit_idx, u8 clk_gate_flags,
> +		      spinlock_t *lock)
> +{
> +	struct eic7700_hsp_clk_gate *gate;
> +	struct clk_init_data init = {};
> +	struct clk_hw *hw;
> +	int ret;
> +
> +	gate = devm_kzalloc(dev, sizeof(*gate), GFP_KERNEL);
> +	if (!gate)
> +		return ERR_PTR(-ENOMEM);
> +
> +	init.name = name;
> +	init.ops = &hsp_clk_gate_ops;
> +	init.flags = flags;
> +	init.parent_data = parent_data;
> +	init.num_parents = 1;
> +
> +	gate->id = id;
> +	gate->reg = reg;
> +	gate->ref_reg = ref_reg;
> +	gate->bit_idx = bit_idx;
> +	gate->gate_flags = clk_gate_flags;
> +	gate->lock = lock;
> +	gate->hw.init = &init;
> +
> +	hw = &gate->hw;
> +	ret = devm_clk_hw_register(dev, hw);
> +	if (ret)
> +		hw = ERR_PTR(ret);
> +
> +	return hw;
> +}
> +
> +static const struct clk_parent_data hsp_cfg[] = {
> +	{ .index = 0 }
> +};
> +
> +static const struct clk_parent_data hsp_mmc[] = {
> +	{ .index = 1 }
> +};
> +
> +static const struct clk_parent_data hsp_usb_sata[] = {
> +	{ .index = 2 }
> +};
> +
> +static struct eswin_fixed_factor_clock eic7700_hsp_factor_clks[] = {
> +	ESWIN_FACTOR(EIC7700_HSP_CLK_FAC_CFG_DIV2, "factor_hsp_cfg_div2",
> +		     hsp_cfg, 1, 2, 0),
> +	ESWIN_FACTOR(EIC7700_HSP_CLK_FAC_CFG_DIV4, "factor_hsp_cfg_div4",
> +		     hsp_cfg, 1, 4, 0),
> +	ESWIN_FACTOR(EIC7700_HSP_CLK_FAC_MMC_DIV10, "factor_hsp_mmc_div10",
> +		     hsp_mmc, 1, 10, 0),
> +};
> +
> +static struct eswin_gate_clock eic7700_hsp_gate_clks[] = {
> +	ESWIN_GATE(EIC7700_HSP_CLK_GATE_SATA, "gate_clk_hsp_sata", hsp_usb_sata,
> +		   CLK_SET_RATE_PARENT, EIC7700_HSP_SATA_REG, 28, 0),
> +	ESWIN_GATE(EIC7700_HSP_CLK_GATE_MSHC0_TMR, "gate_clk_hsp_mshc0_tmr",
> +		   hsp_mmc, CLK_SET_RATE_PARENT, EIC7700_HSP_MSHC0_REG, 8, 0),
> +	ESWIN_GATE(EIC7700_HSP_CLK_GATE_MSHC1_TMR, "gate_clk_hsp_mshc1_tmr",
> +		   hsp_mmc, CLK_SET_RATE_PARENT, EIC7700_HSP_MSHC1_REG, 8, 0),
> +	ESWIN_GATE(EIC7700_HSP_CLK_GATE_MSHC2_TMR, "gate_clk_hsp_mshc2_tmr",
> +		   hsp_mmc, CLK_SET_RATE_PARENT, EIC7700_HSP_MSHC2_REG, 8, 0),
> +};
> +
> +static struct eic7700_hsp_clk_gate eic7700_hsp_spec_gate_clks[] = {
> +	EIC7700_HSP_GATE(EIC7700_HSP_CLK_GATE_USB0, "gate_clk_hsp_usb0",
> +			 hsp_usb_sata, CLK_SET_RATE_PARENT,
> +			 EIC7700_HSP_USB0_REG, 28, EIC7700_HSP_USB0_REF_REG),
> +	EIC7700_HSP_GATE(EIC7700_HSP_CLK_GATE_USB1, "gate_clk_hsp_usb1",
> +			 hsp_usb_sata, CLK_SET_RATE_PARENT,
> +			 EIC7700_HSP_USB1_REG, 28, EIC7700_HSP_USB1_REF_REG),
> +};
> +
> +static const struct clk_parent_data mux_mmc_3mux1_p[] = {
> +	{ .fw_name = "cfg" },
> +	{ .hw = &eic7700_hsp_factor_clks[0].hw },
> +	{ .hw = &eic7700_hsp_factor_clks[1].hw },
> +};
> +
> +static const struct clk_parent_data mux_mmc_2mux1_p[] = {
> +	{ .fw_name = "mmc" },
> +	{ .hw = &eic7700_hsp_factor_clks[2].hw },
> +};
> +
> +static u32 mux_mmc_3mux1_tbl[] = { 0x0, 0x1, 0x3 };
> +
> +static struct eswin_mux_clock eic7700_hsp_mux_clks[] = {
> +	ESWIN_MUX_TBL(EIC7700_HSP_CLK_MUX_EMMC_3MUX1, "mux_hsp_emmc_3mux1",
> +		      mux_mmc_3mux1_p, ARRAY_SIZE(mux_mmc_3mux1_p),
> +		      CLK_SET_RATE_PARENT, EIC7700_HSP_MSHC0_REG, 16, 2, 0,
> +		      mux_mmc_3mux1_tbl),
> +	ESWIN_MUX_TBL(EIC7700_HSP_CLK_MUX_SD0_3MUX1, "mux_hsp_sd0_3mux1",
> +		      mux_mmc_3mux1_p, ARRAY_SIZE(mux_mmc_3mux1_p),
> +		      CLK_SET_RATE_PARENT, EIC7700_HSP_MSHC1_REG, 16, 2, 0,
> +		      mux_mmc_3mux1_tbl),
> +	ESWIN_MUX_TBL(EIC7700_HSP_CLK_MUX_SD1_3MUX1, "mux_hsp_sd1_3mux1",
> +		      mux_mmc_3mux1_p, ARRAY_SIZE(mux_mmc_3mux1_p),
> +		      CLK_SET_RATE_PARENT, EIC7700_HSP_MSHC2_REG, 16, 2, 0,
> +		      mux_mmc_3mux1_tbl),
> +	ESWIN_MUX(EIC7700_HSP_CLK_MUX_EMMC_CQE_2MUX1, "mux_hsp_emmc_cqe_2mux1",
> +		  mux_mmc_2mux1_p, ARRAY_SIZE(mux_mmc_2mux1_p),
> +		  CLK_SET_RATE_PARENT, EIC7700_HSP_MSHC0_REG, 0, 1, 0),
> +	ESWIN_MUX(EIC7700_HSP_CLK_MUX_SD0_CQE_2MUX1, "mux_hsp_sd0_cqe_2mux1",
> +		  mux_mmc_2mux1_p, ARRAY_SIZE(mux_mmc_2mux1_p),
> +		  CLK_SET_RATE_PARENT, EIC7700_HSP_MSHC1_REG, 0, 1, 0),
> +	ESWIN_MUX(EIC7700_HSP_CLK_MUX_SD1_CQE_2MUX1, "mux_hsp_sd1_cqe_2mux1",
> +		  mux_mmc_2mux1_p, ARRAY_SIZE(mux_mmc_2mux1_p),
> +		  CLK_SET_RATE_PARENT, EIC7700_HSP_MSHC2_REG, 0, 1, 0),
> +};
> +
> +static struct eswin_clk_info eic7700_hsp_clks[] = {
> +	ESWIN_GATE_TYPE(EIC7700_HSP_CLK_GATE_EMMC, "gate_clk_hsp_emmc",
> +			EIC7700_HSP_CLK_MUX_EMMC_3MUX1,
> +			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +			EIC7700_HSP_MSHC0_REG, 24, 0),
> +	ESWIN_GATE_TYPE(EIC7700_HSP_CLK_GATE_SD0, "gate_clk_hsp_sd0",
> +			EIC7700_HSP_CLK_MUX_SD0_3MUX1,
> +			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +			EIC7700_HSP_MSHC1_REG, 24, 0),
> +	ESWIN_GATE_TYPE(EIC7700_HSP_CLK_GATE_SD1, "gate_clk_hsp_sd1",
> +			EIC7700_HSP_CLK_MUX_SD1_3MUX1,
> +			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +			EIC7700_HSP_MSHC2_REG, 24, 0),
> +};
> +
> +static int eic7700_hsp_clk_probe(struct platform_device *pdev)
> +{
> +	struct eic7700_hsp_regmap_lock *lock_ctx;
> +	struct device *dev = &pdev->dev;
> +	struct auxiliary_device *adev;
> +	struct eswin_clock_data *data;
> +	struct regmap *regmap;
> +	struct clk_hw *hw;
> +	int i, ret;
> +
> +	data = eswin_clk_init(pdev, EIC7700_HSP_NR_CLKS);
> +	if (IS_ERR(data))
> +		return dev_err_probe(dev, PTR_ERR(data),
> +				     "failed to get clk data!\n");
> +
> +	lock_ctx = devm_kzalloc(dev, sizeof(*lock_ctx), GFP_KERNEL);
> +	if (!lock_ctx)
> +		return dev_err_probe(dev, -ENOMEM,
> +				     "failed to alloc regmap lock ctx\n");
> +
> +	lock_ctx->lock = &data->lock;
> +	const struct regmap_config eic7700_hsp_regmap_config = {
> +		.reg_bits = 32,
> +		.val_bits = 32,
> +		.max_register = 0x1ffc,
> +		.reg_stride = 4,
> +		.lock = eic7700_hsp_regmap_lock_fn,
> +		.unlock = eic7700_hsp_regmap_unlock_fn,
> +		.lock_arg = lock_ctx,
> +	};

So this is valid C99 with the const struct declared here. This can't be
moved outside the probe function because of the lock_ctx. I would drop
the const, declare eic7700_hsp_regmap_config as a regular variable at
the top. Similar to what's done in drivers/gpio/gpio-104-dio-48e.c with
dio48e_regmap_config.

Brian

