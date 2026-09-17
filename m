Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB8534B1A5
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 02:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789612401; cv=none; b=ECJV38mvRxC49rQXkVCJzj8iPyST1VodS/wUQEz2MuyEzeKdbfzzdQPZoAT5v3v5J+0JBtOqoT9k+IZ+ZspTSTfWuZs55Bu7nY3mGzW4JY/opk/ax6Hxc3KjMO6B0CAP8X8qiO/v6HnQ7Kh8ZuGJsFCRPRccsRcgNvHEYdN+u0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789612401; c=relaxed/simple;
	bh=i9/SfUFvsWtmXXytaYsI3kdUPhC0hma5cAcet3Y6TNQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ieg6IQakD7N5/ySLvbEo3AU4A1MIlvjnrmgLgJr44OaJG1xKrJ5mTrmRAeugkPTkDZLpNk7VghvnjGBytasVMrHtsNUP7Edqf4CX/CC3VgKq1zgRMCRdPcSWh8hcsj6HG33Bmn8k+IU6nrEh8OUH8g7M+Koxg+cYYQPM8v0aJRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RlUsT2uU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RlUsT2uU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7101B1F000FF;
	Thu, 17 Sep 2026 02:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789612383;
	bh=zihYgyKHHvLbARRSgq6dlsgWPqfGXKlhkoT8V3y7cAk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RlUsT2uUAH05VjpER0mmGf3LCi9i0NwKUcd6ckdUpXpPtrA+QroP3S9ybNboEPjnJ
	 EX8dYc//GA01+qNpcQ6rAr5W4rXJHLH5hLTh3jUA90xp9e1f0ULsDVC8HLHaoGlIKD
	 qnmWx4e6F2tHMGx0BZcjnDaLhu8s4ja+n9OQqSlmuHgt54oOurWsfncKRMQYmYwCxi
	 W50sp7uhwKqhcjzKYfBaB3ljiWKi5z/MAHAffQ4FTlxbB0CLXhuAxKla8BAp7nkqP7
	 8sAudPv0TENE9vdmNZP6IeEb+FuxidXSSWSrUFTm9u8eDAELyXgazEoOqDkA39lrm0
	 Iv0JOS0WFtRtw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH bluetooth-next 3/3] Bluetooth: btaic: Add AIC8800D80
 SDIO loader and UART transport
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yanli Yang" <yanli.yang@bedmex.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <7c6bc897c991d34854ba2f62a572ce208956d2a4.1789546358.git.yanli.yang@bedmex.com>
References: <cover.1789546358.git.yanli.yang@bedmex.com>
 <7c6bc897c991d34854ba2f62a572ce208956d2a4.1789546358.git.yanli.yang@bedmex.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 02:33:02 +0000
Message-Id: <20260917023303.7101B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] bluetooth: btaic: use-after-free of rx_skb during concurrent flush=
 and receive
- [Medium] bluetooth: btaic: off-by-one in credits check causes timeout for=
 exact-fit payloads
- [Medium] bluetooth: btaic: spurious command failure due to delayed comple=
tion signal
--

commit d0fbf93152e71e54fc5cd6389eb4e023f7adbfc3
Author: Yanli Yang <yanli.yang@bedmex.com>
Subject: Bluetooth: btaic: Add AIC8800D80 SDIO loader and UART transport

This commit adds a driver for the AIC8800D80 combination chip. It utilizes=
=20
SDIO function 1 for loading Bluetooth firmware and a serdev UART interface=
=20
for handling the H4 HCI traffic. The firmware loading process uses a vendor=
=20
protocol to validate patch-table layouts and transfer the necessary images.

> --- /dev/null
> +++ b/drivers/bluetooth/btaic_sdio.c
> @@ -0,0 +1,886 @@

[ ... ]

> +static void aic_bt_complete_response(struct aic_bt_sdio *btdev,
> +				     const struct aic_bt_e2a_header *message,
> +				     size_t message_len)
> +{
> +	unsigned long flags;
> +	size_t param_len;
> +	u16 id;
> +	bool complete_command =3D false;
> +
> +	if (message_len < sizeof(*message))
> +		return;
> +
> +	id =3D get_unaligned_le16(&message->id);
> +	param_len =3D get_unaligned_le16(&message->param_len);
> +	if (param_len > message_len - sizeof(*message))
> +		return;
> +
> +	spin_lock_irqsave(&btdev->response_lock, flags);
> +	if (!btdev->waiting_response || id !=3D btdev->expected_response)
> +		goto unlock;
> +
> +	if (btdev->response && param_len < btdev->response_size) {
> +		btdev->command_result =3D -EMSGSIZE;
> +	} else {
> +		if (btdev->response)
> +			memcpy(btdev->response, message->param,
> +			       btdev->response_size);
> +		btdev->command_result =3D 0;
> +	}
> +
> +	btdev->waiting_response =3D false;
> +	complete_command =3D true;
> +
> +unlock:
> +	spin_unlock_irqrestore(&btdev->response_lock, flags);
> +
> +	if (complete_command)
> +		complete(&btdev->command_done);
> +}

