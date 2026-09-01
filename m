Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C912F3C0A13
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 11:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788263348; cv=none; b=envcFPOgvZCvIHmMM0kUicRkPHTzIC8EpNtWs3v7bopeuaaq75JOizBHIkySpl11j7i6Ce6+eqtrSvcLirkNz/8Z1KX/HZu/ua5upjSuhgUsNUuYe4CDngd7ilN3gVhScT5gW1Sit/5j34lKbK+MLzx7avQAI93rYoEoHmKs0b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788263348; c=relaxed/simple;
	bh=15F21gmNZaw4Qr7gI/tm/UZQzJxye6UU2JDi77ffNAY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UHE+uvoI7mveulYCEKKfLLqcZ6Bt7bi3AXO8jIRo50TLF4ACi5QnmfkCn1kogrF5Rnyd5Imhckv5A5Ga3ZVRYbZok9loMRcurIDCfEsrbat9D4iL86St+34PnxCQMyH7oK6buWu4oXFI5CRLsWkGocqjj0odfyezKpgLv9Q3rog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X5kPk8a8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5kPk8a8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2721F000E9;
	Tue,  1 Sep 2026 11:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788263344;
	bh=BS1Vn5+pUQvT2XxHJ2MLYGrFgVd2xTWRGWoYJLSGRAc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X5kPk8a8j/Grr0bn4nx+2J2d2N7GqbzyrjlH9Q+MxPlw/4IGoBCOvRBN+4LR1ezg3
	 CKLfDwnPYRmbI/2i9QWRXAGB6SooPB8zXZ/T2GmGbO/VsdNNUyWurUdJg0eSg082Ij
	 LEbWSwIfsRLKVjiYaRA+MfJrGMTYrCP+Pev6Nu+aTDS/Q1dd9MaGbkcgFwgsayE3Jv
	 dRKmievm21LG2ZVnS1+z4y9n+u+K64D+aYDFDuT6RszeX4FefMbgpmmsxRSqgHf+xx
	 JakSj5+n8nn6xT/QxEjbeSmTy5TMZYgvi7ysZ45psDQ5Mu88btQ+EbXZExgxhURkOc
	 CjWkKCj4BsSDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/8] i3c: mipi-i3c-hci: Add a quirk to clear the TX
 start threshold
Reply-To: sashiko-reviews@lists.linux.dev
To: "Billy Tsai" <billy_tsai@aspeedtech.com>
Cc: Frank.Li@kernel.org, linux-i3c@lists.infradead.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901-b4-i3c-hci-ast2700-v1-4-19909e7cbd7e@aspeedtech.com>
References: <20260901-b4-i3c-hci-ast2700-v1-0-19909e7cbd7e@aspeedtech.com>
 <20260901-b4-i3c-hci-ast2700-v1-4-19909e7cbd7e@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 11:49:03 +0000
Message-Id: <20260901114903.9E2721F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Endianness Portability Bug: Register accessors used for stream FIF=
Os
- [High] Out-of-bounds Read when handling trailing bytes in TX FIFO
- [High] Unaligned Memory Access when casting caller-provided buffer
--

commit 88ae252ec612f81d6b6f55d8dd0ef78352a438bf
Author: Billy Tsai <billy_tsai@aspeedtech.com>

i3c: mipi-i3c-hci: Add a quirk to clear the TX start threshold

This commit introduces a new quirk, HCI_QUIRK_TX_START_THLD, to clear the
TX start threshold in DMA mode on ASPEED platforms to prevent transfer
stalls. It also moves the PIO access area definitions from pio.c to a new
pio.h header file so they can be shared.

> diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/m=
ipi-i3c-hci/pio.c
> index 439578a6eb54c..6bd5e43364a1d 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/pio.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/pio.c

[ ... ]

While reviewing this file, I noticed a few pre-existing issues that are not
introduced by this patch, but remain uncorrected in this series.

