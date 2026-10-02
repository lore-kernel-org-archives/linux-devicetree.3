Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40434718D0
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932426; cv=none; b=M/Ec0muzI4fZH+vTtCLo/mmmh4J2Fky8u/zXOgG/XsHm92afFp7MnistF0SbfYNjE/ICxhg6zExJJf/+Y+pS5ikd5eQs+4NZ4EVxI7ixePsp1s6NvofjbMk0Q2Vdmp6Va3ZuK4cuib9qMe6bT+xCJlg5W2rwJUSP1WFrENwHJvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932426; c=relaxed/simple;
	bh=m9alEZpHDZ9NV/LqDewbpCS72A/8u+ivSq2+BKBYwcM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Wud+nD/rA7h2f0xHfsWr0BIBsGtSFakjuJV3zrNlBrOPJzhVfiRoMurh159y1K82uIiL8TvC0M5cDPiPcaUl2WqOZqDlt1Ih3yRg1ks27rcOWVr60VniLIWjBQAMDD+1Qt7g5QcliOIyQsDaU4/5acx3mM3HdOBarEM14bfgmPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ebtbJ93y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ebtbJ93y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BB11F000FF;
	Fri,  2 Oct 2026 09:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932424;
	bh=fBJVig5SlgacmL9iC1wwHl5s/llFaH4zXq/0Gc41GtQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ebtbJ93yn8TyvEY057fTbsAps5XRam0hSpmpqn4FZu7NOxNX9fPtpNb9CJ5msQmDQ
	 Lzg4O7XYr9LnOIl/CEEFXmNlm/cjDyMszV+KP6N+0YwQ5P1AhHmI6TmyHv2ew9dFLi
	 LzclzfbwxH+/H+fxchBBVA9z3hhnJxRzCGK3fxdRMoBgNveQ3ml+y+kvMKcEfKqXBD
	 zUpyfFN22YTL1V3Rtt0u8gofgBZmQoN1+O1kgdd/DFxY6GeamAY4Hes8GdxyjY5Z1+
	 oDIm4LbvkmKMMVbX6dsXmUz8uwkSGljbbD+IlrsIjaobz99VmxbTi8fnuqKXMSm14n
	 ljbGxqMhrey5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 6/6] spmi: apple: Add interrupt functionality
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261001-t603x-spmi-v10-6-ff815c66c73f@chaosmail.tech>
References: <20261001-t603x-spmi-v10-0-ff815c66c73f@chaosmail.tech>
 <20261001-t603x-spmi-v10-6-ff815c66c73f@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:13:43 +0000
Message-Id: <20261002091344.53BB11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] spmi: race condition in spmi_raw_cmd() error recovery causes prema=
ture completion
- [High] spmi: TOCTOU race on irq_mask_cache triggers spurious handle_bad_i=
rq()
- [Medium] spmi: endianness corruption on Big-Endian architectures due to w=
ritel() for FIFO
--

commit 30246ba2a054ae67e63f97a3891036e8eeaf0cd4
Author: Alba Mendez <me@alba.sh>

spmi: apple: Add interrupt functionality

This commit adds support for interrupts sent by slave devices and uses the
IRQ for the RX FIFO if possible. This allows the driver to respond as soon
as the reply is available rather than polling with a 10ms sleep interval.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index fabccd25aa0da..2390174452ab4 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
> @@ -26,6 +32,13 @@
[ ... ]
> +static void apple_spmi_irq_mask(struct irq_data *d)
> +{
> +	struct apple_spmi *spmi =3D irq_data_get_irq_chip_data(d);
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&spmi->irq_mask_lock, flags);
> +	apple_spmi_irq_mask_raw(spmi, d->hwirq);
> +	clear_bit(d->hwirq, spmi->irq_mask_cache);
> +	raw_spin_unlock_irqrestore(&spmi->irq_mask_lock, flags);
> +}
[ ... ]
>  static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid, u1=
6 param,
>  			const u8 *buf_wr, size_t len_wr, u8 *buf_rd, size_t len_rd)
>  {
[ ... ]
>  	if (spmi->prev_fail) {
>  		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_ACT_REG);
> +		apple_spmi_irq_ack_raw(spmi, SPMI_IRQ_NOTIFY);
>  		spmi->prev_fail =3D false;
>  	}
> +	reinit_completion(&spmi->fifo_rx);

[Severity: High]
Does this reinit_completion() risk a race condition in spmi_raw_cmd()?

If a previous command timed out and the chained IRQ handler is concurrently
executing on another CPU, it could read the hardware status before it is
acked, but call complete() after this reinit_completion() runs. This would
spuriously mark the next command's wait as done, causing it to fail with
-EIO prematurely.

> =20
>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
> =20
>  	while (i < len_wr) {
>  		j =3D min_t(size_t, sizeof(spmi_cmd), len_wr - i);
>  		spmi_cmd =3D 0;
>  		memcpy(&spmi_cmd, buf_wr + i, j);
>  		writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);

[Severity: Medium]
Since this driver can be built on 64-bit Big-Endian architectures via
COMPILE_TEST && 64BIT, could using writel() here cause endianness
corruption? The writel() accessor performs byte-swapping which reverses the
memory layout of the stream in 4-byte chunks. Should this use writesl()
exclusively for FIFO stream accesses instead?

>  		i +=3D j;
>  	}
[ ... ]
>  	/* Read SPMI data reply */
>  	i =3D 0;
>  	while (i < len_rd) {
[ ... ]
>  		rsp =3D readl(spmi->regs + SPMI_RSP_REG);
>  		j =3D min_t(size_t, sizeof(spmi_cmd), len_rd - i);
>  		memcpy(buf_rd + i, &rsp, j);

[Severity: Medium]
Similar to the write path above, does using readl() for the FIFO stream read
cause unintended byte-swapping on Big-Endian systems?

>  		i +=3D j;
>  	}
[ ... ]
> +static void apple_spmi_irq_handler(struct irq_desc *desc)
> +{
[ ... ]
> +	for (offset =3D 0; offset < SPMI_NUM_PERIPHERAL_IRQS / 8; offset +=3D s=
izeof(val)) {
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
> +		for_each_set_bit(bit, &val, 64) {
> +			generic_handle_domain_irq(spmi->irqd, offset * 8 + bit);
> +			handled =3D true;
> +		}
> +	}
> +	if (!handled)
> +		handle_bad_irq(desc);
> +	chained_irq_exit(chip, desc);
> +}

[Severity: High]
Could this lockless read of irq_mask_cache cause a Time-of-Check to
Time-of-Use race?

If a peripheral interrupt is pending in the hardware status val, but another
thread concurrently calls disable_irq(), it invokes apple_spmi_irq_mask()
which clears the bit in irq_mask_cache.

If irq_mask_cache is read right after the bit is cleared, the pending bit
will be masked out. The handler would then leave the legitimately fired
interrupt unacked, set handled =3D false, and incorrectly fall through to
handle_bad_irq() on the parent interrupt controller.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-t603x-spmi=
-v10-0-ff815c66c73f@chaosmail.tech?part=3D6
