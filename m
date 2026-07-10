Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F0F37F721
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 19:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783712522; cv=none; b=K+FLiE6verUOhHZSmKdQwQ1CxNJXIsLtj65hluaYCKL53aEcpdGngAhKy7eVC+HUpHeIY0JC3nOcIHn/enZk/URrvuf+WZY1hS3OMU7E8pQFhZTTztJxWhreKjdFOYm6eSnKqAEneQZ1c3Nt4rIlxkRA5KIkSRRiSIpnmxsmflg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783712522; c=relaxed/simple;
	bh=p03CTaIAzGuooBrFG7PwpnBqLifJk1r+l9TGBOs/we0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xvk/9dJ11xJuZMeNbUG8RFNDOic8GaXswGLvm0ElcwMUAxbOBTpgBjx4Yv919idTFdxoRBg5ZjIwwX+c3lRm+PS+ZwaZWXuVX3AndZFgqxTgrHukZQ20D1Af8w3BCDru82pX/5kt7tHHvGqXXOKoOZWvn2+uaptaNFEB0P6qbqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zdi3O8E/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zdi3O8E/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690FB1F000E9;
	Fri, 10 Jul 2026 19:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783712520;
	bh=MsD02Sq6B1SaCjDADYsquYcxRCeDZDdLbWHwhyli67w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zdi3O8E/Jtdd06yOWTUnb6L15vMUc4bA0y6GtJ7h0axRmYd6J2YcDC0cuyLq0eV4m
	 Z+B4wkm2mISb4M5tKA4tFh6Fzl9pIAqu9Mfe62yojDc/N9OdDSRjCKtj6spBL8xCKp
	 lc2bazrNYGQrsCl6klZ6GC3JRpYyCCxZ0qpKDDboci54Ip+cDD/ft/fqcHskk+l4is
	 RVzTU/ufXYarC9w/TI6rDCBm+6DMUkGmUYFT6B4GnjgaZwJcfXi/UezhHCS0ZlykLg
	 Yx/iGZmLcLD/u/JQp7eQUsjrcOXFpaw5tSetoBEg3TrMPatWaU+O53/YBi4B3Jn4cj
	 7sP2m4GZiOgRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 4/4] net: pse-pd: realtek-pse-mcu: add UART
 transport
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Jelonek" <jelonek.jonas@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709194125.2784507-5-jelonek.jonas@gmail.com>
References: <20260709194125.2784507-1-jelonek.jonas@gmail.com>
 <20260709194125.2784507-5-jelonek.jonas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 19:41:59 +0000
Message-Id: <20260710194200.690FB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Delayed MCU responses can silently desynchronize the UART protoc=
ol and cause the driver to accept stale data for new requests, leading to s=
ilent data corruption (e.g., reporting incorrect port status).
--

--- Patch [4]: [PATCH net-next v6 4/4] net: pse-pd: realtek-pse-mcu: add UA=
RT transport ---
commit 4b8238c08610aa670e6bef20fc86bbd99d379d19
Author: Jonas Jelonek <jelonek.jonas@gmail.com>

net: pse-pd: realtek-pse-mcu: add UART transport

This commit adds a serdev (UART) transport for the Realtek PSE MCU core.
It registers the MCU as a serdev device and provides send/receive
callbacks to exchange 12-byte frames asynchronously.

> diff --git a/drivers/net/pse-pd/realtek-pse-mcu-uart.c b/drivers/net/pse-=
pd/realtek-pse-mcu-uart.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/net/pse-pd/realtek-pse-mcu-uart.c

[ ... ]

> +static int rtpse_mcu_uart_send(struct rtpse_mcu_ctrl *pse, const struct =
rtpse_mcu_msg *req)
> +{
> +	struct rtpse_mcu_uart *ctx =3D to_rtpse_mcu_uart(pse);
> +	int written;
> +
> +	/* clear any leftover rx state before transmitting */
> +	scoped_guard(spinlock_irqsave, &ctx->rx_lock) {
> +		reinit_completion(&ctx->rx_done);
> +		ctx->rx_len =3D 0;
> +	}

[Severity: Medium]
Can a delayed MCU response silently desynchronize the UART protocol here and
cause the driver to accept stale data for new requests?

If a previous request takes longer than RTPSE_MCU_UART_RX_TIMEOUT, it times
out and the operation fails. When the next request is sent, this block
clears ctx->rx_len.

If the delayed 12-byte response from the first request then arrives, it
will fill the newly cleared rx_buf and complete the receive wait. Because
the core driver hardcodes seq_num to 0xff for all messages:

drivers/net/pse-pd/realtek-pse-mcu-core.c:rtpse_mcu_msg_init() {
        memset(msg, 0xff, sizeof(*msg));
        msg->opcode =3D opcode;
}

it cannot distinguish the stale response from the new one if the opcodes
match. Would it be safer to flush the serdev buffers before transmitting,
or to implement a rolling sequence number in the core to prevent silent
data corruption?

> +
> +	written =3D serdev_device_write(ctx->serdev, (const u8 *)req, sizeof(*r=
eq),
> +				      RTPSE_MCU_UART_TX_TIMEOUT);
> +	if (written < 0)
> +		return written;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709194125.2784=
507-1-jelonek.jonas@gmail.com?part=3D4
