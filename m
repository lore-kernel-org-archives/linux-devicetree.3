Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB972571A9
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785156295; cv=none; b=DuGu8iPLQLLUh7xf0nJ2CTtQz4+kBkY3h2CDCAmxb/oXD1hipd+alm5ODQqMhEn3OvfiHDJDAiWiLcbOL7cCs9iTZsrBWP2P/fNDTQdItABZ4Sweg7dx8paiv1aBlLDtXAfokCQhJ734Rq0/CnEmPbYGfbaZipaWayp7qJrVQBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785156295; c=relaxed/simple;
	bh=oYPah6VumfizMLWN0/O6aAduXT2liCqgHwGu7UegcVA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c56f2Ax0eQD2OLjGyzdTTZC1yHFN0flvejCbFrTWR9KtO4xpFgebuOVhgkaYsvSz11tQLSOMGBSS2r98mxWu716fngwhrZhLUenp1dFFW9WOHZK+EUQyAbjO4PAmbo3Cs/pzJWr5Vpwr8lDaBJP4CLwY0XaYfAHMJ6EQlCs+7ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMnRywZg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMnRywZg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F3E1F000E9;
	Mon, 27 Jul 2026 12:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785156294;
	bh=y1U797azAWIdaDngU5a+XbR878BfyV7X54xHCwbgYKA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YMnRywZgq3B5KTg1yaSXpX7bmoUcIFLlmf6CHlQNrbTLjSKG0Cn5DOV43e/Qyb1zU
	 xYsSkSotcYe9apuToC7LfXMWyNaJpvoKtLDCwA1NS4XoYrI0KOzzW5WQL6oJwlsbxv
	 m59ZnZVGwT6BvGaxm3Iv1dPqTMMgnAczKweokBZlSRWJRa25x39QmWBUYhMEWOzZSl
	 YlkBLWguZ5aAbvB8wj29Jo1QqOgXZg4niJqHYjxVafDv5gMQ4sJDQoq4LKDUbXHd8z
	 dTG85r/VplcyZ2YjYJ8zpSv28MZ9zPHb2K9DUpb71yaW9GW0dVUQ1OP7+6vamER/re
	 NV8O1I1vmD5Dg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/16] nvmem: microchip-otpc: nvmem: microchip-otpc:
 add tag-based packet lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260727122633.117435-9-varshini.rajendran@microchip.com>
References: <20260727122633.117435-1-varshini.rajendran@microchip.com>
 <20260727122633.117435-9-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 12:44:53 +0000
Message-Id: <20260727124454.40F3E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing mutual exclusion to protect the multi-step hardware read s=
equence leads to race conditions and hardware state corruption.
- [High] Unconditional 32-bit writes can overflow unaligned destination buf=
fers when the requested read size is not a multiple of 4.
--

--- Patch [8]: [PATCH v4 08/16] nvmem: microchip-otpc: nvmem: microchip-otp=
c: add tag-based packet lookup ---
commit 9730ed34d324f2aa5db4e67574aa110d572f9120
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

nvmem: microchip-otpc: nvmem: microchip-otpc: add tag-based packet lookup

This commit adds support for accessing OTP packets by their tag (FourCC)
while preserving backward compatibility with ID-based lookup. The driver
resolves offsets matching valid legacy selectors through ID lookup, falling
back to tag lookup for other valid values.

> diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otp=
c.c
> index df979e8549fdb..a17f82afdc37d 100644
> --- a/drivers/nvmem/microchip-otpc.c
> +++ b/drivers/nvmem/microchip-otpc.c
[ ... ]
> @@ -154,12 +225,11 @@ static int mchp_otpc_read(void *priv, unsigned int =
off, void *val,
>  	int ret, payload_size;
> =20
>  	/*
> -	 * We reach this point with off being multiple of stride =3D 4 to
> -	 * be able to cross the subsystem. Inside the driver we use continuous
> -	 * unsigned integer numbers for packet id, thus divide off by 4
> -	 * before passing it to mchp_otpc_id_to_packet().
> +	 * From this point the offset has to be translated into the actual
> +	 * packet. For this we traverse the table of contents stored in a list
> +	 * "packet" based on the access type - packet id or tag.
>  	 */
> -	packet =3D mchp_otpc_id_to_packet(otpc, off / 4);
> +	packet =3D mchp_otpc_resolve_packet(otpc, off);

[Severity: High]
This isn't a bug introduced by this patch, but I wanted to ask about the
thread safety of mchp_otpc_read() and mchp_otpc_prepare_read().=20

If multiple kernel consumers or userspace via sysfs (like a pread on=20
/sys/bus/nvmem/devices/*/nvmem) read from this device concurrently,
couldn't they clobber the shared hardware state machine registers
(MR, CR, SR, etc)?

Since the NVMEM core does not serialize reg_read callbacks unless keepouts
are defined, and this driver doesn't use regmap, does this driver need its
own mutex to protect the multi-step hardware read sequence?

>  	if (!packet)
>  		return -EINVAL;
>  	offset =3D packet->offset;

[Severity: High]
This is also a pre-existing issue, but looking further down in
mchp_otpc_read() at the payload reading loop:

	do {
		*buf++ =3D readl_relaxed(otpc->base + MCHP_OTPC_DR);
		len +=3D sizeof(*buf);
		offset++;
		payload_size--;
	} while (payload_size >=3D 0 && len < bytes);

Could this unconditionally write past the end of the destination buffer if a
caller invokes nvmem_device_read() with an unaligned size?

The loop always writes 4 bytes at a time into *buf. If bytes is not a
multiple of 4 (e.g. bytes =3D 5 or 6), it looks like the final write will
overflow the allocated buffer bounds since the loop condition (len < bytes)
is only checked after the write occurs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727122633.1174=
35-1-varshini.rajendran@microchip.com?part=3D8
