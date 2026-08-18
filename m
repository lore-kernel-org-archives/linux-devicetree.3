Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF177304BB3
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 03:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787024664; cv=none; b=e/J8Y5wNBjY17pP0HoP5Ba6VnDLDbOIsK6Ncz0L9xoiuajA69f2f5+FmIh0GdE3bVZmwBTzjKplcY5sSEAqfST9KQOw7gFbNw0UPkwltfXFvRxWtrEhQ1revIIDE26ing+9ZuWcELJc/6qg0shUyQ4IAvw/aTjme/cIprWkipqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787024664; c=relaxed/simple;
	bh=ljm/Hl01x0VFI/jxss+gzsEebzH9SEEJDd4GCA5jYEs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dWqdzYnE5GEwtZMBRmzBi65gEHV0CJfE/D17wvF/idAYF2AYGLUPKr4gRyhJ23mW2fQ5lljCbfBSxLVAMusdhThgjyOYLjaefZ7v01/noRg6vE/rj9WH1uVz4bRgUdz8yRzTiVXYNmoGwOPk7ZA9Z0qfx24D9O3+ueMOvFU35MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hhT50Gmz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hhT50Gmz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288381F000E9;
	Tue, 18 Aug 2026 03:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787024662;
	bh=sOlIs8QFg7thojv2FPFPceyX4HU9nGCOYQLzIztmspQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hhT50GmzUfF/Jzf+EmKlNP3Lg/DpaLOA/36EdOBCKcEvySnxz8ZygrdEwKAHc9Wmu
	 JYhzua5U3toj+7u9aU3Ox0aKJ09gNr5iHTNh+gNdxKhoGKGPSRTl5V+UuqunDvcI8K
	 hsiM1xDb3DvKoBCipN4I4IiVlJB3/kTezW5JHvKObDKR3YCmMMaG6yBZREZ9QQ+LCo
	 w9vtJLTtVxve1wrAlq5CIQ/bgnWPgjiySpF0NzxtNE2iSR8cG9FVn4rdQb8CeA/KBf
	 iF3I2/v3dGo3+fay5EbcI1ND/y+INWV8uNOEQd+2ZArjwW7p2e/4uZQ97Ws36ITmw1
	 9U7ECd/1wNPBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] mailbox: add Axiado AX3005 mailbox driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Swark Yang" <syang@axiado.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260817-upstream-axiado-ax3005-mailbox-upstream-v2-2-25e713eccff3@axiado.com>
References: <20260817-upstream-axiado-ax3005-mailbox-upstream-v2-0-25e713eccff3@axiado.com>
 <20260817-upstream-axiado-ax3005-mailbox-upstream-v2-2-25e713eccff3@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 03:44:21 +0000
Message-Id: <20260818034422.288381F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The RX thread blindly reads data from the FIFO if the poll loop br=
eaks early due to an error, leading to hardware underflows and garbage data=
 delivery.
- [High] Returning IRQ_NONE after successfully clearing FIFO errors can tri=
gger the spurious interrupt detector and permanently disable the IRQ.
- [High] TOCTOU race in RX thread between checking the active flag and dere=
ferencing the channel client, leading to a NULL pointer dereference.
- [Medium] The driver uses register I/O accessors (`writel`/`readl`) for FI=
FO bulk data transfers instead of the mandated stream I/O accessors (`write=
sl`/`readsl`).
--

--- Patch [2]: [PATCH v2 2/2] mailbox: add Axiado AX3005 mailbox driver ---
commit e614bfa4ee11362f9c00a58fdcc67351b8f3046c
Author: Swark Yang <syang@axiado.com>

mailbox: add Axiado AX3005 mailbox driver

This commit adds a new mailbox controller driver for the Axiado AX3005 SoC.
It supports 8 TX and 8 RX channels using separate register regions, with
TX status via polling and RX via per-channel interrupts.

> diff --git a/drivers/mailbox/axiado-mailbox.c b/drivers/mailbox/axiado-ma=
ilbox.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/mailbox/axiado-mailbox.c

[ ... ]

