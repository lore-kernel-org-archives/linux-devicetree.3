Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978D323D2A4
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 20:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781038703; cv=none; b=tXepUZ6GARSRTaXFaVrzEi9VsU5rgb/r9RG8eu+gUD7uvWH4TpN2b6un29Xk6VlHiM1kn8uMAAclV1FEThKInfeFcY23o5N/74sa4Ci6O21rXwzk0x74Csxjv6EV0nXW+gYw2ncjUI2vAild5iJl8v+WNrXHBh4nxQ8ZjiFWwIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781038703; c=relaxed/simple;
	bh=J31TDGm6HQhribw4GpA/1gSM6x5lUJvmBI3uaO43Lt8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UTs7VEYrCI83F2zDclkdxIIDkvS4yDUXfaEr8+W32BHFjArdCGOegSSQxPr4zhMEO6PaI1M6bbzo0NWCFSE/iTk6nru83xKogtdrRLq7vx4+/8A3MTvDeNxIcMrPjKmstPtltMqPFIeIWpk0EvlJJZu7SMOmfiEouU90KErwlSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TbAFWqmq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TbAFWqmq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E361F00898;
	Tue,  9 Jun 2026 20:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781038702;
	bh=8/IzX23uuIpLYDZQMSAvFZbZaDHfZvZfUl+t1PMzAPU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TbAFWqmq5jb3iSWQoo5J8WAs70A4XzjUXeXAPWaplcgQ21rgYuILJa6Kpf/sn4/Zv
	 W5BtcVt+gwYDXZUO+pnU9tG+ORaz+k6rxBPrZsMjGyHKq2v/S98Hyne1m+EXC1Uz6Z
	 /HHLeZX1r6P10FdIc4AAoDC0EGjEsqaN5tTeWWwiv9DUsjwm0NXLEukHFtFgIZ2LvZ
	 HRINs0KeTxKqpO/dRxCmMz8oztjSOq1NtDawscJPLbENruddY1VoORVDrHl1L4poQV
	 Kuxnj/ibLqCKKwOd/Paqn4IUYXWjB6rTNw2Fstt7BP+YM1U1LxHJ/+ytgblfHUEMg/
	 ghkSfaPYyAy3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/2] net: pse-pd: add Realtek/Broadcom PSE MCU
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Jelonek" <jelonek.jonas@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260608205758.1830521-3-jelonek.jonas@gmail.com>
References: <20260608205758.1830521-3-jelonek.jonas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 20:58:21 +0000
Message-Id: <20260609205822.19E361F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Unprotected data race on UART receive buffer state between asynchr=
onous RX callback and process-context TX function.
- [High] I2C transport handlers swallow explicit MCU error opcodes, causing=
 1-second stalls and masking failures.
- [High] UART receive handler returns partially consumed bytes, leaving ove=
rflow bytes in the serdev tty buffer which corrupts subsequent frames.
- [High] The advertised 60W maximum power limit for the BCM59121 chip is ph=
ysically unreachable and silently clamped to 51W.
- [Low] Use of non-existent macro `kzalloc_obj()` causes a build failure.
--

commit 99e0f1290d70d0585553ebd399054bea3d8ef281
Author: Jonas Jelonek <jelonek.jonas@gmail.com>

net: pse-pd: add Realtek/Broadcom PSE MCU driver
   =20
This commit introduces a new driver for the microcontroller fronting Realtek
and Broadcom PSE chips on PoE switches. It includes both I2C and UART
transport modules alongside a shared core to handle protocol dialects.

> diff --git a/drivers/net/pse-pd/realtek-pse-core.c b/drivers/net/pse-pd/r=
ealtek-pse-core.c
> index 0000000000000..711f85aebf5e8
> --- /dev/null
> +++ b/drivers/net/pse-pd/realtek-pse-core.c
[ ... ]
> +static const struct rtpse_chip_info bcm59121_info =3D {
> +	.device_id =3D RTPSE_DEVICE_ID_BCM59121,
> +	.max_mW_per_port =3D 60000,	/* 802.3bt Type 3 */
> +	.name =3D "BCM59121",
> +	.pw_read_lsb_mW =3D 200,
> +	.pw_set_cmd =3D RTPSE_CMD_PORT_SET_POWER_LIMIT,
> +	.pw_set_lsb_mW =3D 200,
> +};
[ ... ]
> +static int rtpse_port_set_pw_limit(struct pse_controller_dev *pcdev, int=
 id, int max_mW)
> +{
> +	const struct rtpse_opcode *type_opc, *val_opc;
> +	struct rtpse_ctrl *pse =3D to_rtpse_ctrl(pcdev);
> +	const struct rtpse_chip_info *chip =3D pse->chip;
> +	unsigned int prg_val;
> +	int ret;
> +
> +	if (max_mW < 0 || max_mW > chip->max_mW_per_port)
> +		return -ERANGE;
[ ... ]
> +	prg_val =3D min_t(unsigned int, max_mW / chip->pw_set_lsb_mW, 0xff);
> +
> +	return rtpse_port_cmd(pse, id, val_opc->op, prg_val);
> +}

[Severity: High]
Is the 60W maximum power limit for the BCM59121 chip physically unreachable
here?=20

