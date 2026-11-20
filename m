Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175529;
	b=dW1K1NCtJw2t5vxD877xsOcOoniEBHC5YaeR2MZ9KEj/C+OBGAbJd3b7kp0pPV0bEu5g
	 fi2gtXwODu0VEyhgGRVosJer400t2hPivphHDvq59lopVdQ/rjCSX/DwfKUD4aiteBSyX
	 aSVOp/3BKPBz3RPRuobYik+0lKJmjGQZFF4i5zX6vk8r+nKFwu3hzcuP0/LAahHz1qTVG
	 uFnJGgyc7ranOlOnwrzOAbjwGVW9EreVtvtVGCCpqpnGaPi6aoiercJ5MSBiFiWBcS6GH
	 /H6l6pQCb8H7CE1XTrJ5SWiHLjUfLhisbkJBSHWOVv9lWc5exajYesVAxCkOs/FMpHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175529;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XaAGumhVokh+2BDdHg76E3RVHGZuSdmtCNeDNfzUGOU=;
	b=qyvW1PQoydxbic0W/xNoDXAVhxkJu+k5/1xpkX1vOI3aw8oJtuy45Y0cjZMLxjthCNL3
	 4Ss4odrvRg2buh0UzdKKzVBZOxCpy6rPeIvzfBHHvzfSazS8JZsE4kGhp3u99UDaYAWm5
	 IVnMcA9bH3BxXajdrLOyabGHY2d3etKiPK3ZqJOyIHjMd1bu7OEQnbbDtatxJXq+xRZC6
	 M96LQqmta6B2D3Q5MALNyB85x4T2QH/7yVdw8Y7MSVXoti/jmRmWQlQoLEkCP+GfVeh3d
	 85xzjkqIblm7lvoY0H17b5wU0USqpFpuX2idu1JZRWr5Vj2VBOQVcCUN8xoDH7ABpbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ke8WBbXZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFB2606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ke8WBbXZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 083D91F000CF;
	Fri, 20 Nov 2026 11:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795175528;
	bh=XaAGumhVokh+2BDdHg76E3RVHGZuSdmtCNeDNfzUGOU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ke8WBbXZ2WLSrmEKiXicu/EaC1eU2pOKQLVdv5B58q5v3xBL824wsd7up3NOFofPT
	 WF8jz4y8JyjnTXUu9Ykin/C7cZ5QPoJOStxMZP59QpFkwPla/zdmlMWjdufDJ0Wxv0
	 5O3CBBLgErVlfNZ5LQP95+TRrVcHyvO13PfYE0AlSwzJW6bqysNPRxSHxHIl1R66Q4
	 PeLWRwVW2uOmMRTtMHE1LEOOKg91MZo9FLkb0DhO9zs1PTC6CgmquxEedvLOEXhrum
	 zt6mKqPYtOI2ZQBRxFD7AtVu4onLlAxFtwOMbnO2m1/snx6J8QxFxwk6VxsmwwrrPb
	 Gew3vMrsWXUTQ==
Message-ID: <sashiko-outbox-225100@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] mailbox: marvell-mhu: add Marvell MHU driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Cercueil" <paul.cercueil@bootlin.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261120113952.168265-3-paul.cercueil@bootlin.com>
References: <20261120113952.168265-1-paul.cercueil@bootlin.com>
 <20261120113952.168265-3-paul.cercueil@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 11:52:06 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] mailbox: marvell-mhu: missing IRQF_NO_AUTOEN in
  mrvl_mhu_setup_irq()
- [Medium] mailbox: marvell-mhu: inverted TX done check in
  mrvl_mhu_last_tx_done()
- [Low] mailbox: marvell-mhu: invalid min_vecs in mrvl_mhu_setup_irq()
--

commit 2ee602a4969cc96c3afca49d7d2c3b05ee5ffda2
Author: George Cherian <gcherian@marvell.com>

mailbox: marvell-mhu: add Marvell MHU driver

This commit adds a mailbox controller driver for the Message Handling Unit
on Marvell OcteonTX and OcteonTX2 platforms.