> +static int axiado_mbox_send_data(struct mbox_chan *chan, void *data)
> +{

[ ... ]

> +	for (offset =3D 0; offset + sizeof(u32) <=3D msg_len;
> +	     offset +=3D sizeof(u32))
> +		writel(get_unaligned_le32(buf + offset), priv->mbox_reg);

[Severity: Medium]
Since this loop writes bulk data to a FIFO, should it use the stream I/O
accessor writesl() instead of writel()?

The io-accessors subsystem guidelines mandate using stream accessors for
FIFOs to avoid unnecessary per-word memory barriers and redundant endianness
conversions.

> +
> +	tail_len =3D msg_len - offset;
> +	if (tail_len) {
> +		memcpy(tail, buf + offset, tail_len);
> +		writel(get_unaligned_le32(tail), priv->mbox_reg);
> +	}
> +
> +	dev_dbg(mb->mbox.dev, "%s: Ch-%u sent\n", __func__, idx);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t axiado_rx_thread(int irq, void *dev_id)
> +{
> +	struct axiado_channel_data *priv =3D dev_id;
> +	struct mbox_chan *chan =3D priv->chan;
> +	struct axiado_mbox *mb =3D dev_get_drvdata(chan->mbox->dev);

[ ... ]

> +	/*
> +	 * Clear and log/count any pending errors, but don't discard data
> +	 * on their account alone: a rejected overflow write doesn't
> +	 * corrupt what was already safely queued ahead of it, so let the
> +	 * length-based read below decide whether what's here is usable.
> +	 */
> +	axiado_mbox_clear_fifo_errors(priv);
> +
> +	csr =3D readl(priv->csr_reg);
> +	if (csr & AXIADO_MBOX_CSR_EMPTY)
> +		return IRQ_NONE;

[Severity: High]
If the interrupt was asserted solely due to a hardware error (like an
underflow), axiado_mbox_clear_fifo_errors() successfully clears the conditi=
on.
If the FIFO is empty afterwards, this check returns IRQ_NONE.

Does this risk permanently disabling the IRQ line? Returning IRQ_NONE after
successfully servicing a hardware event can trigger the core spurious
interrupt detector.

> +
> +	/*
> +	 * The first word contains the total message length in bytes,
> +	 * including the length word itself.
> +	 */
> +	word =3D readl(priv->mbox_reg);
> +	msg_len =3D word;
> +	put_unaligned_le32(word, buf);
> +
> +	if (msg_len < sizeof(u32) || msg_len > mb->drv_data->msg_size)
> +		goto invalid_message;
> +
> +	num_words =3D DIV_ROUND_UP(msg_len, sizeof(u32));
> +	remaining =3D num_words - 1;
> +
> +	/*
> +	 * The not-empty interrupt may occur as soon as the first DW enters
> +	 * the FIFO. Wait until all remaining DWs of this message arrive.
> +	 */
> +	if (remaining) {
> +		ret =3D readl_poll_timeout(priv->csr_reg, csr,
> +					 (csr & AXIADO_MBOX_CSR_ERRORS) ||
> +					  FIELD_GET(AXIADO_MBOX_CSR_LEVEL, csr) >=3D
> +					  remaining,

[Severity: High]
The poll condition succeeds if AXIADO_MBOX_CSR_ERRORS is set, terminating
early without verifying the FIFO actually reached the required level.

If the loop exits early due to an error rather than the level check, the co=
de
continues to the for-loop below and blindly reads remaining words from the
FIFO. Will this cause hardware underflows and pass garbage data to the
mailbox client?

> +					  AXIADO_MBOX_RX_POLL_US,
> +					  AXIADO_MBOX_RX_TIMEOUT_US);
> +		if (ret)
> +			goto incomplete_message;
> +
> +		axiado_mbox_clear_fifo_errors(priv);
> +	}
> +
> +	for (i =3D 1; i < num_words; i++) {
> +		word =3D readl(priv->mbox_reg);

[Severity: Medium]
Similar to the TX path, does this bulk FIFO read need to use readsl() inste=
ad
of readl() to avoid the per-word memory barriers and endianness swaps?

> +		put_unaligned_le32(word, buf + i * sizeof(u32));
> +	}
> +
> +	axiado_mbox_clear_fifo_errors(priv);
> +
> +	if (READ_ONCE(priv->active))
> +		mbox_chan_received_data(chan, priv->rx_buffer);

[Severity: High]
Can mbox_free_channel() nullify the channel client pointer while this thread
is preempted?

If a mailbox client frees the channel, mbox_free_channel() clears chan->cl
under a lock, releases the lock, and calls axiado_mbox_shutdown(). If this
threaded IRQ handler evaluates READ_ONCE(priv->active) as true just before
being preempted, the shutdown routine will block in disable_irq().

When this handler resumes, will mbox_chan_received_data() dereference a NULL
chan->cl pointer?

> +
> +	return IRQ_HANDLED;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-upstream-a=
xiado-ax3005-mailbox-upstream-v2-0-25e713eccff3@axiado.com?part=3D2
