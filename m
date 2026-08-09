Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293973B2AA
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 08:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786263531; cv=none; b=usBqdi/TjRJSzJt2mO/bKO9G5MSRqfXFmz29jKg4EST/aFDecVosTyP70ZQmMEyTjc2TDol+5Ucq2Nphn5B8TG9ftg5r+ZBN9kRrBv0dKHwWNX09VPtKCaByo5xh+Mk8KXD2VxMwSPdraaU65KYxAlvGncFVXEPcpNxGvoeevpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786263531; c=relaxed/simple;
	bh=bUkrAkgWiyuyDLTf+RdmlMu7eDOfbSeFFbxyBzyPvIY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ly37lgcYCXdjgJY5BgUoB+Rb0+TZ8bo2XSsMXryiGkEocl9cW+xM5wkGffWqvpKCAalpyvG9m6ZWDmwxEDwMGxKOS7Sh9MhtR51udy4VORqQ3aJdaMypUYWrWCMeh0/kNs55W2ZDkls85Rlktf1OxIs74x5NuLWAirSp+IV3fV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AMpMWxXP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AMpMWxXP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B8F1F000E9;
	Sun,  9 Aug 2026 08:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786263529;
	bh=vgWyBzK0DrkvocBUmJ9kqL1FUQ1Rpj9NPx3vaozhlBQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AMpMWxXPDyR4+dynneFQ8EL37nEhJTIsy7TDU8vf+qKlcimbSCfssaEHYl7Wif31T
	 3YjSxDZ/4yl3U06sGXBrEfQtuXBjlenRXkSzdGexY4uWmBMJUAYyile5fv0Nqr23qY
	 cKTL2b9e0qUNglgUZ/S9eNDGHVB6/DgNcTl12/3KNmh0996pXcrheVQkwovetnH7QO
	 F2RRyQC9UBNdm9aVnKVgT4pYb4Hr9uEkCuLgK8aiX7oQNxDu3RJ74Ysl8rco/gkbHk
	 0ksNhjnfKWWdEn6DiXMTjryTSbpNhYZ5iLz4JSDpO8yB1K/fvP8VNP41ArgEqCGB4Z
	 Pq8F//yrN8Bfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] pinctrl: airoha: limit GPIO interrupts to
 interrupt-capable pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmed Naseef" <naseefkm@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <5a7f97adbca73f2bd01393ce0ca840c2a6f43f76.1786262697.git.naseefkm@gmail.com>
References: <cover.1786262697.git.naseefkm@gmail.com>
 <5a7f97adbca73f2bd01393ce0ca840c2a6f43f76.1786262697.git.naseefkm@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 08:18:49 +0000
Message-Id: <20260809081849.89B8F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The shared parent interrupt is requested before the gpiochip and i=
ts IRQ domain are fully registered, creating a race condition that loses ha=
rdware interrupts during probe.
- [High] The interrupt handler manually clears the hardware status bit afte=
r the child handler completes, creating a race condition that drops edge-tr=
iggered interrupts.
- [High] The driver acquires a sleepable spinlock inside IRQ chip callbacks=
 while holding a raw_spinlock_t, violating PREEMPT_RT lock nesting rules.
- [High] The interrupt handler loops over banks bounded by `num_irq_pins` b=
ut fails to mask out unbacked bits within the final bank, neutralizing spur=
ious interrupt mitigation.
--

--- Patch [1]: [PATCH 1/3] pinctrl: airoha: limit GPIO interrupts to interr=
upt-capable pins ---
commit 540e2cd0ad7d06a01aca006b216ac539740ee038
Author: Ahmed Naseef <naseefkm@gmail.com>
pinctrl: airoha: limit GPIO interrupts to interrupt-capable pins

