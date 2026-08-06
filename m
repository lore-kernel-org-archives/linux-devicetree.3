Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27FF2FF672
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009588; cv=none; b=hyXBBzwj07KVyG6V0Q3ub1ChnUzhtJCqFoGVv0Oag8uYPuwX4kbUXe6Z8fVY+I8otY21TzG96k6PjIP6bw54mM730Mtz7N8tMdFGYau82QSjGQGgTpC8SBImFLyeP5GY/E5mil7q/wGI+KfHEN+MDvM8uFWJXC9w8fbwC1cwaE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009588; c=relaxed/simple;
	bh=8KTb7+iMsX4KT3oWr52mniQBL1iMEhkYYzrG7UaGxK4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EktQfeQrnh4ITWGBrliCAl/jC0c+Y/lPx0MkuGRfX+i+RU60smylXNuiTyPHcsfVW8H1XnS0jCml47zjsF0DH7XxLlV6odipS0vJKw192ryLEMs3GQXQ3z6kRzZw0yYz4KmLPsNTae0IpNsC+MfOVypbbvzkc/lTKCanDtHUbYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P+G/Xbgk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P+G/Xbgk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B0F71F000E9;
	Thu,  6 Aug 2026 09:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786009586;
	bh=0kdpO+RpauvbCT5f9Ul3xxqpzi1106+szWwyor9MAic=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P+G/XbgksHxCPLMoyLyx1Xuk72zRSO3FAxV22u8mLHq+y97SN1H3jTtUmsumODvD/
	 Ml9t0+7v7z5WatOCxdWUNnqxZsQDHJB0ac60/xokBbxyugtXehndvaQd0xlk7g/lgQ
	 IWZUk0TltPZZyt3yS4jkW57zeSJ975yTU9D8VehvC9aa/d/Wl812eGCAwIfKgVWcIj
	 4sch7bgncYhjjmJkWs8GVWs3/t29p2dNCmI7ez2IL63xbtw48y5y8GZH2C77WmL6eS
	 QtcM/ZcIEve751rzJLqdqcwAEettO6yXMQNlW3XJGXEBWtAfI/AXo+s6KlVtjAWzpI
	 wErL7Q2ouf97g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/10] pinctrl: ambarella: add Ambarella pin
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806-longzhao-upstream-cv75-v2-v2-7-6b09707c5fe9@ambarella.com>
References: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
 <20260806-longzhao-upstream-cv75-v2-v2-7-6b09707c5fe9@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 09:46:25 +0000
Message-Id: <20260806094626.4B0F71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] Improper devres cleanup ordering leaves the GPIO chip with a destr=
oyed IRQ domain, leading to Use-After-Free.
- [High] Inconsistent enforcement of hsm_domain_id access restrictions for =
IOMUX registers causes bus faults.
- [High] The device tree node pointer is assigned to bank->gc.fwnode withou=
t taking a reference, leading to a Use-After-Free.
- [High] Calling regmap_update_bits() while holding a raw_spinlock_t causes=
 a lock nesting bug on PREEMPT_RT.
- [High] Performing regmap accesses in _noirq power management callbacks ca=
uses lockdep BUGs on PREEMPT_RT.
- [Medium] Improper register restoration order during resume causes glitche=
s on GPIO output pins and pull resistors.
- [Medium] amb_pinctrl_suspend_noirq overwrites GPIO_IE_OFFSET with irq_wak=
e_mask, disabling IRQF_NO_SUSPEND interrupts.
- [Medium] The driver fails to properly handle clk_au_dedicated_pin on devi=
ce trees with non-contiguous GPIO banks.
- [Medium] amb_gpio_irq_enable unconditionally forces the pin direction to =
INPUT, breaking open-drain output IRQs.
--

--- Patch [7]: [PATCH v2 07/10] pinctrl: ambarella: add Ambarella pin contr=
oller ---
commit e1626036cbd93218655297fbd8b45ae82567717d
Author: Long Zhao <longzhao@ambarella.com>

pinctrl: ambarella: add Ambarella pin controller
   =20
Add the Ambarella pinmux/GPIO controller driver used by CV75.

