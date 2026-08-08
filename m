Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD222D2488
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 11:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786189487; cv=none; b=T8+d9G6ctU2foU+8LNwiAAu7HBSjWclKh2c/IPBVqBwuOUxCr28TtEi7Aj+U2BR8Nc+FCqiUCD5UL28E0rXYPhB+NrCaeViE5JwO6FMkBmPnHX3xRmYT8a3MDAtuctyMYvrFm1v9veBHeOJ7opCXHc1SIoHi9cBS2J80OdqWjU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786189487; c=relaxed/simple;
	bh=4z1ywcW/okAc1/uLwJtZElYq5lUxaV+4BZx0f1DnNZQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=smdLXSVNhxvle65O0zSSkPQeY00upROHlduIF+hdg0d5ge37xJKZrtjffq2LYkuXdCTMJktYQk1FSTinhQ8jwME5vV/sMzMYSTaXSiQhK9JCgiyWnCljtw7NWvGunWPFisD8on283mBjqWOmphqJy6G9ZRZze9ejZlOwAJ3FimM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PJs8M6/2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PJs8M6/2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEFAC1F000E9;
	Sat,  8 Aug 2026 11:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786189485;
	bh=4TGLI8cQE1XvfbTIGhES/8Go7Vrz6cnbLsqEnowEb4U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PJs8M6/23H4nPt6L6QoLiw7cNT5nX6vtfnMGZ5dILRY+CxmVFYkJlau4yoS4gWzK+
	 6MuzTMo8Eh5P37+aJ0kRuogn3bR5FwPv1ar64my8W7voq4enp4c9aQSnM3G6+Ojk/t
	 kwndsoDPJ3JdU1ZU3i0We4r4gtYDTZx6oROWR38xc2P9BvvlfqdTDTZegLSINFLS7S
	 5pi1OmRm/xFyBSQjxJMCveOAKSwGIXS/XUEl0J+BAYjLnPhFguQGMPhYLcbQzPEq/f
	 NDnBuqPG+nctFosHB6Z2hGT3ZhMI0+2qV5gM2rB03RliQNWVt+cDAxkUD3rDYJO6La
	 25aPD3wZxFzPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/6] spmi: apple: Add interrupt functionality
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260808-t603x-spmi-v5-6-553c5ac2f137@chaosmail.tech>
References: <20260808-t603x-spmi-v5-0-553c5ac2f137@chaosmail.tech>
 <20260808-t603x-spmi-v5-6-553c5ac2f137@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 11:44:45 +0000
Message-Id: <20260808114445.AEFAC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The IRQ teardown function incorrectly unmasks all hardware interru=
pts instead of masking them, leading to a potential interrupt storm on modu=
le removal.
- [High] A race condition during timeout recovery can cause the next comman=
d to spuriously fail with `-EIO` due to a late interrupt completion.
- [Medium] The IRQ handler uses `readq()` to read two 32-bit registers at o=
nce, which may cause a synchronous external abort (SError) if the periphera=
l bus strictly limits accesses to 32-bit.
--

--- Patch [6]: [PATCH v5 6/6] spmi: apple: Add interrupt functionality ---
commit cbf4e6ab067495af30bb6cec8a0023d78009efc4
Author: Alba Mendez <me@alba.sh>

spmi: apple: Add interrupt functionality

This commit adds support for interrupts sent by slave devices on the Apple
SPMI controller. It utilizes an IRQ for the RX FIFO when available, which
reduces the response latency compared to a 10ms polling sleep interval.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index fabccd25aa0da..1e6cc30da1965 100644
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
Could this reinit_completion() race with a late completion from the IRQ
handler?

If a previous command times out, spmi_raw_cmd() attempts to recover by
flushing the FIFO and calling reinit_completion(). Concurrently, a delayed
hardware interrupt might trigger apple_spmi_irq_handler().

If the handler reads the ACK register before the recovery clears it, but
calls complete() right after this reinit_completion() runs, the new
command's wait_for_completion_timeout() will return immediately. Because
the FIFO is actually empty, this falsely aborts the next valid command with
-EIO.

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
> +		handled =3D true;
> +	}
> +
> +	for (offset =3D 0; offset < SPMI_NUM_PERIPHERAL_IRQS / 8; offset +=3D s=
izeof(val)) {
> +		val =3D readq(spmi->regs + SPMI_IRQ_ACK_BASE + offset);

[Severity: Medium]
Is it safe to use readq() here to read two adjacent 32-bit registers?

Apple Silicon APB peripherals commonly enforce strict 32-bit access widths.
If the peripheral bus rejects 64-bit accesses, this single readq() could
cause a synchronous external abort (SError) resulting in a kernel panic.

Would it be safer to use two 32-bit readl() calls instead?

> +		/**
> +		 * because of other masters in the bus, we're going to get a multitude=
 of
> +		 * interrupts we're not interested in. irq_resolve_mapping isn't very
> +		 * optimized for the nonexistent path, so instead we mask with (a loca=
lly
> +		 * cached version of) the IRQ mask
> +		 */
> +		val &=3D spmi->irq_mask_cache[offset / sizeof(val)];
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
> +		writel(U32_MAX, spmi->regs + SPMI_IRQ_MASK_BASE + offset);

[Severity: High]
Does writing U32_MAX here accidentally unmask all interrupts on module
removal?

In apple_spmi_init_irq(), 0 is written to safely mask everything, which
implies the hardware uses 1 to unmask. Writing U32_MAX here fully unmasks
all 288 peripheral interrupts on the controller just before the chained
handler is removed.

Could this lead to an unhandled interrupt storm that locks up a CPU or
forces the generic IRQ subsystem to permanently disable the shared parent
IRQ line?

> +
> +	synchronize_irq(spmi->irq);
> +	irq_set_chained_handler_and_data(spmi->irq, NULL, NULL);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808-t603x-spmi=
-v5-0-553c5ac2f137@chaosmail.tech?part=3D6
