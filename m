Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECBC476CD0
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 16:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860699; cv=none; b=lVqs39/AtIC1GEpxMDn1H77kj4Ttr90K/jWWckfSxIFGMYBhZrHp6BgL/xIeKDWWpa/27H7uGrjwMNRx2uTRxmjREiO8phPhBetesUIN3jXkCEElpJu6cmda2Lr73g5GpX5qnTdhk8ljQdYvNztdDE2IEt1/jCkdZbAB34x9570=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860699; c=relaxed/simple;
	bh=XgYKNyqIgWdnyRQVvdmvQGfnWlO6//g6loE5rImOgjk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aYTAYg6fahRCoD91lPEpXLNy80A6ouf/ncW0Y4KuY+5qfdmyzuToE1NUlAA06XSzRtTZp+R4xo2skaZr1SM3erT+rOQe5sjLKhSF6y0WvxE0UPgAvvhYxJkTb0Erg7FJ4sUeWX3M/Qbogrqy8N70bkfFTL4HVqy+x4caEL5twl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZPxw/gi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZPxw/gi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC84B1F000E9;
	Tue,  4 Aug 2026 16:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860697;
	bh=r55Iq/4eWo9YDGtPl2xDLuuY/ZMboDimWMHZzSZOYXg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NZPxw/giWnZoigjj26vNZ5XAXmj4R+fN/00yKIB3RkNmyXeVyUf0RRJB1AZ5jvIH2
	 nJExcDvQ1C4A9QhEuf5IMikxKwlMi+gyRwBPmZqaJXqGIuaBjiAd1UX66cNbcN4guY
	 dfXwPUzOZiljJzUX7+CIgz7x6cM++S9ZyKMs2k+54X/8aCUAxD5b+jg/BJyUf1SisY
	 ldgTCLB8k3e0CWKK8piqxvX4FXe91+iTQQGjh9JakkUqJLX3Yk26XAD0OvD5JTq0QK
	 zIvOMuyz6YHZ5rohRFlOwhX0V1m1CY+Ez5K+mZ7WSmLBu+GPunEcSOvO8Y39u+HPft
	 FLDgzMvqRjvZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 18/36] pinctrl: airoha: add missed IRQ resource
 helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260804160419.3592327-19-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
 <20260804160419.3592327-19-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 16:24:55 +0000
Message-Id: <20260804162456.EC84B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The irqchip is marked as `IRQCHIP_IMMUTABLE`, but its `.irq_mask` =
and `.irq_unmask` callbacks fail to call `gpiochip_disable_irq()` and `gpio=
chip_enable_irq()` respectively.
- [High] The IRQ handler acknowledges (ACKs) the interrupt by clearing the =
status register after the generic handler logic has executed, leading to lo=
st edge interrupts.
- [High] The driver requests the parent IRQ before the GPIO chip's IRQ doma=
in is registered, creating a race condition if an interrupt fires immediate=
ly.
- [High] The irqchip callbacks `airoha_irq_mask` and `airoha_irq_unmask` ca=
ll syscon regmap functions which acquire a `spinlock_t`, but they are invok=
ed with the irq descriptor's `raw_spinlock_t` held.
--

--- Patch [18]: [PATCH v9 18/36] pinctrl: airoha: add missed IRQ resource h=
elpers ---
commit 0adbdce0f6e107b50fe1d5a5369eb0d66b97d6e1
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: pinctrl: airoha: add missed IRQ resource helpers

This patch adds GPIOCHIP_IRQ_RESOURCE_HELPERS to the airoha_gpio_irq_chip
structure. This ensures .irq_request_resources is hooked up, allowing gpiol=
ib
to properly set GPIOD_FLAG_USED_AS_IRQ. This prevents userspace or other
drivers from incorrectly reconfiguring active IRQ pins as outputs.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 8c0a28eec0a17..261180b656392 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -2689,6 +2689,7 @@ static const struct irq_chip airoha_gpio_irq_chip =
=3D {
>  	.irq_mask_ack =3D airoha_irq_mask,
>  	.irq_set_type =3D airoha_irq_type,
>  	.flags =3D IRQCHIP_SET_TYPE_MASKED | IRQCHIP_IMMUTABLE,

[Severity: High]
This is a pre-existing issue, but since this chip is marked as
IRQCHIP_IMMUTABLE, should the airoha_irq_unmask() and airoha_irq_mask()
callbacks call gpiochip_enable_irq() and gpiochip_disable_irq() respectivel=
y?

Without these calls, the gpiolib core tracking of FLAG_IRQ_IS_ENABLED can
become desynchronized from the actual hardware state during dynamic unmaski=
ng
or masking of GPIO interrupts:

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_irq_unmask() {
        ...
        case IRQ_TYPE_LEVEL_HIGH:
                regmap_update_bits(pinctrl->regmap, gpiochip->level[index],
                                   mask, val);
                break;
        ...
}

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_irq_mask() {
        ...
        regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
        regmap_clear_bits(pinctrl->regmap, gpiochip->edge[index], mask);
}

[Severity: High]
This isn't a bug introduced by this patch, but does the irq_mask and
irq_unmask implementation risk deadlocks on PREEMPT_RT kernels?

The airoha_irq_mask() and airoha_irq_unmask() callbacks invoke syscon regmap
functions (like regmap_update_bits and regmap_clear_bits) which acquire a
spinlock_t (a sleepable rt_mutex on PREEMPT_RT).=20

Since these irqchip callbacks are invoked with the irq descriptor's
raw_spinlock_t held, this creates a wait-context hierarchy violation=20
(LD_WAIT_SPIN > LD_WAIT_CONFIG).

> +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
>  };
> =20
>  static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,

[Severity: High]
This is a pre-existing issue, but does using handle_simple_irq instead of
handle_edge_irq lead to lost edge interrupts?

In airoha_irq_handler(), the hardware interrupt is acknowledged by clearing
the status register after the generic handler executes:

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_irq_handler() {
        ...
                for_each_set_bit(irq, &status, AIROHA_PIN_BANK_SIZE) {
                        ...
                        generic_handle_irq(irq_find_mapping(girq->domain,
                                                            offset));
                        regmap_write(pinctrl->regmap,
                                     pinctrl->gpiochip.status[i], BIT(irq));
                }
        ...
}

If a new edge interrupt triggers on the same GPIO pin while
handle_simple_irq() is executing, the unconditional clear (W1C) afterwards
could wipe the newly latched interrupt.

[Severity: High]
This isn't a bug introduced by this patch, but is there a race condition
during initialization?

The driver requests the parent IRQ via devm_request_irq() before the GPIO
chip and its IRQ domain are fully initialized by devm_gpiochip_add_data():

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_pinctrl_add_gpiochip() {
        ...
        err =3D devm_request_irq(dev, irq, airoha_irq_handler, IRQF_SHARED,
                                dev_name(dev), pinctrl);
        if (err) {
                ...
        }

        return devm_gpiochip_add_data(dev, gc, pinctrl);
}

If an interrupt triggers immediately after devm_request_irq(), the handler
executes with a NULL girq->domain. This causes irq_find_mapping() to fail
and return 0, potentially handling an invalid IRQ 0 and dropping the interr=
upt.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804160419.3592=
327-1-mikhail.kshevetskiy@iopsys.eu?part=3D18
