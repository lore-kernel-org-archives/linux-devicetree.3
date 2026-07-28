Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD0541B8E0
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231614; cv=none; b=jihjE9hqZFC71DNisJMhwc2KwlmoP2d+Oo7erhcPFriH2eqUMBUBa7zIQoHtEyJssgU4eQsK+usq+9Hh7AGKtfpaDbckkE4GrHihmKS5pwH05ZJgz6bmK2nNFw0WTh1OZ3YgDTf76O2Yhyz5fkRxMjE9EWOwLs7m/GL7fiyMzB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231614; c=relaxed/simple;
	bh=J6VjRQGXYR0IBVog3busSM3w/GfzTWzSHaogMpW5yug=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Csjrq3EylOhQd3bcpXxBax4gPpYAtL8aOw9MsgYTAxZasTXxWC3pNdskbgN0Rg6sFpY2QOZMGEN0ooTkLFPE71swd5dLQ+NDx7Cz1XvdsjgFiV+TpziwwYUh9lBxFYcEK6wUylUPA6J3ttVJXZRYuDO6wshrXP/TrXBKjZJLyZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CYb7ZzW9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYb7ZzW9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7E8F1F000E9;
	Tue, 28 Jul 2026 09:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785231612;
	bh=mlS/eJvxOTE6Xxo3CvtJ1oq7WSWtbf11LoPZX+lGKto=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CYb7ZzW9qALQ9SF9mCq8drsuzmb6gNFKma/aDJ4J40fn/dpq3D+vgb49J6NKUdg+p
	 B8FpbFH8llpclHohSoc8qorZRH2OARgRvocEOdTTspk5rFP+t30vuuVxc2+2gc79Bt
	 MHnv8s39NmP9Y07CQ4K+U/ghPDUKpd8YAZSOPyNXZFLInymh3EroY7oVKMicl4USpJ
	 1tQO0/zR4ZHmH/sX9osOMuxlhJV+D0Y1FDENrrCEO0Imc88vHEgEac05xcy6VbpNyE
	 NyWuUVukl0zZwhOcsq3oDXreYcyKSeYv7b+jFC5JMh6TxGifrod0PzCQgW3lCVMern
	 QCLNy3AdEp8ZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/7] spmi: apple: interrupt controller functionality
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260728-t603x-spmi-v2-7-f43e5f10e583@chaosmail.tech>
References: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
 <20260728-t603x-spmi-v2-7-f43e5f10e583@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 09:40:12 +0000
Message-Id: <20260728094012.A7E8F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The software IRQ mask cache is updated after the hardware interrup=
t is unmasked, creating a race window where an interrupt can fire and be dr=
opped.
- [Low] Lockless concurrent access to `irq_mask_cache` lacks `READ_ONCE()` =
and `WRITE_ONCE()` annotations, leading to a formal C data race.
--

--- Patch [7]: [PATCH v2 7/7] spmi: apple: interrupt controller functionali=
ty ---
commit 2c670245829f06c9db4ee3ae30ca2eacf7d1e022
Author: Alba Mendez <me@alba.sh>

spmi: apple: interrupt controller functionality

Add support for interrupts sent by slave devices.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index 109c5d2c735d4..8f6a0d560da82 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c

[ ... ]

> +static void apple_spmi_irq_unmask(struct irq_data *d)
> +{
> +	struct apple_spmi *spmi =3D irq_data_get_irq_chip_data(d);
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&spmi->irq_mask_lock, flags);
> +	apple_spmi_irq_unmask_raw(spmi, d->hwirq);

[Severity: High]
Is there a race window here where a pending interrupt could be lost?

Since the hardware interrupt is unmasked via apple_spmi_irq_unmask_raw()
before the software irq_mask_cache is updated, an interrupt could fire
immediately. If the parent interrupt controller routes it to a CPU and
apple_spmi_irq_handler() executes, it will read the outdated cache mask
(observing a 0 for this IRQ).

The handler would then clear the interrupt from its pending mask and
return without acknowledging the hardware, potentially causing the
interrupt to be permanently lost (if edge-triggered) or resulting in an
interrupt storm (if level-triggered).

Should the irq_mask_cache be updated before the hardware is unmasked?

> +	spmi->irq_mask_cache[d->hwirq / 64] |=3D BIT_ULL(d->hwirq % 64);

[Severity: Low]
Since irq_mask_cache is read locklessly in apple_spmi_irq_handler(),
should this update use WRITE_ONCE() to prevent potential compiler store
tearing?

> +	raw_spin_unlock_irqrestore(&spmi->irq_mask_lock, flags);
> +}

[ ... ]

> +static irqreturn_t apple_spmi_irq_handler(int irq, void *dev_id)
>  {
>  	struct apple_spmi *spmi =3D dev_id;
>  	bool handled =3D false;
> -	u32 val;
> +	u64 val, offset, bit;
> =20
>  	val =3D readl(spmi->regs + SPMI_IRQ_ACK_BASE + SPMI_IRQ_USER_SIZE);
>  	if (val & BIT(SPMI_IRQ_FIFO_RX)) {
> @@ -239,6 +357,23 @@ static irqreturn_t apple_spmi_irq_handler(int irq, v=
oid *dev_id)
>  		handled =3D true;
>  	}
> =20
> +	for (offset =3D 0; offset < SPMI_IRQ_USER_SIZE; offset +=3D sizeof(val)=
) {
> +		val =3D readq(spmi->regs + SPMI_IRQ_ACK_BASE + offset);
> +		/**
> +		 * because of other masters in the bus, we're going to get a multitude=
 of
> +		 * interrupts we're not interested in. irq_resolve_mapping isn't very
> +		 * optimized for the nonexistent path, so instead we mask with (a loca=
lly
> +		 * cached version of) the IRQ mask
> +		 */
> +		val &=3D spmi->irq_mask_cache[offset / sizeof(val)];

[Severity: Low]
Since this lockless read happens concurrently with the locked updates in
apple_spmi_irq_mask() and apple_spmi_irq_unmask(), should this use
READ_ONCE() to ensure the compiler doesn't cache the value in a register
or tear the load?

> +		while (val) {
> +			bit =3D __builtin_ctzll(val);
> +			generic_handle_domain_irq(spmi->irqd, offset * 8 + bit);
> +			handled =3D true;
> +			val &=3D ~BIT(bit);
> +		}
> +	}
> +
>  	return handled ? IRQ_HANDLED : IRQ_NONE;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-t603x-spmi=
-v2-0-f43e5f10e583@chaosmail.tech?part=3D7
