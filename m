Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C053D5C2C
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 13:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783086319; cv=none; b=KcSBZ+o/O/OCss1vYqNfnYbBO5+io/tQvnis+kdlw0iv5pINWgMjuxOopEX/4/fPgK2bWasfMWu4N9sMq6EJJZUi0kX+VLf2aZOYbb5oPymPihTkhSjcZcX6AXFvPeaj36374RoU5Pq9x4tMKC0Ruu/zTU3s7ryAKYt29yoJGQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783086319; c=relaxed/simple;
	bh=Eed7PcfjAFodpMZeCqFZd05mN/8mYnW9dGq57fRkdvQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NJdNNozM/16i8pZkQq1+C+ywb0nCWCzcLdRdrrY3T2C89VVwkhxzpnvGeZp/HknxAag5zrUWi0Rvo8DAkymQbWa2qRBwlW8HiIArZTp3FcJbLjUcRB2YcgMlVrT/IEqMEzPeQeYFwQDr0X5wMbb0dfJdTzpaFvkpOodVwsgwK9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bL8CiVjM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bL8CiVjM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECD1A1F000E9;
	Fri,  3 Jul 2026 13:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783086317;
	bh=cBQl74WOtGP5Fs5G5wqCz6eBiT52oKz7aTTD3gyINuU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bL8CiVjMMOvwjxtsyCPL3UImsp2ObRMfLpd9Vig3lVabMCJLvH0BuTqwwlRuqgj7V
	 MDIPdsDNElJQ3od/b8PoKnYZsaPe40tMK6SBMWLJWbD/3mQarki8dSCMPIe73OuWHB
	 g+11y8gEI24DaIc6S9yxZ4RZI6LoLNOPhwpkJM/rPR3H+MZu3GC4Vj8kw3+bYyCSB4
	 rKj1mnku3sYrb4YjLFkdV9chs0/Ncrm07F/T10gaSrfXspDdJhylvMsJkrycNuZ+SV
	 RO1SkDh1B5j1109xuMVd4BGg0wXpWIF/i5y7X5CNb2vpFgfzmIuXqLTeYpaZCAFk3m
	 AbG5jaOv5Uvew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/12] soc: fsl: qe: Convert to generic IRQ chip
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Louvel" <paul.louvel@bootlin.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260703-qe-pic-gpios-v1-8-6c3e706e27dc@bootlin.com>
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
 <20260703-qe-pic-gpios-v1-8-6c3e706e27dc@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 13:45:16 +0000
Message-Id: <20260703134516.ECD1A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Incorrect hwirq calculation in `qepic_cascade()` maps bit indices =
[0..31] to hwirqs [32..1] instead of [31..0], causing out-of-bounds mapping=
 and shifting all IRQs by one.
- [High] Race condition on probe: The chained interrupt handler is register=
ed before `data->gc` is initialized, causing a NULL pointer dereference if =
an interrupt fires early.

Pre-existing issues:
- [High] The IRQ mask, unmask, and set_type callbacks use lockless read-mod=
ify-write operations on shared registers, leading to data races.
--

commit 39268a559b43e95ee6bcd43807086719d4997f6e
Author: Paul Louvel <paul.louvel@bootlin.com>

soc: fsl: qe: Convert to generic IRQ chip

The generic IRQ chip framework is available to handle IRQ chips. Using
this framework for the QE interrupt controller allows to simplify the
driver. Indeed, the framework internally handles operations coded
directly in the driver.

> diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_por=
ts_ic.c
> index c8b73b0aa2334..d022aa224f6d6 100644
> --- a/drivers/soc/fsl/qe/qe_ports_ic.c
> +++ b/drivers/soc/fsl/qe/qe_ports_ic.c
> @@ -20,63 +20,65 @@ struct qepic_data {
>  	void __iomem *reg;
>  	struct irq_domain *host;
>  	int irq;
> +	struct irq_chip_generic *gc;
>  };
> =20
>  static void qepic_mask(struct irq_data *d)
>  {
> -	struct qepic_data *data =3D irq_data_get_irq_chip_data(d);
> +	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
> +	struct irq_chip_type *ct =3D irq_data_get_chip_type(d);
> =20
> -	clrbits32(data->reg + CEPIMR, 1 << (31 - irqd_to_hwirq(d)));
> +	clrbits32(gc->reg_base + ct->regs.mask, d->mask);
>  }

[Severity: High]
This is a pre-existing issue, but does this lockless read-modify-write
operation cause data races?

The qepic_mask(), qepic_unmask(), and qepic_set_type() callbacks use
clrbits32() and setbits32() on shared registers without a shared controller
lock. If multiple CPUs modify different IRQs concurrently, could updates to
the shared mask or type registers be lost?

[ ... ]

>  static void qepic_cascade(struct irq_desc *desc)
>  {
>  	struct qepic_data *data =3D irq_desc_get_handler_data(desc);
> +	struct irq_chip_type *ct =3D data->gc->chip_types;
>  	struct irq_chip *chip =3D irq_desc_get_chip(desc);
>  	unsigned long event, bit;
> =20
>  	chained_irq_enter(chip, desc);
> =20
> -	event =3D in_be32(data->reg + CEPIER);
> +	event =3D in_be32(data->gc->reg_base + ct->regs.eoi);
>  	if (!event) {
>  		handle_bad_irq(desc);
>  		goto out;
>  	}

[Severity: High]
Could the hwirq calculation in qepic_cascade() be incorrect?

When an interrupt fires, the trailing loop (using for_each_set_bit) yields a
0-based bit index, but generic_handle_domain_irq() evaluates the hwirq using
"32 - bit".

For example, if bit 0 is set, it maps to hwirq 32, which exceeds the domain=
's
hwirq_max of 32 and leaves all IRQs shifted out of bounds. Does this need to
be "31 - bit" to correctly map bit indices [0..31] to hwirqs [31..0]?

[ ... ]

> @@ -125,14 +158,16 @@ static int qepic_probe(struct platform_device *pdev)
>  	if (data->irq < 0)
>  		return data->irq;
> =20
> -	data->host =3D irq_domain_create_linear(dev_fwnode(dev), 32, &qepic_hos=
t_ops, data);
> -	if (!data->host)
> -		return -ENODEV;
> +	data->host =3D devm_irq_domain_instantiate(dev, &d_info);
> +	if (IS_ERR(data->host))
> +		return PTR_ERR(data->host);
> =20
> -	irq_set_chained_handler_and_data(data->irq, qepic_cascade, data);
> -
> -	return devm_add_action_or_reset(dev, qepic_remove, data);
> +	data->gc =3D irq_get_domain_generic_chip(data->host, 0);
> +	if (!data->gc)
> +		return -ENODEV;
> +	data->gc->reg_base =3D data->reg;
> =20
> +	return 0;
>  }

[Severity: High]
Can this probe sequence trigger a NULL pointer dereference?

When devm_irq_domain_instantiate() is called, it triggers the init callback
qepic_domain_init(), which registers the chained handler and unmasks the
parent interrupt:

qepic_domain_init()
    irq_set_chained_handler_and_data(data->parent_irq, qepic_cascade, data);

If an interrupt is pending and fires immediately, qepic_cascade() will
execute and attempt to dereference data->gc->reg_base. However, data->gc is
not initialized until irq_get_domain_generic_chip() is called after the
domain instantiation returns.

Could this cause a crash if a pending interrupt is triggered during probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-qe-pic-gpi=
os-v1-0-6c3e706e27dc@bootlin.com?part=3D8
