Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA76C3B9D8D
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786361002; cv=none; b=oibhAV+PIdORIDegICjNV5qQRGlNYWaNaxFJ9plQpRfgJm8MEGldKlWXqTnBk77rjHeBBcoD+ZhQqOG8o/wf5nMURVexwxGSMIS2dyCcJFyHK946sOboMPMsoQG2VOqzIp4v8J6KkqLApoUueZM+8Wywa5zR/25mzMItafokg2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786361002; c=relaxed/simple;
	bh=hM/e6sEw3uOVfonAsCqzvf/uHg/lVoSod78brWFS8NQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZTaj5n6DWar8ZSj6v892tZSSIU4V5Qn3fSm2z/LDN4NnpnvmS4O0+NoNB4BJl2hjYEKaDqd9PjC+MKWAm+sEcsA8u+MH/yXr02VvqRIk3JV4ZcoTnkzgR9VlZ9XHwcKr+tq9fOMq2UvJb/IWMLmUt0lTVK2b8O4NgUEAhb58/Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mAtmAIPA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mAtmAIPA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A081F000E9;
	Mon, 10 Aug 2026 11:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786361000;
	bh=7BddFMs6jbBewSYBePF4lVaf3ktEK9bPvc+eaE2UCx4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mAtmAIPAXXZtsUAgUiWfw1xZDAr0ZCq/CpWpUOBVNOJrdEEDsdyd/qN5taDVsyi+r
	 72Pi644ZEM363rCsgtn5q36SWmXYAprRDTJt+iuYwERTSMP2eeovWit9N6xvNB7EA2
	 MMM60kv6rrdIF6/8TFrxLIqQ6J1QNicVezrNvG0FPa1RFulf6D7sdIUAdSRRWAv86d
	 PQbygCAXnnNRQ8jZcEFaikdWI1R2twGuEOwaV4+zPRxUb7m5PI5lrlozwBgSKFlZD+
	 PJJHn4kVhAIfGJR9iZIBZGRuAe9+B0SZY1Bel/BDDMzj9FPhZiB3yPK3Tljzjijg7G
	 TMEOkJHGs9KDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v12 4/4] net: pse-pd: realtek-pse-mcu: add UART
 transport
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Jelonek" <jelonek.jonas@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260809112251.5797-5-jelonek.jonas@gmail.com>
References: <20260809112251.5797-1-jelonek.jonas@gmail.com>
 <20260809112251.5797-5-jelonek.jonas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 11:23:19 +0000
Message-Id: <20260810112320.38A081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The UART receive callback silently drops valid response bytes when=
 multiple frames arrive back-to-back or are coalesced, causing transaction =
timeouts and framing desynchronization.
--

--- Patch [4]: [PATCH net-next v12 4/4] net: pse-pd: realtek-pse-mcu: add U=
ART transport ---
commit 590478bd64a58c36fc17f754ed1f8e9aed82d8be
Author: Jonas Jelonek <jelonek.jonas@gmail.com>

net: pse-pd: realtek-pse-mcu: add UART transport
   =20
This commit adds the serdev (UART) transport for the Realtek PSE MCU core.
It registers the MCU as a serdev device and provides the send/recv callbacks
the core uses to exchange 12-byte frames asynchronously.

> diff --git a/drivers/net/pse-pd/realtek-pse-mcu-uart.c b/drivers/net/pse-=
pd/realtek-pse-mcu-uart.c
> new file mode 100644
> index 0000000000000..af8bd8ace00e9
> --- /dev/null
> +++ b/drivers/net/pse-pd/realtek-pse-mcu-uart.c

[ ... ]

> +static size_t rtpse_mcu_uart_receive(struct serdev_device *serdev,
> +				     const u8 *buf, size_t count)
> +{
> +	struct rtpse_mcu_uart *ctx =3D serdev_device_get_drvdata(serdev);
> +	size_t take;
> +
> +	scoped_guard(spinlock_irqsave, &ctx->rx_lock) {
> +		take =3D min(count, sizeof(ctx->rx_buf) - ctx->rx_len);
> +		if (take) {
> +			memcpy(ctx->rx_buf + ctx->rx_len, buf, take);
> +			ctx->rx_len +=3D take;
> +			if (ctx->rx_len =3D=3D sizeof(ctx->rx_buf))
> +				complete(&ctx->rx_done);
> +		}
> +	}
> +
> +	/* consume all to avoid desync/misalignment */
> +	return count;
> +}

[Severity: High]
Will this silently drop bytes if the TTY layer delivers coalesced frames?

In rtpse_mcu_uart_receive(), take is capped by the remaining space in rx_buf
(up to 12 bytes). If the MCU responds with multiple frames quickly (for
example, an INCOMPLETE frame followed immediately by a final frame), the TTY
layer might coalesce these and pass a count > 12 to this callback.

Since this function copies at most 12 bytes but unconditionally returns cou=
nt,
it tells the serdev core that all bytes were consumed. The remaining bytes
would be permanently lost.

Similarly, if a second frame arrives before the sleeping thread in
rtpse_mcu_uart_recv() wakes up to reset ctx->rx_len to 0, take will be 0,
the bytes will be ignored, but count is still returned.

Will this cause rtpse_mcu_uart_recv() to subsequently time out because the
final frame was discarded here?

[ ... ]

> +static int rtpse_mcu_uart_recv(struct rtpse_mcu_ctrl *pse,
> +			       const struct rtpse_mcu_msg *req,
> +			       struct rtpse_mcu_msg *resp)
> +{
> +	struct rtpse_mcu_uart *ctx =3D to_rtpse_mcu_uart(pse);
> +	unsigned long timeout =3D RTPSE_MCU_UART_RX_TIMEOUT;
> +	bool final;
> +
> +	/* Wait past a non-final frame (transient NOT_READY / stale) within bud=
get. */
> +	do {
> +		timeout =3D wait_for_completion_timeout(&ctx->rx_done, timeout);
> +		if (!timeout)
> +			return -ETIMEDOUT;
> +
> +		scoped_guard(spinlock_irqsave, &ctx->rx_lock) {
> +			if (ctx->rx_len !=3D sizeof(*resp))
> +				return -EIO;
> +
> +			memcpy(resp, ctx->rx_buf, sizeof(*resp));
> +			final =3D rtpse_mcu_resp_is_final(req, resp);
> +			if (!final) {
> +				reinit_completion(&ctx->rx_done);
> +				ctx->rx_len =3D 0;
> +			}
> +		}
> +	} while (!final);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260809112251.5797=
-1-jelonek.jonas@gmail.com?part=3D4
