Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52770411F92
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 13:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785764054; cv=none; b=fVwkouJCbfoNfYReD3/Y/hrxlJNDDaJIl3VFHTBOZBku5t2oPCqNKkt+W9/ohpAMH0SnM/yIlHAKjguRCWbPvzLO0ZazSjxqX0Zwi7SEQ149IqBB/qtEmqi2bYbF+hfQePo0TehRdCNk3k8mI4tOb14YMPhFOESKWVR2spF19MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785764054; c=relaxed/simple;
	bh=1GCCh9Rhuj9YT6EIaAlyNeSq0XtZkhoJuenhMEgUce0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A5GD4vUe1TpSv6dvXeZQIY9a5pOtGijM2q8NigcXDx2KuGR+tkkGEI+o90mgKy0hD9mdkVADYg3KhUbDfSzAKiugTxxBDCffcuXcIJkg2uEvSUe4c+4A5FwKsdo63OI1kKh8MXwqf1URKaAOu5Lae6ZHdwUFmV28J4Rl4lQYK0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eAdikwXw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eAdikwXw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6DD1F000E9;
	Mon,  3 Aug 2026 13:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785764051;
	bh=8Oqrrp1jnAx3yl1OhgHR6Di5yXiAbcRUusY5WjfSrQY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eAdikwXwdlmGa0qZsi8IrkaMzI7WcvkENmOA0ru4+WUYlMCruaUivN4ZZibcDsSCV
	 gduvO1YsJwFnXhsP+MA2Plkk6BPkodRAOL7dxvzmfp0HQjnC+jXefRJPzlCSj+Y+wT
	 PesCrIrTwLuiZ1Pvj324GehdgRhkCFYseAFF+YZjzsUkGQNgGQ2C0U1gD48slUSD+j
	 YGUq+P09Y9Ur9SL8eEAiTBfwOngx0Ade5Wj4qabh/8lCsHdIz0/fRZSvGQsOCsF9VJ
	 KAe/6S79VvFnpYSXbaWS7emCMcZ4u2i45UdXC9v3o+x39ym+itrFsHZKwQORHKM2od
	 rao6amm6CHj+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/6] spmi: apple: Implement remaining commands
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260803-t603x-spmi-v3-4-c17b506d91a1@chaosmail.tech>
References: <20260803-t603x-spmi-v3-0-c17b506d91a1@chaosmail.tech>
 <20260803-t603x-spmi-v3-4-c17b506d91a1@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 13:34:09 +0000
Message-Id: <20260803133410.EE6DD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Integer underflow in SPMI read loop size calculation causes an=
 out-of-bounds write (buffer overflow).
- [Medium] Using `memcpy()` combined with `writel()`/`readl()` to pack/unpa=
ck stream data breaks big-endian compatibility and causes data corruption.
--

--- Patch [4]: [PATCH v3 4/6] spmi: apple: Implement remaining commands ---
commit 92726351469b11b82f4d483115faf989e21b09b0
Author: Alba Mendez <me@alba.sh>

spmi: apple: Implement remaining commands

This commit adds support for zero write and power management commands to the
Apple SPMI controller. It also refactors the command transmission logic into
shared raw command helper functions for both read and write paths.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c

[ ... ]

> @@ -77,18 +77,26 @@ static void flush_extra_data(struct spmi_controller *=
ctrl)
> -static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
> -			 u16 saddr, u8 *buf, size_t len)
> +static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
> +			 u16 param, const u8 *buf, size_t len, u8 *ibuf, size_t ilen)
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
>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
> =20
> +	while (i < len) {
> +		j =3D min_t(size_t, sizeof(spmi_cmd), len - i);
> +		spmi_cmd =3D 0;
> +		memcpy(&spmi_cmd, buf + i, j);
> +		writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);

[Severity: Medium]
Will this sequence cause data corruption on big-endian architectures?

By using memcpy() to copy the byte buffer directly into a u32 variable, and
then passing that variable to writel(), the implicit CPU-to-little-endian
byteswap in writel() will reverse the byte order on the bus.

The previous code avoided this by packing the integer using manual bit shif=
ts,
which preserves the byte layout regardless of CPU endianness.

> +		i +=3D j;
> +	}
> +
>  	ret =3D apple_spmi_wait_rx_not_empty(ctrl);

[ ... ]

> -	while (len_read < len) {
> +	while (len_read < ilen) {
>  		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
> -			dev_err_ratelimited(&ctrl->dev,
> -					    "FIFO lacks reply data, controller stuck?\n");
> +			dev_err(&ctrl->dev, "FIFO lacks reply data, controller stuck?\n");
>  			return -EIO;
>  		}
>  		rsp =3D readl(spmi->regs + SPMI_RSP_REG);
> -		i =3D 0;
> -		while ((len_read < len) && (i < 4)) {
> -			buf[len_read++] =3D ((0xff << (8 * i)) & rsp) >> (8 * i);
> -			i +=3D 1;
> -		}
> +		i =3D min_t(size_t, sizeof(spmi_cmd), len_read - ilen);
> +		memcpy(ibuf + len_read, &rsp, i);

[Severity: Critical]
Does this length calculation underflow and cause an out-of-bounds write?

Since len_read starts at 0 and the loop condition ensures it is strictly le=
ss
than ilen, the subtraction of len_read - ilen will mathematically yield a
negative number. When evaluated as an unsigned size_t, this underflows to a
massive positive number.

Because of this underflow, min_t() will always select sizeof(spmi_cmd), whi=
ch
is 4. If a caller requests a read smaller than 4 bytes, memcpy() will
unconditionally write 4 bytes and overflow the destination buffer. Should t=
his
calculation be ilen - len_read instead?

[Severity: Medium]
Similar to the write path above, does unpacking the result of readl() using
memcpy() introduce an endianness issue?

readl() performs an implicit little-endian-to-CPU byteswap, which is then
copied sequentially into the byte buffer, potentially scrambling the payload
on big-endian systems.

> +		len_read +=3D i;
>  	}
> =20
>  	flush_extra_data(ctrl);
> =20
> -	if (~FIELD_GET(SPMI_REPLY_FRAME_PARITY_STATUS, reply) & ((1 << len) - 1=
)) {
> +	if (!ilen && !FIELD_GET(SPMI_REPLY_ACK, reply)) {
> +		dev_err(&ctrl->dev, "command not acknowledged\n");
> +		return -EIO;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-t603x-spmi=
-v3-0-c17b506d91a1@chaosmail.tech?part=3D4
