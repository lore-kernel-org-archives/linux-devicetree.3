Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BB335675E
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 09:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787910499; cv=none; b=QfK3CC8hLt+zxj6xJVMqsy5je3TyfljFeSxwxyetFCWAEHZeEAM2Wr+kgeNDm/zZPQqwi3/IOM7tVIIOct2fbLVvxQBErz2f4BaJPJnpIPm6OvVIA3aPcJKp2akxlDVjOCE8iLkD8uDWRqayKi2/QbE9F/VwdD9w8aGQEnLcD7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787910499; c=relaxed/simple;
	bh=cx7GFvuw4NY9Okx9HDCJiK/T3k1jCDDbclXC+5Cuol4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dUckaOfr2EB83/sOPdliH2NSdfvFM2tbusU0WOaeDds9+a1dAiAQGD7za/IzeWagUmzpSQHlBG4P1ldfnyESU7jDdql4K2xzyHT6g7unzyYAyoHuHook82iJRY5G+wVau84WFW5WLM/WnH8q6qpTw0UPgBTNkHV4myGLdnxoa2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BNZ3KsYd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BNZ3KsYd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A401C1F000E9;
	Fri, 28 Aug 2026 09:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787910497;
	bh=+grCGbuff0kTstGcoiZoi/Hn3pxdnRxUvzuRvKRHvxg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BNZ3KsYdajWtiBG4F1UgmHqP9vLlQSdl1CYR+EeUCI2DaeibHk8JFrJsvx8heu00n
	 Z/OykJNXC3EMWFx1zi8UO7518hVV2jwuLQBTmLopuHw4PDXICLlQ8p9f+qVX025+PV
	 MTNLly1+Ei6nsBHdgj5YTB3rgTTUOD1ecx/XDeFTW3aOgRF85p3ALSXKEDUtxDLzmJ
	 6pSF7fzbPQ21l0Aq1R0vGYLNxt/i9Iwd8+zKS26/H9aAH+1NDjazcgBhPuv09zCpf7
	 HxdgVnlBRBaVwC9yoj0Oj+rg93+mi3uCueo89+L1jD7SbV9kkEfuETJq3aq6R8sgLC
	 QRaGonsRPIFTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/6] spmi: apple: Implement remaining commands
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260828-t603x-spmi-v8-4-708d4d12e0fd@chaosmail.tech>
References: <20260828-t603x-spmi-v8-0-708d4d12e0fd@chaosmail.tech>
 <20260828-t603x-spmi-v8-4-708d4d12e0fd@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 09:48:17 +0000
Message-Id: <20260828094817.A401C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The driver introduces a severe endianness bug by replacing explici=
t bitwise packing/unpacking with `memcpy()` into `u32` variables combined w=
ith `writel()`/`readl()` for I/O access. This violates I/O accessor rules f=
or FIFOs and reverses the payload byte order on big-endian architectures, c=
ausing data corruption.
--

commit 27913f3e899931b97f0177dcfa7c3281dd970a85
Author: Alba Mendez <me@alba.sh>

spmi: apple: Implement remaining commands

This commit adds support for zero write and power management commands to the
Apple SPMI controller.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index b1c127cf5f441..9843dc871d6c7 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
> @@ -86,6 +85,14 @@ static int spmi_read_cmd(struct spmi_controller *ctrl,=
 u8 opc, u8 sid,
> =20
>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
> =20
> +	while (i < len_wr) {
> +		j =3D min_t(size_t, sizeof(spmi_cmd), len_wr - i);
> +		spmi_cmd =3D 0;
> +		memcpy(&spmi_cmd, buf_wr + i, j);
> +		writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);

[Severity: High]
Does this combination of memcpy() into a u32 and writel() reverse the paylo=
ad
byte order on big-endian architectures?

Since writel() byteswaps to little-endian on big-endian systems, copying the
buffer bytes linearly into the u32 variable beforehand will place the first
byte at the most significant position. This seems like it could corrupt the
payload by reversing the byte order on the bus.=20

According to the io-accessors subsystem rules, FIFO/stream interfaces should
typically avoid byteswapping.

> +		i +=3D j;
> +	}
> +
>  	ret =3D apple_spmi_wait_rx_not_empty(ctrl);

[ ... ]

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
> +		j =3D min_t(size_t, sizeof(spmi_cmd), len_rd - i);
> +		memcpy(buf_rd + i, &rsp, j);

[Severity: High]
Can this also corrupt the incoming stream on big-endian systems?

Using readl() byteswaps the incoming register value, and then extracting it
via memcpy() into the buffer will place partial bytes at the wrong offset.
This replaces the previous explicit bitwise unpacking that handled endianne=
ss
safely.

> +		i +=3D j;
>  	}
> =20
>  	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-t603x-spmi=
-v8-0-708d4d12e0fd@chaosmail.tech?part=3D4
