Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793856716;
	b=rLycMRnbNlmda4dMpAAsUBkym2t0MbfRIyagpcbpb7o+zEdR8fGkasc43pzyLRzL41tf
	 kzM/d1+apVznyrky61uYY/k5f6oqlAKPPbvKTB5V0ZRzjgWKHrIyEgz3Dyd4zy5OifgRM
	 bEoSr9Zt/l8I4mlCsfn5rB0JvHdaoamxofxKgIIwRXd8POvLaq2BIdvAg8rOOHYKvLznf
	 nsekKU+hcBd8mOEvGqRHB1La9pcC+cGGcxpkJtCizOod1yFZXAhdxZ3G6UX01irp8JycL
	 1AJLMjpf/3AqlZUu8+GQmSxTHXxSqnLNa6wpre9KAKftcqBPXTvFEqwEylYM+bNay3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793856716;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DwaT0bDtS3aEVeInFPzea5Q/NPR+4MSHF7Qf1jyDWsM=;
	b=boyRQCFPdiKT7k6kCBCdp56sbt+m8LBo46hb66XXItXVWlCm56i+lWUOj+4Mlcs8oJZ4
	 s5jgeoQS+u3tlZIrmPchDrpc4gCIlkCTcmU1WxCtkmCqD7DvelD7hpQRcDT8ZfvVY7BEO
	 CGbkiaFlF+5WHiQ9CR8ikteHcEOyLsKL5ZQDu1BaSJDnicJOdNPOrqyqkOnEOq+gqa+Py
	 JxoKhIOb+g+faC7hXaqECGlfK6yZpCG4eY3qEo95MgzD4gfqqS5mAF1lTFmvHQNKcGDS3
	 ZBVMP/KUup9CjxO7r50bAwLl2/kVzN2beTojQ4bVg0Tjcc5/BwxfYzVTJiOxRm9SlGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W2oaUZ98;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCAF606A329
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 05:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W2oaUZ98
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35101F000C1;
	Thu,  5 Nov 2026 05:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793856715;
	bh=DwaT0bDtS3aEVeInFPzea5Q/NPR+4MSHF7Qf1jyDWsM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W2oaUZ98yw346+DQCWoggaWzPVHU0ri9fDGtk95COJlVRTCoFAgWy24ok6jRVK7Bh
	 U55oand4cJJM8UVGXwQ0bWBSWsLeObRtz7wVoAUW0GfdtMskF1hUARj33uIJflqj6G
	 8tqcpKhBHLwgUVzTBLddGSmLxWcraNeBMgNwmGKb6lJWdyLDgr9d0y0x88SY9Uj7YC
	 VXuCGF6gkJnTqkF1O91wHEvieFhfc3D1zlbdkC6L4BSmKhHtB9xckvltwKQXRqsWMg
	 bUc0dvpOUdTy4sP0oZjHepKbMpN6LDsV2pSSSZMQZ10bmNLUiQkrbb1BAHo+5kJC45
	 hvAr4D4BICvTw==
Message-ID: <sashiko-outbox-198598@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/6] mailbox: Add AMD PL Mailbox soft IP controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ben Levinsky" <ben.levinsky@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105051902.1646651-5-ben.levinsky@amd.com>
References: <20261105051902.1646651-1-ben.levinsky@amd.com>
 <20261105051902.1646651-5-ben.levinsky@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 05:31:55 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] mailbox: partial FIFO write on TX busy in amd_pl_mbox_send_data()
- [High] mailbox: lost RX threshold interrupt race in amd_pl_mbox_startup()
- [Medium] mailbox: skipped error read in amd_pl_mbox_irq_thread() when rat=
elimited
--

commit f34934c4693ba6bdc80f192703145aea6291afe7
Author: Ben Levinsky <ben.levinsky@amd.com>

mailbox: Add AMD PL Mailbox soft IP controller

