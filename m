Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C365385D7B
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 10:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787911731; cv=none; b=t702JjpgxngnvMgQ1xe+tlr3cxdhLi4iXdHiV4uPl9TPIOYjhzqrkZAV+Fc0mXHbzRodFTw+6FQEtrnyzg8QKSYGh9LA+WIY1c4KfMZBIK6woncx9A5YhG/C3sPK4bNCtrBbby8SmL+sHqyjoX9VRcS4qj3f+M3+SawClH4Gr4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787911731; c=relaxed/simple;
	bh=0+xPC6XRIBOj4SqxIZ/5XDKbH8i6pjnP3DQOgDjwdJ8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Gyt529TDt4vlx5gvUytdJa6rnKTKrcRbNieYESx2XSOXTIx0L6YTP0ZI/R5wehVoXwp1THXG9IpL4noCf1wdxoQiS3q1wstixDb6+wwWVu7lk6uCOZU6PSrlhdnjyjs9dtQ0TAffYiWvVJVCvYA+6mYtQR3SuTTKZTj3+MMQ68c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AfccXujW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AfccXujW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB3C41F000E9;
	Fri, 28 Aug 2026 10:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787911730;
	bh=YuFAuclOFeCLiYhMsJwWZjIG4Q6fvwtSmqbwOwgdyxc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AfccXujWV2z1sZGNWFIPTeIm1mVrLNw7iiT95YYd29sFxJT2O9MZHKiWU2kBJPWrG
	 Y9Ewwq0QWPZGO3asMx3H+KiYSENNz0eDm3sLQzNgS7AGQxfVxaRC7yXe3q4NxHX8pm
	 Ups92T/vP3eIyLYlEhlE4nhJC9MWhwCRaLUTvKrN6WLqmr8yfOsMFzxdhlBsd9FVfd
	 ZTce6XP47dYr6HMEcSwkJX5NeFqgcnV3scu3Gd/0nc8uszzt7QnZkueScg05RXLYlT
	 5UlCWu90LLOHyfVNWYFe9Pa72QVWa3Y+zaXB1WcSIYFEJCrtnaQwyaHxEoECq/Oo1e
	 KxaVQlmdRuUAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 6/6] spmi: apple: Add interrupt functionality
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260828-t603x-spmi-v8-6-708d4d12e0fd@chaosmail.tech>
References: <20260828-t603x-spmi-v8-0-708d4d12e0fd@chaosmail.tech>
 <20260828-t603x-spmi-v8-6-708d4d12e0fd@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 10:08:49 +0000
Message-Id: <20260828100849.AB3C41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Stale interrupt from a timed-out command can prematurely complete =
a subsequent command due to lack of synchronization.
- [High] Potential use-after-free of the `spmi` structure due to ineffectiv=
e synchronization of the chained interrupt handler during device teardown.
- [High] Using a 64-bit `readq()` to read 32-bit peripheral registers is li=
kely to trigger a synchronous external abort (SError) on Apple Silicon.
- [Low] Unprotected lockless read of `spmi->irq_mask_cache` in the interrup=
t handler.
--

commit 871fe99995b531329b52ffbebcd1520006e84bea
Author: Alba Mendez <me@alba.sh>
Subject: spmi: apple: Add interrupt functionality

This patch adds support for interrupts sent by slave devices and=20
utilizes the IRQ for the RX FIFO to reduce polling latency.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index fabccd25aa0da..2390174452ab4 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c

[ ... ]

> @@ -84,8 +165,10 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl,=
 u8 opc, u8 sid, u16 param,
> =20
>  	if (spmi->prev_fail) {
>  		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_ACT_REG);
> +		apple_spmi_irq_ack_raw(spmi, SPMI_IRQ_NOTIFY);
>  		spmi->prev_fail =3D false;
>  	}
> +	reinit_completion(&spmi->fifo_rx);

[Severity: High]
Could a stale interrupt from a previously timed-out command prematurely=20
complete the new command here?=20