> diff --git a/drivers/mailbox/marvell_mhu.c b/drivers/mailbox/marvell_mhu.c
> new file mode 100644
> index 0000000000000..9b618b3fe2768
> --- /dev/null
> +++ b/drivers/mailbox/marvell_mhu.c
> @@ -0,0 +1,239 @@
[ ... ]
> +#define SCP_INDEX	0x0
> +#define DEV_AP0		0x2
> +#define SCP_TO_AP_INTERRUPT	2
> +#define INT_VECS_MIN	0
> +#define INT_VECS_MAX	3
[ ... ]
> +static bool mrvl_mhu_last_tx_done(struct mbox_chan *chan)
> +{
> +	struct mrvl_mhu *mhu =3D chan->con_priv;
> +	u64 status;
> +
> +	status =3D ioread64(mhu->base + AP0_TO_SCP_MBOX_LINT);
> +
> +	return status !=3D 0;
> +}

[Severity: Medium]
Is the status check in mrvl_mhu_last_tx_done() inverted?

Writing the doorbell in mrvl_mhu_send_data() asserts the interrupt bit in
AP0_TO_SCP_MBOX_LINT, and the register remains non-zero until the SCP
services and clears the interrupt.  Returning status !=3D 0 reports TX done
while the interrupt is still pending (or times out if the SCP clears it
before the poll runs), instead of waiting for status =3D=3D 0.

> +
> +static int mrvl_mhu_startup(struct mbox_chan *chan)
> +{
> +	struct mrvl_mhu *mhu =3D chan->con_priv;
> +
> +	/* Enable interrupts only if there is client for data */
> +	writeq_relaxed(1ul, mhu->base + SCP_TO_AP0_MBOX_RINT_ENA_W1S);
> +
> +	enable_irq(mhu->irq);
> +
> +	return 0;
> +}
> +
> +static void mrvl_mhu_shutdown(struct mbox_chan *chan)
> +{
> +	struct mrvl_mhu *mhu =3D chan->con_priv;
> +
> +	/* Could be using SCP_TO_AP0_MBOX_RINT_DIS_W1S if we knew where it was =
*/
> +	disable_irq(mhu->irq);
> +}
[ ... ]
> +static int mrvl_mhu_setup_irq(struct mrvl_mhu *mhu, struct pci_dev *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	int ret, nvec;
> +
> +	nvec =3D pci_alloc_irq_vectors(pdev, INT_VECS_MIN, INT_VECS_MAX, PCI_IR=
Q_MSIX);
> +	if (nvec < 0)
> +		return nvec;
> +
> +	ret =3D devm_add_action_or_reset(dev, mrvl_mhu_free_irq_vector, pdev);
> +	if (ret)
> +		return ret;
> +
> +	mhu->irq =3D pci_irq_vector(pdev, SCP_TO_AP_INTERRUPT);

[Severity: Low]
Should INT_VECS_MIN be 3 (or SCP_TO_AP_INTERRUPT + 1) instead of 0?
pci_alloc_irq_vectors() requires min_vecs >=3D 1, and requesting vector
index 2 requires at least 3 MSI-X vectors to be allocated.

> +	if (mhu->irq < 0)
> +		return mhu->irq;
> +
> +	return devm_request_irq(dev, mhu->irq,
> +				mrvl_mhu_rx_interrupt, 0, "mvl-mhu", mhu);
> +}

[Severity: High]
Should devm_request_irq() pass IRQF_NO_AUTOEN?

With irqflags set to 0, mhu->irq is enabled immediately during probe while
mhu->chan.cl is still NULL.  When a client binds to the channel,
mrvl_mhu_startup() calls enable_irq(mhu->irq) on the already-enabled IRQ
and triggers an "Unbalanced enable for IRQ" warning in __enable_irq().  In
addition, if an SCP interrupt fires before a client attaches,
mrvl_mhu_rx_interrupt() calls mbox_chan_received_data(&mhu->chan, ...) and
dereferences a NULL chan->cl.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120113952.1682=
65-1-paul.cercueil@bootlin.com?part=3D2