This commit adds a mailbox controller driver for the AMD Programmable Logic
Mailbox soft IP, exposing separate transmit and receive FIFO channels using
zynqmp_ipi_message payloads. It manages interface clock gating across chann=
el
startup and shutdown, polling-based TX completion, and threaded IRQ-driven =
RX
FIFO draining.

> diff --git a/drivers/mailbox/amd-pl-mailbox.c b/drivers/mailbox/amd-pl-ma=
ilbox.c
> new file mode 100644
> index 0000000000000..dc95fe4eff9b6
> --- /dev/null
> +++ b/drivers/mailbox/amd-pl-mailbox.c
> @@ -0,0 +1,378 @@

[ ... ]

> +static int amd_pl_mbox_send_data(struct mbox_chan *chan, void *data)
> +{
> +	struct amd_pl_mbox *mb =3D chan->con_priv;
> +	struct zynqmp_ipi_message *msg =3D data;
> +	unsigned long flags;
> +	size_t offset;
> +	int ret =3D 0;
> +
> +	if (chan !=3D &mb->chans[AMD_PL_MBOX_CHAN_TX])
> +		return -EINVAL;
> +
> +	/* The TX FIFO is empty here, since TX completion waits for it. */
> +	if (!msg || !msg->len || msg->len > mb->fifo_len * sizeof(u32))
> +		return -EINVAL;
> +
> +	/*
> +	 * The mailbox core can submit a queued message after shutdown() has
> +	 * started, while the interface clock is being disabled. Do not access
> +	 * registers then.
> +	 */
> +	spin_lock_irqsave(&mb->tx_lock, flags);
> +	if (!mb->tx_active) {
> +		ret =3D -ENODEV;
> +		goto unlock;
> +	}
> +
> +	for (offset =3D 0; offset < msg->len; offset +=3D sizeof(u32)) {
> +		size_t count =3D min(sizeof(u32), msg->len - offset);
> +		u32 word =3D 0;
> +
> +		if (readl(mb->regs + AMD_PL_MBOX_STATUS) &
> +		    AMD_PL_MBOX_STS_TX_FULL) {
> +			ret =3D -EBUSY;
> +			goto unlock;
> +		}
> +
> +		memcpy(&word, &msg->data[offset], count);
> +		writel(word, mb->regs + AMD_PL_MBOX_WRDATA);
> +	}
> +
> +unlock:
> +	spin_unlock_irqrestore(&mb->tx_lock, flags);
> +	return ret;
> +}

[Severity: High]
In drivers/mailbox/amd-pl-mailbox.c, amd_pl_mbox_send_data() assumes the
hardware TX FIFO is empty on entry and checks AMD_PL_MBOX_STS_TX_FULL before
each word inside the loop. Can this corrupt or coalesce messages in the
hardware TX FIFO if a previous transfer timed out or if the FIFO becomes fu=
ll
mid-message?

In drivers/mailbox/mailbox.c, when a blocking transfer (cl->tx_block) times
out in mbox_send_message(), it calls tx_tick(chan, -ETIME) -> msg_submit():

drivers/mailbox/mailbox.c:mbox_send_message()
	ret =3D wait_for_completion_timeout(&chan->tx_complete, wait);
	if (ret =3D=3D 0) {
		t =3D -ETIME;
		tx_tick(chan, t);
	}

tx_tick() clears chan->active_req and invokes msg_submit(chan) to submit the
next queued message via ops->send_data() even if the remote peer has not yet
drained the timed-out message from the hardware TX FIFO (and similarly if a
client sets cl->knows_txdone).

Because amd_pl_mbox_send_data() does not check that the TX FIFO is empty
(AMD_PL_MBOX_STS_TX_THRESHOLD in AMD_PL_MBOX_STATUS) before writing:

1. If unconsumed words remain in the TX FIFO and space is still available, =
the
new message's words are written directly behind the old words, coalescing t=
wo
messages in the unframed hardware FIFO.

