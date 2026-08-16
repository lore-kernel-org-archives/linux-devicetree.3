Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558F42BCF7F
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 10:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786876696; cv=none; b=BCWj7NLNOl5ceXSG2teZRdhVRZN3scbJ9gt0q1dMHyNCK9+YyDHrAkAtEDaRQ5TXFiTjSkXC5UtTelcXuKR9xBz8pfp9i8+t5g8RJvlKpkaZnINxca0hrkbhVKIAAF+irDpeqk5z7q1ImjBi61c6h/fq7DuKKYNtVD4xb95oVqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786876696; c=relaxed/simple;
	bh=Vicvp0QtsAt75p1mN/EUKTI5ZcBOuPU/GRsmmhSlFus=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t/5g016ekmhO70UPbjDeoHY1KmdedP9AgdB6vOBpn1x/JrEhJSdcBgJT5MiZwpq0y2+qUKvePDNi8jZQuZAuRgOHMqlXLlPukscMMJcDf/Mix0LrKztiTzLkVQBAcfgMEYSZo2N4SIzqvUQXYCZ+/4rcf50+NR+4Hsz3QpEW+zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YJz18UWs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YJz18UWs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D7E1F000E9;
	Sun, 16 Aug 2026 10:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786876695;
	bh=05hj95y+xp1XnwkFdsCVBrX/P9s/s4eK066J0FEFbKQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YJz18UWsoKC/U+AFLgRrOgf9oNNQFuuzvDMwQYvtTPUxOX3A4F9FcPUHfA8NWXfng
	 YPskFGdgcyw6fyUnXLA9HIX5pVgluIGsSk2fmnDo36Ak4TqU2LtG1JQmM8aNkP22DG
	 Hp2AqlRtJKdE4Mf/407rskTj7qHHfeffX9iJIz7SaQLd/4VmK7FVOnlMnZQrFnNknb
	 71qrxqxmWDoFzNtZReAHWTApKHcCFABGwPBKIg7/PUJEYrCH/bZpJKNcmzcQ3tSHWE
	 cnhUlOeBqXQkhVrkPJ5u62ZHZME+nJ+0zQtUyZ9xVX3pS2F2azZxWmsp1iCKQb656D
	 VLCK+1vEiUDYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/6] spmi: apple: Add interrupt functionality
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260816-t603x-spmi-v6-6-c5ab87aa447b@chaosmail.tech>
References: <20260816-t603x-spmi-v6-0-c5ab87aa447b@chaosmail.tech>
 <20260816-t603x-spmi-v6-6-c5ab87aa447b@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 10:38:14 +0000
Message-Id: <20260816103814.B4D7E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Using a 64-bit readq() on 32-bit peripheral registers is unsafe an=
d triggers SError panics on ARM64.
- [High] synchronize_irq() fails to synchronize chained interrupt handlers,=
 risking use-after-free of unmapped device memory.
- [Medium] Race condition in the timeout recovery path causes a spurious co=
mplete(), instantly failing the next command.
- [Low] Plain lockless read of spmi->irq_mask_cache in the interrupt handle=
r races with atomic bit modifications.
--

--- Patch [6]: [PATCH v6 6/6] spmi: apple: Add interrupt functionality ---
commit e7fe16312dff03ba851c46ae746de243bb8ab6e1
Author: Alba Mendez <me@alba.sh>

spmi: apple: Add interrupt functionality

Add support for interrupts sent by slave devices and use IRQ for
RX FIFO if possible, as that IRQ fires as soon as the reply is
available, which is usually takes a few us instead of the 10ms sleep
interval for polling.

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

[Severity: Medium]
Is there a race condition between the error recovery path and the interrupt
handler here?

If a previous command times out, and the delayed interrupt fires concurrent=
ly,
the lockless interrupt handler might read the IRQ register before it is
cleared here, but call complete() just after reinit_completion() executes.

Could this prematurely complete the new command's wait and spuriously fail =
it
with -EIO?

> =20
>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
[ ... ]
> @@ -188,6 +271,167 @@ static int spmi_cmd(struct spmi_controller *ctrl, u=
8 opc, u8 sid)
[ ... ]
> +static void apple_spmi_irq_handler(struct irq_desc *desc)
> +{
[ ... ]
> +	for (offset =3D 0; offset < SPMI_NUM_PERIPHERAL_IRQS / 8; offset +=3D s=
izeof(val)) {
> +		val =3D readq(spmi->regs + SPMI_IRQ_ACK_BASE + offset);

[Severity: High]
Does this 64-bit read on adjacent 32-bit peripheral registers trigger a
Synchronous External Abort (SError) on Apple Silicon?

Using readq() on 32-bit peripheral endpoints is typically unsupported on AR=
M64
and can lead to a kernel panic during normal hardware operation.

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
Can this lockless read of the irq_mask_cache array race with atomic bit
modifications applied concurrently on another CPU?

Since set_bit() and clear_bit() are used to modify this array elsewhere,
should this use READ_ONCE() to prevent compiler tearing and KCSAN warnings?

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

[Severity: High]
Does synchronize_irq() successfully wait for chained handlers here?

Since chained handlers don't traverse the standard handle_irq_event path,
they do not set the IRQD_IRQ_INPROGRESS flag, meaning synchronize_irq()
evaluates to a no-op.

If the driver is unbound while an interrupt is actively being handled on
another CPU, could devres proceed to unmap the device memory while the
handler is still running, leading to a use-after-free?

> +	irq_set_chained_handler_and_data(spmi->irq, NULL, NULL);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816-t603x-spmi=
-v6-0-c5ab87aa447b@chaosmail.tech?part=3D6
