Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDB837881B
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 04:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778648176; cv=none; b=KWZrSGZE3XRqaO8hrYBbu2vWzxM7mn9NUVTQ6HWpAym7V6APV1VNc/cvWwYjlE6QeQzh9B77+/Rq/NAFhWMRoOiYzhfdPNbH+mGNrrfw1j0a5DgW+fDt6mEuwz/9j8ZFvC8QSB+2syQ/NwAR4HQNo9y1RceLXFzqwr9gyjvJkMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778648176; c=relaxed/simple;
	bh=sfBtXR1kRXSz661IoJxY7Zqr7WIPUe5w8ybTQPpU0Lc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bzJDd/kjLGhuDxnPJAYURNxYfNOkDUc3rjv1rryD37+DNVuQ3fLcwppgGugxZQiaXo3qTcr71C/bnF7pm6ZDkXIeEPfXO66Q/fosWydI5gcPcUOv8msWVuvhy9fSym5c9hQlnUdQ3f7f5DhfHY26dE9mg5NE8pL7U37PITWtJUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GGb3MqJ2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GGb3MqJ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A158BC2BCB7;
	Wed, 13 May 2026 04:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778648175;
	bh=sfBtXR1kRXSz661IoJxY7Zqr7WIPUe5w8ybTQPpU0Lc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=GGb3MqJ2joOHjSh4kk+xe+/KPPezue16g5evvlC+lUeu0pluyZrYHxAjcOj91mkt8
	 agPDWs5Hmm7iAa0hDYdHZ4jrwUxQBjl+7JK/JYu+XstB8EGaUeLFyjauD0WnR008im
	 3/wUr4YQIa8z301z7mnTDMd7ANgra4CnGbPjc2XCWNQbxz91TP6Qp5za+0JfvpiTKc
	 Oo1grjdkkHuhIeqGOC4KECR0t9DPa4rIl/3UUc9hRZ02MiQN6ErdlMRsBWxdtZDsTQ
	 FJNS1NPQD65zM83ABaY4lUxWEIvMTaUm+wloDYoUm4TPgBcODM/riY1bhAbOe1w065
	 2l1zRAFtb1Mcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/7] gpio: realtek: Add driver for Realtek DHC
 RTD1625 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260512033317.1602537-7-eleanor.lin@realtek.com>
References: <20260512033317.1602537-7-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 04:56:15 +0000
Message-Id: <20260513045615.A158BC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Uninitialized raw spinlock `data->lock` triggers a BUG/panic.
- [High] Chained IRQ handlers and IRQ domain are leaked on probe failure an=
d driver unbind, causing Use-After-Free.
- [High] Type mismatch in `rtd1625_gpio_set_debounce()` causes memory corru=
ption and panic.
- [High] Missing base offset in `rtd1625_gpio_set_debounce()` corrupts inte=
rrupt status registers.
- [High] Race condition in IRQ mapping leads to a NULL pointer dereference.
- [High] Incorrect hardware mask in `GPIO_REGMAP_GET_OP` breaks GPIO input =
value reading.
- [Medium] Unprotected state modifications via `gpiochip_disable_irq()` in =
`.irq_mask`.
--

commit 2806fbf586d5ca5b8f36cb1b33138f23dd2f5b19
Author: Tzuyi Chang <tychang@realtek.com>

gpio: realtek: Add driver for Realtek DHC RTD1625 SoC

Add support for the GPIO controller found on Realtek DHC RTD1625 SoCs.

> diff --git a/drivers/gpio/gpio-rtd1625.c b/drivers/gpio/gpio-rtd1625.c
> new file mode 100644
> index 0000000000000..0eae4bb5577d9
> --- /dev/null
> +++ b/drivers/gpio/gpio-rtd1625.c

[ ... ]