2. If AMD_PL_MBOX_STS_TX_FULL is hit after one or more words have already b=
een
written (offset > 0), amd_pl_mbox_send_data() returns -EBUSY after partially
writing the message to AMD_PL_MBOX_WRDATA. In msg_submit():

drivers/mailbox/mailbox.c:msg_submit()
	err =3D chan->mbox->ops->send_data(chan, data);
	if (!err) {
		chan->active_req =3D data;
		chan->msg_count--;
	}

When send_data() returns -EBUSY, the message is not dequeued and poll_hrt is
not started, leaving the partial words in the hardware FIFO while the full
message remains queued at the head of chan->msg_data[] to be sent again from
offset 0.

Should amd_pl_mbox_send_data() verify that AMD_PL_MBOX_STS_TX_THRESHOLD is =
set
before writing any words to AMD_PL_MBOX_WRDATA?

[ ... ]

> +static int amd_pl_mbox_startup(struct mbox_chan *chan)
> +{
> +	struct amd_pl_mbox *mb =3D chan->con_priv;
> +	unsigned long flags;
> +	u32 irq_enable;
> +	int ret;
> +
> +	if (chan !=3D &mb->chans[AMD_PL_MBOX_CHAN_TX] &&
> +	    chan !=3D &mb->chans[AMD_PL_MBOX_CHAN_RX])
> +		return -EINVAL;
> +
> +	ret =3D clk_prepare_enable(mb->clk);
> +	if (ret)
> +		return ret;
> +
> +	if (chan =3D=3D &mb->chans[AMD_PL_MBOX_CHAN_TX]) {
> +		writel(AMD_PL_MBOX_CTRL_TX_RESET, mb->regs + AMD_PL_MBOX_CTRL);
> +		writel(0, mb->regs + AMD_PL_MBOX_SEND_THRESHOLD);
> +
> +		spin_lock_irqsave(&mb->tx_lock, flags);
> +		mb->tx_active =3D true;
> +		spin_unlock_irqrestore(&mb->tx_lock, flags);
> +
> +		return 0;
> +	}
> +
> +	writel(AMD_PL_MBOX_CTRL_RX_RESET, mb->regs + AMD_PL_MBOX_CTRL);
> +	/* Interrupt when the RX FIFO changes from empty to nonempty. */
> +	writel(0, mb->regs + AMD_PL_MBOX_RECV_THRESHOLD);
> +	writel(AMD_PL_MBOX_IRQ_RX_THRESHOLD | AMD_PL_MBOX_IRQ_ERROR,
> +	       mb->regs + AMD_PL_MBOX_IRQ_STATUS);
> +	irq_enable =3D readl(mb->regs + AMD_PL_MBOX_IRQ_ENABLE);
> +	irq_enable |=3D AMD_PL_MBOX_IRQ_RX_THRESHOLD | AMD_PL_MBOX_IRQ_ERROR;
> +	writel(irq_enable, mb->regs + AMD_PL_MBOX_IRQ_ENABLE);
> +	enable_irq(mb->irq);
> +
> +	return 0;
> +}

[Severity: High]
In drivers/mailbox/amd-pl-mailbox.c, when amd_pl_mbox_startup() initializes
the RX channel, can a word arriving from the remote peer between the RX FIFO
reset and the AMD_PL_MBOX_IRQ_STATUS clear permanently wedge RX interrupts?

As noted in the driver comments, with AMD_PL_MBOX_RECV_THRESHOLD set to 0,
AMD_PL_MBOX_IRQ_RX_THRESHOLD is edge-latched only when the RX FIFO transiti=
ons
from empty to nonempty. In amd_pl_mbox_startup():

	writel(AMD_PL_MBOX_CTRL_RX_RESET, mb->regs + AMD_PL_MBOX_CTRL);
	/* Interrupt when the RX FIFO changes from empty to nonempty. */
	writel(0, mb->regs + AMD_PL_MBOX_RECV_THRESHOLD);
	writel(AMD_PL_MBOX_IRQ_RX_THRESHOLD | AMD_PL_MBOX_IRQ_ERROR,
	       mb->regs + AMD_PL_MBOX_IRQ_STATUS);

