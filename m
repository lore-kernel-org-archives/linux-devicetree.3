Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1172043BDAE
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 07:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789976356; cv=none; b=gZa7clF2uLQfitXQ/sLivLLe2BbCtgDZJM0+swaBFyg7ISHahYr7Cl6BMEl1QjQPNerZq7cHIUR/uyEcxX5HpxXGZFXa5W9KvTWXBcqzSoyKV6TUGnQO+WS3SFKiY9420JuOMJCxXTwXXofA7Hg4PnkMNiDgymcpYvSpgqkU54U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789976356; c=relaxed/simple;
	bh=ssiE1zAHlgu8wEIQQKLJgftjk/ZLgc2Ik07wCBKMeOQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UJK3FyBpQ/adVIEBBA+WqZFkom2igIYRHvhkGfhbuDsv5xxq6fiQ5/9Q06u0YvxkpX6uhZZL+hKyR5hXvqFPQakXmnYUz/xPUJ+exVmF2KlavUqdBssVgclgjCN6eeUjYPrWXE1tGunJar0GS/olMQL005qLm/4b4Ncsggkjv3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UfInivcg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UfInivcg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE6741F000FF;
	Mon, 21 Sep 2026 07:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789976349;
	bh=OUK5vYGHdDyUJA3ZCmO3d+uV+3lnXvRO9hEphK0VY+E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UfInivcgaC4Y4ey+U4yc8zR6dPS/0L5OkH5ZVLRTb28YpCTJuZ4ZmMVDLJf8UhGpU
	 9k41ni8cDGB+1IyWG2VYzyUw5wG1CkOg7khHU5ecydfC0yHkqfBSlm1SxFm4vMjs7a
	 xuDvroubUEIidyiWw+XrcM/rxvvfvQ3ZfY495LsPEgprN3SPMFwpfdj7Vrw4h7ywEd
	 6xeN0F0ffuO4TOekifANgHuc4Mwf5PYJ2xQ1tsjaDoAXqkOvd33D9bxuEtFjWwkfLr
	 ZWTTgH4Fgpr8fll3UGQBwcfRi7EAiBgNX99FU2oG0pLf70sjrr2FRZoLNy2z/2p+XC
	 KaEJ+P6MhSm3g==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v3 3/3] Bluetooth: btaic: Add AIC8800D80 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yanli Yang" <yanli.yang@bedmex.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <cf5876168e36fc0086c543f347affbf968482cdb.1789974593.git.yanli.yang@bedmex.com>
References: <cover.1789974593.git.yanli.yang@bedmex.com>
 <cf5876168e36fc0086c543f347affbf968482cdb.1789974593.git.yanli.yang@bedmex.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 07:39:09 +0000
Message-Id: <20260921073909.AE6741F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] bt: aic: struct layout mismatch breaks firmware loading
- [High] bt: aic: synchronous request_firmware in probe deadlocks SDIO bus
- [High] bt: aic: type mismatch in h4_recv_buf() causes out-of-bounds access
- [Medium] bt: aic: rx_skb memory leak and state corruption on open failure
- [Medium] bt: aic: memory leak of skb on skb_cow_head failure
- [Low] bt: aic: build failure due to undefined kzalloc_obj macro
--

commit 0701d7f81641131610e34be895b933ef2ec43de9
Author: Yanli Yang <yanli.yang@bedmex.com>

Bluetooth: btaic: Add AIC8800D80 support

Add a driver for the AIC8800D80 combination chip, using SDIO function 1
for Bluetooth firmware loading and a serdev UART for H4 HCI traffic.

> diff --git a/drivers/bluetooth/btaic_core.c b/drivers/bluetooth/btaic_cor=
e.c
> --- /dev/null
> +++ b/drivers/bluetooth/btaic_core.c
> @@ -0,0 +1,180 @@

[ ... ]