> diff --git a/drivers/pinctrl/pinctrl-ambarella.c b/drivers/pinctrl/pinctr=
l-ambarella.c
> index 0000000000000..bb79e06c4160f 100644
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-ambarella.c

[ ... ]

> @@ -462,13 +462,13 @@ static int amb_pinconf_set(struct pinctrl_dev *pctl=
dev, unsigned int pin,
>  	bank =3D gpio_bank->hw_id;
>  	offset =3D pin - gpio_bank->pin_base;
> =20
>  	raw_spin_lock_irqsave(&soc->lock, flags);
>  	for (i =3D 0; i < num_configs; i++) {
>  		config =3D configs[i];
>  		param =3D pinconf_to_config_param(config);
>  		arg =3D pinconf_to_config_argument(config);
> =20
>  		switch (param) {
>  		case PIN_CONFIG_BIAS_DISABLE:
>  			regmap_update_bits(soc->pull_regmap,
>  					   soc->data->pull_en[bank], BIT(offset), 0);

[Severity: High]
The syscon regmaps use a standard spinlock_t internally, which maps to a
sleepable rt_mutex on PREEMPT_RT.=20

Since raw_spin_lock_irqsave(&soc->lock, flags) is held, does calling
regmap_update_bits() here trigger a "sleeping in atomic context" BUG
on PREEMPT_RT?

[ ... ]

> @@ -746,13 +746,13 @@ static int amb_gpio_direction_output(struct gpio_ch=
ip *gc, unsigned int pin, int
>  	writel_relaxed(data | BIT(pin), bank->base + GPIO_DIR_OFFSET);
> =20
>  	raw_spin_unlock_irqrestore(&soc->lock, flags);
> =20
>  	return 0;
>  }
> =20
>  /* gpiolib gpio_to_irq callback function */
>  static int amb_gpio_to_irq(struct gpio_chip *gc, unsigned int pin)
>  {
>  	struct amb_gpio_bank *bank =3D gpiochip_get_data(gc);
> =20
>  	return irq_create_mapping(bank->domain, pin);
>  }

[ ... ]

> @@ -1181,24 +1181,24 @@ static int amb_gpio_register(struct amb_pinctrl_s=
oc_data *soc)
> =20
>  		bank->domain =3D irq_domain_add_linear(to_of_node(bank->gc.fwnode),
>  						    bank->gc.ngpio,
>  						    &amb_gpio_irq_domain_ops,
>  						    bank);
>  		if (!bank->domain)
>  			return dev_err_probe(soc->dev, -ENODEV,
>  					     "GPIO%u: failed to create irqdomain\n",
>  					     i);
> =20
>  		rval =3D devm_gpiochip_add_data(soc->dev, &bank->gc, bank);
>  		if (rval) {
>  			irq_domain_remove(bank->domain);
>  			bank->domain =3D NULL;
>  			return dev_err_probe(soc->dev, rval,
>  					     "GPIO%u: gpiochip registration failed\n",
>  					     i);
>  		}
> =20
>  		writel_relaxed(0xffffffff, bank->base + GPIO_ENABLE_OFFSET);
>  		writel_relaxed(0x00000000, bank->base + GPIO_AFSEL_OFFSET);
>  		writel_relaxed(0x00000000, bank->base + GPIO_MASK_OFFSET);
> =20
>  		irq_set_irq_type(bank->irq, IRQ_TYPE_LEVEL_HIGH);
>  		irq_set_chained_handler_and_data(bank->irq,
>  						 amb_gpio_handle_irq, bank);
> =20
>  		rval =3D devm_add_action_or_reset(soc->dev,
>  					       amb_gpio_irq_cleanup, bank);

[Severity: High]
The devres cleanup action amb_gpio_irq_cleanup() is registered after the
gpiochip is added. Since devres actions execute in reverse order, the IRQ
domain will be destroyed before the gpiochip is removed.

Could this leave the gpiochip with a NULL bank->domain during unbind,
causing a use-after-free if amb_gpio_to_irq() is called?

[ ... ]

> @@ -841,13 +841,13 @@ static void amb_gpio_irq_enable(struct irq_data *da=
ta)
> =20
>  	offset =3D irqd_to_hwirq(data);
> =20
>  	gpiochip_enable_irq(gc, offset);
> =20
>  	raw_spin_lock_irqsave(&soc->lock, flags);
> =20
>  	val =3D readl_relaxed(gpio_base + GPIO_DIR_OFFSET);
>  	val &=3D ~(0x1 << offset);
>  	writel_relaxed(val, gpio_base + GPIO_DIR_OFFSET);

[Severity: Medium]
The gpiolib core supports open-drain outputs as interrupt sources. Will
unconditionally clearing the direction bit here force the pin to be an
input, breaking any open-drain output IRQs?

> =20
>  	for (i =3D 0; i < 3; i++) {
>  		val =3D readl_relaxed(iomux_base + IOMUX_OFFSET(bank->hw_id, i));
>  		val &=3D ~(0x1 << offset);
>  		writel_relaxed(val, iomux_base + IOMUX_OFFSET(bank->hw_id, i));
>  	}

[Severity: High]
The driver restricts IOMUX register access in amb_pinmux_set_altfunc()
to only the safety domain (hsm_domain_id =3D=3D 0).

Does this loop bypass that check? Can unprotected writes here trigger a bus
fault on platforms where hsm_domain_id !=3D 0?

[ ... ]

> @@ -996,9 +996,9 @@ static int amb_gpio_parse_dt(struct amb_pinctrl_soc_d=
ata *soc)
>  			if (soc->banks[i].hw_id =3D=3D hw_id)
>  				return dev_err_probe(soc->dev, -EINVAL,
>  						     "%pOF: duplicate GPIO bank\n",
>  						     np);
>  		}
> =20
>  		bank =3D &soc->banks[soc->bank_num];
>  		bank->soc =3D soc;
>  		bank->pin_base =3D args.args[1];
>  		bank->hw_id =3D hw_id;
>  		bank->gc.ngpio =3D args.args[2];
>  		bank->gc.fwnode =3D of_fwnode_handle(np);

[Severity: High]
The for_each_available_child_of_node_scoped() loop automatically drops the
reference to the np node when it goes out of scope.

Will assigning it to bank->gc.fwnode without taking an additional reference
via of_node_get() lead to a use-after-free later?

[ ... ]

> @@ -1300,9 +1300,9 @@ static int amb_pinctrl_probe(struct platform_device=
 *pdev)
>  	for (i =3D 0; i < soc->bank_num; i++) {
>  		unsigned int pin;
> =20
>  		for (pin =3D soc->banks[i].pin_base;
>  		     pin < soc->banks[i].pin_base + soc->banks[i].gc.ngpio;
>  		     pin++)
>  			clear_bit(pin, soc->used);
>  	}
> =20
>  	if (soc->data->clk_au_dedicated_pin >=3D gpio_pins &&
>  	    soc->data->clk_au_dedicated_pin < AMBA_MAX_PINS)
>  		clear_bit(soc->data->clk_au_dedicated_pin, soc->used);

[Severity: Medium]
If the device tree contains sparse, non-contiguous GPIO banks, the dedicated
pin might fall into a "hole" (a missing bank) that has an ID less than
the highest pin ID returned by amb_gpio_pins_end(soc).

If this happens, will gpio_pins incorrectly skip this dedicated pin, leaving
it marked busy and preventing it from being suspended?

[ ... ]

> @@ -1390,15 +1390,15 @@ static int amb_pinctrl_suspend_noirq(struct devic=
e *dev)
>  	struct amb_pinctrl_soc_data *soc =3D dev_get_drvdata(dev);
>  	u32 bank, hw, i;
> =20
>  	for (i =3D 0; i < soc->bank_num; i++) {
>  		hw =3D soc->banks[i].hw_id;
> =20
>  		regmap_read(soc->pull_regmap, soc->data->pull_en[hw], &soc->pm[i].pull=
[0]);
>  		regmap_read(soc->pull_regmap, soc->data->pull_dir[hw], &soc->pm[i].pul=
l[1]);
> =20
>  		regmap_read(soc->ds_regmap, soc->data->ds0[hw], &soc->pm[i].ds[0]);

[Severity: High]
The amb_pinctrl_suspend_noirq() callback executes with hardirqs disabled.
Will reading the syscon regmaps here attempt to acquire a sleepable rt_mutex
on PREEMPT_RT, triggering a "sleeping in atomic context" BUG?

>  		regmap_read(soc->ds_regmap, soc->data->ds1[hw], &soc->pm[i].ds[1]);
>  		if (soc->data->have_ds2)
>  			regmap_read(soc->ds_regmap, soc->data->ds2[hw], &soc->pm[i].ds[2]);
> =20
>  		soc->pm[i].iomux[0] =3D readl_relaxed(soc->iomux_base + IOMUX_OFFSET(h=
w, 0));
>  		soc->pm[i].iomux[1] =3D readl_relaxed(soc->iomux_base + IOMUX_OFFSET(h=
w, 1));
>  		soc->pm[i].iomux[2] =3D readl_relaxed(soc->iomux_base + IOMUX_OFFSET(h=
w, 2));

[Severity: High]
Similar to amb_gpio_irq_enable(), is this missing a check to ensure
hsm_domain_id =3D=3D 0? Could these IOMUX reads trigger a bus fault in
non-safety domains?

[ ... ]

> @@ -1404,9 +1404,9 @@ static int amb_pinctrl_suspend_noirq(struct device =
*dev)
>  		soc->pm[i].is =3D readl_relaxed(soc->banks[i].base + GPIO_IS_OFFSET);
>  		soc->pm[i].ibe =3D readl_relaxed(soc->banks[i].base + GPIO_IBE_OFFSET);
>  		soc->pm[i].iev =3D readl_relaxed(soc->banks[i].base + GPIO_IEV_OFFSET);
>  		soc->pm[i].ie =3D readl_relaxed(soc->banks[i].base + GPIO_IE_OFFSET);
>  		soc->pm[i].mask =3D readl_relaxed(soc->banks[i].base + GPIO_MASK_OFFSE=
T);
>  		writel_relaxed(0xffffffff, soc->banks[i].base + GPIO_MASK_OFFSET);
>  		soc->pm[i].data =3D readl_relaxed(soc->banks[i].base + GPIO_DATA_OFFSE=
T);
> =20
>  		if (soc->banks[i].irq_wake_mask)
>  			writel_relaxed(soc->banks[i].irq_wake_mask,
>  				       soc->banks[i].base + GPIO_IE_OFFSET);

[Severity: Medium]
The generic IRQ core already masks non-wake interrupts during suspend,
leaving wake and IRQF_NO_SUSPEND interrupts enabled.

Does unconditionally overwriting GPIO_IE_OFFSET with the irq_wake_mask here
unintentionally disable any configured IRQF_NO_SUSPEND interrupts?

[ ... ]

> @@ -1452,9 +1452,9 @@ static int amb_pinctrl_resume_noirq(struct device *=
dev)
>  		if (soc->data->have_ds2)
>  			regmap_write(soc->ds_regmap, soc->data->ds2[hw], soc->pm[i].ds[2]);
> =20
>  		writel_relaxed(soc->pm[i].iomux[0], soc->iomux_base + IOMUX_OFFSET(hw,=
 0));
>  		writel_relaxed(soc->pm[i].iomux[1], soc->iomux_base + IOMUX_OFFSET(hw,=
 1));
>  		writel_relaxed(soc->pm[i].iomux[2], soc->iomux_base + IOMUX_OFFSET(hw,=
 2));
> =20
>  		writel_relaxed(soc->pm[i].afsel, soc->banks[i].base + GPIO_AFSEL_OFFSE=
T);
>  		writel_relaxed(soc->pm[i].dir, soc->banks[i].base + GPIO_DIR_OFFSET);
>  		/* Expose DATA writes while restoring the saved GPIO state. */
>  		writel_relaxed(0xffffffff,
>  			       soc->banks[i].base + GPIO_MASK_OFFSET);
>  		writel_relaxed(soc->pm[i].data,
>  			       soc->banks[i].base + GPIO_DATA_OFFSET);

[Severity: Medium]
The direction is restored before the data is written back. If a pin is
configured as an output driving HIGH, will setting its direction to output
while the data register still holds a default 0 momentarily drive the pin
LOW, causing a hardware glitch during resume?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-longzhao-u=
pstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com?part=3D7
