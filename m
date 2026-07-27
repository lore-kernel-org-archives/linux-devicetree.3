Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A3D3DE434
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139164; cv=none; b=b9iAecSMKU65nt03Tf9NtPazQ5V/YWW0SB14m3dfrwhI94J6OzkUks5Pq73kJy5JP2XUWQUnjnOE9tGKg29MZqpmjxN0/O0mTIGn+a/3hYEmX1wwaouvD5ROOy9qoZexEmbjpPR8N5PCkGguwyd4gZzSouF+RIzitW7BPdLPvDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139164; c=relaxed/simple;
	bh=9i5bpMcjP5p2TtYxg51n+QxrlcfAh1AVg7tgxuNt3zY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Nlkex3KfWCjAGhWtIugPu9WORE4LzwIudTkdrdqMrURBaA63R7Okr31lUCWl1ZNI+ejNx+g4rCSw7hoY7s8IienN1cMA0fV4e7jGgiVVinsaYGjgP7LCGQ/O5BFMIiI7Tor4NsZ9QQUp4pQ3CJ9WinpEmeOSRBCwCIMrVQz4cfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2q+lb2x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2q+lb2x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D25441F000E9;
	Mon, 27 Jul 2026 07:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785139163;
	bh=OzPNV/C7wSxsRHExRc/eRmH1tAllNhbgop//v7Kt51Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S2q+lb2xHd7rP4yWELmd21zZ2b33JqHqUFE70xoha27vOw1lIMR+WFccLPLYuI0/u
	 4XbSVetDFaRZT812LasgftFBPet8Z1a+4+R5TQr+3nCJnCRlOQkFnkIMdOA8NP/Fl7
	 4QvM3dthLzVSeHVbPgMJk994NYWLr5645aTvAR+D0wypEUt8Vc9m5vrs3MGDiIBhzK
	 y8uBD37pwyU3NKoM0QkjsebZSZWc4Oqqe/w+Kbb48pir9xEbD+n0pzceYDHpGdHU+V
	 Qf+1yZNZjK1EmL8q8aJmmaLGoT6yCSNh3Ah9fqvw7/xYaaVt5VF009EkPpy2pWKoXc
	 qTy6VKMd1jbKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 17/34] pinctrl: airoha: fix edge-triggered interrupts
 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727074234.3761170-18-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-18-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 07:59:22 +0000
Message-Id: <20260727075922.D25441F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Leftover manual status clear in `airoha_irq_handler` double-acknow=
ledges edge-triggered interrupts, causing newly latched edge events to be p=
ermanently lost.

Pre-existing issues:
- [High] The irq_chip callbacks acquire a non-raw spinlock (`spinlock_t`) i=
nside a raw spinlock critical section, causing a lockdep violation and a pa=
nic on PREEMPT_RT kernels.
--

--- Patch [17]: [PATCH v7 17/34] pinctrl: airoha: fix edge-triggered interr=
upts handling ---
commit 2624d620bd965f151504e589dca531b9b80d52fe
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: fix edge-triggered interrupts handling

This patch aims to fix edge-triggered interrupts handling for the Airoha
EN7581 SoC. It defines an irq_ack handler, switches to using the appropriate
handle_level_irq or handle_edge_irq handler based on the interrupt type,
and assigns the handler type.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index c886ecc2c39e9..0a865cf0c2728 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -2613,11 +2613,28 @@ static void airoha_irq_mask(struct irq_data *data)
>  	u8 index =3D data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
>  	u32 mask =3D GENMASK(2 * offset + 1, 2 * offset);
> =20
> +	if (data->hwirq >=3D ARRAY_SIZE(gpiochip->irq_type))
> +		return;
> +
>  	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
>  	regmap_clear_bits(pinctrl->regmap, gpiochip->edge[index], mask);

[Severity: High]
This is a pre-existing issue, but does calling regmap operations here cause
a lock nesting violation on PREEMPT_RT kernels?

The core IRQ flow handlers call irq_chip callbacks like irq_mask and irq_ack
while holding the IRQ descriptor lock, which is a raw_spinlock_t. Because
the driver initializes this regmap via device_node_to_regmap, it defaults to
using a standard spinlock_t.

On PREEMPT_RT, spinlock_t becomes a sleeping rt_mutex. Acquiring a sleeping
lock while holding a raw_spinlock_t causes a kernel panic. Since this patch
adds airoha_irq_ack which also uses regmap_write, it introduces another path
for this same lockdep violation.

>  	gpiochip_disable_irq(gc, irqd_to_hwirq(data));
>  }

[ ... ]

> @@ -2658,8 +2687,7 @@ static irqreturn_t airoha_irq_handler(int irq, void=
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
Are edge interrupts permanently lost due to this trailing regmap_write?

With this patch properly configuring handle_edge_irq for edge interrupts,
the core IRQ code calls the newly added airoha_irq_ack function before
invoking the device driver's action handler. This early ack correctly clears
the hardware status bit so new edges can be latched.

However, when the driver's action handler completes and the call to
generic_handle_domain_irq returns, this manual regmap_write unconditionally
clears the status bit a second time. If a new edge arrives and is latched=20
while the ISR is executing, wouldn't this trailing write wipe out the newly
latched state in the hardware status register?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727074234.3761=
170-1-mikhail.kshevetskiy@iopsys.eu?part=3D17
