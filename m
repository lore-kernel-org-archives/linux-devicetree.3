Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EADB48F847
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 13:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787318166; cv=none; b=DtQH2PzI69hCGDddxwxVxhCB02afkyZA3aEWaWvRskxLaXzOWBYHsLlHCn4ZesMFb6cqd27fESivIRcZYivG7kQCj2m0w7iwq81o+6zKEJkWqw5zCHq1hL+4N7Oq3OB60SCgXW7KcEmQ93KBrzG2QT6ToQpcShxVPHBOoAzotlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787318166; c=relaxed/simple;
	bh=Ja/rPxOwN4WgQ5M7WWlH3DG5G+nmxT3SN0ReTYvjh/4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WlOr3Mg3pBi7oP7uReB8WD0yibhxJzhurLlviQVR+43IqAthytEHFwCloaujbkmNkEALwOw+CXSVv6VfAUOaes4RMt7UsQwnz3nFNNPQ6JPL7aEMaZG9E2nZZdBSBSAvW+JoUchUvPN0hwxFCrLxYt62jZLCVogkd/rZx95GN2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZoeQyWZM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZoeQyWZM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15041F00A3D;
	Fri, 21 Aug 2026 13:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787318149;
	bh=bv9T3Bf0UGihfHOdk60NDUA+VleUF5WWmwM+I4oBo4M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZoeQyWZMu6iCApDXGdQxmgh9Ova3C/v+sT4Ns/5NIGyDd6PCTmA1JycAxVo7RMLoi
	 U0U7BFVR3WRMG42BYza+sYbAB82Nf306mpbzyQtgu99fzQF/g5gGdcRI/LRGpLdjgS
	 gcntaKCe3DSNu5FU4zKW3Iz9o+8dFBv1ikI1JJ6rFvVaNiUW/NuX61aIfIHme9Vi1U
	 rBdarQPIWCMQlcXcK/ibdzZrfeXAMJZ4QC9c6gxHs0UVcAiWEsa30lxaLEXdCwUnma
	 bG6zuBcGnawXa20NByqVwLzN2t+5WU0hM6mR3oV6Xg01FwVZ34YA/dNnA9BkGEtEWF
	 B+5rMFpI2YIfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 10/18] spi: cadence-quadspi: refactor direct read
 path for PHY support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, conor+dt@kernel.org, robh@kernel.org, "Michael
 Walle" <mwalle@kernel.org>, "Richard Weinberger" <richard@nod.at>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Vignesh Raghavendra" <vigneshr@ti.com>, devicetree@vger.kernel.org, "Miquel
 Raynal" <miquel.raynal@bootlin.com>
In-Reply-To: <20260821114822.4040338-11-s-k6@ti.com>
References: <20260821114822.4040338-1-s-k6@ti.com>
 <20260821114822.4040338-11-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 13:15:48 +0000
Message-Id: <20260821131548.E15041F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] `cqspi_memcpy_fromio()` incorrectly byte-swaps the memory-mapped b=
yte stream on big-endian architectures.
- [High] `cqspi_memcpy_fromio()` triggers fatal alignment faults on strict-=
alignment architectures if the source address is odd.
- [High] `cqspi_memcpy_fromio()` is vulnerable to integer underflow and buf=
fer overflow if called with a count of 1.
--

--- Patch [10]: [PATCH v8 10/18] spi: cadence-quadspi: refactor direct read=
 path for PHY support ---
commit 590a74a26c162a104820e05cc0e00a87a2e899bf
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: refactor direct read path for PHY support

This patch extracts the DMA transfer code from cqspi_direct_read_execute()
into a new cqspi_direct_read_dma() helper. It also adds cqspi_memcpy_fromio=
()
to handle non-DMA transfers, using 2-byte-aligned I/O reads for 8D-8D-8D mo=
de
to satisfy the minimum 16-bit AHB transaction width required by the Cadence
OSPI controller.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c

[ ... ]

> +static void cqspi_memcpy_fromio(const struct spi_mem_op *op, void *to,
> +				const void __iomem *from, size_t count)
> +{
> +	if (op->data.buswidth =3D=3D 8 && op->data.dtr) {
> +		unsigned long from_addr =3D (unsigned long)from;
> +
> +		/* Handle unaligned start with 2-byte read */
> +		if (count && !IS_ALIGNED(from_addr, 4)) {
> +			put_unaligned_le16(__raw_readw(from), to);
> +			from +=3D 2;
> +			to +=3D 2;
> +			count -=3D 2;
> +		}

[Severity: High]
If an unprivileged user initiates a 1-byte SPI read at an unaligned address
(e.g., offset 2), this block in cqspi_memcpy_fromio() executes when count
is 1.

Since it writes 2 bytes into the 1-byte destination buffer, doesn't this
cause a buffer overflow?

Also, count -=3D 2 will underflow the unsigned size_t count to SIZE_MAX,
leading to a massive out-of-bounds read/write loop in the while statement
below.

Could we ensure count >=3D 2 before performing a 2-byte read?

[Severity: High]
If from_addr is an odd address (1-byte aligned), __raw_readw(from) in
cqspi_memcpy_fromio() attempts an unaligned 16-bit MMIO read.

On strict-alignment architectures like ARM, wouldn't an unaligned 16-bit
MMIO read trigger a Data Abort (Alignment Fault)?

Furthermore, adding 2 to an odd address results in another odd address,
meaning the subsequent __raw_readl() loop will also fault.

> +
> +		/*
> +		 * Use an explicit 32-bit read loop for the bulk; this
> +		 * guarantees the minimum 16-bit AHB transaction width required
> +		 * in 8D-8D-8D mode on all architectures.
> +		 */
> +		while (count >=3D 4) {
> +			put_unaligned_le32(__raw_readl(from), to);

[Severity: High]
Does this combination of __raw_readl() and put_unaligned_le32() in
cqspi_memcpy_fromio() corrupt data on big-endian architectures?

On a big-endian CPU, __raw_readl() performs a native 32-bit load. For
example, reading the byte stream [A, B, C, D] results in the value
0xAABBCCDD.

Passing this native 32-bit value to put_unaligned_le32() stores it in
little-endian format, writing out [D, C, B, A] and reversing the bytes in
every 4-byte chunk.

Should this use stream I/O functions like ioread32_rep(), or pair native
loads with native stores to preserve the original stream order regardless
of CPU endianness?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821114822.4040=
338-1-s-k6@ti.com?part=3D10
