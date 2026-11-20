Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795210435;
	b=YUV7iA0+SNWWF0KoPE33Wt4FVZri3O6Xl/F8pTKwAdH1XH5yE5kyRDgaCoNXrSJUsg0Q
	 1gX4ljg4se3fe5CXR0A/HrYmygWuEh9u8ZKGmHa3vyO0MhjbXVwMgNFGodZwOMdoM8gqA
	 AE5L6wmaDRsSAhzHMs5xxNogsCqJ4QIxxoXzaAAavpm1Z1oNGelLLdA3jZgNpjei2Y95s
	 SjHDfcfmq74kWuHgY9z2Kgnn2EF2vBtUL7AokL0s6x4YdHO+UoHgu72LJkl+a+zxMpMhB
	 PXsdHafSHk6OEGL18Ktm797R2MeKtyVIZhBggkNuVXy0kydzxXpaGAJulD/GH1Rcosg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=NQI7dFtW45SJmVgRHVzx21Zyb7CXJ48fgy5qE9osfjQ=;
	b=YRWOaVXLRl5CPlKEXgP9V690nAvKDJytTVsgwuuW858tBjmcwDRrlmXNz2v+wmByp0nC
	 6lpK9EqKTYZ0E6IWcCsX8FtyDzQPneADNnxbsWUkIoJ++3e8x6aAIhkKVyAh+Sftd/RwW
	 IpRmnyyufwOYbazQRcwqOLpG4v+p1LtACMWPH4Ig6HniRmlphcZgQyNhXSHLEWUDnxO0u
	 8jHFnKAKMHQF2rMD2Af/+bq8VseSNkwL8sPF3lZJzM+0yVPNskAHaOgGGuQSDpidPnU1m
	 pJtnRgCQru7931GCNPO/mCNBB24GBbhRSTg8xBhohBiu48T9AOJjiT8QhhU6HRkClmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=OQlWJhIi;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8729D606A699
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 21:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8729D606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=OQlWJhIi
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4ad587ba293so911151fac.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795210433; x=1795815233; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NQI7dFtW45SJmVgRHVzx21Zyb7CXJ48fgy5qE9osfjQ=;
        b=OQlWJhIiC0XRKcfjw1tTmgnegt6YqqTE3g+iJ4Ayb7FIkwAHpLEpusjQ+NfGO9GkEl
         IW76A+xSYfA8FCRG0kFLhM3ITqYlBBm0S+PNPUyry9CTZH5VnAxrqqrklckXGdHABVg8
         Hcf9oklA7XaPUfXXLcTe32DI8lFcRwWMaeu/DGejsunMfqlM8YOO1oP9jDm2IKYdeadH
         cqbLXpbjEi05gqbH3mMBYrQH2EQgqpAz71BAh/z8ER8rtNI3vnoxgKwskgmyi89SyCR0
         rKzuOueS4+ZReoB8/Z4wtE3L4alN4Z48MsNka63ucJcdsn8Ku3QCb/3jFZb4x7qH952U
         XDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795210433; x=1795815233;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NQI7dFtW45SJmVgRHVzx21Zyb7CXJ48fgy5qE9osfjQ=;
        b=VvM3nkagfw6S+XHf0fxoj7WyYHeWMT0tx/dFmsKe3Zq9Fp5j60ryN/KC+V11t0z0Ks
         tf48L/52RBTyO3yuoyrKHImFXwL+RX4vG3UIGP+GbocDgCwwcyYdtQZzWBkJZ9YCBb3J
         QGtAIUOytc5y2bTTAPgua4/fBW09FIVOcP013h6qXzArBCPsN+Bttrl0YUgjBPOw43Xu
         VTX5yr379UbZuscIWNECnco5d2Po3IFfVs3CK5gk/cNpR8FXuR0dymXpsdELpKGz55ak
         DekfxGaVo1Z+V5QcwxVSPHUEfNvY4G6x5IRUAIiTUytC140kDDrwralkfvD15SXQlUQT
         Tkyg==
X-Gm-Message-State: APuU4Z/iNkPmEyGEyyjWXlL7LmRbXbe0wbixk4x1UwCU3WDYB7OEq00V
	8Ve6ifHoVHg1P6gXHWdswvJNLuEO+86GMQZyg4qjDhWcHbo9cfWnPdmLwReOQfjl1Go5fbGSd5z
	m4S5YmuBKfw==