If the remote peer writes a word after AMD_PL_MBOX_CTRL_RX_RESET empties the
FIFO, that 0-to-1 occupancy transition latches AMD_PL_MBOX_IRQ_RX_THRESHOLD.
The subsequent writel() to AMD_PL_MBOX_IRQ_STATUS then clears that latched
interrupt status bit while the received word remains unread in the RX FIFO.

Because the RX FIFO is now already nonempty and amd_pl_mbox_startup() does =
not
reset or drain the FIFO after clearing AMD_PL_MBOX_IRQ_STATUS, neither the
unread word nor any subsequent words written by the peer will cause an
empty-to-nonempty transition, so AMD_PL_MBOX_IRQ_RX_THRESHOLD will never
latch again.

Should AMD_PL_MBOX_RECV_THRESHOLD and AMD_PL_MBOX_IRQ_STATUS be programmed
before issuing AMD_PL_MBOX_CTRL_RX_RESET (or should the RX FIFO be checked
after enabling the interrupt)?

[ ... ]

> +static irqreturn_t amd_pl_mbox_irq_thread(int irq, void *data)
> +{
> +	struct amd_pl_mbox *mb =3D data;
> +	u32 pending_intr;
> +	u32 irq_enable;
> +	u32 irq_status;
> +
> +	irq_status =3D readl(mb->regs + AMD_PL_MBOX_IRQ_STATUS);
> +	irq_enable =3D readl(mb->regs + AMD_PL_MBOX_IRQ_ENABLE);
> +	pending_intr =3D irq_status & irq_enable;
> +
> +	if (!pending_intr) {
> +		dev_warn_ratelimited(mb->controller.dev,
> +				     "unexpected interrupt: status %#x enable %#x\n",
> +				     irq_status, irq_enable);
> +		return IRQ_NONE;
> +	}
> +
> +	/*
> +	 * Acknowledge before draining. The receive event latches when the RX
> +	 * FIFO goes from empty to nonempty, so a word that arrives after the
> +	 * drain has emptied the FIFO raises a new event.
> +	 */
> +	writel(pending_intr, mb->regs + AMD_PL_MBOX_IRQ_STATUS);
> +
> +	if (pending_intr & AMD_PL_MBOX_IRQ_ERROR)
> +		dev_warn_ratelimited(mb->controller.dev,
> +				     "mailbox FIFO error: %#x\n",
> +				     readl(mb->regs + AMD_PL_MBOX_ERROR));

[Severity: Medium]
In drivers/mailbox/amd-pl-mailbox.c, amd_pl_mbox_irq_thread() passes
readl(mb->regs + AMD_PL_MBOX_ERROR) directly as an argument to
dev_warn_ratelimited().

In include/linux/dev_printk.h, dev_warn_ratelimited() expands to
dev_level_ratelimited(), which only evaluates its variadic arguments when
__ratelimit(&_rs) returns true:

#define dev_level_ratelimited(dev_level, dev, fmt, ...)			\
do {									\
	static DEFINE_RATELIMIT_STATE(_rs,				\
				      DEFAULT_RATELIMIT_INTERVAL,	\
				      DEFAULT_RATELIMIT_BURST);		\
	if (__ratelimit(&_rs))						\
		dev_level(dev, fmt, ##__VA_ARGS__);			\
} while (0)

When AMD_PL_MBOX_IRQ_ERROR fires frequently enough to be rate-limited, will
skipping readl(mb->regs + AMD_PL_MBOX_ERROR) leave sticky error bits unclea=
red
in the hardware error register?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105051902.1646=
651-1-ben.levinsky@amd.com?part=3D4
