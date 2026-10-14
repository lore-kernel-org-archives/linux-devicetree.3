Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73774377A98
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 21:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792014119; cv=none; b=tXAltY6rWT1zEIiRHBCwqpVSgYpWuLGAmfr2+9q9JbUrHvz7hLejy9NXOi0JdFxNA0qTcOfVcqjh34N4eWxzD/s3eUmBmfzZuY7HnqdlGry7ELjXHhV52IPjBcIRnf4M16Ao9RlgmD78JQ9x0eTZF20R4OGZsHTJ2BykX52YLGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792014119; c=relaxed/simple;
	bh=IpRBATAPtq/vttgxdbFftx//ojOxCAGKzolWRYsgoxc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=SParKQoYYpSCtW6tz78LMwdGKQMlqujM+7EjRSJomKL0UEzke4Gd2+FfTH2213DIM5suLfBf6Cq0sgmrTusXCRxhvZccllG1+7P3A9uK4A4zZ+xEWs3+Ghm3k+HhMv8Ojm7sDnkF+/TJYbmbbIwoHKxosi5t2T7XToeniNewrME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iB0KGHO+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iB0KGHO+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD5971F000C4;
	Wed, 14 Oct 2026 21:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792014118;
	bh=2+mOoFFBbIosum+/pXKsQkK+XhVZO05+QEV0sYIiUAg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iB0KGHO+MgTFyEO6c9re2WZkygh6Zvw41dptXOBGZIIutKZoPW2oegDLrNS0Wqp/R
	 BUp4mJu/z63fF5dvSMiUrtk6HiSp7w1hrs82y/i6LGLdh1Gd6rJxEbqgYYOFvYH4ki
	 gnbdncZKwiDdiGsdbwKUrdfeDKv3pQ6/3B3F1lLw61RFHmrEPcCG0E9Zbb36Q2Pk60
	 qxkSxGaPKLoBfeRUa8tUfyF3tEBLnWfdvE0QCD5ytyy6CPV4p59KNjXG469NvSJlJX
	 IgLYIwIT0QtRtxESblFHU8S5FycdOI5OtdaJaHYm0bdq9XScpd53K1DDO1NXRwWaGW
	 z0CVekEfzBm2w==
Message-ID: <sashiko-outbox-171934@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] mailbox: Add AMD PL Mailbox soft IP controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ben Levinsky" <ben.levinsky@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014213426.2957480-5-ben.levinsky@amd.com>
References: <20261014213426.2957480-1-ben.levinsky@amd.com>
 <20261014213426.2957480-5-ben.levinsky@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 21:41:57 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] io: endianness bug when reading/writing FIFO data with readl/writel
- [High] mailbox: missed RX interrupt edge transition when FIFO is complete=
ly full
--

commit d6bab080b0d20a1bf0f4308b07fa000ff665f3d5
Author: Ben Levinsky <ben.levinsky@amd.com>

mailbox: Add AMD PL Mailbox soft IP controller

Adds a mailbox framework controller for the AMD programmable-logic Mailbox =
soft
IP. The controller exposes separate transmit and receive FIFO channels,
supporting interrupt-driven receive notifications and polling-based transmit
completion.

> diff --git a/drivers/mailbox/amd-pl-mailbox.c b/drivers/mailbox/amd-pl-ma=
ilbox.c
> new file mode 100644
> index 0000000000000..bd6595332f533
> --- /dev/null
> +++ b/drivers/mailbox/amd-pl-mailbox.c

[ ... ]

> +static int amd_pl_mbox_send_data(struct mbox_chan *chan, void *data)
> +{
> +	struct amd_pl_mbox *mb =3D chan->con_priv;
> +	struct zynqmp_ipi_message *msg =3D data;
> +	size_t offset;
> +
> +	if (chan !=3D &mb->chans[AMD_PL_MBOX_CHAN_TX])
> +		return -EINVAL;
> +
> +	/* The TX FIFO is empty here, since TX completion waits for it. */
> +	if (!msg || !msg->len || msg->len > mb->fifo_len * sizeof(u32))
> +		return -EINVAL;
> +
> +	for (offset =3D 0; offset < msg->len; offset +=3D sizeof(u32)) {
> +		size_t count =3D min(sizeof(u32), msg->len - offset);
> +		u32 word =3D 0;
> +
> +		if (readl(mb->regs + AMD_PL_MBOX_STATUS) &
> +		    AMD_PL_MBOX_STS_TX_FULL)
> +			return -EBUSY;
> +
> +		memcpy(&word, &msg->data[offset], count);
> +		writel(word, mb->regs + AMD_PL_MBOX_WRDATA);

[Severity: High]
Will this corrupt the byte order of the stream payload on big-endian
architectures? writel performs implicit CPU-to-device byteswapping.
For bulk FIFO stream data, should this use writesl to preserve the byte
layout of the zynqmp_ipi_message stream when crossing endianness boundaries?

> +	}
> +
> +	return 0;
> +}

[ ... ]

> +static void amd_pl_mbox_rx(struct amd_pl_mbox *mb)
> +{
> +	/* data[] follows a size_t in a kzalloc() buffer: u32 aligned. */
> +	u32 *rx_words =3D (u32 *)mb->rx_msg->data;
> +	u32 words;
> +
> +	/*
> +	 * The hardware reports neither the peer's message length nor the FIFO
> +	 * occupancy. Read until the FIFO is empty, up to one FIFO depth, and
> +	 * deliver the words as one message.
> +	 */
> +	for (words =3D 0; words < mb->fifo_len; words++) {
> +		if (readl(mb->regs + AMD_PL_MBOX_STATUS) &
> +		    AMD_PL_MBOX_STS_RX_EMPTY)
> +			break;
> +
> +		rx_words[words] =3D readl(mb->regs + AMD_PL_MBOX_RDDATA);

[Severity: High]
Similarly, does using readl for stream data cause byte swapping issues on
big-endian systems? Should this use readsl to read the FIFO without unwanted
endianness conversion?

> +	}
> +
> +	if (words) {
> +		mb->rx_msg->len =3D words * sizeof(u32);
> +		mbox_chan_received_data(&mb->chans[AMD_PL_MBOX_CHAN_RX],
> +					mb->rx_msg);
> +	}
> +}
> +
> +static void amd_pl_mbox_rx_rearm(struct amd_pl_mbox *mb)
> +{
> +	/*
> +	 * The receive event latches only when the FIFO goes from empty to
> +	 * nonempty. A word that arrived after the drain, but before the event
> +	 * was acknowledged, had its event cleared, and words left by the
> +	 * bounded drain never raised one. Raise the threshold and lower it
> +	 * again to latch a new event, so that the interrupt fires for them.
> +	 * This cannot latch an event while the FIFO is full, which happens only
> +	 * if the peer writes a full FIFO depth during one interrupt.
> +	 */
> +	if (!(readl(mb->regs + AMD_PL_MBOX_STATUS) &
> +	      AMD_PL_MBOX_STS_RX_EMPTY)) {
> +		writel(mb->fifo_len - 1, mb->regs + AMD_PL_MBOX_RECV_THRESHOLD);
> +		writel(0, mb->regs + AMD_PL_MBOX_RECV_THRESHOLD);

[Severity: High]
Can this permanently lose the RX interrupt if the FIFO becomes completely f=
ull?

If the FIFO has exactly fifo_len words, both occupancy > fifo_len - 1 and
occupancy > 0 evaluate to true. Without a false-to-true edge transition, the
hardware might not latch the new event, leaving data stuck in the FIFO.

> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014213426.2957=
480-1-ben.levinsky@amd.com?part=3D4
