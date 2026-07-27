Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C0142F6EB
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785175419; cv=none; b=YqAN9XN86dpSoCIjHx+ULQW3MnxZHcnGMsyvvH/bl0RzcQEqEssbxEkvMlvqr21KdidrKVHA/Jt9N0+HWUf0N/Zg0UGwMvdm0OJHzpsKcuI7bwGU1lqCeuv0G8EUjDRduf3sr3sqliiJsuZcC/Mj6aHSG8VA/ifQ//c2z+HFz90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785175419; c=relaxed/simple;
	bh=ssmcKElcPhoj3gm1D7Ps+gWIvPy/6yX3USmG868pF7s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hbBgucLqfMMiFqQTzfYljzYlWQVtWC9UKIqo2vLnsjhdCdj3VaaGwa77AWCm4CZye9cXRLmNO1P/TNoHwFe/0nM6/OmODMrGfJw5BX4KdkXeAh+rdPBw9mJbC+4k0zjVFpHsEWco8MzWPVDC9n9so0vXLLRY5vrJe7a7kFeMBTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/FNldYH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/FNldYH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 384611F000E9;
	Mon, 27 Jul 2026 18:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785175417;
	bh=DQGZmWqXmGudRxb/7H2R5sNWch7m5tedw/OIjwxFLPw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O/FNldYH9HvGSZFvxTWLKakyybyhCP3oU963ppqmJO9FkY/aWOYAHq0Gdq5BA7v/h
	 UbsjVf3j5TBMog9+eMy73yrnqfQ0W9nhDInUpDk+bEy8SC+Da8p2qHMCvY9qLjkTEl
	 nVTwCNftl2RW1FjBdwjUI9luLN908Y0JTe/L0fj+h7wPCn9579EUpy8JkonbrjtvNX
	 gMfCszsl00dz19U+gxkutHbaVJq3uXpD6DkqfGRheIagsGYo6ho9DzAFIjFOA5wdm9
	 7amnUSKMQGBDe539KQT2XkoNElq9hWVdfldqwyrG2JhUAo5JnadjzCYiETiCRhMKlX
	 I2aCiTTzrJ/lQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 18/35] pinctrl: airoha: fix edge-triggered interrupts
 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260727174141.664933-19-mikhail.kshevetskiy@iopsys.eu>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727174141.664933-19-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 18:03:36 +0000
Message-Id: <20260727180337.384611F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Redundant manual clearing of the interrupt status in the chained h=
andler drops newly latched edge interrupts.

Pre-existing issues:
- [High] Acquiring a `spinlock_t`-protected regmap from within an `irq_chip=
` callback while a `raw_spinlock_t` is held.
--

--- Patch [18]: [PATCH v8 18/35] pinctrl: airoha: fix edge-triggered interr=
upts handling ---
commit 33dfa7f80fbe6a5d6d2b4b58cb7fc7442d5bbe21
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: fix edge-triggered interrupts handling

This patch adds an irq_ack callback and sets the correct IRQ handlers for
edge and level triggered interrupts.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index f11ec77f6e338..42714b8beb3cc 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c

[ ... ]

> @@ -2608,11 +2608,28 @@ static void airoha_irq_mask(struct irq_data *data)

[ ... ]

> +static void airoha_irq_ack(struct irq_data *data)
> +{
> +	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(data);
> +	struct airoha_pinctrl *pinctrl =3D gpiochip_get_data(gc);
> +	struct airoha_pinctrl_gpiochip *gpiochip =3D &pinctrl->gpiochip;
> +	u8 offset =3D data->hwirq % AIROHA_PIN_BANK_SIZE;
> +	u8 index =3D data->hwirq / AIROHA_PIN_BANK_SIZE;
> +
> +	if (data->hwirq >=3D ARRAY_SIZE(gpiochip->irq_type))
> +		return;
> +
> +	regmap_write(pinctrl->regmap, gpiochip->status[index], BIT(offset));

[Severity: High]
This is a pre-existing issue, but does calling regmap_write() here cause a
lock nesting violation?

The core IRQ subsystem calls airoha_irq_ack() while holding the IRQ
descriptor's raw spinlock. If this syscon regmap internally acquires a
standard spinlock, it will cause a sleeping in atomic context lockdep splat
or a kernel panic on PREEMPT_RT kernels, since standard spinlocks map to a
sleepable rt_mutex.

> +}
> +

[ ... ]

> @@ -2653,8 +2682,7 @@ static irqreturn_t airoha_irq_handler(int irq, void=
 *data)
>  		for_each_set_bit(irq, &status, AIROHA_PIN_BANK_SIZE) {
>  			u32 offset =3D irq + i * AIROHA_PIN_BANK_SIZE;
> =20
> -			generic_handle_irq(irq_find_mapping(girq->domain,
> -							    offset));
> +			generic_handle_domain_irq(girq->domain, offset);
>  			regmap_write(pinctrl->regmap,
>  				     pinctrl->gpiochip.status[i], BIT(irq));

[Severity: High]
Can this redundant status clear drop newly latched edge interrupts?

Since the core IRQ subsystem now correctly acknowledges edge interrupts ear=
ly
via the newly added airoha_irq_ack() callback, if a new edge interrupt
arrives while the device driver's airoha_irq_handler() is running, the
hardware latches the new status.

Clearing the status bit again here after generic_handle_domain_irq() returns
erases the newly latched interrupt without it ever being serviced.

>  		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727174141.6649=
33-1-mikhail.kshevetskiy@iopsys.eu?part=3D18
