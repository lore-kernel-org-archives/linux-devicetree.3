Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59509357CFA
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782983778; cv=none; b=L1RsyXCVVUx+ryodx854aXxsEchNa0iOAf9LvviBwVfjdIpF/HmoDMiLCsqvtnzGY1MGKQ5u8CuA95MiAbLDPjZi4z1whYgYFv2eMyivfjYgrGhbqti1ml9MWyGYAhmpDIqeI9d/Hm61GAqqN2okhsUVLs3tDZoAebBLmjQ0p+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782983778; c=relaxed/simple;
	bh=9lP4WZl+My2EqHnu2HYzTjfVpiAN91JRvSWJizSaRaA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Oe85rH9996mZTU0ZwwdF4K+SYPBYw22G0xdKdFw19Oqi4FRvbFTd+Px/UkjQuSNDPYLQTRZYZAIGyIRi69i7BNIMxDOWKJ5eIrEJ+QbyC3zaOAdcmC6BXlwp3fFpHr4rzwp210yVXPdUgfGj6G3an0XZrHDOSRotbSqSsFMOTqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EUDKcmHX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EUDKcmHX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B16081F000E9;
	Thu,  2 Jul 2026 09:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782983777;
	bh=sxyDinjyNxN3IuKwCdyUTrKFGGNilM5rlnzj/8NECPg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EUDKcmHXJiNCrp+Q5ZcAxZoo0sD+/LB0Q/L6rob860xMimHnjKCoADP0ho7Ov1c9O
	 c3RTg25FMf5c5jWIVcKAgYZg7L15/wyUfhgHR9vYUgfil/OzeZqvm97YVL0woTZuId
	 MTqdmFBbiMxJSOWIN5qjojj6tDCxe3ej/jCI0CyuKUeMfDh89B2DowRkGjaPOzsphO
	 9psEBxArqXrdYic5nqYelRR/6F6ewwatMiTaD2SlW1g0UoBIDPfTOiw+qSUWKoulNS
	 03uKbnw/Ep4HnagmkfwuD9pkP4IqswZfoIfex2tAirvzTPpUwzua9qHCFznRdGes07
	 Jkaf0FjKUL0bA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/4] gpio: realtek: Add driver for Realtek DHC
 RTD1625 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260702090115.2564318-4-eleanor.lin@realtek.com>
References: <20260702090115.2564318-1-eleanor.lin@realtek.com>
 <20260702090115.2564318-4-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 09:16:16 +0000
Message-Id: <20260702091616.B16081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Incorrect implementation of IRQ_TYPE_EDGE_BOTH causes double-dispa=
tch on rising edges and missed falling edges.
- [High] Missing bounds check on computed hwirq causes out-of-bounds proces=
sing and infinite interrupt storms.
- [High] Missing interrupt enable sanitization and flawed mask/ack logic ca=
uses kernel hangs from bootloader-enabled interrupts.
- [Medium] The driver returns -ENOTSUPP for a debounce value of 0, breaking=
 standard API requests to disable debouncing.
--

commit 70be814576adfb9c031580980614a470a5f6afe1
Author: Tzuyi Chang <tychang@realtek.com>
Subject: gpio: realtek: Add driver for Realtek DHC RTD1625 SoC

This commit introduces a new GPIO driver for the Realtek DHC RTD1625 SoC,
which uses a per-pin register architecture. It supports basic GPIO operatio=
ns
and optional interrupt handling, addressing a hardware quirk where both
assert and de-assert interrupts fire simultaneously on edge toggles.

