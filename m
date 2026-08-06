Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABF042903D
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 22:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054897; cv=none; b=WgEOxg5UkB64R9savQqeq8mQtiY0zAO0nbVI7NJg2Q4WIwgdsQHJlio1IAT8RfIpSj37RWiAHWtglUsUk47PQkWNtTE33oariMh2VRJyvgzrG64GY/hTfnBzF4/t3rGqzMO6wZTGXfmbp3SAkfGqgr/nap67vCVW6IApCezEo+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054897; c=relaxed/simple;
	bh=w6v/tUfhICSsNQMhIPSi9uVIFL2/ff2TAu3q07KbMg4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IONzP5uihDQ8BKi76BtuwtKcZspBzCoQ3306T346YkFBce1M7zDDXNBce8SSZI+myqToogUHIWibTjM/BMuo7Mp5hQFcmy7Av33KKmMoi0vjcdfLR7vFdJ8wQuQV+ILt7w1YeLXQKSNFCBU1anyppLfnaUwsybmXL2vPwrms2j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XkwYUt9L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XkwYUt9L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D4C81F000E9;
	Thu,  6 Aug 2026 22:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786054894;
	bh=vOiR/2U40nVogDRpK51AXxBwdqFFxcBJzzvtWYglpbY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XkwYUt9Lmz9eeLV4GZbH0iTPBzDmM5P+VVNaXEyC+EH269xFgKMFy+8kg6n5E4Ak2
	 yFPldF7jlF9wpmxt/A54Iz6jvKguZC1ImeSmpolFLXbOZR805UbiT1eG6iIdTggfDj
	 QeKjnfYAznFD6uCwVYvvsteevi9BrkIrLBaYbgxuWa7RtG3w9bNYfxiKRJL39u8Gzs
	 V1xAA09Z2KXGSRa6ZwJ6QCpPJBGQbIfK6mHtuRINB5ErA5YER+PDEU7K3EsXzDEKB8
	 F5sJFuX51HCi2LAtJNyFBpBHG2Tk/Aq6eGJUue4B5tobO0fyfEtHrAHcGtfZIGdnVz
	 2okl//+bzPlQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 19/37] pinctrl: airoha: add missed IRQ resource
 helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806220615.4078303-20-mikhail.kshevetskiy@iopsys.eu>
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
 <20260806220615.4078303-20-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 22:21:34 +0000
Message-Id: <20260806222134.9D4C81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The immutable IRQ chip `airoha_gpio_irq_chip` is missing required =
`gpiochip_disable_irq()` and `gpiochip_enable_irq()` calls in its `.irq_mas=
k` and `.irq_unmask` callbacks.
- [High] The driver hardcodes `handle_simple_irq` for all GPIO interrupts a=
nd incorrectly clears the hardware interrupt status after the handler runs,=
 breaking edge and level interrupt semantics.
- [High] The IRQ handler is requested before the gpiochip is fully initiali=
zed, creating a race condition where a shared interrupt can cause a null do=
main dereference.
- [High] The IRQ chip callbacks use a syscon regmap, which relies on a slee=
pable spinlock on PREEMPT_RT, while being called under a raw spinlock.
--

--- Patch [19]: [PATCH v11 19/37] pinctrl: airoha: add missed IRQ resource =
helpers ---
commit b705513e6d14523fbe92901715e6323201dc334f
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: add missed IRQ resource helpers

Without hooking .irq_request_resources, gpiolib cannot set
GPIOD_FLAG_USED_AS_IRQ. This breaks pin direction locking and can allow
userspace or another driver to reconfigure an active IRQ pin as an output

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 9b880fd20a1a0..f3078f9b14a76 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -2689,6 +2689,7 @@ static const struct irq_chip airoha_gpio_irq_chip =
=3D {
>  	.irq_mask_ack =3D airoha_irq_mask,
>  	.irq_set_type =3D airoha_irq_type,
>  	.flags =3D IRQCHIP_SET_TYPE_MASKED | IRQCHIP_IMMUTABLE,
> +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
>  };
> =20

[Severity: High]
This is a pre-existing issue, but missing required gpiochip_disable_irq() a=
nd
gpiochip_enable_irq() calls in airoha_irq_mask() and airoha_irq_unmask() me=
ans
the GPIOD_FLAG_IRQ_IS_ENABLED flag is never set when an IRQ is unmasked.

Without these calls:

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_irq_mask() {
...
	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
	regmap_clear_bits(pinctrl->regmap, gpiochip->edge[index], mask);
...
}

Can userspace or another driver incorrectly reconfigure the active IRQ pin =
as
an output because gpiolib believes the IRQ is masked or disabled?

[Severity: High]
This is a pre-existing issue, but does using syscon regmap inside the IRQ c=
hip
callbacks cause a lock context violation on PREEMPT_RT?

The callbacks are invoked under desc->lock which is a raw spinlock:

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_irq_mask() {
...
	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
	regmap_clear_bits(pinctrl->regmap, gpiochip->edge[index], mask);
}

However, the regmap is retrieved from the syscon parent in
airoha_pinctrl_probe(), which defaults to standard (sleepable) spinlocks.
Could this result in sleeping in atomic context?

>  static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,

[Severity: High]
This isn't a bug introduced by this patch, but is it safe to unconditionally
use handle_simple_irq for all pins and clear the status bit after the handl=
er
finishes?

In airoha_pinctrl_add_gpiochip(), handle_simple_irq is assigned to all pins:

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_pinctrl_add_gpiochip() {
...
	girq->default_type =3D IRQ_TYPE_NONE;
	girq->handler =3D handle_simple_irq;
...
}

However, in airoha_irq_handler(), the hardware status bit is cleared after
generic_handle_irq() returns:

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_irq_handler() {
...
			generic_handle_irq(irq_find_mapping(girq->domain, offset));
			regmap_write(pinctrl->regmap,
				     pinctrl->gpiochip.status[i], BIT(irq));
...
}

For edge-triggered interrupts, clearing the hardware status bit after the
handler returns means that any new edge occurring during handler execution
might be permanently lost. For level-triggered interrupts, handle_simple_irq
does not mask the interrupt line during execution. Can this lead to dropped
interrupts or hard interrupt storms if threaded handlers are used?

[Severity: High]
This is a pre-existing issue, but is there a race condition where a shared
interrupt can cause a NULL domain dereference?

The IRQ is requested with IRQF_SHARED before the gpiochip and its irqdomain
are added:

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_pinctrl_add_gpiochip() {
...
	err =3D devm_request_irq(dev, irq, airoha_irq_handler, IRQF_SHARED,
				dev_name(dev), pinctrl);
	if (err) {
		dev_err(dev, "error requesting irq %d: %d\n", irq, err);
		return err;
	}

	return devm_gpiochip_add_data(dev, gc, pinctrl);
}

If the shared IRQ line is asserted, the interrupt handler runs immediately.
Will it dereference girq->domain which is still NULL in airoha_irq_handler(=
),
leading to a kernel crash?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806220615.4078=
303-1-mikhail.kshevetskiy@iopsys.eu?part=3D19
