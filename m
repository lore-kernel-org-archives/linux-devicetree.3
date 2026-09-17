Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588FA37E2E9
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 02:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789613003; cv=none; b=loYAOiiwhE0gKcRIdQ3p7h74eLY07n7kzV3UXTpSiEEI8s6KMwBIr57bqwEs8F7v46Tm6vFG7vbE/59obvmny7WBO5G+hFxdR+6Wov9RAJMTHyrbbo5v47SzVf4mC6PFecRvK0r4pte1+XrsuzaD6CT9bUnQLhY1tMwBPq94Jwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789613003; c=relaxed/simple;
	bh=RUrzdIsn65oziGpDYn9VgAehBTtNxlVVupgPdDH+QAY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YrFzZFEBYDIvfihuS+9WtCBowlJRHfBxO30lU18AIMGlSHtuzHd4bOTJzvxaRTXWhUiINqWJx8aSHsp1RzrFgwW5RJVw8y2ZjH03saRzeksLXWMRqxWps52Jd/bpgfSg+bcY7BS/gwJDJVjD8oWmv+p0tmdtAFjLXh7UmTuCxPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iXYGeVFh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iXYGeVFh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E65741F000FF;
	Thu, 17 Sep 2026 02:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789612995;
	bh=aIlL7MRQRnEA94zyg7wsv4JTmTzrLZiYiRZPbsFbm0k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iXYGeVFhXqHuMC8WM4ucDPRBNnYY+r4JRvKO6nxepRIUu1rIVjnDaYfeMaUPqarqi
	 SBlFN+9I9WHYSEq+ucaTBlb+xy6KtB2PlfHZf5Li+BqpWHdvMHGntM93tZDYy+tYXw
	 O+bVBZhmYLFnUiTWcN86GgsX7BFgzkURohQEGVLHPGyDYF5M5ZuCoS5HWgDwnCzc49
	 YsxMr+hSSeRYubyMeRW2lG8mGjW7BD4lkYhjY9k3QSm7a6piiRphL1otQg2EJqMjHD
	 5G1+U6z6Z3tYF7vBGFHXjaZQjMKnTGcQ8tcvhmDJUMk9gzSHO9YNQTJDaOYHr/CONY
	 tviu5dV3Xsovg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH bluetooth-next 3/3] Bluetooth: btaic: Add AIC8800D80
 SDIO loader and UART transport
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yanli Yang" <yanli.yang@bedmex.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <178954773705.2.3606741563381453586@bedmex.com>
References: <178954773705.2.3446471521233620446@bedmex.com>
 <178954773705.2.3606741563381453586@bedmex.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 02:43:14 +0000
Message-Id: <20260917024314.E65741F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] bluetooth: btaic: off-by-one in SDIO credit check causes timeout
- [High] bluetooth: btaic: missing SDIO transaction sequence numbers
- [High] bluetooth: btaic: UAF race in aic_bt_flush with RX path
- [High] bluetooth: btaic: deadlock in SDIO IRQ due to GFP_KERNEL allocation
- [Medium] bluetooth: btaic: UART max-speed DT property breaks firmware bau=
d rate sync
--

commit c8b56eafa02e3f8c8946ccb2113f1c30e8b1cd4f
Author: Yanli Yang <yanli.yang@bedmex.com>
Subject: Bluetooth: btaic: Add AIC8800D80 SDIO loader and UART transport

Adds a driver for the AIC8800D80 combination chip. It implements an SDIO
firmware loader and a serdev UART for H4 HCI traffic.