> diff --git a/drivers/gpio/gpio-rtd1625.c b/drivers/gpio/gpio-rtd1625.c
> new file mode 100644
> index 0000000000000..27af1ac65d281
> --- /dev/null
> +++ b/drivers/gpio/gpio-rtd1625.c
[ ... ]
> +static int rtd1625_gpio_set_debounce(struct gpio_chip *chip, unsigned in=
t offset,
> +				     unsigned int debounce)
> +{
> +	struct rtd1625_gpio *data =3D gpiochip_get_data(chip);
> +	u8 deb_val;
> +	u32 val;
> +
> +	switch (debounce) {
> +	case 1:
> +		deb_val =3D RTD1625_GPIO_DEBOUNCE_1US;
> +		break;
[ ... ]
> +	case 50000:
> +		deb_val =3D RTD1625_GPIO_DEBOUNCE_50MS;
> +		break;
> +	default:
> +		return -ENOTSUPP;
> +	}

[Severity: Medium]
Will this return -ENOTSUPP if callers request a debounce value of 0?

Standard kernel callers, such as gpiolib or the input subsystem, typically
pass a debounce value of 0 to disable GPIO debouncing. By not handling
debounce =3D=3D 0, does this break standard API requests to disable debounc=
ing?

[ ... ]
> +static void rtd1625_gpio_irq_handle(struct irq_desc *desc)
> +{
[ ... ]
> +	for (i =3D 0; i < data->info->num_gpios; i +=3D 32) {
> +		reg_offset =3D get_reg_offset(data, i);
> +		status =3D readl_relaxed(data->irq_base + reg_offset);
> +
> +		/*
> +		 * Hardware quirk: The controller fires both "assert" and "de-assert"
> +		 * interrupts simultaneously on any edge toggle.
> +		 * We must pre-clear edge interrupts here. If we drop an unwanted
> +		 * de-assert interrupt below, it will never reach the IRQ core
> +		 * (generic_handle_domain_irq), meaning ->irq_ack() won't be called.
> +		 * Failing to clear it here leads to an interrupt storm.
> +		 */
> +		if (irq !=3D data->irqs[RTD1625_IRQ_LEVEL])
> +			writel_relaxed(status, data->irq_base + reg_offset);
> +
> +		for_each_set_bit(j, &status, 32) {
> +			hwirq =3D i + j;
> +			irq_type =3D irq_get_trigger_type(irq_find_mapping(domain, hwirq));

[Severity: High]
Is there a missing bounds check on the computed hwirq against num_gpios?

If num_gpios is not a multiple of 32 (like 166 or 4), the final iteration
could include unused or reserved hardware bits. If any of these bits read
as 1, hwirq will exceed num_gpios. Calling generic_handle_domain_irq() with
an unmapped hwirq returns -EINVAL.

For level interrupts where the status is not pre-cleared, since the unmapped
IRQ is rejected, irq_ack() would never be invoked. Could this leave the lev=
el
interrupt unacknowledged in hardware and cause an infinite interrupt storm?

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
> +	}
> +
> +	chained_irq_exit(chip, desc);
> +}
> +
> +static void rtd1625_gpio_ack_irq(struct irq_data *d)
> +{
> +	struct rtd1625_gpio *data =3D irq_data_get_irq_chip_data(d);
> +	irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
> +	u32 irq_type =3D irqd_get_trigger_type(d);
> +	u32 bit_mask =3D BIT(hwirq % 32);
> +	int reg_offset;
> +
> +	if (irq_type & IRQ_TYPE_LEVEL_MASK) {
> +		reg_offset =3D rtd1625_gpio_level_offset(data, hwirq);
> +		writel_relaxed(bit_mask, data->irq_base + reg_offset);
> +	}
> +}

[Severity: High]
Does this correctly handle unrequested interrupts, where irq_type defaults
to 0 (IRQ_TYPE_NONE)?

If a bootloader leaves a GPIO interrupt active, it can fire as soon as the =
OS
registers the IRQ domain. Because the interrupt isn't requested, irq_type i=
s 0.

In rtd1625_gpio_ack_irq(), the code only acks if the type matches
IRQ_TYPE_LEVEL_MASK.

Similarly, in rtd1625_gpio_disable_irq(), it fails to mask the interrupt if
the type is 0:

	if (irq_type & IRQ_TYPE_EDGE_BOTH)
		rtd1625_gpio_disable_edge_irq(data, hwirq);
	else if (irq_type & IRQ_TYPE_LEVEL_MASK)
		rtd1625_gpio_disable_level_irq(data, hwirq);

Could this cause the driver to do nothing to clear or mask the interrupt,
defeating the core IRQ subsystem's spurious interrupt handling
(handle_bad_irq) and causing a hang from an infinite interrupt storm?

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
Does this code configure EDGE_BOTH identically to EDGE_RISING by passing 1 =
to
rtd1625_gpio_irq_set_edge_type()?

If the hardware only detects the configured edge, will all falling edges be
completely missed? Additionally, in rtd1625_gpio_irq_handle(), the code
explicitly skips filtering the DEASSERT interrupt for EDGE_BOTH requests:

	if (irq =3D=3D data->irqs[RTD1625_IRQ_DEASSERT] &&
	    irq_type !=3D IRQ_TYPE_EDGE_BOTH)
		continue;

Since a rising edge fires both ASSERT and DEASSERT simultaneously due to the
hardware quirk, will a single rising edge be processed twice, leading to
incorrect input event counting and dropped events?

> +
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		return rtd1625_gpio_irq_set_level_type(d, 0);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702090115.2564=
318-1-eleanor.lin@realtek.com?part=3D3
