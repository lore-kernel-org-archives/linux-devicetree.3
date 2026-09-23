Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC7252269C
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168890; cv=none; b=I/zXH72fuB8c0+EhSIeLTT280YHBCa52wXqPJRsMTuZyp6zW9K9pO3Rn9RPEqlc1zrsqmgwP6DcRipP+yx4lRYi6jnE+i+xqbwrffCrK0CJKYy7u2HnmzJZfHkYWG3hxMBsG2QwltcAd/mojtwPR1hXIwJVHPuibCN3arkuVh+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168890; c=relaxed/simple;
	bh=0s0g9jXOYXSoDKCzMGG05T+ZEeFuKErvoM4xxdBcwps=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W1Hpyc+WuikwRQeA+m+AVNWIYuOP7JyaglKwclw41jrdVEAyuC/+z41zmb/LoN3ATsb4bCc/Z7k2EillBqiz13I/3s364tucwS02QkIKbw/R9VDFn+8bxOKeFqDXvmUyg7dZkc6APakc/9RMR7i0e7kDLOpxW9iK8xGIZCL1eKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TDjIoXQf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TDjIoXQf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC261F000FF;
	Wed, 23 Sep 2026 13:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790168888;
	bh=vuAiPdvIRFgl0TnOg1+sCu6VGzHmY2KMR6hqC3vyJhs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TDjIoXQfsnS8cn4/hKlcABLyZLKlrUu9z1w+2awSmygXb/WlEnVtkCsvF6okg+Q+i
	 c5dE1Uo5DJHDfhAXAnGaZHCLkgywlT4+RxJ6/rKhCAnaF5yGcduE4miV38SZSYs2cC
	 /yRrgaE49fJ4foH4il+x6PkrPaVl29oaytSjSL1eMfVxot+jaTFMIlJjw16BqodH8l
	 17gF8KI7iE07sxa3qE57U7dylFB5TgUfJMmTGscUNOogCVWcHVOnzc8x/hMZFPbIeA
	 +lYl7GNFtQQfsbONZZtuG/Hby4bCJ0P8CoQahGy5/fwCxWfoFtnOMXVPRzMpyEPebY
	 6ndygDv8cFgCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] gpio: davinci: Add level support via extended
 registers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aniket Limaye" <a-limaye@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260923-upstream-tda54-gpio-v1-2-d1a0a199c836@ti.com>
References: <20260923-upstream-tda54-gpio-v1-0-d1a0a199c836@ti.com>
 <20260923-upstream-tda54-gpio-v1-2-d1a0a199c836@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 13:08:08 +0000
Message-Id: <20260923130808.7EC261F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] gpio: davinci: interrupt storm due to incorrect default level trig=
gers
- [High] gpio: davinci: infinite loop in chained handler for level IRQs
--

commit 31955d22d1eb969a680fcf19a5faaeb164ffab12
Author: Aniket Limaye <a-limaye@ti.com>

gpio: davinci: Add level support via extended registers

This commit adds support for level-triggered interrupts for the TDA54 GPIO
controller. It utilizes the extended register sets to allow handling of
IRQ_TYPE_LEVEL_HIGH and IRQ_TYPE_LEVEL_LOW triggers.

> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index cccbaea1dec24..e5a3abe6b9d3f 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
[ ... ]
> @@ -293,6 +317,18 @@ static void gpio_irq_unmask(struct irq_data *d)
[ ... ]
> +static int gpio_irq_type_ext(struct irq_data *d, unsigned int trigger)
> +{
> +	if (trigger & ~(IRQ_TYPE_EDGE_BOTH | IRQ_TYPE_LEVEL_MASK))
> +		return -EINVAL;
> +
> +	return 0;
> +}

[Severity: High]
Does this code need to reconfigure the flow handler to handle_level_irq
when a level trigger is requested?

If a level trigger is requested, we need to assign the proper flow handler
using irq_set_handler_locked(). Since this doesn't happen, handle_simple_irq
will continue to be used, which does not mask the interrupt line while the
action handler runs.

If the external line remains asserted during a level-triggered interrupt,
could the chained handler (gpio_irq_handler) continuously detect the active
status in the intstat register?

Since the intstat bit immediately re-latches after being cleared, wouldn't
the while (1) loop inside gpio_irq_handler spin infinitely and cause a CPU
lockup?

[ ... ]
> @@ -418,8 +474,12 @@ davinci_gpio_irq_map(struct irq_domain *d, unsigned =
int irq,
>  	struct davinci_gpio_controller *chips =3D
>  				(struct davinci_gpio_controller *)d->host_data;
> =20
> -	irq_set_chip_and_handler_name(irq, &gpio_irqchip, handle_simple_irq,
> -				"davinci_gpio");
> +	if (chips->regs_ext[0])
> +		irq_set_chip_and_handler_name(irq, &gpio_irqchip_ext, handle_simple_ir=
q,
> +					      "davinci_gpio");

[Severity: High]
Is it safe to hardcode handle_simple_irq as the default handler for all ban=
ked
GPIO interrupts here, when level interrupts are supported?

As mentioned above in gpio_irq_type_ext(), using handle_simple_irq for level
interrupts can lead to an infinite loop in the chained handler because it
does not mask the line.

[ ... ]
> @@ -534,6 +595,11 @@ static int davinci_gpio_irq_setup(struct platform_de=
vice *pdev)
[ ... ]
>  		/* default trigger: both edges */
>  		g =3D chips->regs[0];
>  		writel_relaxed(~0, &g->set_falling);
>  		writel_relaxed(~0, &g->set_rising);
> +		g_ext =3D chips->regs_ext[0];
> +		if (g_ext) {
> +			writel_relaxed(~0, &g_ext->set_high);
> +			writel_relaxed(~0, &g_ext->set_low);
> +		}

[Severity: High]
Will this unconditionally enable level interrupts for all unbanked GPIOs
during controller setup?

The code writes ~0 to both set_high and set_low registers, which enables
level-triggered interrupts for both high and low states on all unbanked pins
simultaneously.

Since a digital line must be either high or low, wouldn't this guarantee
the interrupt condition is continuously met? If an unbanked GPIO interrupt
is then unmasked without explicitly overriding the trigger type (for exampl=
e,
relying on the default 'both edges' state), wouldn't this trigger an
unrecoverable interrupt storm?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-upstream-t=
da54-gpio-v1-0-d1a0a199c836@ti.com?part=3D2