X-Gm-Gg: AZFdTZdvXGeWsIGV1ve9wLO8NEeioqI+KbqVrn7RZs2htEXCyBLHnHvFnpgqdpjY+AL
	iDSv4/IIRRSzaKb3UVLZ+YTpD64mNosX11D6BeiB3XUH4UsEhkbKDjP3O0BQ+MHjj+UHr5qf6W/
	6Ef4RRoSWKGKsMcuhYmPto1OxJDXr2fUwuWUf60RXLsFS/AQDKHUE9KDs/Tvvz6j7fxeHVLwl8R
	x2FkPsVkAn7Hspu2/kHQx6edC6MW+gdB46yAt5DzNa81bS7F1fXmRqLsTlNyxrwFhTHUm5iYPo5
	lH0IJDoyfplLxKueaB2p9PNd2EYF/lfXvr8AlGD/bPfC1Q1spg/4WIGKN3Fr3fWaeqB29WvD4t2
	C8621G+kBi4dR1VxMoNKikffgQQLTPhdKOQLsQchJj+wghprevGck3/UJ3oUtGMIZ4vxnieaRQR
	2WuEBHX2LpuQ67OWeF7zd8VJeMrhUHpYXxQzsJby1ZprV9eD/dYeAXQs5x5zA7bRSltzID5VxUC
	RMqL9bSnkpW3OZ2Jll+bednHg3HYFjfhMPC9Yn01AqXuBItGuLMj6sYrPC/uo2fdZrb9yDH4Fj4
	ruha7ub8thLuTPBZ9kqf43MBrLjUmMC6fQ==
X-Received: by 2002:a05:6870:3d8b:b0:483:cb42:3979 with SMTP id 586e51a60fabf-4bc8289cfbamr4568358fac.17.1795210433325;
        Fri, 20 Nov 2026 13:33:53 -0800 (PST)
Received: from [172.22.22.28] ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bd3008160dsm3072987fac.16.2026.11.20.13.33.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 13:33:53 -0800 (PST)
Message-ID: <51e8f08c-623f-44ad-a2ce-d7905984a6ee@riscstar.com>
Date: Fri, 20 Nov 2026 15:33:52 -0600
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: toshiba: introduce a TC9564 clock/reset
 driver
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261120183212.1264522-1-elder@riscstar.com>
 <20261120183212.1264522-3-elder@riscstar.com>
 <sashiko-outbox-225862@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <sashiko-outbox-225862@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 12:42 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issues to consider:
> - [Medium] clk: tc9564: unlocked register read-modify-write in
>    reset_manage()
> - [Medium] clk: tc9564: missing select RESET_CONTROLLER in
>    COMMON_CLK_TC9564
> - [Low] clk: tc9564: stale v1 and dt-binding text in commit message
> - [Low] clk: tc9564: duplicate clk_gate implementation in
>    gate_register()
> --

Quick summary (more below):  I will act on all of the observed
issues mentioned here.

> commit c8a057c6e9911108f130ae1447d0fae1c9ba8eff
> Author: Alex Elder <elder@kernel.org>
> 
> clk: toshiba: introduce a TC9564 clock/reset driver
> 
> This commit adds a platform driver for the clock and reset controllers on
> the Toshiba TC9564 SoC.
> 
>> Define a new platform driver that manages clocks implemented by the
>> Toshiba TC9564 SoC.  There are 21 gate clocks that can be enabled
>> and disabled, but currently only the clocks that are (or will soon
>> be) used are defined to be controllable.
>>
>> Two registers manage the state of the clocks.  The registers are
>> accessed via a regmap supplied by a system controller.  Access to
>> the memory region is provided via a BAR on a PCIe endpoint function
>> embedded in the TC9564 SoC.
>>
>> Define the binding for the clock and reset controller that present in
>> the Toshiba TC9564 SoC.
> 
> [Severity: Low]
> These first three paragraphs appear to be leftover text from v1 and the
> devicetree binding patch: the driver now maps the platform MMIO resource
> directly via devm_platform_ioremap_resource() instead of using a syscon
> regmap, and the description restarts in the fourth paragraph.

This is correct, I neglected to update the text that talked about
regmaps.  I will fix this.

I will also fix the e-mail addresses provided for Daniel and me.
I'll use the our @kernel.org addresses, to be consistent with
what's in the MAINTAINERS file.


