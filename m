Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD373DE45C
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139337; cv=none; b=t/knxTTKLSlw5E8EAogYMqzsPKusBx32KnDoV/nMSYyNncra3uzcC/McsmLUSyuXLebDyfL/0o4bQnZxT1uKQf4c+bfxB3H8g67yzvvjeB7mEG2dJJpPnc8s78mGYMiAbs7zdBT/q5fXIuNx1MNAdVElMaYGHf7YC6E09HGVxtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139337; c=relaxed/simple;
	bh=nNvzcDrntUwRalJgovjqv0a3CjJ84TuMhrVLTzqU0vM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hpJydst6nzhOR+rWwifLN5PR0FImXgeZimf3L1x+qpoFuyR+qUeG6Xd6DRDp5pJvs9O62izcxxI2h2l6OfFgd4SUEpo78Xj/mVrKHcjNH8vh+XZ5kmb5qk6x/Tv/EQFRW/203TS00nj3LCIe++Eu5CgUVAV341XxXmGatMeCX38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C8FFayRO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8FFayRO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B63F1F000E9;
	Mon, 27 Jul 2026 08:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785139336;
	bh=RcFIP+NkFzW74uK2b629luFn4E9MdP8V0M0hvRJtxjY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C8FFayROd7+iImufqO0exv05o5YM7d74Oju5R/CUFhXv7jYNUP1YjToCJz08kSUYb
	 /jzX0+SK50ShKsOhVjsaN9v6jl6QnHTqa9lBRNlBX+ydBthJs8Ydv90zArzmULfdhv
	 MMj6UqG9SxUwmj+VlYjg1UU7hvVWxWyo4li17/djA+UShDz2uGxVRsahiJeMvJCpmP
	 VGc2RsxMAEKcyEngMIEHI2vXGek91kYOz622rXUIZ8pHh23nZ2Cw8eOfyUrVlBBQNE
	 cmthBCT/quIZfg9veeL7JWwwF4N8ShzmcBV8U7oiyFI0cigjS3WzASkw5ZneRgy87K
	 OZEfu/BCGutrw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 16/34] pinctrl: airoha: add missed IRQ resource
 helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727074234.3761170-17-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-17-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 08:02:15 +0000
Message-Id: <20260727080216.1B63F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Raw Spinlock Nesting Violation: `airoha_irq_mask` and `airoha_irq_=
unmask` acquire a `spinlock_t` while holding a `raw_spinlock_t`.
- [High] Lost edge-triggered interrupts due to clearing the hardware status=
 register after executing the IRQ handler.
- [High] Unsafe IRQ mapping and early shared IRQ registration can result in=
 executing an invalid IRQ 0.
--

--- Patch [16]: [PATCH v7 16/34] pinctrl: airoha: add missed IRQ resource h=
elpers ---
commit ca6b3b2f26911552b2347a6203653d8c640120dd
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: add missed IRQ resource helpers

Without hooking .irq_request_resources, gpiolib cannot set
GPIOD_FLAG_USED_AS_IRQ. This breaks pin direction locking and can allow
userspace or another driver to reconfigure an active IRQ pin as an output.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 2dc97e0711003..c886ecc2c39e9 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -2676,6 +2676,7 @@ static const struct irq_chip airoha_gpio_irq_chip =
=3D {
>  	.irq_mask_ack =3D airoha_irq_mask,

[Severity: High]
This isn't a bug introduced by this patch, but can this cause a lock nesting
violation?

The IRQ core calls .irq_mask and .irq_unmask with the IRQ descriptor's
raw_spinlock_t held. Inside airoha_irq_mask(), the driver calls
regmap_clear_bits():

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_irq_mask() {
	...
	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
	regmap_clear_bits(pinctrl->regmap, gpiochip->edge[index], mask);
	...
}

And inside airoha_irq_unmask(), it calls regmap_update_bits():

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_irq_unmask() {
	...
	regmap_update_bits(pinctrl->regmap, gpiochip->level[index],
			   mask, val);
	...
}

Since pinctrl->regmap defaults to using a standard sleepable spinlock_t,
acquiring it inside a raw_spinlock_t critical section is a wait-type lock
nesting violation. This will cause a "sleeping in atomic context" kernel pa=
nic
on PREEMPT_RT kernels, or lockdep splats with CONFIG_PROVE_RAW_LOCK_NESTING=
=3Dy.

>  	.irq_set_type =3D airoha_irq_type,
>  	.flags =3D IRQCHIP_SET_TYPE_MASKED | IRQCHIP_IMMUTABLE,
> +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
>  };
> =20
>  static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,

[Severity: High]
This is a pre-existing issue, but could this cause lost edge-triggered
interrupts?

In airoha_irq_handler(), the hardware status bit is read, generic_handle_ir=
q()
is dispatched, and only after it returns is the status cleared via
regmap_write():

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_irq_handler() {
	...
	generic_handle_irq(irq_find_mapping(girq->domain, offset));
	regmap_write(pinctrl->regmap, pinctrl->gpiochip.status[i], BIT(irq));
	...
}

If a new edge-triggered interrupt arrives while the child IRQ handler is
executing, the hardware status bit will be set again. The unconditional cle=
ar
after the handler returns will discard this new interrupt edge, leading to =
lost
interrupts.

Does the hardware status need to be acknowledged before invoking the handler
for edge-triggered interrupts?


[Severity: High]
This is also a pre-existing issue, but could this early shared IRQ registra=
tion
lead to executing an invalid IRQ?

In airoha_pinctrl_add_gpiochip(), devm_request_irq() is called with IRQF_SH=
ARED
before devm_gpiochip_add_data() initializes the irqdomain:

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_pinctrl_add_gpiochip() {
	...
	err =3D devm_request_irq(dev, irq, airoha_irq_handler, IRQF_SHARED,
				dev_name(dev), pinctrl);
	...
	return devm_gpiochip_add_data(dev, gc, pinctrl);
}

If the shared interrupt triggers immediately from another device on the same
line, airoha_irq_handler() runs while the domain is still NULL. This causes
irq_find_mapping(NULL, offset) to return 0.

Passing 0 to generic_handle_irq() will execute IRQ 0 (often a system timer =
or
invalid IRQ), leading to system instability or an invalid IRQ trap.

Should the IRQ be requested after the domain is created, and use
generic_handle_domain_irq() to handle unmapped IRQs safely?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727074234.3761=
170-1-mikhail.kshevetskiy@iopsys.eu?part=3D16
