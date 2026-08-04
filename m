Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2354147604F
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 16:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785861053; cv=none; b=TmVKFyDKTcq9JjhaPu9OJorUxKJJFKKAFlxPqh6dU/wiXyXhUjad84M+pZU0dNAjGEEXtBIKXYf68usm0qEfxpCevRrOn3IDObzeh5/3KUr46eVODAmcMEfnb0XH3Q7N66WIu/YUb6kOkIZiXG7WjzuqW81fgSlCXFtwuPSOtBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785861053; c=relaxed/simple;
	bh=dszf8mFAMY9g9WJYo35Nuir1vOUEIeIo7Npj1z9njeE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kXO38dgTxnuJTuNtB2XgD4G006UbDjfld0nNMB5/bTpgpaKZN+pfB4bOh2FPVzNp2ybXPnRB2vE2CKKeKdok2jrQn0ckQV1kYlzWXpTZaFgaOU0KBdvVe3qiKFzkfAtCUFniCrD6BQXhTmWu71MEY5/yNbSecGVr9r+GHkvjpMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g28T6gxJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g28T6gxJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A04ED1F000E9;
	Tue,  4 Aug 2026 16:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785861049;
	bh=EbLiLZPf9V9CplsBurD3bzTaAOyWitrQXEC/+2bn08s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g28T6gxJMpqtVXMegV9J7ofXvIjog8fpbpZW+oFeCKQGLYBLF5NDtZdZIMwONyO/+
	 unYrhfgoLA+Uomj2GlTmsSWlalwfQep5/yxZdFg1VnztINnFQJDAQZhTyairMNe5t5
	 B0eVRe90bS+B6NecjV59P4eantfudOi44sj3m9w1eC6mwOKpkEl2WcCDDBw0OVpsfb
	 IdntqsEyIrKNqA5HEFGNDSeJgVDriw5xr7k9DRYPJSbF2BwOMFYExPUphvdg9vrYTb
	 SzI9yJmiJ8tNvYKqTa4QhxqIiBDxqhWcBD5CZjYQD/CSTypZf70rdSCQ4ha2YIK1ys
	 yjP7DFVNCoi1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 22/36] pinctrl: airoha: statically allocate gpio regs
 structure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260804160419.3592327-23-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
 <20260804160419.3592327-23-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 16:30:49 +0000
Message-Id: <20260804163049.A04ED1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] Applying device tree hogs during `pinctrl_enable()` causes a k=
ernel panic due to a NULL pointer dereference.
- [High] Double-ACK of W1C interrupt status register leads to lost edge int=
errupts.
- [Low] The statically allocated 'airoha_gpiochip_regs' structure is not ma=
rked as const.
--

--- Patch [22]: [PATCH v9 22/36] pinctrl: airoha: statically allocate gpio =
regs structure ---
commit 59e0c76f94587804fea9f38323fde803107848bb
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: statically allocate gpio regs structure
   =20
just a small refactoring to collect all gpio register information
in the one statically allocated structure.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 3dc9b3cb0051f..c4d16c5636ef8 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c

[ ... ]

> @@ -339,6 +350,15 @@ static const u32 irq_edge_regs[] =3D {
>  	REG_GPIO_INT_EDGE3
>  };
> =20
> +static struct airoha_gpiochip_regs airoha_gpiochip_regs =3D {
> +	.data =3D gpio_data_regs,
> +	.dir =3D gpio_dir_regs,
> +	.out =3D gpio_out_regs,
> +	.status =3D irq_status_regs,
> +	.level =3D irq_level_regs,
> +	.edge =3D irq_edge_regs,
> +};
> +

[Severity: Low]
Should this statically allocated structure be marked as const?

Failing to mark both the static structure and the corresponding gpio_regs
pointer in struct airoha_pinctrl as const prevents the compiler from
placing this read-only data in the .rodata section.

[ ... ]

> @@ -411,7 +418,8 @@ struct airoha_pinctrl {
>  	struct regmap *chip_scu;
>  	struct regmap *regmap;
> =20
> -	struct airoha_pinctrl_gpiochip gpiochip;
> +	struct gpio_chip gpiochip;
> +	struct airoha_gpiochip_regs *gpio_regs;
>  };

[Severity: Low]
Should this gpio_regs pointer field also be marked as pointing to a const
structure for the same reason?

[ ... ]

> @@ -2683,12 +2693,12 @@ static irqreturn_t airoha_irq_handler(int irq, vo=
id *data)
>  	int i;
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(irq_status_regs); i++) {
> -		struct gpio_irq_chip *girq =3D &pinctrl->gpiochip.chip.irq;
> +		struct gpio_irq_chip *girq =3D &pinctrl->gpiochip.irq;
>  		u32 regmap;
>  		unsigned long status;
>  		int irq;
> =20
> -		if (regmap_read(pinctrl->regmap, pinctrl->gpiochip.status[i],
> +		if (regmap_read(pinctrl->regmap, pinctrl->gpio_regs->status[i],
>  				&regmap))
>  			continue;
> =20
> @@ -2698,7 +2708,7 @@ static irqreturn_t airoha_irq_handler(int irq, void=
 *data)
> =20
>  			generic_handle_domain_irq(girq->domain, offset);
>  			regmap_write(pinctrl->regmap,
> -				     pinctrl->gpiochip.status[i], BIT(irq));
> +				     pinctrl->gpio_regs->status[i], BIT(irq));
>  		}
>  		handled |=3D !!status;
>  	}

[Severity: High]
Can this explicit W1C write clear newly latched interrupts that arrive
during generic_handle_domain_irq() and lose them?

An earlier patch in this series added airoha_irq_ack as the .irq_ack
callback for airoha_gpio_irq_chip, which handles acking by writing to the
W1C (write-one-to-clear) interrupt status register.

For edge-triggered interrupts, the IRQ core calls irq_ack before invoking
the device's interrupt handler. If a new edge interrupt arrives while the
handler is running, the hardware will latch the status bit again.

Will leaving this redundant manual W1C register write unconditionally clear
this newly set status bit without handling the interrupt?

[ ... ]

> @@ -2820,7 +2829,7 @@ static int airoha_pinmux_set_direction(struct pinct=
rl_dev *pctrl_dev,
>  	if (pin < 0)
>  		return pin;
> =20
> -	return airoha_gpio_set_direction(&pinctrl->gpiochip.chip, pin, input);
> +	return airoha_gpio_set_direction(&pinctrl->gpiochip, pin, input);
>  }

[Severity: Critical]
Does this sequence cause a kernel panic due to a NULL pointer dereference
during probe?

If the device tree contains pinctrl-0 hogs with input-enable or output-enab=
le,
it triggers airoha_pinconf_set() when pinctrl_enable() is called in
airoha_pinctrl_probe().

airoha_pinconf_set() calls airoha_pinmux_set_direction(), which uses this
airoha_gpio_set_direction() helper.

Because pinctrl_enable() is called before airoha_pinctrl_add_gpiochip(),
chip->gpiodev is still NULL. When airoha_gpio_set_direction() calls:

    struct airoha_pinctrl *pinctrl =3D gpiochip_get_data(chip);

Will this return NULL and lead to an immediate dereference when accessing
pinctrl->regmap?

This regression appears to have been introduced earlier in the series when
the set_direction helper replaced safe direct driver data retrieval.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804160419.3592=
327-1-mikhail.kshevetskiy@iopsys.eu?part=3D22