> diff --git a/drivers/bluetooth/btaic_sdio.c b/drivers/bluetooth/btaic_sdi=
o.c
> --- a/drivers/bluetooth/btaic_sdio.c
> +++ b/drivers/bluetooth/btaic_sdio.c
[ ... ]
> static void aic_bt_complete_response(struct aic_bt_sdio *btdev,
> 				     const struct aic_bt_e2a_header *message,
> 				     size_t message_len)
> {
[ ... ]
> 	spin_lock_irqsave(&btdev->response_lock, flags);
> 	if (!btdev->waiting_response || id !=3D btdev->expected_response)
> 		goto unlock;

[Severity: High]
Is there a risk of mismatched responses if a command times out?

In aic_bt_command(), a timeout clears waiting_response and aborts, leaving
the hardware state machine active:

    spin_lock_irqsave(&btdev->response_lock, flags);
    btdev->waiting_response =3D false;
    btdev->response =3D NULL;

If a subsequent command of the same type is sent, and the hardware belatedly
responds to the timed-out request, aic_bt_complete_response() would accept
the late response since the expected_response ID matches. Could this corrupt
the initialization sequence?

[ ... ]
> static void aic_bt_sdio_irq(struct sdio_func *func)
> {
[ ... ]
> 	data =3D kmalloc(data_len, GFP_KERNEL);

[Severity: High]
Could this allocation deadlock under memory pressure?

The mmc core's sdio_irq_thread calls aic_bt_sdio_irq() with the mmc host lo=
ck
held. If GFP_KERNEL triggers direct reclaim, and reclaim tries to flush dir=
ty
pages to a block device on the same mmc host, it would attempt to acquire t=
he
host lock again, hanging the system.

[ ... ]
> static int aic_bt_wait_for_credits(struct aic_bt_sdio *btdev, size_t tx_l=
en)
> {
[ ... ]
> 	for (retry =3D 0; retry < AIC_SDIO_FLOW_RETRIES; retry++) {
> 		u8 credits;
>=20
> 		credits =3D sdio_readb(btdev->func, AIC_SDIO_FLOW_CTRL_Q1, &err);
> 		if (err)
> 			return err;
>=20
> 		if (credits && tx_len < (size_t)credits * AIC_SDIO_BUFFER_SIZE)
> 			return 0;

[Severity: High]
Can this condition prevent transmission when exactly the right amount of
credits are available?

If the hardware grants exactly the required number of credits, this strictly
less-than check evaluates to false, causing the initialization to time out.
Should this be a <=3D check?

[ ... ]
> static u32 aic_bt_mode_value(unsigned int pair, u32 firmware_value)
> {
> 	switch (pair) {
[ ... ]
> 	case 5:
> 		return AIC_BT_UART_BAUD;

[Severity: Medium]
Does this firmware configuration get out of sync with the device tree speed?

Here, aic_bt_mode_value() hardcodes the firmware's baud rate patch to
1,500,000. However, in aic_bt_uart_probe(), the max-speed DT property is
read and configures the host UART speed. If the device tree specifies a
different speed, the host and controller will operate at different baud rat=
es,
causing HCI communication to fail.

> diff --git a/drivers/bluetooth/btaic_uart.c b/drivers/bluetooth/btaic_uar=
t.c
> --- a/drivers/bluetooth/btaic_uart.c
> +++ b/drivers/bluetooth/btaic_uart.c
[ ... ]
> static size_t aic_bt_receive_buf(struct serdev_device *serdev,
> 				 const u8 *data, size_t count)
> {
> 	struct aic_bt_uart *uart =3D serdev_device_get_drvdata(serdev);
>=20
> 	uart->rx_skb =3D h4_recv_buf(&uart->hu, uart->rx_skb, data, count,
[ ... ]
> static int aic_bt_flush(struct hci_dev *hdev)
> {
[ ... ]
> 	kfree_skb(uart->rx_skb);
> 	uart->rx_skb =3D NULL;

[Severity: High]
Could this race with concurrent UART receives and cause a use-after-free?

When the HCI core invokes aic_bt_flush(), it frees uart->rx_skb. But the
serdev device is not closed until aic_bt_close(), meaning aic_bt_receive_bu=
f()
could be executing simultaneously on another CPU, calling h4_recv_buf() on =
the
freed socket buffer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/178954773705.2.3446=
471521233620446@bedmex.com?part=3D3