With max_mW_per_port set to 60000 and pw_set_lsb_mW set to 200, programming
60W results in a target of 300. Since this is packed into an 8-bit command
payload, the min_t calculation clamps the value to 0xff (255).=20

This seems to silently restrict the maximum output to 51W, which could break
functionality for devices expecting the advertised power budget.

[ ... ]
> +static int rtpse_port_get_pw_limit_ranges(struct pse_controller_dev *pcd=
ev, int id,
> +					  struct pse_pw_limit_ranges *out)
> +{
> +	struct ethtool_c33_pse_pw_limit_range *range;
> +	struct rtpse_ctrl *pse =3D to_rtpse_ctrl(pcdev);
> +
> +	range =3D kzalloc_obj(*range, GFP_KERNEL);
> +	if (!range)
> +		return -ENOMEM;

[Severity: Low]
Will this code compile successfully? There does not appear to be a
kzalloc_obj() macro in the standard kernel API, which might lead to an
immediate build failure. Should this just be kzalloc() instead?

> diff --git a/drivers/net/pse-pd/realtek-pse-i2c.c b/drivers/net/pse-pd/re=
altek-pse-i2c.c
> index 0000000000000..8b9c31cbdfe99
> --- /dev/null
> +++ b/drivers/net/pse-pd/realtek-pse-i2c.c
[ ... ]
> +static int rtpse_i2c_smbus_recv(struct rtpse_ctrl *pse,
> +				const struct rtpse_mcu_msg *req,
> +				struct rtpse_mcu_msg *resp)
> +{
> +	struct i2c_client *client =3D to_i2c_client(pse->dev);
> +	int tries, ret;
> +
> +	for (tries =3D 0; tries < RTPSE_I2C_MAX_TRIES; tries++) {
> +		if (tries > 0)
> +			msleep(RTPSE_I2C_RETRY_MS);
> +
> +		/* MCU needs 0x00 as command byte for read */
> +		ret =3D i2c_smbus_read_i2c_block_data(client, 0x00,
> +						    RTPSE_MCU_MSG_SIZE,
> +						    (u8 *)resp);
> +		if (ret < 0)
> +			return ret;
> +		if (ret =3D=3D RTPSE_MCU_MSG_SIZE && resp->opcode =3D=3D req->opcode)
> +			return 0;
> +	}
> +
> +	return -ETIMEDOUT;
> +}

[Severity: High]
Do these transport loops inadvertently swallow explicit MCU error opcodes?

If the MCU returns a valid error opcode like 0xfd (request incomplete) or
0xfe (checksum error), resp->opcode won't match req->opcode.=20

Instead of returning the error so the core can translate and handle it,
the loop appears to ignore the response and continues to poll until hitting
the timeout.

Could this needlessly stall the bus for a full second on every invalid
command in both the SMBus and native I2C receive paths?

> diff --git a/drivers/net/pse-pd/realtek-pse-uart.c b/drivers/net/pse-pd/r=
ealtek-pse-uart.c
> index 0000000000000..27fa7e0c3f95e
> --- /dev/null
> +++ b/drivers/net/pse-pd/realtek-pse-uart.c
[ ... ]
> +static size_t rtpse_uart_receive(struct serdev_device *serdev,
> +				 const u8 *buf, size_t count)
> +{
> +	struct rtpse_uart *ctx =3D serdev_device_get_drvdata(serdev);
> +	size_t take;
> +
> +	take =3D min(count, sizeof(ctx->rx_buf) - ctx->rx_len);
> +	if (take =3D=3D 0)
> +		return count;  /* drop overflow bytes */
> +
> +	memcpy(ctx->rx_buf + ctx->rx_len, buf, take);
> +	ctx->rx_len +=3D take;
> +
> +	if (ctx->rx_len =3D=3D sizeof(ctx->rx_buf))
> +		complete(&ctx->rx_done);
> +
> +	return take;
> +}

[Severity: High]
Can returning take instead of count here cause framing desynchronization?

If the handler returns a value less than count, the serdev core keeps the
unconsumed bytes buffered.

When the next transaction begins, these leftover overflow bytes might
immediately push into the new buffer, permanently misaligning future
responses. Does it make sense to unconditionally return count here to drop
any overflow bytes and allow resynchronization?

[ ... ]
> +static int rtpse_uart_send(struct rtpse_ctrl *pse, const struct rtpse_mc=
u_msg *req)
> +{
> +	struct rtpse_uart *ctx =3D to_rtpse_uart(pse);
> +	int written;
> +
> +	/* clear any leftover rx state before transmitting */
> +	reinit_completion(&ctx->rx_done);
> +	ctx->rx_len =3D 0;

[Severity: High]
Is there a data race on ctx->rx_len between the receive callback and this
send function?

The serdev callback rtpse_uart_receive() modifies ctx->rx_len asynchronously
from a softirq or workqueue context. If a delayed byte arrives just as
rtpse_uart_send() locklessly resets ctx->rx_len to 0, it could corrupt the
buffer state.

The pse->mutex appears to only serialize host-initiated requests, but not
the asynchronous UART receive callback. Could this lead to dropped frames or
out-of-bounds writes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608205758.1830=
521-1-jelonek.jonas@gmail.com?part=3D2
