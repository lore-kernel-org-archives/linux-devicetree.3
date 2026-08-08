Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C482D2488
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 11:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786189304; cv=none; b=qP+N0M/2qhTm+anUKnztWaw2UXs+XT52MmNTStl2Nby8ADRoGixsa6fFBEqbpYgG3yl2nWjds60Rzbd8OG7TFnD8zwSjKIYJmAXIQI89QMU3LSs1n/dcEp+nFu1ZoRo6AYl8nFf45vGmMFhRXvj08Y/I4i7gTCp3OHc5HygiZkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786189304; c=relaxed/simple;
	bh=l7R+Ky5y2zS9XLBqGSFiA89WNfXiy3IxYWsROQYuvfg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LLSiE2IoVqQSW2kmhswYHl2xFlOk8JEkOA7C1RNZndnFW//ofWEmN4TrNBv/ovr4nz8My3hyK22GZPAbrE9azzJwHFHguENSz+6JmdsqgzimQ2ehwmUL6XsCsuXdA79Chl35n9pvTLb6NCZZgDIaaEbKPJrrfylmRTEDcSPNVJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g/IOmKbh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g/IOmKbh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC541F000E9;
	Sat,  8 Aug 2026 11:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786189303;
	bh=pakleQQz7/aTqFxH16Fl4w4LdW4pNo+BhCiwC8nEk9o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g/IOmKbhWQKGz8yu3Uo84ELSf2JN0r5dEw1npGEtAoS8IeVzzxnWnt6GzLFKyy25z
	 LWmMjylO0Zd3DXLiZNKKHoAYJC93RFw4sOo4pozzgi1hkcAslaVU4yNkrm4utygj+T
	 q5F95mThgUmytWol/0LolgUmS8RLNftRHs3pChcsdBIVfy+0JBHm2C2VNZm2de62zN
	 zpEOjegFYnLFhgoyNaj6a/WsXoYZHB3VZANeSjn473/Zq1yAEhjVWBowEni3gBUgKi
	 t3wU81XT9BO2l13AR/Zua9gv2eTd7vneOiiS0cpbC9UsTziT4BHac26dAmu9z3bpyD
	 BIipTI46JRZOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/6] spmi: apple: Implement remaining commands
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260808-t603x-spmi-v5-4-553c5ac2f137@chaosmail.tech>
References: <20260808-t603x-spmi-v5-0-553c5ac2f137@chaosmail.tech>
 <20260808-t603x-spmi-v5-4-553c5ac2f137@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 11:41:42 +0000
Message-Id: <20260808114142.DFC541F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Using `memcpy()` to pack/unpack byte streams into a 32-bit integer=
 variable combined with `writel()`/`readl()` causes byte-swapping data corr=
uption on big-endian architectures.
--

--- Patch [4]: [PATCH v5 4/6] spmi: apple: Implement remaining commands ---
commit 133f8b2358af9160fedbf5fcf84ef152c33022e4
Author: Alba Mendez <me@alba.sh>
   =20
spmi: apple: Implement remaining commands
   =20
This patch adds support for zero write and power management commands to the
Apple SPMI controller driver. It achieves this by introducing a unified
spmi_raw_cmd function for executing SPMI transactions.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
[ ... ]
> -static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
> -			 u16 saddr, u8 *buf, size_t len)
> +static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid, u1=
6 param,
> +			const u8 *buf_wr, size_t len_wr, u8 *buf_rd, size_t len_rd)
>  {
[ ... ]
> +	while (i < len_wr) {
> +		j =3D min_t(size_t, sizeof(spmi_cmd), len_wr - i);
> +		spmi_cmd =3D 0;
> +		memcpy(&spmi_cmd, buf_wr + i, j);
> +		writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
> +		i +=3D j;
> +	}

[Severity: High]
Will this sequence cause byte-swapping data corruption on big-endian
architectures?

When len_wr is greater than zero, memcpy copies the byte stream into the
u32 spmi_cmd. On big-endian systems, memcpy places the first byte in the
most-significant byte position.

writel then performs CPU-to-LE conversion (byte-swapping), which causes
the hardware to receive the bytes in reverse order.

[ ... ]
>  		rsp =3D readl(spmi->regs + SPMI_RSP_REG);
> -		i =3D 0;
> -		while ((len_read < len) && (i < 4)) {
> -			buf[len_read++] =3D ((0xff << (8 * i)) & rsp) >> (8 * i);
> -			i +=3D 1;
> -		}
> +		j =3D min_t(size_t, sizeof(spmi_cmd), len_rd - i);
> +		memcpy(buf_rd + i, &rsp, j);
> +		i +=3D j;
>  	}

[Severity: High]
Does the read path in spmi_raw_cmd suffer from the exact inverse problem?

readl will byte-swap the incoming data on big-endian hosts, and memcpy
will then save it into buf_rd in reverse order.

While Apple SoCs are primarily little-endian, Linux drivers are expected to
be endian-portable. Would it be better to use stream accessors like writesl
and readsl, or manually pack the bytes using shifts (as the original read
code did) to ensure consistent behavior across architectures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808-t603x-spmi=
-v5-0-553c5ac2f137@chaosmail.tech?part=3D4
