Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5E73DD500
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138918; cv=none; b=BPtwS/1qvZ7yBvRnc8lWkPx9bFuyCK8dZs8dCqmV13M4cDktbZW1DonZYLD6G2seRCrESQXFp6eaxteT26vmzLKRppO/UeYle0uYtIURuh5uCKfcvuSbmUiqjseGfUAWqKj/8TNjNiVTTF+w7FJX8qC01vii6ZVzkZ5iCmknBHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138918; c=relaxed/simple;
	bh=iROoKbASoDe+DN87Y31qjbTyXTwHP01z6NS+nuSTMh8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dMK1HtGD7KYEh4n12hTULCDu70L2NQkw+tZu8lR1R9ddG6+KudvwAGToNi/pn7eRUdFGfPF/dUOyqxdhS/l7yRsCjREBrZ43+ck4yrCI0zX2PXN8ecrjzDBD/NpSw/VZWtCTWj8t2gHAXm+ogenYhDDvm9vbtIAKfT3KuQFbxDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VyCIKfZH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VyCIKfZH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E091F000E9;
	Mon, 27 Jul 2026 07:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785138917;
	bh=nCTyQdA0EovYnTwCrumwAdc2GC/ExWtg7psqnMx/XUo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VyCIKfZHq/83eK8C/qzvedrOwD2ksh4C6gs5u7QVb81oczlbyON8uPMqwanDSRzpW
	 xpoWmzLaRH4Vg/ogCeB3+qJeQPwYjG/JCNRBrDrn3IMhtT7Bo0sv21mgrXFyiV/2Ik
	 29p/YOaTH5yxFdkPFMn1IB/3h/LxPq0M7I3iTTXxT4Auqp5l83AnRxaIIremccAWuA
	 IYVvJzPr2YuZz+AnY273OXO1rDBLDtGm+7CSAZ4hfReYJqOK8zR1NQVLNXwsFtfq4m
	 Hs9q1m9Y1wtab01TMJrqyqBx2QfNUeqQ2dtxkUyP+W1YXcVEPf8Uun4CmtBvUcaYPt
	 BBrTwPrwTvdNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 14/34] pinctrl: airoha: fix potential kenel panic in
 IRQ handling code
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260727074234.3761170-15-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-15-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 07:55:16 +0000
Message-Id: <20260727075516.F0E091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The shared parent IRQ is requested before the gpiochip and its IRQ=
 domain are fully initialized, creating race conditions that lead to NULL p=
ointer dereferences on probe and Use-After-Free during teardown.
- [High] The driver hardcodes `handle_simple_irq` for all interrupts and ma=
nually ACKs status bits after handling, causing race conditions that perman=
ently lose edge interrupts.
- [High] The irq_chip callbacks call regmap functions on a syscon regmap, a=
ttempting to acquire a sleepable spinlock while holding a raw spinlock.
--

--- Patch [14]: [PATCH v7 14/34] pinctrl: airoha: fix potential kenel panic=
 in IRQ handling code ---
commit 4e32db00b413a54d784b7251323863762cc5e739
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

    pinctrl: airoha: fix potential kenel panic in IRQ handling code
   =20
    This commit fixes invalid pointer initializations for gpiochip and pinc=
trl
    variables in the irq callback functions. Previously, these pointers were
    derived incorrectly, leading to dangerous memory accesses. The patch up=
dates
    the code to correctly obtain the required pointers.

> pinctrl: airoha: fix potential kenel panic in IRQ handling code

This isn't a bug, but there's a typo (kenel) in the subject line.

[ ... ]

> So any access to the data pointed by gpiochip and pinctrl variables is
> extremelly dangerous.

This isn't a bug, but there's a typo (extremelly) here.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index fcf498f7720c9..6b881ab56d9c3 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -2606,14 +2605,12 @@ static void airoha_irq_unmask(struct irq_data *da=
ta)
> =20
>  static void airoha_irq_mask(struct irq_data *data)
>  {
> +	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(data);
> +	struct airoha_pinctrl *pinctrl =3D gpiochip_get_data(gc);
> +	struct airoha_pinctrl_gpiochip *gpiochip =3D &pinctrl->gpiochip;
>  	u8 offset =3D data->hwirq % AIROHA_REG_GPIOCTRL_NUM_PIN;
>  	u8 index =3D data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
>  	u32 mask =3D GENMASK(2 * offset + 1, 2 * offset);
> =20
>  	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);

[Severity: High]
This is a pre-existing issue, but on real-time kernels, wouldn't this result
in a scheduling while atomic bug?

The airoha_irq_mask() and airoha_irq_unmask() callbacks execute in atomic
hardirq context holding a raw_spinlock_t. However, they call
regmap_clear_bits() and regmap_update_bits() which attempt to acquire the
syscon regmap's lock.

Since the regmap from airoha_pinctrl_probe() uses a standard spinlock_t
(which becomes a sleepable rt_mutex on real-time kernels), could acquiring =
it
here trigger an invalid locking sequence?

[ ... ]

While reviewing this, I noticed a couple of other pre-existing regressions
in the driver's interrupt handling code:

[Severity: High]
This isn't a bug introduced by this patch, but does the devres cleanup order
create a use-after-free or null pointer dereference risk?

In airoha_pinctrl_add_gpiochip(), the parent interrupt is requested before =
the
gpiochip is added:

	err =3D devm_request_irq(dev, irq, airoha_irq_handler, IRQF_SHARED,
				dev_name(dev), pinctrl);
	if (err) {
		dev_err(dev, "error requesting irq %d: %d\n", irq, err);
		return err;
	}

	return devm_gpiochip_add_data(dev, gc, pinctrl);

Due to devres ordering (first-in, last-out), the domain will be destroyed
before the parent interrupt is freed during device unbind or if a later pro=
be
step fails.

If an interrupt fires during this teardown window, wouldn't
airoha_irq_handler() dereference the freed girq->domain pointer here?

			generic_handle_irq(irq_find_mapping(girq->domain,
							    offset));

Could the request be moved after the gpiochip is added to ensure safe
teardown?

[Severity: High]
This is a pre-existing issue, but could this logic permanently lose concurr=
ent
edge events?

In airoha_pinctrl_add_gpiochip(), the driver hardcodes handle_simple_irq for
all interrupts, regardless of their type:

	girq->handler =3D handle_simple_irq;
	gpio_irq_chip_set_chip(girq, &airoha_gpio_irq_chip);

And in airoha_irq_handler(), the hardware status bit is manually cleared
after handling the event:

			generic_handle_irq(irq_find_mapping(girq->domain,
							    offset));
			regmap_write(pinctrl->regmap,
				     pinctrl->gpiochip.status[i], BIT(irq));

If a second edge event arrives while the child handler is executing, wouldn=
't
the manual regmap_write unconditionally clear the status bit and cause the
new edge event to be discarded?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727074234.3761=
170-1-mikhail.kshevetskiy@iopsys.eu?part=3D14
