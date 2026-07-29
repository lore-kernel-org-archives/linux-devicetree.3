Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3573C3CAA30
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 07:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785309278; cv=none; b=PIH8lsUFSCD/4cCiTZUZBV2+sHr1AWIAcE7uJ+JguyhEau7//vfl5IDYHha2mwZwBc4FXTIhgdSIbBT58oeaqiHKa7RiLt7IVmZE70qml8+B+yBPIjwx8sRW93jJ7XZws4NErLzV656Hr5RkV8UN5rBcAHH5EKRfI53uQZ/prOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785309278; c=relaxed/simple;
	bh=v6dKEZ4B7/uQ+YCApH9cHCCdEz8pIJK3eynwWOaK8dM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lVHGT9uPyuEm6nnXO9Wr95lrPEwA5fsBX4EpAD4MicDpjMJOtiH+4irrMwhTdQJlWR9xsLe61tGwIP2CPh5onPRdUz923992IPpGcJxR0+hvcKES387QsRxUNLtSFTUeFkJVNuP8XmcjotdGJBd7Rast3DSav4h3l3lgiSIIjJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8JPLAcs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8JPLAcs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61FDA1F000E9;
	Wed, 29 Jul 2026 07:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785309275;
	bh=836z6hzXhiHDQw8br6v4sqbJnlbAdPohyHx6KEt8CIs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H8JPLAcs5GWe+vYCejwiTyLOz121SlJ4trDXfbMZgHDtUDwCwRjge+JdDXBcMwgZu
	 nOcywhskOF8D4E++PxpG8Pf+IToAPjNVEl0AOzM3dvZPoCjuYmZAN1OUNF7kq8BlQg
	 WisrNasPAUJ7rpTe93ibWbWywsODJwk8SpuCC5ykjEQQUc1R+dECkyOao+IPMhLgzJ
	 F8KNoQgAfF7ZJmB8MB1a+ti3QieYB7qnO1ZiMMxZedG/YDQhaQoK3vUiAqos+IsMac
	 H1IG8dX8MdrG8c0qb5LvY71cWbMRTdtek0o3+0nyn/P4PZT+4OA/CyQ9OhWOnEdmEO
	 8ArUg1HWwXxkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] gpio: axiado: add SGPIO controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260729-axiado-ax3000-sgpio-controller-v2-2-976f4ed11438@axiado.com>
References: <20260729-axiado-ax3000-sgpio-controller-v2-0-976f4ed11438@axiado.com>
 <20260729-axiado-ax3000-sgpio-controller-v2-2-976f4ed11438@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 07:14:34 +0000
Message-Id: <20260729071435.61FDA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] ax3000_sgpio_get() returns a stale cached value for input GPIOs, w=
hich breaks polling loops and risks livelocks.
- [High] Edge interrupts are permanently lost if they occur while the child=
 interrupt is masked.
- [High] Missing required `irq_ack` callback for `handle_edge_irq` causes a=
 NULL pointer dereference.
- [High] Hardware configuration for Clock (Slice A0) and Output Enable (Sli=
ce E4) is hardcoded to 32 pins, truncating SGPIO operation.
- [High] Function pointer type mismatch for `sgpio->chip.set` causes Contro=
l-Flow Integrity (KCFI) panics.
- [High] Devres registration order causes a Use-After-Free of the IRQ domai=
n when the device is unbound.
- [Medium] The threaded IRQ handler `sgpio_irq_handler` unconditionally ret=
urns `IRQ_HANDLED`, preventing the detection of spurious interrupts.
--

--- Patch [2]: [PATCH v2 2/2] gpio: axiado: add SGPIO controller support ---
commit f070fa50e06960bd582fe83c1386133514675e7d
Author: Petar Stepanovic <pstepanovic@axiado.com>

gpio: axiado: add SGPIO controller support
   =20
Add support for the Axiado SGPIO controller.

Each SGPIO position provides one input GPIO and one output GPIO with
fixed directions. The driver registers the controller as a gpio_chip,
supports interrupts on input GPIOs, and uses regmap for register access.

> diff --git a/drivers/gpio/gpio-axiado-sgpio.c b/drivers/gpio/gpio-axiado-=
sgpio.c
> new file mode 100644
> index 0000000000000..91e63239c99d4
> --- /dev/null
> +++ b/drivers/gpio/gpio-axiado-sgpio.c

[ ... ]