> 
>> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
>> index 6bfa2c8fffe1b..b27807ee93863 100644
>> --- a/drivers/clk/Kconfig
>> +++ b/drivers/clk/Kconfig
>> @@ -185,6 +185,14 @@ config COMMON_CLK_CDCE706
>>   	help
>>   	  This driver supports TI CDCE706 programmable 3-PLL clock synthesizer.
>>   
>> +config COMMON_CLK_TC9564
>> +	tristate "Toshiba TC9564 clock and reset support"
>> +	depends on TC9564_PCI || COMPILE_TEST
>> +	default TC9564_PCI
>> +	help
>> +	  This enables support for the clock and reset controllers embedded
>> +	  in the Toshiba TC9564 SoC.
> 
> [Severity: Medium]
> Should COMMON_CLK_TC9564 select RESET_CONTROLLER?  Because TC9564 is a
> PCIe endpoint device, this driver can be enabled on host architectures
> that do not select ARCH_HAS_RESET_CONTROLLER.  When
> CONFIG_RESET_CONTROLLER is disabled, devm_reset_controller_register()
> compiles to a no-op stub returning 0, silently omitting the reset
> controller functionality and causing non-optional reset consumers to fail
> with -ENOTSUPP.

Yes, it should.  It passed COMPILE_TEST checks, but this
code sits outside drivers/reset so this should be selected.

> 
>> diff --git a/drivers/clk/clk-tc9564.c b/drivers/clk/clk-tc9564.c
>> new file mode 100644
>> index 0000000000000..65ed524bf2ee7
>> --- /dev/null
>> +++ b/drivers/clk/clk-tc9564.c
> 
> [ ... ]
> 
>> +static const struct reset_init reset_init[] = {
>> +	[RESET_I2C] = {
>> +		.offset = RESET0_OFFSET,
>> +		.mask = BIT(12),
>> +	},
>> +	[RESET_PCIE] = {
>> +		.offset = RESET0_OFFSET,
>> +		.mask = BIT(9),
>> +	},
>> +	[RESET_MSIGEN] = {
>> +		.offset = RESET0_OFFSET,
>> +		.mask = BIT(18),
>> +	},
>> +
>> +	[RESET_MAC0_MAC] = {
>> +		.offset = RESET0_OFFSET,
>> +		.mask = BIT(7),
>> +	},
>> +	[RESET_MAC0_PMA] = {
>> +		.offset = RESET0_OFFSET,
>> +		.mask = BIT(30),
>> +	},
>> +	[RESET_MAC0_XPCS] = {
>> +		.offset = RESET0_OFFSET,
>> +		.mask = BIT(31),
>> +	},
>> +
>> +	[RESET_MAC1_MAC] = {
>> +		.offset = RESET1_OFFSET,
>> +		.mask = BIT(7),
>> +	},
>> +	[RESET_MAC1_PMA] = {
>> +		.offset = RESET1_OFFSET,
>> +		.mask = BIT(30),
>> +	},
>> +	[RESET_MAC1_XPCS] = {
>> +		.offset = RESET1_OFFSET,
>> +		.mask = BIT(31),
>> +	},
>> +};
>> +#define RESET_COUNT	ARRAY_SIZE(reset_init)
> 
> [ ... ]
> 
>> +static const struct gate_clock *hw_to_gate_clock(struct clk_hw *hw)
>> +{
>> +	return container_of_const(hw, struct gate_clock, hw);
>> +}
>> +
>> +static int gate_clk_manage(struct clk_hw *hw, bool enable)
>> +{
>> +	struct tc9564_clock *tc9564_clock = dev_get_drvdata(clk_hw_get_dev(hw));
>> +	const struct gate_clock *clock = hw_to_gate_clock(hw);
>> +	u32 mask = clock->init->mask;
>> +	void __iomem *ioaddr;
>> +	u32 val;
>> +
>> +	ioaddr = tc9564_clock->ioaddr + clock->init->offset;
>> +
>> +	val = readl(ioaddr);
>> +	if (enable)
>> +		val |= mask;
>> +	else
>> +		val &= ~mask;
>> +	writel(val, ioaddr);
>> +
>> +	return 0;
>> +}
>> +
>> +static int gate_clk_enable(struct clk_hw *hw)
>> +{
>> +	return gate_clk_manage(hw, true);
>> +}
>> +
>> +static void gate_clk_disable(struct clk_hw *hw)
>> +{
>> +	(void)gate_clk_manage(hw, false);
>> +}
>> +
>> +static int gate_clk_is_enabled(struct clk_hw *hw)
>> +{
>> +	struct tc9564_clock *tc9564_clock = dev_get_drvdata(clk_hw_get_dev(hw));
>> +	const struct gate_clock *clock = hw_to_gate_clock(hw);
>> +	void __iomem *ioaddr;
>> +
>> +	ioaddr = tc9564_clock->ioaddr + clock->init->offset;
>> +
>> +	return readl(ioaddr) & clock->init->mask ? 1 : 0;
>> +}
>> +
>> +static const struct clk_ops gate_clk_ops = {
>> +	.enable = gate_clk_enable,
>> +	.disable = gate_clk_disable,
>> +	.is_enabled = gate_clk_is_enabled,
>> +};
>> +
>> +static struct clk_hw *gate_register(struct device *dev, const char *name,
>> +				    const struct clock_init *init)
>> +{
>> +	struct tc9564_clock *tc9564_clock = dev_get_drvdata(dev);
>> +	struct clk_init_data clk_init = { };
>> +	const struct clk_hw *parent_hw;
>> +	struct gate_clock *clock;
>> +	int ret;
>> +
>> +	clock = devm_kzalloc_obj(dev, *clock);
>> +	if (!clock)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	parent_hw = tc9564_clock->clk_data->hws[init->parent];
>> +
>> +	clk_init.name = name;
>> +	clk_init.ops = &gate_clk_ops;
>> +	clk_init.parent_hws = &parent_hw;
>> +	clk_init.num_parents = 1;
>> +	if (init->type == CRITICAL_GATE)
>> +		clk_init.flags = CLK_IS_CRITICAL;
>> +
>> +	clock->hw.init = &clk_init;
>> +	clock->init = init;
>> +
>> +	ret = devm_clk_hw_register(dev, &clock->hw);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	return &clock->hw;
>> +}
> 
> [Severity: Low]
> This isn't a bug, but now that the driver accesses MMIO registers directly
> rather than through regmap, gate_register() and gate_clk_ops duplicate the
> standard single-bit MMIO gate implementation.  Using
> devm_clk_hw_register_gate_parent_hw() (as pll_register() and
> fixed_register() do with the fixed-factor helpers) would allow dropping
> struct gate_clock and the custom gate callbacks.