In drivers/i3c/master/mipi-i3c-hci/pio.c:hci_pio_do_rx():

	while (xfer->data_left >=3D 4) {
		/* bail out if FIFO hasn't reached the threshold value yet */
		if (!(pio_reg_read(INTR_STATUS) & STAT_RX_THLD))
			return false;
		nr_words =3D min(xfer->data_left / 4, pio->rx_thresh_size);
		/* extract data from FIFO */
		xfer->data_left -=3D nr_words * 4;
		dev_dbg(&hci->master.dev, "now %d left %d",
			nr_words * 4, xfer->data_left);
		while (nr_words--)
			*p++ =3D pio_reg_read(XFER_DATA_PORT);
	}

[Severity: High]
This isn't a bug introduced by this patch, but does reading from the stream
FIFO (XFER_DATA_PORT) using pio_reg_read() cause unintended byteswapping on
big-endian architectures?

According to the I/O Accessors Subsystem Guidelines, stream FIFOs must
exclusively use stream accessors (readsl() / writesl()) to avoid corrupting
the I3C byte stream payload on big-endian systems.

Additionally, if the caller provides an arbitrary buffer in xfer->data that
is not aligned to a 4-byte boundary, doesn't casting it directly to a u32
pointer and dereferencing it via *p++ cause an alignment fault (kernel
panic) on architectures that do not support hardware unaligned accesses?

The same patterns appear in hci_pio_do_tx() for writes:

drivers/i3c/master/mipi-i3c-hci/pio.c:hci_pio_do_tx():

	while (xfer->data_left >=3D 4) {
		/* bail out if FIFO free space is below set threshold */
		if (!(pio_reg_read(INTR_STATUS) & STAT_TX_THLD))
			return false;
		/* we can fill up to that TX threshold */
		nr_words =3D min(xfer->data_left / 4, pio->tx_thresh_size);
		/* push data into the FIFO */
		xfer->data_left -=3D nr_words * 4;
		dev_dbg(&hci->master.dev, "now %d left %d",
			nr_words * 4, xfer->data_left);
		while (nr_words--)
			pio_reg_write(XFER_DATA_PORT, *p++);
	}

[Severity: High]
This is a pre-existing issue, but does writing to the TX stream FIFO using
pio_reg_write() also byteswap the data incorrectly on big-endian
architectures, and does it similarly suffer from unaligned memory access
panics?

Further down in hci_pio_do_tx(), trailing bytes are handled:

	if (xfer->data_left) {
		/*
		 * There are trailing bytes to send. We can simply load
		 * them from memory as a word which will keep those bytes
		 * in their proper place even on a BE system. This will
		 * also get some bytes past the actual buffer but no one
		 * should care as they won't be sent out.
		 */
		if (!(pio_reg_read(INTR_STATUS) & STAT_TX_THLD))
			return false;
		dev_dbg(&hci->master.dev, "trailing %d", xfer->data_left);
		pio_reg_write(XFER_DATA_PORT, *p);
		xfer->data_left =3D 0;
	}

[Severity: High]
This isn't a bug introduced by this patch, but does the 32-bit dereference
of *p for the trailing bytes read past the end of the allocated buffer?

If an I3C transfer occurs where the provided payload buffer length leaves
1 to 3 trailing bytes and unprivileged userspace passes an unpadded buffer
via an ioctl, reading past the allocation could trigger KASAN splats or
cause a fatal page fault if the buffer ends exactly at a page boundary or
a SLUB debugging redzone.

Finally, in hci_pio_get_ibi_segment():

drivers/i3c/master/mipi-i3c-hci/pio.c:hci_pio_get_ibi_segment():

		/* extract the data from the IBI port */
		nr_words =3D thresh_val;
		ibi->seg_cnt -=3D nr_words * 4;
		dev_dbg(&hci->master.dev, "now %d left %d",
			nr_words * 4, ibi->seg_cnt);
		while (nr_words--)
			*p++ =3D pio_reg_read(IBI_PORT);

[Severity: High]
This is a pre-existing issue, but does reading from the IBI FIFO stream
using pio_reg_read() incorrectly byteswap the data payload on big-endian
platforms?

Does this need to be updated to use readsl() or similar stream accessors?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-b4-i3c-hci=
-ast2700-v1-0-19909e7cbd7e@aspeedtech.com?part=3D4
