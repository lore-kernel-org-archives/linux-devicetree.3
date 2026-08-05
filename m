Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31E13DAAA6
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 10:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785925464; cv=none; b=ArtsDFz8+qAF06e2ki520C1OQRGnrkwNQEDi1m3QfPQqoxZ4jWaCEDc5S/bXm/8QCPXhb+uFVZ0Q/tVuo76SEwTlwot1Bu2r7tGF0LsZL6Ttogzo4uTeXmqyL1he6DmGrpOBzIOukIkAkNrWxfkkrHqjUps7dmW7NYsuV8jf5Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785925464; c=relaxed/simple;
	bh=zYjCzqEd4rYBCTqQrqGCnhqmw5bSJNZTtXwQt82CwK4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u43EI8t6zrOOBBwBSGpyY2ZREplfWCUljfayo8pjiFB4eR4Wp33gegwsnrJNCCfMmgBpwPeBnm1/IPq3nROTZpc3ufOdxLB0h62LoA7JemI23lpxzorS8ISbsTfAeKQ9ytHAb3YSgpcPi8TFiUpDVAt/d+C+XG6MWAyTh4FZDcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNAr8Sjp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNAr8Sjp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FADC1F000E9;
	Wed,  5 Aug 2026 10:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785925462;
	bh=nKIrMI+PiO+rCfLKYDcB1AOrXo3KHYo7040R8yEw3Zg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mNAr8SjpbSOG25iChUSgQ6f1BFihAwVCJNWJ5Irf8ckuu1c6roijRnL8lsk5Tg6vc
	 OlN+hIxq96DGQPaG2xNDF+fOUJMAyC2aNHDiR74SW47/0/NcQ8xd87Rk0Kv/eDMU9F
	 lv09ct7UqOEywsuEAuQjKZVrJbmgeKXYbpFSvLsROTDTbuPKOBHRAHF9QVuTI5ydkj
	 Nd3WOa1JQOjHYdAwGaki3JOC04RMdo744yJ26/sQQPg6Fa/s9V+UrVS9a4rb21aEYA
	 pamhf088oLLnQrsgUWXr/klXWU3euuxTmSN8k19kNne4fDPndfULa9bimU6pDP0RrT
	 v5K/hU1ibkB+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/6] spmi: apple: Implement remaining commands
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260805-t603x-spmi-v4-4-c15a12d9a7d1@chaosmail.tech>
References: <20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech>
 <20260805-t603x-spmi-v4-4-c15a12d9a7d1@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 10:24:21 +0000
Message-Id: <20260805102422.5FADC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Endianness portability bug causing data corruption on big-endian a=
rchitectures due to `memcpy` and `writel()` interaction.

Pre-existing issues:
- [High] Missing lock around SPMI bus transactions allows concurrent operat=
ions to interleave, corrupting hardware state.
--

--- Patch [4]: [PATCH v4 4/6] spmi: apple: Implement remaining commands ---
commit 3757bcbae2fce4b6f6a6ec4bc0492ce9325dcd8c
Author: Alba Mendez <me@alba.sh>

spmi: apple: Implement remaining commands

Add support for zero write and power management commands

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index 7ebf899edf173..49827e51e93e9 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
> @@ -69,14 +69,14 @@ static int apple_spmi_wait_rx_not_empty(struct spmi_c=
ontroller *ctrl)
>  	return 0;
>  }
> =20
> -static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
> -			 u16 saddr, u8 *buf, size_t len)
> +static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
> +			 u16 param, const u8 *buf, size_t len, u8 *ibuf, size_t ilen)

[Severity: High]
This is a pre-existing issue, but is there a missing lock around the SPMI
bus transactions here?

The SPMI subsystem core does not serialize calls to controller read/write
functions. Without a mutex protecting this transaction sequence, concurrent
requests can interleave their writes to the shared command register,
poll operations, and reads from the response FIFO.

Additionally, the unprotected shared flag spmi->prev_fail introduces a race
condition where one thread's failure can cause another thread to
unexpectedly flush the controller's FIFO mid-transaction.

>  {
>  	struct apple_spmi *spmi =3D spmi_controller_get_drvdata(ctrl);
> -	u32 spmi_cmd =3D apple_spmi_pack_cmd(opc, sid, saddr, len);
> +	u32 spmi_cmd =3D apple_spmi_pack_cmd(opc, sid, param);
>  	u32 reply, rsp;
>  	size_t len_read =3D 0;
> -	u8 i;
> +	size_t i =3D 0, j;
>  	int ret;
> =20
>  	if (spmi->prev_fail) {

[ ... ]

> @@ -86,6 +86,14 @@ static int spmi_read_cmd(struct spmi_controller *ctrl,=
 u8 opc, u8 sid,
> =20
>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
> =20
> +	while (i < len) {
> +		j =3D min_t(size_t, sizeof(spmi_cmd), len - i);
> +		spmi_cmd =3D 0;
> +		memcpy(&spmi_cmd, buf + i, j);
> +		writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);

[Severity: High]
Will this byte stream copy cause an endianness bug on big-endian
architectures?

Using memcpy to copy the byte stream into a local u32 spmi_cmd
variable and then calling writel() will result in byteswapping on
big-endian systems.

The memcpy call places the first byte of buf into the most significant
byte of the u32, and writel() performs a CPU-to-LE conversion.

This reverses the byte order sent to the hardware compared to the previous
bitwise-shift implementation, which was correctly endian-safe. Should this
use writesl() or continue using the previous shift-based packing?

> +		i +=3D j;
> +	}
> +
>  	ret =3D apple_spmi_wait_rx_not_empty(ctrl);
>  	if (ret)
>  		return ret;
> @@ -93,7 +101,7 @@ static int spmi_read_cmd(struct spmi_controller *ctrl,=
 u8 opc, u8 sid,
>  	reply =3D readl(spmi->regs + SPMI_RSP_REG);
> =20
>  	/* Read SPMI data reply */
> -	while (len_read < len) {
> +	while (len_read < ilen) {
>  		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
>  			spmi->prev_fail =3D true;
>  			dev_err_ratelimited(&ctrl->dev,
> @@ -101,11 +109,9 @@ static int spmi_read_cmd(struct spmi_controller *ctr=
l, u8 opc, u8 sid,
>  			return -EIO;
>  		}
>  		rsp =3D readl(spmi->regs + SPMI_RSP_REG);
> -		i =3D 0;
> -		while ((len_read < len) && (i < 4)) {
> -			buf[len_read++] =3D ((0xff << (8 * i)) & rsp) >> (8 * i);
> -			i +=3D 1;
> -		}
> +		i =3D min_t(size_t, sizeof(spmi_cmd), ilen - len_read);
> +		memcpy(ibuf + len_read, &rsp, i);

[Severity: High]
Does unpacking the readl() result via memcpy introduce the same
endianness reversal on big-endian systems?

Since rsp is read via readl(), copying it directly to the buffer with
memcpy will reverse the byte order.

> +		len_read +=3D i;
>  	}
> =20
>  	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-t603x-spmi=
-v4-0-c15a12d9a7d1@chaosmail.tech?part=3D4
