Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BDE2D5C68
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 09:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782121718; cv=none; b=mFVEQIzumzWshcOmjQSK6j7EiDljRGVNwffm6B+MAzKzdRQOsxF2YxStNpW85b0d78JTibfFfS2t7+49ugbFPox78PMLq8kLi1nVgX5DnkbmcgVFJ0iUByPC4k5cNSXZcBLWnlepHWcLv3R6LQcGSuAVhFnLanbop21g6fhHeSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782121718; c=relaxed/simple;
	bh=4xc5Kzrp6peOB528xcC8p86lgC0NwDdqu7Etv1FVpQQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l8yX37kv+yBgIy1ghmZ0G9ZoY8koLBm3dopwakktyRHGAqETMvjwxjYRUNfoXMuR8MSOBXI2YEC1TJqDWcQANw0iw1RyPeL0qqJVMWk6B4qGCUAGvgNRf2qqJLen5xKTpH90TQGE5QFU4SRVN/XPCHIvJi39AFX2UOiKZ15gbyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DA3UyqUj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DA3UyqUj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 869CE1F000E9;
	Mon, 22 Jun 2026 09:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782121716;
	bh=SRFpGCgwjrAskeh6pbO5IO2gRzGTpuC1M04DWmzHGgM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DA3UyqUjbzhWPyo9nI3Idk7wFVL/JcG7/ZQKqgS6Yrlh19iayH29JDsOufGKkRde9
	 vzRqnhYGe2nICHy4tSBoZtIUSgeSrXaPqw7zz8idHU87Xc4G+itQGPiOcH7DBIJK5r
	 ejLcxzf64PYdUeE1bXxVtmZFrUnbizaisBOaf1T5ZW33kBfojqtUjkrEy3sgjXPCea
	 bUO3DCpPv9DPXbsu/UYOBVv8AeqbP3HMihqwODd5Vv5f20rhJAou06rHzti8UL0zbC
	 ciYIjSULXo3o/cVq35xyfqwHZjHgZiBk0TwuCjgaySqY44mgf39McW7WoPyHakTILz
	 o5hXBbi5EEX4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] gpio: realtek: Add driver for Realtek DHC
 RTD1625 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260622092335.1166876-4-eleanor.lin@realtek.com>
References: <20260622092335.1166876-1-eleanor.lin@realtek.com>
 <20260622092335.1166876-4-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 09:48:36 +0000
Message-Id: <20260622094836.869CE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Incorrect hardware configuration and filtering for IRQ_TYPE_EDGE_B=
OTH causes missed falling edges and spurious double-interrupts.
- [High] Unmapped level interrupts are not masked, causing an infinite inte=
rrupt storm.
- [High] Clearing the hardware interrupt status in the .irq_unmask callback=
 causes lost edge interrupts.
- [Medium] The driver uses a global raw_spinlock_irqsave for all register a=
ccesses, causing severe unnecessary contention.
--

commit 2c67ad7ec485f951d81fe09ef1853cbf7ebd2d95
Author: Tzuyi Chang <tychang@realtek.com>

gpio: realtek: Add driver for Realtek DHC RTD1625 SoC

Add support for the GPIO controller found on Realtek DHC RTD1625 SoCs.
The RTD1625 introduces a per-pin register architecture with a dedicated
32-bit control register per GPIO line. Interrupt support is optional.

> diff --git a/drivers/gpio/gpio-rtd1625.c b/drivers/gpio/gpio-rtd1625.c
> new file mode 100644
> index 0000000000000..409e540bf40b3
> --- /dev/null
> +++ b/drivers/gpio/gpio-rtd1625.c

[ ... ]

> +static int rtd1625_gpio_set(struct gpio_chip *chip, unsigned int offset,=
 int value)
> +{
> +	struct rtd1625_gpio *data =3D gpiochip_get_data(chip);
> +	u32 val =3D RTD1625_GPIO_WREN(RTD1625_GPIO_OUT);
> +
> +	if (value)
> +		val |=3D RTD1625_GPIO_OUT;
> +
> +	guard(raw_spinlock_irqsave)(&data->lock);
> +
> +	writel_relaxed(val, data->base + GPIO_CONTROL(offset));
> +
> +	return 0;
> +}
> +
> +static int rtd1625_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +	struct rtd1625_gpio *data =3D gpiochip_get_data(chip);
> +	u32 val;
> +
> +	guard(raw_spinlock_irqsave)(&data->lock);
> +
> +	val =3D readl_relaxed(data->base + GPIO_CONTROL(offset));