If a prior command times out, the hardware might still assert the IRQ later=
.=20
The IRQ handler will read the status and prepare to call=20
complete(&spmi->fifo_rx). If this thread concurrently calls=20
reinit_completion(&spmi->fifo_rx) for a new command before the IRQ handler=
=20
calls complete(), the new command's wait_for_completion_timeout() will=20
return immediately and likely fail with -EIO. Is there a need for=20
synchronization between the hardware status check in the interrupt handler=
=20
and reinit_completion() here?

[ ... ]

> +static void apple_spmi_irq_handler(struct irq_desc *desc)
> +{
> +	struct apple_spmi *spmi =3D irq_desc_get_handler_data(desc);
> +	struct irq_chip *chip =3D irq_desc_get_chip(desc);
> +	bool handled =3D false;
> +	unsigned long val, offset, bit;
> +
> +	chained_irq_enter(chip, desc);
> +	val =3D readl(spmi->regs + SPMI_IRQ_ACK_BASE + (SPMI_IRQ_NOTIFY / 32) *=
 4);
> +	if (val & BIT(SPMI_IRQ_NOTIFY % 32)) {
> +		apple_spmi_irq_ack_raw(spmi, SPMI_IRQ_NOTIFY);
> +		complete(&spmi->fifo_rx);

[Severity: High]
Does this complete() need to be synchronized with the new command setup in=
=20
spmi_raw_cmd()? As mentioned above, a delayed execution here might race wit=
h=20
reinit_completion() and corrupt the state of a subsequent command.

> +		handled =3D true;
> +	}
> +
> +	for (offset =3D 0; offset < SPMI_NUM_PERIPHERAL_IRQS / 8; offset +=3D s=
izeof(val)) {
> +		val =3D readq(spmi->regs + SPMI_IRQ_ACK_BASE + offset);

[Severity: High]
Will this 64-bit readq() trigger a synchronous external abort (SError) on=20
Apple Silicon?=20

The IRQ mask and ACK registers appear to be initialized and accessed=20
everywhere else as strictly 32-bit registers (e.g., using writel and readl)=
.=20
If the peripheral bus only supports 32-bit transactions, emitting a 64-bit=
=20
ldr instruction here could cause a hardware exception and kernel panic.

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
Is it safe to read spmi->irq_mask_cache locklessly here?=20

The bitmap is modified using clear_bit() and set_bit() in=20
apple_spmi_irq_mask() and apple_spmi_irq_unmask() while holding=20
spmi->irq_mask_lock. Reading it without READ_ONCE or atomic bitops (like=20
test_bit) creates a data race.

> +		for_each_set_bit(bit, &val, 64) {
> +			generic_handle_domain_irq(spmi->irqd, offset * 8 + bit);
> +			handled =3D true;
> +		}
> +	}
> +	if (!handled)
> +		handle_bad_irq(desc);
> +	chained_irq_exit(chip, desc);
> +}
> +
> +static void apple_spmi_teardown_irq(void *data)
> +{
> +	struct apple_spmi *spmi =3D data;
> +
> +	for (size_t offset =3D 0; offset < SPMI_NUM_IRQS / 8; offset +=3D 4)
> +		writel(0, spmi->regs + SPMI_IRQ_MASK_BASE + offset);
> +
> +	synchronize_irq(spmi->irq);
> +	irq_set_chained_handler_and_data(spmi->irq, NULL, NULL);

[Severity: High]
Does this safely synchronize the chained interrupt handler before the devre=
s=20
framework frees the device data?=20

Since chained interrupt handlers bypass standard flow handlers and do not=20
set the IRQD_IRQ_INPROGRESS flag, synchronize_irq() acts as a no-op and=20
returns immediately. If apple_spmi_irq_handler() is executing concurrently=
=20
on another CPU, it could continue running while devres frees the spmi=20
structure and MMIO mappings, potentially leading to a use-after-free and=20
kernel panic upon driver unbind.

> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-t603x-spmi=
-v8-0-708d4d12e0fd@chaosmail.tech?part=3D6
