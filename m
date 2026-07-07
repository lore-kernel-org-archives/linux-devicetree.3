Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358303D891A
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 09:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783418264; cv=none; b=tNuQgdMKrq8eO36TtAu69OoK95s0EAeYGBMkAeRCs0Ks3rEsbFj+Vi4ZKa0cWcee83KpbMBxekCxgTbFLvKmP7OFEyq1vb3WMlHUrw+mv2zd5qdDBuYyQqTYXg0jYJ1RbjxxHfK8x1UviE4RzlXkFKdCkEal7mvInHYuy2SDrPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783418264; c=relaxed/simple;
	bh=qxX3tvsZdeKotDI/IwkpMCuK47jrzommPjMCT3dlGrg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BLuj22DhZIPlATdIePyp+U39VH5Kbbp4RoOo/wA2FhRTBib0qBrdUMk9oex2s9b/XjAGYHwiwT7AGkoyUDsWifg0GFdsIFvcV3uYPySMBHCHvHZV3ppEsBH4XHmW0L/ayW/I1y/EzR0MgaGmJEOyVBAzc4bkhh730dlRDMLgW3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RacDnoIb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RacDnoIb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BE201F000E9;
	Tue,  7 Jul 2026 09:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783418262;
	bh=NTp+KeaCUT/uw4i8PfcfNuCvYu4wVF/u3sV/ZzqiZgU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RacDnoIb9CuDfXZesi7O0QA5q4DvS7cXGBQulKJSxbdkEJHf3BmHXTKDByid1KIvL
	 cetZYPZspFSRo9700sEKGALTCRsi6Ht0YXluN9GKAPCEW/OOR9xoaSTV+q6lTG4gKZ
	 pLtPMlMgLXeIXbzYSiAEIbZP4eSv5KdpcubAsUIIRVwb5Kb0ZFUSOCKqpDyfs+GTZB
	 mOYtqegOgu5imD/v7TexDlr7dUyhYfaxtQh0JCSo8/j5HdMlVAKjEIT0RoHAAqV7VG
	 rNbGgSFQr6HIlvxqGhCGwwRaRmaam+tfp4tHpgPHWP4Hz0b2PBy185stmdSyOASsxs
	 78tj0Qu/C5qZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/7] irqchip/qcom-pdc: Configure PDC to pass through
 mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maulik Shah" <maulik.shah@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260707-hamoa_pdc_v3-v4-4-dfd1f4a3ae89@oss.qualcomm.com>
References: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
 <20260707-hamoa_pdc_v3-v4-4-dfd1f4a3ae89@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 09:57:42 +0000
Message-Id: <20260707095742.8BE201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Edge-triggered GPIO interrupts on PDC secondary controllers are ne=
ver cleared from the hardware latch, leading to an infinite interrupt storm.
- [High] Unprotected Read-Modify-Write (RMW) operations on `irq_cfg_reg` ca=
n overwrite and clear the hardware interrupt latch (`gpio_irq_sts`), result=
ing in lost interrupts.
- [Low] Redundant call to `irq_domain_set_hwirq_and_chip` in `qcom_pdc_allo=
c`.
--

--- Patch [4]: [PATCH v4 4/7] irqchip/qcom-pdc: Configure PDC to pass throu=
gh mode ---
commit 283bb75867e93f6367d30274c8a45615e4e22c2c
Author: Maulik Shah <maulik.shah@oss.qualcomm.com>

irqchip/qcom-pdc: Configure PDC to pass through mode

This commit configures the PDC to pass-through mode via SCM write, and
falls back to a secondary controller mode if it fails. It introduces separa=
te
IRQ chip operations to handle GPIO interrupts in secondary mode.

> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> index 53a477aa97655..d122e8e7dc9d7 100644
> --- a/drivers/irqchip/qcom-pdc.c
> +++ b/drivers/irqchip/qcom-pdc.c
[ ... ]
> @@ -229,6 +258,24 @@ static void pdc_enable_intr_bank(int pin_out, bool o=
n)
>  		pdc_reg_write(pdc->regs->irq_en_reg, index, enable);
>  }
> =20
> +static void pdc_clear_gpio_cfg(int pin_out)
> +{
> +	unsigned long gpio_sts;
> +
> +	gpio_sts =3D pdc_reg_read(pdc->regs->irq_cfg_reg, pin_out);
> +	__clear_bit(pdc->cfg_fields->gpio_irq_sts, &gpio_sts);
> +	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, gpio_sts);
> +}
> +
> +static void pdc_unmask_gpio_cfg(int pin_out, bool unmask)
> +{
> +	unsigned long gpio_mask;
> +
> +	gpio_mask =3D pdc_reg_read(pdc->regs->irq_cfg_reg, pin_out);
> +	__assign_bit(pdc->cfg_fields->gpio_irq_mask, &gpio_mask, !unmask);
> +	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, gpio_mask);
> +}

[Severity: High]
Can these software Read-Modify-Write operations on irq_cfg_reg race with
hardware setting the interrupt status bit?

If a hardware interrupt arrives between the software read and write, the
software will read a 0 for gpio_irq_sts. When the hardware sets it to 1,
and the software writes back the stale 0, does this inadvertently clear
the newly arrived interrupt and drop it entirely?

[ ... ]
> +static void qcom_pdc_secondary_ack(struct irq_data *d)
> +{
> +	if (!irqd_is_level_type(d))
> +		pdc->clear_gpio(d->hwirq);
> +}
> +
> +static void qcom_pdc_gic_secondary_eoi(struct irq_data *d)
> +{
> +	if (irqd_is_level_type(d))
> +		pdc->clear_gpio(d->hwirq);
> +
> +	irq_chip_eoi_parent(d);
> +}

[Severity: High]
For edge-triggered interrupts, does this logic result in the hardware latch
never being cleared, leading to an interrupt storm?

Since qcom_pdc_alloc() forces these interrupts to IRQ_TYPE_LEVEL_HIGH before
passing them to the parent GIC domain, the GIC will unconditionally configu=
re
them to use handle_fasteoi_irq().

Because handle_fasteoi_irq() only calls .irq_eoi and never calls .irq_ack,
qcom_pdc_secondary_ack() appears to be unreachable dead code. Meanwhile,
qcom_pdc_gic_secondary_eoi() explicitly skips clearing the latch for edge
types.

Would we need to call irq_set_handler_locked(d, handle_fasteoi_ack_irq) in
qcom_pdc_gic_secondary_set_type() for edge interrupts to ensure the latch g=
ets
cleared?

[ ... ]
> @@ -388,16 +563,38 @@ static int qcom_pdc_alloc(struct irq_domain *domain=
, unsigned int virq,
>  	if (ret)
>  		return ret;
> =20
> +	/*
> +	 * PDC secondary chip is only set for the GPIO interrupts as SPIs.
> +	 * Direct SPI interrupts are still in pass through mode (no latching
> +	 * at PDC).
> +	 */
> +	if (pdc->mode =3D=3D PDC_SECONDARY_MODE && pdc_pin_is_gpio(hwirq)) {
> +		ret =3D irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
> +						    &qcom_pdc_gic_secondary_chip,
> +						    NULL);
> +		if (ret)
> +			return ret;
> +
> +		/* Secondary mode converts all interrupts to LEVEL HIGH type */
> +		type =3D IRQ_TYPE_LEVEL_HIGH;
> +	} else {
> +		ret =3D irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
> +						    &qcom_pdc_gic_chip,
> +						    NULL);
> +		if (ret)
> +			return ret;

[Severity: Low]
Is this call to irq_domain_set_hwirq_and_chip() for &qcom_pdc_gic_chip
redundant?

There is already an unconditional call to irq_domain_set_hwirq_and_chip()
for &qcom_pdc_gic_chip just before the block added by this hunk. Does this
duplicate the earlier setup?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-hamoa_pdc_=
v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com?part=3D4