> +static int rtd1625_reg_mask_xlate(struct gpio_regmap *gpio, enum gpio_re=
gmap_operation op,
> +				  unsigned int base, unsigned int offset, unsigned int *reg,
> +				  unsigned int *mask)
> +{
> +	/* Each GPIO has its own dedicated 32-bit register */
> +	*reg =3D base + offset * 4;
> +
> +	switch (op) {

[ ... ]

> +	case GPIO_REGMAP_SET_DIR_WREN_OP:
> +		*mask =3D RTD1625_GPIO_WREN(RTD1625_GPIO_DIR);
> +		break;
> +	case GPIO_REGMAP_GET_OP:
> +	case GPIO_REGMAP_GET_DIR_OP:
> +		*mask =3D RTD1625_GPIO_DIR;

GPIO_REGMAP_GET_OP is mapped to RTD1625_GPIO_DIR. Will this return the
direction configuration instead of the actual physical logic level of the p=
in
(RTD1625_GPIO_IN) when calling gpio_get_value()?

> +		break;
> +	default:
> +		*mask =3D 0;
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static unsigned int rtd1625_gpio_set_debounce(struct gpio_chip *chip, un=
signed int offset,
> +					      unsigned int debounce)
> +{
> +	struct rtd1625_gpio *data =3D gpiochip_get_data(chip);

gpiochip_get_data(chip) returns a pointer to struct gpio_regmap when using =
the
gpio-regmap framework, not struct rtd1625_gpio.

Will dereferencing data->regmap later in this function cause a crash? Should
this use gpio_regmap_get_drvdata(gpiochip_get_data(chip)) like the other
functions?

> +	u8 deb_val;
> +	u32 val;
> +
> +	switch (debounce) {

[ ... ]

> +	case 50000:
> +		deb_val =3D RTD1625_GPIO_DEBOUNCE_50MS;
> +		break;
> +	default:
> +		return -ENOTSUPP;
> +	}
> +
> +	val =3D FIELD_PREP(RTD1625_GPIO_DEBOUNCE, deb_val) | RTD1625_GPIO_DEBOU=
NCE_WREN;
> +	regmap_write(data->regmap, GPIO_CONTROL(offset), val);

Is data->info->base_offset missing from the register calculation here?

Writing to GPIO_CONTROL(offset) without the base offset will overwrite the
gpa_offset and gpda_offset interrupt status registers instead of the target
GPIO control register.

> +
> +	return 0;
> +}

[ ... ]

> +static void rtd1625_gpio_disable_irq(struct irq_data *d)
> +{
> +	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +	irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
> +	u32 irq_type =3D irqd_get_trigger_type(d);
> +	struct rtd1625_gpio *data;
> +	struct gpio_regmap *gpio;
> +
> +	gpio =3D gpiochip_get_data(gc);
> +	data =3D gpio_regmap_get_drvdata(gpio);
> +
> +	if (irq_type & IRQ_TYPE_EDGE_BOTH)
> +		rtd1625_gpio_disable_edge_irq(data, hwirq);
> +	else if (irq_type & IRQ_TYPE_LEVEL_MASK)
> +		rtd1625_gpio_disable_level_irq(data, hwirq);
> +
> +	gpiochip_disable_irq(gc, hwirq);

This function is registered as the .irq_mask callback. Since the core
temporarily masks level-triggered interrupts during processing, will calling
gpiochip_disable_irq() clear GPIOD_FLAG_IRQ_IS_ENABLED?

If so, could this inadvertently allow a concurrent thread to bypass protect=
ions
(e.g. gpiod_direction_output()) and change the GPIO direction to output whi=
le
the interrupt is actively firing?

> +}

[ ... ]

> +static int rtd1625_gpio_irq_map(struct irq_domain *domain, unsigned int =
irq,
> +				irq_hw_number_t hwirq)
> +{
> +	struct rtd1625_gpio *data =3D domain->host_data;
> +
> +	irq_set_chip_data(irq, data->gpio_chip);

Could data->gpio_chip be NULL here?

The IRQ domain is added in rtd1625_gpio_probe() before data->gpio_chip is
populated by gpio_regmap_get_gpiochip(). If an interrupt is mapped
concurrently during probe, setting NULL chip data will cause a NULL pointer
dereference later when retrieving the chip data.

> +
> +	irq_set_chip_and_handler(irq, &rtd1625_iso_gpio_irq_chip, handle_bad_ir=
q);
> +
> +	irq_set_noprobe(irq);
> +
> +	return 0;
> +}

[ ... ]

> +static int rtd1625_gpio_probe(struct platform_device *pdev)
> +{
> +	struct gpio_regmap_config config =3D {0};
> +	struct device *dev =3D &pdev->dev;
> +	struct gpio_regmap *gpio_reg;
> +	struct rtd1625_gpio *data;
> +	void __iomem *irq_base;
> +	int ret;
> +
> +	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;

Is there a missing initialization for data->lock?

Since data is zero-initialized by devm_kzalloc(), acquiring this uninitiali=
zed
raw spinlock via guard(raw_spinlock_irqsave)(&data->lock) in the IRQ callba=
cks
will trigger a kernel panic when lock debugging or PREEMPT_RT is enabled.

> +
> +	data->info =3D device_get_match_data(dev);
> +	if (!data->info)
> +		return -EINVAL;

[ ... ]

> +	data->domain =3D irq_domain_add_linear(dev->of_node,
> +					     data->info->num_gpios,
> +					     &rtd1625_gpio_irq_domain_ops,
> +					     data);
> +	if (!data->domain)
> +		return -ENOMEM;
> +
> +	ret =3D rtd1625_gpio_setup_irq(pdev, data);
> +	if (ret) {
> +		irq_domain_remove(data->domain);
> +		return ret;
> +	}
> +
> +	config.irq_domain =3D data->domain;
> +	config.drvdata =3D data;
> +	platform_set_drvdata(pdev, data);
> +
> +	gpio_reg =3D devm_gpio_regmap_register(dev, &config);
> +	if (IS_ERR(gpio_reg)) {
> +		irq_domain_remove(data->domain);
> +		return PTR_ERR(gpio_reg);
> +	}

If devm_gpio_regmap_register() fails, or when the driver is later unbound
(since there is no .remove callback), data is automatically freed by devres.

However, rtd1625_gpio_setup_irq() configures chained handlers on the parent
IRQs which are not cleaned up. Will this cause a use-after-free if the pare=
nt
hardware interrupt fires after cleanup? Also, is the irq_domain leaked on
driver unbind?

> +
> +	data->gpio_chip =3D gpio_regmap_get_gpiochip(gpio_reg);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512033317.1602=
537-1-eleanor.lin@realtek.com?part=3D6
