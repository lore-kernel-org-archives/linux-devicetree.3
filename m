Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34D342DA38
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 22:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786055062; cv=none; b=PEaUG0nOVfpbMOSA/3HJig4sVc4yrB6IF5aMMtW7SoDxqPz/aAvwnXd5jr5dalS7OfDsvMGJCFnaJpw1Tzt2iWaFsId//m1qwB7FCStupXkdJn54TustRYgcW4/2A4cba1B9qVXYza2ZVdsJFTBThMok6uRNKHLjbQhHGc5FpPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786055062; c=relaxed/simple;
	bh=TUYM0ZA2elOtD4yOZCaWgSCUSoi+UJ+dIt5L1IP3ZCs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PGDSzu0EjDu5u8sWN1drV0Qsyt0kl+WpYO+XRQg23tqAqzPkkbLdpLB2MixAp/A8oE08zx75B2tr80VNUFdDG3yR823wasVh7huQ/viERUbQiMitCu2rlIwVFti7xTJlbUWELlA+9qY6f3DqVkMMIsojFIAWaxIklIsiHLaiK4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MbyTi1Vj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MbyTi1Vj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF1F1F000E9;
	Thu,  6 Aug 2026 22:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786055059;
	bh=Dui3CXm6FEN1xQI5UwdIiopXBWfDslg3XJHWpD2vNGk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MbyTi1VjXROgrKI62CZzhFgoABV1jmEys6qAKTvZhmbpDaEl/OwHEr6c5u5PZDeDW
	 nVCgPKF21Sw3ZRWB07IYlJDmuhas246LiCIXREqHQ6RQoeHgjJpSq/q+iCXnBM3yZw
	 cKR4OmdtS2lQOm5Nd3souIesbKFAtIm1CJj58WkvsPpywne2FaR+ejhTnrCRkwhKTb
	 wZA4iAwCsqtPGcQiVtBO7Q9jC6mjdV18JV+JBXCYD86UJ9HYbAdW6U+TLIKLrJZakt
	 ox3x6eGv67tZS0G3MbtJ9D7EQI3Ql+6IuyioGmhZXTCgNqkiG0AVpbLMCsfPk6ucvJ
	 Ld7huJPrJKB1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 20/37] pinctrl: airoha: fix IRQ mask/unmask code
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260806220615.4078303-21-mikhail.kshevetskiy@iopsys.eu>
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
 <20260806220615.4078303-21-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 22:24:18 +0000
Message-Id: <20260806222419.1AF1F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Lost edge-triggered interrupts due to clearing interrupt status af=
ter running the handler and using handle_simple_irq.
- [High] Sleeping in atomic context on PREEMPT_RT due to regmap calls withi=
n irq_mask/irq_unmask.
--

--- Patch [20]: [PATCH v11 20/37] pinctrl: airoha: fix IRQ mask/unmask code=
 ---
commit 6fffeeb5d12a43c2d9965d0cb9e5d1e4595a6f8f
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: fix IRQ mask/unmask code
   =20
This commit adds missing gpiochip_enable_irq() and gpiochip_disable_irq()
calls to the IRQ mask and unmask functions. This ensures gpiolib correctly
sets the GPIOD_FLAG_IRQ_IS_ENABLED bit.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index f3078f9b14a76..4859fcebac7de 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -2595,6 +2595,7 @@ static void airoha_irq_unmask(struct irq_data *data)
>  	if (WARN_ON_ONCE(data->hwirq >=3D ARRAY_SIZE(gpiochip->irq_type)))
>  		return;
> =20
> +	gpiochip_enable_irq(gc, irqd_to_hwirq(data));
>  	switch (gpiochip->irq_type[data->hwirq]) {
>  	case IRQ_TYPE_LEVEL_LOW:
>  		val =3D val << 1;

[ ... ]

> @@ -2629,6 +2630,7 @@ static void airoha_irq_mask(struct irq_data *data)
> =20
>  	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
>  	regmap_clear_bits(pinctrl->regmap, gpiochip->edge[index], mask);

[Severity: High]
This is a pre-existing issue, but does calling regmap_clear_bits() here
cause a sleep in atomic context on PREEMPT_RT?

Since airoha_irq_mask() is called by the core irq framework with the raw
desc->lock held, using a syscon regmap which defaults to a sleepable
spinlock on PREEMPT_RT could lead to a lockdep splat or crash. This also
applies to the regmap_update_bits() call in airoha_irq_unmask().

> +	gpiochip_disable_irq(gc, irqd_to_hwirq(data));
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does the driver lose
edge-triggered interrupts in the handler?

Looking at airoha_irq_handler(), the hardware status is cleared via
regmap_write() after the handler has executed:

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_irq_handler() {
	...
	generic_handle_irq(irq_find_mapping(girq->domain,
					    offset));
	regmap_write(pinctrl->regmap,
		     pinctrl->gpiochip.status[i], BIT(irq));
	...
}

Also, airoha_pinctrl_add_gpiochip() hardcodes handle_simple_irq for all
interrupt types:

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_pinctrl_add_gpiochip() {
	...
	girq->handler =3D handle_simple_irq;
	...
}

If a second edge happens while the interrupt is being serviced, wouldn't the
hardware latch the status, only for it to be wiped out by the regmap_write()
after generic_handle_irq() returns without being serviced?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806220615.4078=
303-1-mikhail.kshevetskiy@iopsys.eu?part=3D20
