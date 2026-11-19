Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795126714;
	b=xrIPkm2TQRdk64+Hd2QKkEdE+ypnPHE1z4ekT+nLhJz+RKBd/ag+QQCy+qDIAj4hoiuc
	 MKRocgnzueYkWd4JGEk1mmmIr1J053CUtX/BX+6PwOwEEVb3tLYQbcMQiZRKCGGnIYPeG
	 IEKZ09vkJ6q01CVmltD9TMHcrFsFQ3tbSRRJcfZyvNiD0T1W/3Mge5Ru7eNeCPVsybGLH
	 SokUywLZ0v7AeDigtFfpnETSLc5LdpjYMNGC4b4JnkhpImWv79wwvqWuUOILBOkDNMy33
	 UZ8MCxyYhGX89k80JMPRZ2nwbA8AUfmFZmU6LZ9HgLuRbXfvmd4GAOqlPdGyi5MraNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126714;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aECXQ0SIPaNWF8pgOOuSIECsr3wCesY2Y+EwG2k2ij8=;
	b=jFtr95J5i9POJa+ZgHNN29R9preGC+rTlRZFr8YutdDT6uukVksO7otOD3XLek9V/xX0
	 cFzCYhks0yyxOe2wIA/BACq6hryndojLrfHltti1SNizcdjSHFPnx8LCumfCS9Z3QRqC/
	 ZYajFy562Cox3CaN0KgWByoKyN/CjG8HzfZsNgW1Zk4WT4JsH7eLjXAxW37r22OI3zHip
	 eLrtg9qWshzEgKfzU5JyHnIazYCXKuH+yNe4Hr6TlWedK5vah0A/YOXKR5fxE8R1/OQ8i
	 ZYMusxZUXdFWMFBRrC/9TcCTwl+mN+jdslEvInNBxkZBBLXvt6TWj72NPv6wouoMg4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ErqNF9va;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D52606A326
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 22:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ErqNF9va
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCDE91F000C0;
	Thu, 19 Nov 2026 22:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795126714;
	bh=aECXQ0SIPaNWF8pgOOuSIECsr3wCesY2Y+EwG2k2ij8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ErqNF9vav8CkcVm+PMn/cIhiONlu2mh9rFUjWydRWokxfjWP6PpcQ0V/aQVnHzEDC
	 PM2/uYbhq8dYeZfTqtVZxu2WC11mMKA7R88Qm6iKUZOo1XPrSOLE95YVPkRgE14/fD
	 wNaF1xx4WK5OHTsrY2+WgMYjQx8/njLpmF7xqn0dUHDS6ONPrrVjekdG7Gg1sNfOlA
	 NSbitR9sSlGZbNsE/0Yjrss9ACLYih3BucE2/izBVH3AWy0tBnU0JRsWmZCJpu7pSq
	 Mdq89wU4CBp5gyi45SBMB8JcpP7pI8FXcuqTPluEPFf3QxZCFT0EqDMsFEgfxiB+xx
	 GRMyaFynolqSg==
Message-ID: <sashiko-outbox-224127@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] mailbox: Add AMD PL Mailbox soft IP controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ben Levinsky" <ben.levinsky@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119220405.2838553-3-ben.levinsky@amd.com>
References: <20261119220405.2838553-1-ben.levinsky@amd.com>
 <20261119220405.2838553-3-ben.levinsky@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 22:18:33 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] mailbox: skipped error read in amd_pl_mbox_irq_thread() when
  ratelimited
- [Medium] mailbox: lost RX threshold IRQ race in amd_pl_mbox_startup()
--

commit d942eb10f8289caaed849b4d53047a9b3e47ae11
Author: Ben Levinsky <ben.levinsky@amd.com>

mailbox: Add AMD PL Mailbox soft IP controller

This commit adds a mailbox controller driver for the AMD Programmable
Logic Mailbox soft IP with polling-based TX completion and
interrupt-driven RX handling.

> diff --git a/drivers/mailbox/amd-pl-mailbox.c b/drivers/mailbox/amd-pl-ma=
ilbox.c
> new file mode 100644
> index 0000000000000..d1fe0f381dce5
> --- /dev/null
> +++ b/drivers/mailbox/amd-pl-mailbox.c
> @@ -0,0 +1,378 @@
[ ... ]
> +static int amd_pl_mbox_startup(struct mbox_chan *chan)
> +{
[ ... ]
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

[Severity: Medium]
Can clearing AMD_PL_MBOX_IRQ_STATUS after resetting the RX FIFO lose an
incoming receive interrupt and stall the RX channel?

With AMD_PL_MBOX_RECV_THRESHOLD set to 0, AMD_PL_MBOX_IRQ_RX_THRESHOLD
only latches when the RX FIFO transitions from empty to nonempty.  If the
remote peer writes a word after AMD_PL_MBOX_CTRL_RX_RESET empties the
FIFO and before AMD_PL_MBOX_IRQ_STATUS is cleared, that status write
clears the latched event while the word stays unread in the FIFO.  Later
words then see a nonempty FIFO and never latch AMD_PL_MBOX_IRQ_RX_THRESHOLD
again.

Clearing AMD_PL_MBOX_IRQ_STATUS before resetting the RX FIFO (or draining
after enabling the interrupt) would avoid this race.

[ ... ]

> +static irqreturn_t amd_pl_mbox_irq_thread(int irq, void *data)
> +{
[ ... ]
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
Does passing readl(mb->regs + AMD_PL_MBOX_ERROR) directly to
dev_warn_ratelimited() skip reading the error register when logging is
rate-limited or CONFIG_PRINTK is disabled?

dev_warn_ratelimited() only evaluates its variadic arguments when
__ratelimit() succeeds, so once the burst limit is exceeded the
clear-on-read AMD_PL_MBOX_ERROR register is not read and its sticky FIFO
error bits remain set.  Reading AMD_PL_MBOX_ERROR into a local variable
before calling dev_warn_ratelimited() ensures the register is always
cleared.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119220405.2838=
553-1-ben.levinsky@amd.com?part=3D2
