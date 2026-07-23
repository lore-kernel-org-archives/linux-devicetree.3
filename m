Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9FE470104
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 11:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784806899; cv=none; b=betoXtx9ExO1e3mab6X7Lovv7z3vXfocXtZoxVzvOam4HJbp9aynbD2edQXjC+s2M5Bf3zJyzEb8ju7P+xnh4TJyMwkcTcJ2GZJnF8ANiu3YoL+95m6vGNLbkaDlNt0b/BPygiRtQVPWKo+SrKgH7XKw1Tsws6s8fu+Zo0XKkfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784806899; c=relaxed/simple;
	bh=+CQX+JKfeKJLrNTH93rPeu72dnKyjqfC+yruklJGiyM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kMjvbmGd9f0IHejHWPx9qOThBGVYKCVU1kCLozXNnaf0HGz8BeVMlJVoegArTZnjbhlQV7vPNq6J6SSnTH6y0eToK5zdR6J+exWXtFRF40+U/2Ym88Mr9uFFkxhZXthrC84L/tcmzTycdh4j8GLDYQrd0Ur9raRjz1tSEvdAefk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lvIq6tMo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lvIq6tMo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E149A1F000E9;
	Thu, 23 Jul 2026 11:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784806897;
	bh=6DUBalBmaSYvBb+h+JYdPGthkyr76Xr8UcbLSfhmtTs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lvIq6tMofq2Yuu+5pCQtV2+lmiCEsaP+fJOOUviNunjOn/fVr+O2hWEmshKthOVnD
	 /F19R5x/pBvI7pkbo9dYDfjn3WR0OSh03Stxwc845upw+TXsByefrDaAPLlrH+RssA
	 vTkr8o0JpV5wM+H6YuK6eCj79bzIRLZlsJ1j+7vg3V4hA6EWs/P721Jr6oePp091Pu
	 2EK/YZ9cmwwsPcynazJWwVxwZPuZdVKI7OqUZulThLe0RSLSNvMI+0AEAw9gIMBLhr
	 DHiB14I0sz/CtTO5MoexeKMwT/XmCGvwGDvSF0bAKxfJTdlW06e6Y+PKYfY7NP+qMp
	 j1yhyx7CA2aaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 10/17] spi: cadence-quadspi: refactor direct read
 path for PHY support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, "Pratyush
 Yadav" <pratyush@kernel.org>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Michael Walle" <mwalle@kernel.org>, "Richard
 Weinberger" <richard@nod.at>
In-Reply-To: <20260723110219.3180747-11-s-k6@ti.com>
References: <20260723110219.3180747-1-s-k6@ti.com>
 <20260723110219.3180747-11-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 11:41:36 +0000
Message-Id: <20260723114136.E149A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] cqspi_memcpy_fromio() directly casts an arbitrary destination poin=
ter to u16* and dereferences it, triggering unaligned access exceptions on =
strict-alignment architectures.
- [High] cqspi_memcpy_fromio() triggers a hardware alignment fault (Data Ab=
ort) by issuing __raw_readw() on odd device memory addresses.
- [High] cqspi_memcpy_fromio() delegates bulk copies to memcpy_fromio(), wh=
ich can fall back to 8-bit I/O reads and violate the strict 16-bit AHB requ=
irement for 8D-8D-8D mode.
--

--- Patch [10]: [PATCH v6 10/17] spi: cadence-quadspi: refactor direct read=
 path for PHY support ---
commit f23703adf58b1895572efb17e7d5f736dc1bf89f
Author: Santhosh Kumar K <s-k6@ti.com>
Subject: spi: cadence-quadspi: refactor direct read path for PHY support

This commit extracts the DMA transfer code from cqspi_direct_read_execute()
into a new cqspi_direct_read_dma() helper. It also adds
cqspi_memcpy_fromio() to handle non-DMA transfers, attempting to guarantee
2-byte-aligned I/O accesses for 8D-8D-8D mode.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index 5070ffc53d5e8..322e95b3bc17d 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c

[ ... ]

> @@ -1580,8 +1577,61 @@ static int cqspi_direct_read_execute(struct cqspi_=
flash_pdata *f_pdata,
>  	return ret;
>  }
> =20
> +static void cqspi_memcpy_fromio(const struct spi_mem_op *op, void *to,
> +				const void __iomem *from, size_t count)
> +{
> +	if (op->data.buswidth =3D=3D 8 && op->data.dtr) {
> +		unsigned long from_addr =3D (unsigned long)from;
> +
> +		/* Handle unaligned start with 2-byte read */
> +		if (count && !IS_ALIGNED(from_addr, 4)) {
> +			*(u16 *)to =3D __raw_readw(from);

[Severity: High]
Is it safe to cast 'to' directly to a u16 pointer?

If the destination buffer 'to' is not 2-byte aligned, won't this pointer
dereference cause an unaligned access exception on strict-alignment
architectures? Should put_unaligned() be used here instead?

[Severity: High]
Will __raw_readw() cause a hardware alignment fault (Data Abort) on
architectures like ARM if 'from' is an odd address?

Since IS_ALIGNED(from_addr, 4) only checks for 4-byte alignment, an odd
'from' address will enter this block and trigger a 16-bit I/O read on an
unaligned device memory address. Should the driver enforce even address
offsets for these operations?

> +			from +=3D 2;
> +			to +=3D 2;
> +			count -=3D 2;
> +		}
> +
> +		/* Use 4-byte reads for aligned bulk (no readq for 32-bit) */
> +		if (count >=3D 4) {
> +			size_t len =3D round_down(count, 4);
> +
> +			memcpy_fromio(to, from, len);

[Severity: High]
Could memcpy_fromio() fall back to 8-bit I/O reads on some architectures
(like ARM32), violating the controller's strict >=3D16-bit AHB requirement
for 8D-8D-8D mode?

To guarantee the AHB transaction size irrespective of the architecture's
memcpy_fromio() implementation, would it be better to use explicit 32-bit
or 16-bit I/O accessors (like an explicit __raw_readl() loop with
put_unaligned())?

> +			from +=3D len;
> +			to +=3D len;
> +			count -=3D len;
> +		}
> +
> +		/* Handle remaining 2 bytes */
> +		if (count)
> +			*(u16 *)to =3D __raw_readw(from);

[Severity: High]
Similar to the issue above, does this need put_unaligned() to prevent
unaligned memory access exceptions if 'to' is not aligned?

> +
> +		return;
> +	}
> +
> +	memcpy_fromio(to, from, count);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723110219.3180=
747-1-s-k6@ti.com?part=3D10