> +struct aic_bt_boot *aic_bt_boot_register(struct device *dev)
> +{
> +	struct aic_bt_boot *boot;
> +
> +	boot =3D kzalloc_obj(*boot);
> +	if (!boot)
> +		return ERR_PTR(-ENOMEM);

[Severity: Low]
Is kzalloc_obj() defined in the kernel?

In aic_bt_boot_register(), the code attempts to allocate memory using
kzalloc_obj(). This macro is not a standard Linux kernel macro and does not
appear to be defined anywhere in the kernel source or driver headers. Will
this cause a compilation failure?

> diff --git a/drivers/bluetooth/btaic_sdio.c b/drivers/bluetooth/btaic_sdi=
o.c
> --- /dev/null
> +++ b/drivers/bluetooth/btaic_sdio.c
> @@ -0,0 +1,901 @@

[ ... ]

> +struct aic_bt_e2a_header {
> +	__le16 id;
> +	__le16 dest_id;
> +	__le16 src_id;
> +	__le16 param_len;
> +	__le32 pattern;
> +	u8 param[];
> +} __packed;

[Severity: High]
Does this struct layout match the hardware format constructed during TX?

The driver manually constructs SDIO TX messages with a 4-byte zero padding
(pattern) starting at offset 4 of the buffer, followed by request_id at
offset 8, dest_id at 10, etc., in aic_bt_command():

	put_unaligned_le16(request_id, btdev->tx_buf + 8);
	put_unaligned_le16(AIC_TASK_DBG, btdev->tx_buf + 10);
	put_unaligned_le16(AIC_DRIVER_TASK, btdev->tx_buf + 12);
	put_unaligned_le16(param_len, btdev->tx_buf + 14);
	if (param_len)
		memcpy(btdev->tx_buf + 16, param, param_len);

However, the RX parser receives the payload starting at offset 4 and casts
it to struct aic_bt_e2a_header. This struct defines __le16 id at offset 0
and __le32 pattern at offset 8, which reverses the TX layout.

Due to this layout mismatch, message->id reads the zero padding instead of
the ID, and message->param_len reads the dest_id. Does this cause all
received responses to fail validation in aic_bt_complete_response() and
prevent firmware loading?

[ ... ]

> +static int aic_bt_download_firmware(struct aic_bt_sdio *btdev)
> +{
> +	const struct firmware *table;
> +	u32 chip_id;
> +	u32 adid_addr;
> +	u32 patch_addr;
> +	u8 revision;
> +	int err;
> +
> +	err =3D aic_bt_mem_read(btdev, AIC_BT_CHIP_ID_ADDR, &chip_id);
> +	if (err)
> +		return err;
> +
> +	revision =3D (chip_id >> 16) & 0x3f;
> +	if (revision !=3D AIC_BT_CHIP_REV_U02 &&
> +	    revision !=3D AIC_BT_CHIP_REV_U03) {
> +		dev_err(&btdev->func->dev,
> +			"unsupported AIC8800D80 revision %u\n", revision);
> +		return -ENODEV;
> +	}
> +
> +	err =3D request_firmware(&table, AIC_BT_FW_TABLE, &btdev->func->dev);

[Severity: High]
Can calling request_firmware() synchronously from the SDIO probe path
deadlock the bus?

The SDIO probe function aic_bt_sdio_probe() calls aic_bt_download_firmware(=
),
which initiates synchronous request_firmware() calls.

SDIO probes execute in the context of the MMC host worker thread. Blocking
the MMC host worker thread prevents the MMC subsystem from servicing other
requests.

If the requested firmware resides on a filesystem mounted via the same MMC
host, this could create an unresolvable deadlock. Even if it does not, a
missing firmware file might block the MMC bus for 60 seconds waiting for
the user-mode helper timeout.

> diff --git a/drivers/bluetooth/btaic_uart.c b/drivers/bluetooth/btaic_uar=
t.c
> --- /dev/null
> +++ b/drivers/bluetooth/btaic_uart.c
> @@ -0,0 +1,328 @@

[ ... ]

> +static size_t aic_bt_receive_buf(struct serdev_device *serdev,
> +				 const u8 *data, size_t count)
> +{
> +	struct aic_bt_uart *uart =3D serdev_device_get_drvdata(serdev);
> +
> +	uart->rx_skb =3D h4_recv_buf(&uart->hu, uart->rx_skb, data, count,
> +				   aic_bt_recv_pkts,
> +				   ARRAY_SIZE(aic_bt_recv_pkts));

[Severity: High]
Does this pass the correct pointer type to h4_recv_buf()?

The generic Bluetooth core function h4_recv_buf() requires a
struct hci_dev *hdev as its first parameter. However, aic_bt_receive_buf()
passes &uart->hu, which is a pointer to struct hci_uart.

If h4_recv_buf() encounters a framing error or an internal issue, it logs
the error using bt_dev_err(hdev, ...). Passing the incorrect struct pointer
could cause the generic core to read out-of-bounds memory when evaluating
hdev->name, potentially leading to garbage logs, memory corruption, or
kernel panics.

[ ... ]

> +static int aic_bt_open(struct hci_dev *hdev)
> +{
> +	struct aic_bt_uart *uart =3D hci_get_drvdata(hdev);
> +	unsigned int actual_speed;
> +	int err;
> +
> +	err =3D aic_bt_boot_wait(uart->boot,
> +			       msecs_to_jiffies(AIC_BT_BOOT_TIMEOUT_MS));
> +	if (err) {
> +		bt_dev_err(hdev, "Bluetooth firmware is not ready (%d)", err);
> +		return err;
> +	}
> +
> +	err =3D serdev_device_open(uart->serdev);
> +	if (err)
> +		return err;
> +
> +	actual_speed =3D serdev_device_set_baudrate(uart->serdev, AIC_BT_UART_D=
EFAULT_SPEED);
> +	if (!actual_speed) {
> +		serdev_device_close(uart->serdev);
> +		return -EIO;
> +	}

[Severity: Medium]
Does this error path leak uart->rx_skb?

In aic_bt_open(), the serdev is opened before the baudrate is set. RX data
may arrive immediately and allocate uart->rx_skb via the RX callback.

If setting the baudrate fails, the function returns -EIO and closes the
serdev, but uart->rx_skb is not freed or set to NULL on this error path.

Since the HCI core considers the device unopened on failure, close() is nev=
er
called. If the interface is subsequently brought up again, the stale rx_skb
will corrupt the next received packet sequence, and the original allocation=
 is
leaked.

[ ... ]

> +static int aic_bt_send_frame(struct hci_dev *hdev, struct sk_buff *skb)
> +{
> +	struct aic_bt_uart *uart =3D hci_get_drvdata(hdev);
> +	u8 pkt_type =3D hci_skb_pkt_type(skb);
> +	int err;
> +
> +	err =3D skb_cow_head(skb, 1);
> +	if (err)
> +		return err;

[Severity: Medium]
Should this error path free the skb?

The Bluetooth HCI core transfers ownership of the skb to the driver's
hdev->send() callback. If the driver's send callback drops the packet (even
if it returns an error), it must free the skb.

In aic_bt_send_frame(), if skb_cow_head() fails, the function returns -ENOM=
EM
but does not invoke kfree_skb(skb). Could this silently drop the reference
and create a memory leak?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1789974593.gi=
t.yanli.yang@bedmex.com?part=3D3