[Severity: Medium]
Could this delayed completion signal cause a race condition with a subseque=
nt
command?

If a command times out, aic_bt_command() aborts and unlocks command_mutex.
If the SDIO IRQ handler processes the timed-out command's delayed response
concurrently, it releases response_lock just before calling complete().

If another thread executing aic_bt_command() acquires command_mutex and cal=
ls
reinit_completion() in this narrow window, the delayed complete() might sat=
isfy
the new command's wait immediately. The new command would then incorrectly
return its initial command_result (-EINPROGRESS) instead of waiting for its
own response.

[ ... ]

> +static int aic_bt_wait_for_credits(struct aic_bt_sdio *btdev, size_t tx_=
len)
> +{
> +	unsigned int retry;
> +	int err;
> +
> +	for (retry =3D 0; retry < AIC_SDIO_FLOW_RETRIES; retry++) {
> +		u8 credits;
> +
> +		credits =3D sdio_readb(btdev->func, AIC_SDIO_FLOW_CTRL_Q1, &err);
> +		if (err)
> +			return err;
> +
> +		if (credits && tx_len < (size_t)credits * AIC_SDIO_BUFFER_SIZE)
> +			return 0;

[Severity: Medium]
Does this strict inequality incorrectly reject a transmission that exactly =
fits
the available credit buffers?

For example, when aic_bt_mem_block_write() sends firmware chunks of 1024
bytes, the total tx_len (including headers and padding) is calculated as
1536 bytes. If the hardware advertises exactly 1 credit (1536 bytes of
capacity), the check (1536 < 1536) evaluates to false, causing the driver
to unnecessarily spin until it times out.

> +
> +		if (retry < 30)
> +			usleep_range(30, 50);
> +		else if (retry < 40)
> +			usleep_range(1000, 1500);
> +		else
> +			usleep_range(10000, 12000);
> +	}
> +
> +	return -ETIMEDOUT;
> +}
> +
> +static int aic_bt_command(struct aic_bt_sdio *btdev, u16 request_id,
> +			  const void *param, size_t param_len, u16 response_id,
> +			  void *response, size_t response_size)
> +{
> +	unsigned long flags;
> +	size_t frame_len;
> +	size_t message_len;
> +	size_t tx_len;
> +	long timeout;
> +	int err;

[ ... ]

> +	reinit_completion(&btdev->command_done);
> +	spin_lock_irqsave(&btdev->response_lock, flags);
> +	btdev->expected_response =3D response_id;
> +	btdev->response =3D response;
> +	btdev->response_size =3D response_size;
> +	btdev->command_result =3D -EINPROGRESS;
> +	btdev->waiting_response =3D true;
> +	spin_unlock_irqrestore(&btdev->response_lock, flags);

[ ... ]

> --- /dev/null
> +++ b/drivers/bluetooth/btaic_uart.c
> @@ -0,0 +1,331 @@

[ ... ]

> +static size_t aic_bt_receive_buf(struct serdev_device *serdev,
> +				 const u8 *data, size_t count)
> +{
> +	struct aic_bt_uart *uart =3D serdev_device_get_drvdata(serdev);
> +
> +	uart->rx_skb =3D h4_recv_buf(&uart->hu, uart->rx_skb, data, count,
> +				   aic_bt_recv_pkts,
> +				   ARRAY_SIZE(aic_bt_recv_pkts));

[ ... ]

> +static int aic_bt_close(struct hci_dev *hdev)
> +{
> +	struct aic_bt_uart *uart =3D hci_get_drvdata(hdev);
> +
> +	serdev_device_close(uart->serdev);
> +	return 0;
> +}
> +
> +static int aic_bt_flush(struct hci_dev *hdev)
> +{
> +	struct aic_bt_uart *uart =3D hci_get_drvdata(hdev);
> +
> +	serdev_device_write_flush(uart->serdev);
> +	cancel_work_sync(&uart->tx_work);
> +	skb_queue_purge(&uart->txq);
> +	kfree_skb(uart->rx_skb);
> +	uart->rx_skb =3D NULL;

[Severity: High]
Can this lead to a use-after-free of uart->rx_skb if data is received
concurrently during teardown?

During interface teardown, the HCI stack calls hdev->flush() before it calls
hdev->close(). This means aic_bt_flush() will free uart->rx_skb while the
UART serdev is still open.

If a UART receive interrupt fires before aic_bt_close() runs,
aic_bt_receive_buf() could be called and pass the freed uart->rx_skb
pointer into h4_recv_buf(), causing memory corruption.

> +	clear_bit(AIC_BT_TX_ACTIVE, &uart->tx_state);
> +	clear_bit(AIC_BT_TX_WAKEUP, &uart->tx_state);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1789546358.gi=
t.yanli.yang@bedmex.com?part=3D3