This is a very good point.  Previously I avoided the standard
gate clocks *because* we were using regmap.  I will review this
but I expect to be able to use the existing code instead.

> 
>> +
>> +/* Warn on requests to assert or deassert critical resets */
>> +static bool reset_is_critical(unsigned long id)
>> +{
>> +	return WARN_ON(id == RESET_I2C) || WARN_ON(id == RESET_PCIE);
>> +}
>> +
>> +static int reset_manage(struct reset_controller_dev *rcdev,
>> +			unsigned long id, bool assert)
>> +{
>> +	struct tc9564_clock *tc9564_clock = dev_get_drvdata(rcdev->dev);
>> +	const struct reset_init *reset = &reset_init[id];
>> +	u32 mask = reset->mask;
>> +	void __iomem *ioaddr;
>> +	u32 val;
>> +
>> +	if (reset_is_critical(id))
>> +		return 0;		/* Just ignore the request */
>> +
>> +	ioaddr = tc9564_clock->ioaddr + reset->offset;
>> +
>> +	val = readl(ioaddr);
>> +	if (assert)
>> +		val |= mask;
>> +	else
>> +		val &= ~mask;
>> +	writel(val, ioaddr);
>> +
>> +	return 0;
>> +}
> 
> [Severity: Medium]
> Can concurrent reset operations on lines sharing RESET0_OFFSET or
> RESET1_OFFSET race in reset_manage()?

I hadn't considered that, but yes, we could be exercising this
code concurrently, so a spin lock should be used.

Great review feedback!

					-Alex

> 
> Unlike the clock framework (which holds enable_lock across enable and
> disable callbacks), the reset controller core only acquires a
> per-reset-control SRCU read lock in reset_control_assert() and
> reset_control_deassert().  Two consumers asserting or deasserting
> different resets in the same register (such as RESET_MSIGEN and
> RESET_MAC0_MAC in RESET0_OFFSET) can perform concurrent read-modify-write
> sequences and overwrite each other's bit changes.  A spinlock in struct
> tc9564_clock around the readl()/writel() sequence in reset_manage() would
> prevent this.

