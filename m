Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58B025F99F
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 07:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790236421; cv=none; b=DUOIqBoaUFlE2nhCvJCp9a0Htpn5NoihPfWWPm5OoyzyTPnbg6a4yL+THUU+i94VxN+fC4rKVsuXD0n4ybO/b7wQigeGEpSZsGysgKrNrRrgvmbQRZpscUCMmXQz/7ErWhifz1NMm8e03GNODmm+InYBJIHpCow/UTIVukCPfoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790236421; c=relaxed/simple;
	bh=EjU+EeVE86UDHMl1ozy25KeLHlH/rTJxYO/Y/Ws4t50=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TIpYiyI/1Nk5/+xowYZy8P+Q6Tjkol7VTedv8aY9eFqHb9aPU9dyffAM9xYqhqeNX1V7uTogBXN41gr4pVio3kb/wH9Led6tNbKUjFlCTrXcYwrhYW5/3QeJOaGMpTb3hHNZqvmRvxOL3D+CCI8m0WCJZ2mflV6cd2AZi3tGlrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LO9GKOAU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LO9GKOAU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E081F000FF;
	Thu, 24 Sep 2026 07:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790236420;
	bh=n/9vqacdxJiedXxN2bccyhW7QKkXeD+OK0JdpLIGfps=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LO9GKOAUtyobrbkmDH7xAOtOJn2dOrOJnVaiLD5EpaF1MdeWZhPKYLzlpznJXuuFW
	 2vzfsVdT/8Em9Ssdeccr2aOdJtdjEd2trgL6oRtMFpt/yG6bsgEWs5fYJ+IRSCqRdb
	 og7GVrUa47MdR8ZI13dWF1BdAqpVQvDj3j9otBB8ZTOCyy6XseKEVlFsrquXwO2YT+
	 7s6Wo2yv4pZfB/FCZDJr526Wdaak5Oe5sbCz3PiVJWwq+95y71Gwd21jL+PDmbfEOT
	 XNaSSe7wyQVPlJ3P5AR2zDK+Dp58p871UHIOF7akDDX6ynKVH6oKNsbAwmo33w9vQV
	 99Z2tUp7pmzUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH bluetooth-next v5 3/3] Bluetooth: btaic: Add AIC8800D80
 SDIO loader and UART transport
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yanli Yang" <yanli.yang@bedmex.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <39564a381eaf73a9225a3706f2c44c0b3706a519.1790235697.git.yanli.yang@bedmex.com>
References: <cover.1790235697.git.yanli.yang@bedmex.com>
 <39564a381eaf73a9225a3706f2c44c0b3706a519.1790235697.git.yanli.yang@bedmex.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 07:53:40 +0000
Message-Id: <20260924075340.65E081F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] bluetooth: btaic: forcible override of SDIO CCCR IEN corrupts bus =
state
- [Medium] bluetooth: btaic: permanent TX queue wedge on UART transmission =
error
--

commit 0b3f4967899ed87ce6d0daef5c0ff2b9f67d8faf
Author: Yanli Yang <yanli.yang@bedmex.com>

Bluetooth: btaic: Add AIC8800D80 SDIO loader and UART transport

This commit adds a driver for the AIC8800D80 combination chip. It uses
SDIO function 1 for Bluetooth firmware loading and a serdev UART for H4
HCI traffic. Firmware loading and patching are synchronized with UART
initialization via a reference-counted boot state.

> diff --git a/drivers/bluetooth/btaic_sdio.c b/drivers/bluetooth/btaic_sdi=
o.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/bluetooth/btaic_sdio.c
[ ... ]
> +static int aic_bt_sdio_hw_init(struct aic_bt_sdio *btdev)
> +{
> +	struct sdio_func *func =3D btdev->func;
> +	struct mmc_host *host =3D func->card->host;
> +	u8 io_control;
> +	int err;
[ ... ]
> +	err =3D sdio_claim_irq(func, aic_bt_sdio_irq);
> +	if (err)
> +		goto disable_func;
> +	btdev->irq_claimed =3D true;
> +
> +	sdio_f0_writeb(func, 0x07, 0x04, &err);

[Severity: High]
Does this hardcoded write to the CCCR IEN register (0x04) bypass the MMC=20
core's interrupt tracking?=20

Since sdio_claim_irq() was already called to properly enable the master and=
=20
Function 1 interrupts, writing 0x07 forcibly enables the Function 2 (WiFi)=
=20
interrupt outside of the MMC core's knowledge. Could this lead to unhandled=
=20
interrupt storms or disrupt the WiFi function if its driver is not yet read=
y?

> +	if (err)
> +		goto release_irq;
> +
> +	sdio_writeb(func, 0x07, AIC_SDIO_INTR_ENABLE, &err);
> +	if (err)
> +		goto release_irq;
> +
> +	sdio_release_host(func);
> +	return 0;
[ ... ]
> diff --git a/drivers/bluetooth/btaic_uart.c b/drivers/bluetooth/btaic_uar=
t.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/bluetooth/btaic_uart.c
[ ... ]
> +static void aic_bt_tx_work(struct work_struct *work)
> +{
> +	struct aic_bt_uart *uart =3D container_of(work, struct aic_bt_uart,
> +						 tx_work);
> +
> +	for (;;) {
> +		struct sk_buff *skb;
> +
> +		clear_bit(AIC_BT_TX_WAKEUP, &uart->tx_state);
> +
> +		while ((skb =3D skb_dequeue(&uart->txq))) {
> +			int len;
> +
> +			len =3D serdev_device_write_buf(uart->serdev, skb->data,
> +						      skb->len);
> +			if (len <=3D 0) {
> +				skb_queue_head(&uart->txq, skb);
> +				if (len < 0)
> +					bt_dev_err(uart->hdev,
> +						   "UART transmit failed (%d)", len);
> +				break;
> +			}

[Severity: Medium]
Will this create a permanent wedge in the TX queue on a transmission error?

If serdev_device_write_buf() returns a negative error code (such as -EIO=20
or -ENODEV) due to local hardware or bus errors, the driver treats it=20
identically to a full buffer by pushing the exact same skb back to the=20
head of uart->txq.

On the next TX wakeup, it appears it will dequeue this same packet,=20
fail again, and requeue it indefinitely, which would effectively block=20
all subsequent outbound Bluetooth traffic rather than gracefully dropping=20
the failed packet.

> +
> +			uart->hdev->stat.byte_tx +=3D len;
> +			skb_pull(skb, len);
> +			if (skb->len) {
> +				skb_queue_head(&uart->txq, skb);
> +				break;
> +			}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790235697.gi=
t.yanli.yang@bedmex.com?part=3D3