[Severity: Medium]
Since the RTD1625 hardware features a dedicated control register per GPIO
line and uses a Write-Enable bitmask design, do we need this global raw
spinlock?

It seems updates to individual bits are independent and atomic, and
readl_relaxed is inherently an atomic bus operation. Does wrapping these
operations in a single global lock across all 166 GPIOs unnecessarily
serialize all GPIO operations globally?

[ ... ]

> +static void rtd1625_gpio_irq_handle(struct irq_desc *desc)
> +{

[ ... ]

> +		for_each_set_bit(j, &status, 32) {
> +			hwirq =3D i + j;
> +			girq =3D irq_find_mapping(domain, hwirq);
> +			irq_type =3D irq_get_trigger_type(girq);

[Severity: High]
If a level interrupt fires on a pin that has no mapping (for example, if it
was left enabled by the bootloader), irq_find_mapping() returns 0 and
generic_handle_domain_irq() will return -EINVAL.

Because the child handler is never invoked, the active level interrupt is
never cleared or masked. Once the parent IRQ is unmasked, will the pending
level interrupt immediately re-trigger and cause an interrupt storm?

> +
> +			/*
> +			 * Filter out the hardware-forced de-assert interrupt unless
> +			 * the user explicitly requested IRQ_TYPE_EDGE_BOTH.
> +			 */
> +			if (irq =3D=3D data->irqs[RTD1625_IRQ_DEASSERT] &&
> +			    irq_type !=3D IRQ_TYPE_EDGE_BOTH)
> +				continue;
> +
> +			generic_handle_domain_irq(domain, hwirq);
> +		}

[Severity: High]
For IRQ_TYPE_EDGE_BOTH, does this filter intentionally let the duplicate
de-assert interrupt through?

Due to the hardware quirk where a single edge triggers both the assert and
de-assert IRQ lines, it appears this would cause generic_handle_domain_irq()
to be called twice sequentially for the exact same physical rising edge.

[ ... ]

> +static void rtd1625_gpio_enable_edge_irq(struct rtd1625_gpio *data, irq_=
hw_number_t hwirq)
> +{
> +	int gpda_reg_offset =3D rtd1625_gpio_gpda_offset(data, hwirq);
> +	int gpa_reg_offset =3D rtd1625_gpio_gpa_offset(data, hwirq);
> +	u32 clr_mask =3D BIT(hwirq % 32);
> +	u32 val;
> +
> +	guard(raw_spinlock_irqsave)(&data->lock);
> +
> +	writel_relaxed(clr_mask, data->irq_base + gpa_reg_offset);
> +	writel_relaxed(clr_mask, data->irq_base + gpda_reg_offset);
> +	val =3D RTD1625_GPIO_EDGE_INT_EN | RTD1625_GPIO_WREN(RTD1625_GPIO_EDGE_=
INT_EN);
> +	writel_relaxed(val, data->base + GPIO_CONTROL(hwirq));
> +}

[Severity: High]
This explicitly clears any pending hardware interrupts. Since this function
is called via the irq_unmask callback (mapped to rtd1625_gpio_enable_irq),
will this cause edge interrupts to be permanently lost if a hardware edge
occurs while the IRQ is temporarily masked?

Could status clearing be restricted to irq_startup or irq_ack?

[ ... ]

> +static int rtd1625_gpio_irq_set_type(struct irq_data *d, unsigned int ty=
pe)
> +{
> +	switch (type & IRQ_TYPE_SENSE_MASK) {
> +	case IRQ_TYPE_EDGE_RISING:
> +		return rtd1625_gpio_irq_set_edge_type(d, 1);
> +
> +	case IRQ_TYPE_EDGE_FALLING:
> +		return rtd1625_gpio_irq_set_edge_type(d, 0);
> +
> +	case IRQ_TYPE_EDGE_BOTH:
> +		return rtd1625_gpio_irq_set_edge_type(d, 1);

[Severity: High]
Does this map IRQ_TYPE_EDGE_BOTH to the exact same hardware polarity
configuration as IRQ_TYPE_EDGE_RISING?

It seems the hardware will only detect rising edges and completely miss
falling edges. When combined with the filter in rtd1625_gpio_irq_handle(),
does EDGE_BOTH miss all falling edges and duplicate all rising edges?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622092335.1166=
876-1-eleanor.lin@realtek.com?part=3D3
