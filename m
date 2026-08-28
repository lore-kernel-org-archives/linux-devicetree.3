Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD4A348C7B
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 15:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932129; cv=none; b=C+/aevN3DhwmjSqYm1If84LB3WhHv2SJLhK+k8hCkXeIJkc1mgxNqFFxivNZCjow5zyeKw1+8s9AVnggwhBzDOZ4Y6s9/Hago5dgAng2agGwqe645BkZ6CRp5uP2pX48qkoyZqp00o4apffbOt9hjP8+GiIKNsIrOqA6KwJnj4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932129; c=relaxed/simple;
	bh=+vGaBhMU/J4MMR3cTY5lX+Cg+Pl76wd2jiepCeKuSf4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GRo+rtGb25XngfAtHXMevC4Y2JBlgIlAT1utqLZPOI2JKEtv/KR00f3quPmhgZUe46iMVviL/L6kKpdsOVapDvYWe/B8rdDxLJUXfByT3tlhF8ZC9wDw92+xHwiyEcmDSDMb5ps0e6jSOvW2/O7RuiPahzpxmTvDT6W3zqqPDfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+8KACCi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+8KACCi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF401F000E9;
	Fri, 28 Aug 2026 15:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787932125;
	bh=nCqda9lHQbFzolsuqTZmfeJPYaF70Wj2/3+GPWxLIRs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V+8KACCi1R8RitsBQo7nwrHhjdPcdhrYZs5iBI/dX9Q6GSPnMgJaWfGqtUmRZSdmS
	 ISBbO9ElDTXdWHoDMtileIb7gJmtWiPDW0Utnm/zF2+OIWKyvzHGenfmJQBeE3amFk
	 usJ2eUDUuuBaMVxzTzl4pbcRX2g0/sO7F87s1ONXqraaK22aD8v98R+rtVNTjuwNlu
	 lMdqMnmjaP/3uxbCy+PYFOEwc5FKi9Jr4rsa1ceP5hE4G4UHbYSljRwkTI8FBuxKBA
	 1uPEisLlouinFUZJwvvOQdE+JTkFV/Y8FQ1COYX0gFhURo6Rk8Gw2jL0TLMKIGTrmC
	 XQsMtjcTFXijA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] pinctrl: airoha: limit GPIO interrupts to
 interrupt-capable pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmed Naseef" <naseefkm@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <420a5e385cf7204318cdc1cc86a99570162e9b35.1787931313.git.naseefkm@gmail.com>
References: <cover.1787931313.git.naseefkm@gmail.com>
 <420a5e385cf7204318cdc1cc86a99570162e9b35.1787931313.git.naseefkm@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 15:48:44 +0000
Message-Id: <20260828154845.2BF401F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] The patch fails to properly bound the inner interrupt loop to `n=
um_irq_pins`, leaving it vulnerable to falsely claiming shared interrupts.

Pre-existing issues:
- [High] Use-After-Free in the interrupt handler during device unbind due t=
o incorrect devres registration order.
- [High] The interrupt handler unconditionally clears the status register a=
fter processing, creating a race condition that permanently drops edge inte=
rrupts.
--

commit a41a436d88572aa867cd2449961e1f380a5c1d31
Author: Ahmed Naseef <naseefkm@gmail.com>

pinctrl: airoha: limit GPIO interrupts to interrupt-capable pins

The driver assumes that every one of the AIROHA_NUM_PINS GPIOs can raise
an interrupt. That holds for the SoCs supported so far, but not for every
member of the family: on EN7528 only GPIO0-GPIO15 are wired to the
interrupt controller.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index f505a3f69c5d1..52a768c859b71 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
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

[Severity: Medium]
Will this fail to bound the inner interrupt loop if num_irq_pins is not a
multiple of 32?

If num_irq_pins is, for example, 16 for EN7528, the inner loop still iterat=
es
up to 32:

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_irq_handler() {
    ...
		status =3D regmap;
		for_each_set_bit(irq, &status, AIROHA_PIN_BANK_SIZE) {
			u32 offset =3D irq + i * AIROHA_PIN_BANK_SIZE;

			generic_handle_domain_irq(girq->domain, offset);
    ...
}

If hardware sets any status bits beyond num_irq_pins (like raw floating GPIO
state), they will be processed. generic_handle_domain_irq() will return
-EINVAL but handled will be set to true, falsely claiming the interrupt.

[Severity: High]
This is a pre-existing issue, but does this unconditional clear drop hardwa=
re
edge interrupts?

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_irq_handler() {
    ...
		for_each_set_bit(irq, &status, AIROHA_PIN_BANK_SIZE) {
			u32 offset =3D irq + i * AIROHA_PIN_BANK_SIZE;

			generic_handle_domain_irq(girq->domain, offset);
			regmap_write(pinctrl->regmap,
				     pinctrl->gpio_regs->status[i], BIT(irq));
		}
    ...
}

When an edge interrupt occurs, generic_handle_domain_irq() correctly calls
the driver's .irq_ack callback to clear the latch before running the device
action handler.

If a new edge arrives during the action execution, the hardware latches it
again. However, when generic_handle_domain_irq() returns, the handler
unconditionally executes a redundant regmap_write() to clear the status bit=
 a
second time, blindly wiping out any newly latched edge interrupt before it =
can
be processed.

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

[Severity: High]
This is a pre-existing issue, but can this devres registration order create=
 a
use-after-free window during device unbind?

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_pinctrl_add_gpiochip() {
    ...
	err =3D devm_request_irq(dev, irq, airoha_irq_handler, IRQF_SHARED,
				dev_name(dev), pinctrl);
	if (err)
		return err;

	return devm_gpiochip_add_data(dev, gc, pinctrl);
}

The driver registers the parent IRQ with devm_request_irq() before register=
ing
the gpiochip. During unbind, devres runs in reverse, calling gpiochip_remov=
e()
(which destroys and frees girq->domain) before calling free_irq().

Because IRQF_SHARED is used, the handler remains active on the shared line.
If a shared interrupt fires in this window, airoha_irq_handler() runs and
dereferences the freed girq->domain pointer in generic_handle_domain_irq().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787931313.gi=
t.naseefkm@gmail.com?part=3D1
