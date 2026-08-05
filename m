Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EE73DAAB4
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 13:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934867; cv=none; b=XS+5KmGGLL31Zdg51R8KNE2jHhamqSG145h7z3mHw/F5r8gpqZRFn/iP+eh8TUbrH7cEXu1mA/0RM7tTB9WFENOtQNHpN5WTj6aje79SSTbH0YotEs8nb1RK7CRBC2OFiLkFF8Vy564sx0f150Xdgz5JlA0N85vdUq9E5LTms4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934867; c=relaxed/simple;
	bh=y0K9KcUkftJ6BZ/YqmFB849OpGfViZCU93FoRyOHO8k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j66d8JR3HN9fSH9MvKYG4YP/obzgc6JTU91eey5Rxg0ByVVOuGqRi/LDyqXA0D2FLKFolUm8Zf14M8pzUql9bgJw70QNw8JENO59xUyVE8qxcWtX7xEUjJHBnNFVBaGrId/bPEa9P8fqTbAFNF7DlEXC1yg5FyxBjYSfN+AY+pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RLePcri2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RLePcri2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1CFA1F000E9;
	Wed,  5 Aug 2026 13:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785934865;
	bh=UjExM+ZHlNsLl9LIZxD0REZLBViaUAvBvQzjrPBSXa8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RLePcri24LwbOHRDsBFFG3PC1zbQ4Nz5Abj1zF/qrjcbfhdsWePeTOZKBdR/mU8Ka
	 9rTF3RUpqrPRqXSa/0L2s2Hx6JGvCNuwpIX6tAr2WkQVdFnvJKBRNit0EPTdwPCzY8
	 3MMozJo1xAdc5ni0xt7kNI8fly1bEk0uORaIHQAfXkM3+VjlQCz+KVkp1PlPz8Ho33
	 Am5CZjio5UTc3PmTR2vX3sCa3vRtKSkYy0tQB3VUz6Ed1m85z8So4P0GjhlZiSRDXu
	 E5PhJeQiJE65y2CVKpSAqUD6qiaK3YST+f5wYP0RXj/I99O9txOE5WJWcYi4UiLFjj
	 aiqlExeslDnlg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 19/36] pinctrl: airoha: fix IRQ mask/unmask code
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805123408.3767648-20-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
 <20260805123408.3767648-20-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 13:01:05 +0000
Message-Id: <20260805130105.A1CFA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver incorrectly uses `handle_simple_irq` for all interrupts=
, leading to interrupt storms for level-triggered interrupts. Additionally,=
 the interrupt handler clears the interrupt status register after executing=
 the specific IRQ handler, creating a race condition where edge-triggered i=
nterrupts can be lost. Finally, the irq_chip lacks a proper `.irq_ack` call=
back.
- [High] The IRQ callbacks and chained handler invoke regmap operations on =
a syscon regmap that uses a sleepable `spinlock_t`. On PREEMPT_RT, this cau=
ses an `rt_mutex` to be acquired in hardirq context and while holding a `ra=
w_spinlock_t`, leading to a Wait-Type Nesting violation and a 'sleeping in =
atomic context' BUG.
--

--- Patch [19]: [PATCH v10 19/36] pinctrl: airoha: fix IRQ mask/unmask code=
 ---
commit 97f2ae6176e0b5295c8894fb1446d64bc5196ae8
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: pinctrl: airoha: fix IRQ mask/unmask code

This commit updates the IRQ mask and unmask functions to correctly call
gpiochip_disable_irq() and gpiochip_enable_irq() when using
IRQCHIP_IMMUTABLE. This ensures gpiolib sets the GPIOD_FLAG_IRQ_IS_ENABLED
bit, allowing gpiod_direction_output() to realize when a pin is actively
used as an interrupt.

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

[Severity: High]
This is a pre-existing issue, but does airoha_irq_unmask() safely interact
with the regmap?

The core IRQ subsystem calls airoha_irq_unmask() while holding the raw
irq_desc spinlock with interrupts disabled. However, this function invokes
regmap operations (e.g., regmap_update_bits()) on a syscon regmap that uses
a sleepable spinlock_t (which becomes an rt_mutex on PREEMPT_RT).

Can this cause a 'sleeping in atomic context' BUG and Wait-Type Nesting
violation on PREEMPT_RT kernels?

>  	switch (gpiochip->irq_type[data->hwirq]) {
>  	case IRQ_TYPE_LEVEL_LOW:
>  		val =3D val << 1;

[ ... ]

> @@ -2629,6 +2630,7 @@ static void airoha_irq_mask(struct irq_data *data)
> =20
>  	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
>  	regmap_clear_bits(pinctrl->regmap, gpiochip->edge[index], mask);
> +	gpiochip_disable_irq(gc, irqd_to_hwirq(data));
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does the IRQ configuration
in airoha_pinctrl_add_gpiochip() handle level and edge interrupts correctly?

The driver unconditionally uses handle_simple_irq for all interrupts:

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_pinctrl_add_gpiochip() {
    ...
	girq->handler =3D handle_simple_irq;
    ...
}

Because handle_simple_irq fails to mask the interrupt while it is being
processed, won't this lead to an infinite interrupt storm for
level-triggered interrupts?

Additionally, does airoha_irq_handler() drop edge interrupts?

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_irq_handler() {
    ...
		for_each_set_bit(irq, &status, AIROHA_PIN_BANK_SIZE) {
			u32 offset =3D irq + i * AIROHA_PIN_BANK_SIZE;

			generic_handle_irq(irq_find_mapping(girq->domain,
							    offset));
			regmap_write(pinctrl->regmap,
				     pinctrl->gpiochip.status[i], BIT(irq));
		}
    ...
}

The interrupt status register is cleared after generic_handle_irq() returns.
If a second edge arrives during generic_handle_irq(), won't this clear
operation drop it permanently?

Also, airoha_irq_handler() acquires the same sleepable syscon regmap lock
in hardirq context when calling regmap_read() and regmap_write(). Will this
also cause a 'sleeping in atomic context' BUG on PREEMPT_RT?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805123408.3767=
648-1-mikhail.kshevetskiy@iopsys.eu?part=3D19