> +static const struct irq_chip axiado_sgpio_irqchip =3D {
> +	.name =3D "axiado-sgpio",
> +	.irq_mask =3D sgpio_mask_irq,
> +	.irq_unmask =3D sgpio_unmask_irq,
> +	.irq_set_type =3D sgpio_set_irq_type,
> +	.irq_shutdown =3D sgpio_irq_shutdown,
> +	.flags =3D IRQCHIP_IMMUTABLE | IRQCHIP_MASK_ON_SUSPEND,
> +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};

[Severity: High]
Is a .irq_ack callback required here?

The flow handler for edge interrupts is set to handle_edge_irq() below in
sgpio_set_irq_type(). The kernel's handle_edge_irq() unconditionally calls
the .irq_ack callback on the irq_chip.

Will omitting .irq_ack from this structure cause a NULL pointer dereference
when the handler fires?

[ ... ]

> +static int ax3000_sgpio_set(struct gpio_chip *chip, unsigned int offset,
> +			     int value)

[Severity: High]
Is it safe to define this function as returning an int?

The set callback in struct gpio_chip is expected to return void.

Could assigning an int-returning function to the chip.set pointer trigger a
Control-Flow Integrity (KCFI) panic when the callback is indirectly invoked?

[ ... ]

> +static int ax3000_sgpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +	struct ax3000_sgpio *sgpio =3D gpiochip_get_data(chip);
> +	u32 position =3D (offset / 2) % 32;
> +	u32 bank =3D (offset / 2) / 32;
> +	u32 val;
> +
> +	if (!(offset % 2)) {
> +		guard(spinlock_irqsave)(&sgpio->lock);
> +
> +		val =3D sgpio->slices[3].reg_ss[bank];

[Severity: High]
Does this return a stale cached value for input GPIOs?

The slices[3].reg_ss cache is only updated during the threaded IRQ handler
sgpio_irq_handler().

If a consumer driver loops polling this GPIO state while preventing the
IRQ thread from running, could this cause a permanent livelock since the
cache will never be refreshed?

[ ... ]

> +static irqreturn_t sgpio_irq_handler(int irq, void *arg)
> +{
> +	struct ax3000_sgpio *sgpio =3D (struct ax3000_sgpio *)arg;
> +	u32 status, new_value;
> +	u32 changed_value;
> +	int bit, reg_ptr;
> +	int ret, i;
> +
> +	/* Read-on-clear (ACK) parent cause */
> +	ret =3D regmap_read(sgpio->regmap,
> +			  sgpio->regmap_base_offset + sgpio->regs->status,
> +			  &status);
> +	if (ret)
> +		return IRQ_NONE;
> +
> +	status >>=3D 16;
> +
> +	bool has_shifted_layout =3D (sgpio->max_offset_regs =3D=3D MAX_OFFSET_R=
EG);
> +
> +	reg_ptr =3D has_shifted_layout ? 16 - DIV_ROUND_UP(sgpio->ngpios, 32) :=
 0;
> +
> +	for (i =3D 0; i < DIV_ROUND_UP(sgpio->ngpios, 32); i++, reg_ptr++) {
> +		if (status & BIT(reg_ptr)) {
> +			ret =3D regmap_read(sgpio->regmap,
> +					  sgpio->regmap_base_offset +
> +					  sgpio->regs->din_ss +
> +					  reg_ptr * sizeof(u32),
> +					  &new_value);
> +			if (ret)
> +				continue;
> +
> +			{
> +				guard(spinlock_irqsave)(&sgpio->lock);
> +				changed_value =3D sgpio->slices[3].reg_ss[i] ^ new_value;
> +				sgpio->slices[3].reg_ss[i] =3D new_value;
> +			}

[Severity: High]
Can this permanently drop edge interrupts if they occur while the child
interrupt is masked?

When an edge event triggers the parent handler, the software cache is updat=
ed
here regardless of the child IRQ's mask state.

If the child IRQ is currently masked below, the event isn't pended or
otherwise saved. Once the IRQ is unmasked, wouldn't the edge be completely
lost since the cache has already absorbed the state change?

> +
> +			while (changed_value) {
> +				irq_hw_number_t hwirq;
> +				unsigned int position;
> +				unsigned int type;
> +				bool rising;
> +
> +				bit =3D __ffs(changed_value);
> +				changed_value &=3D ~BIT(bit);
> +
> +				position =3D i * 32 + bit;
> +				hwirq =3D position * 2;
> +
> +				rising =3D !!(new_value & BIT(bit));
> +				type =3D READ_ONCE(sgpio->irq_type[position]);
> +
> +				if (rising &&
> +				    !(type & IRQ_TYPE_EDGE_RISING))
> +					continue;
> +
> +				if (!rising &&
> +				    !(type & IRQ_TYPE_EDGE_FALLING))
> +					continue;
> +
> +				if (READ_ONCE(sgpio->irq_unmasked[position])) {
> +					unsigned int child_irq;
> +
> +					child_irq =3D irq_find_mapping(sgpio->chip.irq.domain,
> +								     hwirq);
> +					if (child_irq)
> +						handle_nested_irq(child_irq);
> +				}
> +			}
> +		}
> +	}
> +
> +	return IRQ_HANDLED;
> +}

[Severity: Medium]
Should this return IRQ_HANDLED unconditionally?

If no bits are set in the status register that match the loop conditions,
no events are processed but the handler still claims the interrupt.

Could this prevent the kernel's spurious interrupt detector from noticing
an interrupt storm and disabling the misbehaving IRQ line?

[ ... ]

> +static void sgpio_hw_init(struct ax3000_sgpio *sgpio)
> +{
> +	bool has_shifted_layout =3D (sgpio->max_offset_regs =3D=3D MAX_OFFSET_R=
EG);
> +	u32 position;
> +	u32 bank;
> +	int i;
> +
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->mask, 0);
> +
> +	/* slice A0, Clock Pin - 0 */
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->mux_0, 0x306);
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->preset_0,
> +		     sgpio->preset_value);
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->count_0,
> +		     sgpio->count_value);
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->pos_0, 0x1f001f);