This patch limits GPIO interrupts to interrupt-capable pins by introducing a
num_irq_pins field to the SoC match data. It restricts the interrupt callba=
cks
and the loop in the interrupt handler, and feeds the count to gpiolib to
prevent requesting invalid interrupts.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index f505a3f69c5d1..52a768c859b71 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -213,7 +213,7 @@ static void airoha_irq_unmask(struct irq_data *data)
>  	u32 mask =3D GENMASK(2 * offset + 1, 2 * offset);
>  	u32 val =3D BIT(2 * offset);
> =20
> -	if (WARN_ON_ONCE(data->hwirq >=3D AIROHA_NUM_PINS))
> +	if (WARN_ON_ONCE(data->hwirq >=3D pinctrl->num_irq_pins))
>  		return;
> =20
>  	gpiochip_enable_irq(gc, irqd_to_hwirq(data));
>  	switch (irqd_get_trigger_type(data)) {
>  	case IRQ_TYPE_LEVEL_LOW:
>  		val =3D val << 1;
>  		fallthrough;
>  	case IRQ_TYPE_LEVEL_HIGH:
>  		regmap_update_bits(pinctrl->regmap, gpio_regs->level[index],
>  				   mask, val);

[Severity: High]
This isn't a bug introduced by this patch, but does calling
regmap_update_bits() here cause a lock nesting violation on PREEMPT_RT
kernels?

The IRQ chip callbacks like airoha_irq_unmask() are invoked by the IRQ core
with the descriptor lock (desc->lock) held, which is a raw_spinlock_t.

The syscon regmap (pinctrl->regmap) uses a standard spinlock_t that becomes
a sleepable RT-mutex on PREEMPT_RT. Acquiring a sleepable lock under a raw
spinlock leads to a kernel panic.

[ ... ]

> @@ -304,9 +307,11 @@ static irqreturn_t airoha_irq_handler(int irq, void =
*data)
>  {
>  	struct airoha_pinctrl *pinctrl =3D data;
>  	bool handled =3D false;
> +	unsigned int nbanks;
>  	int i;
> =20
> -	for (i =3D 0; i < ARRAY_SIZE(irq_status_regs); i++) {
> +	nbanks =3D DIV_ROUND_UP(pinctrl->num_irq_pins, AIROHA_PIN_BANK_SIZE);
> +	for (i =3D 0; i < nbanks; i++) {
>  		struct gpio_irq_chip *girq =3D &pinctrl->gpiochip.irq;
>  		u32 regmap;
>  		unsigned long status;
>  		int irq;
> =20
>  		if (regmap_read(pinctrl->regmap, pinctrl->gpio_regs->status[i],
>  				&regmap))
>  			continue;
> =20
>  		status =3D regmap;
>  		for_each_set_bit(irq, &status, AIROHA_PIN_BANK_SIZE) {
>  			u32 offset =3D irq + i * AIROHA_PIN_BANK_SIZE;
> =20
>  			generic_handle_domain_irq(girq->domain, offset);
>  			regmap_write(pinctrl->regmap,
>  				     pinctrl->gpio_regs->status[i], BIT(irq));

[Severity: High]
This isn't a bug introduced by this patch, but does clearing the hardware
status bit after the child handler completes cause edge-triggered interrupts
to be dropped?

In airoha_irq_handler(), after generic_handle_domain_irq() returns, the
handler manually clears the hardware status bit using regmap_write().
However, the IRQ core (such as handle_edge_irq) already invokes the chip's
irq_ack callback to clear this bit before executing the child handler.

By clearing the bit a second time after the child handler returns, any new
edge-triggered interrupts that arrived while the child handler was executing
would be silently erased.

>  		}
>  		handled |=3D !!status;

[Severity: High]
This is a pre-existing issue, but does failing to mask out unbacked bits in
the final bank neutralize the spurious interrupt mitigation?

While nbanks limits the outer loop, on EN7528 num_irq_pins is 16, so nbanks
is 1. The loop reads status[0] and for_each_set_bit() iterates over all
32 bits.

If any unbacked hardware bit (16-31) reads as 1, generic_handle_domain_irq()
is called (and safely returns -EINVAL), but handled incorrectly evaluates to
true. This would cause IRQ_HANDLED to be returned for spurious interrupts on
the shared line, defeating the kernel's spurious interrupt storm mitigation.

[ ... ]

> @@ -362,6 +383,7 @@ static int airoha_pinctrl_add_gpiochip(struct airoha_=
pinctrl *pinctrl,
> =20
>  	girq->default_type =3D IRQ_TYPE_NONE;
>  	girq->handler =3D handle_bad_irq;
> +	girq->init_valid_mask =3D airoha_gpio_init_valid_mask;
>  	gpio_irq_chip_set_chip(girq, &airoha_gpio_irq_chip);
> =20
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq < 0)
>  		return irq;
> =20
>  	err =3D devm_request_irq(dev, irq, airoha_irq_handler, IRQF_SHARED,
>  				dev_name(dev), pinctrl);
>  	if (err)
>  		return err;
> =20
>  	return devm_gpiochip_add_data(dev, gc, pinctrl);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does requesting the shared
parent interrupt before registering the gpiochip cause a race condition
during probe?

The driver requests the shared parent IRQ via devm_request_irq() before
calling devm_gpiochip_add_data().

If the shared IRQ line is asserted by another device before
devm_gpiochip_add_data() completes, airoha_irq_handler() will run, read the
hardware status, and call generic_handle_domain_irq() with an uninitialized
girq->domain. The core lookup fails, but the handler proceeds to clear the
hardware status and returns IRQ_HANDLED, dropping the interrupt.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786262697.gi=
t.naseefkm@gmail.com?part=3D1