[Severity: High]
Are the Clock (Slice A0) and Output Enable (Slice E4) hardware configuratio=
ns
hardcoded to only support 32 pins?

Writing 0x1f001f configures the hardware position for 32 bits. Later on,
only a single 32-bit register is initialized for the Output Enable (regs->o=
e).

If this driver is bound to a 128-pin or 512-pin controller, won't this
leave all pins beyond the first 32 completely disabled and unclocked?

[ ... ]

> +	/* Slice E4, Output Enable for respective pins */
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->mux_4,
> +		     has_shifted_layout ? 0x10c : 0x104);
> +	regmap_write(sgpio->regmap, sgpio->regmap_base_offset + sgpio->regs->oe,
> +		     0xffffffff);
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->oe_ss,
> +		     0xffffffff);
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->preset_4,
> +		     sgpio->preset_value);
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->count_4,
> +		     sgpio->count_value);
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->pos_4, 0x1f001f);

[ ... ]

> +static int sgpio_probe(struct platform_device *pdev)
> +{
...
> +	rc =3D devm_request_threaded_irq(&pdev->dev, irq, NULL, sgpio_irq_handl=
er,
> +				       IRQF_ONESHOT, dev_name(&pdev->dev), sgpio);
> +
> +	if (rc)
> +		return dev_err_probe(&pdev->dev, rc, "Failed to request IRQ\n");

[Severity: High]
Does registering the IRQ before adding the gpiochip cause a use-after-free
on device unbind?

Devres manages resource cleanup in reverse order (LIFO).

If the IRQ is requested here, and then the gpiochip is added below:

> +
> +	sgpio->chip.parent =3D &pdev->dev;
> +	sgpio->chip.ngpio =3D sgpio->ngpios * 2;
> +	sgpio->chip.get_direction =3D ax3000_sgpio_get_direction;
> +	sgpio->chip.direction_input =3D ax3000_sgpio_dir_in;
> +	sgpio->chip.direction_output =3D ax3000_sgpio_dir_out;
> +	sgpio->chip.get =3D ax3000_sgpio_get;
> +	sgpio->chip.set =3D ax3000_sgpio_set;
> +	sgpio->chip.can_sleep =3D true;
> +	sgpio->chip.label =3D dev_name(&pdev->dev);
> +	sgpio->chip.base =3D -1;
> +
> +	girq =3D &sgpio->chip.irq;
> +
> +	gpio_irq_chip_set_chip(girq, &axiado_sgpio_irqchip);
> +	girq->handler =3D handle_bad_irq;
> +	girq->default_type =3D IRQ_TYPE_NONE;
> +	girq->init_valid_mask =3D axiado_sgpio_irq_init_valid_mask;
> +	girq->threaded =3D true;
> +	girq->parent_handler =3D NULL;
> +	girq->num_parents =3D 0;
> +	girq->parents =3D NULL;
> +
> +	rc =3D devm_gpiochip_add_data(&pdev->dev, &sgpio->chip, sgpio);

won't the gpiochip and its IRQ domain be torn down during removal while the
interrupt handler is still registered?

If the interrupt fires in this window, the handler calls irq_find_mapping()
on a freed IRQ domain.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-axiado-ax3=
000-sgpio-controller-v2-0-976f4ed11438@axiado.com?part=3D2
