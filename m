Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F9C3D6CDE
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 07:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781769448; cv=none; b=NGVb4w7lpmQmePX34PSgpZqgdvYQCbGSTNUwyZidg/+S3hBiTKgEj0tpwLdRxRuG8w050o7tvxxrRWHSNXRl2jFMBNsi+/rT2078Ob95/vF7B7OQShnDTCPfPu4eqlW+dRPB8jujz47M9UrnSwb29zICz9vD+I9uc4I+qoCQOTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781769448; c=relaxed/simple;
	bh=moQihCXDUJRieyqUlr+26FNTokX19FzYKTPkpCN6LJw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k+R3Hf1B/UZsFRkrWrUAS9aiXG5mFr/tW7kB/38q8eLvVf8IXyHrZHXDFmYS4IQ9bJTqv5ZkiwG8AXJF41YQwqTXTlLmAFHCQqd3Az8t6f5eIR6lVzXeuE/TPcXfOpQeTJJ7mfjaIyaqHUzIbrUKCgxtENP5M2sw9Q1u66MD8+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HoikS7pM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HoikS7pM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D4B1F000E9;
	Thu, 18 Jun 2026 07:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781769447;
	bh=Ygdr1RW415r3qDAjp6EjcLNrh19N1EYJ65qIMa8jGrA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HoikS7pMxIsXR8F+FECmw64j1WREHJrUezsEy9Y7wh0AOFjcc2t0E8NOJ+kWB2Y9A
	 EDly3uPKmSwkK3ZpNFxCQixvUyDNKh8dvQIOSVcRjBTEBVL7iLg1fk/vj7CDTFq7Bd
	 2jklbfLgkco9FeuFS8yQFmvH738mYh/uJqkjbavzLweEu3b+uQ9PF4+ejEMvs+KDoG
	 WZlnMwS+c3gUWJAOcHkR57tLW5B2B38NLHywSWEngYNBfr0rxiQKAOX8mPjmzsjnTv
	 p/kbuDvABGvtB+oiWJnhdNAFZY/IrMXTS9uveu3murXI+Jir8vqfmjfHKdG/DNpyDM
	 B1VShCo7uO8HA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 10/16] spi: cadence-quadspi: refactor direct read
 path for PHY support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260618073725.84733-11-s-k6@ti.com>
References: <20260618073725.84733-1-s-k6@ti.com>
 <20260618073725.84733-11-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 07:57:26 +0000
Message-Id: <20260618075727.37D4B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Casting an arbitrary `void *` buffer pointer to `u16 *` and derefe=
rencing it causes unaligned access faults on strict-alignment architectures.
- [High] Performing 16-bit unaligned reads from memory-mapped I/O if the fl=
ash offset is odd causes a Data Abort.
- [High] Silent degradation to 1-byte I/O reads by memcpy_fromio() violates=
 8D-8D-8D access size requirements.
--

commit d928e9450946bfcaed1dc0c5349081ffad136425
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: refactor direct read path for PHY support

Extract the DMA transfer code from cqspi_direct_read_execute() into a
new cqspi_direct_read_dma() helper. Add cqspi_memcpy_fromio() to handle
non-DMA transfers, with 2-byte-aligned I/O accesses for 8D-8D-8D mode.
Transfers shorter than CQSPI_PHY_MIN_DIRECT_READ_LEN bytes always use
the memcpy path; longer transfers use DMA when available.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index c94bb8ad5d1dd..5f992fee790a4 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c
[ ... ]
> @@ -1506,8 +1503,61 @@ static int cqspi_direct_read_execute(struct cqspi_=
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
Will this __raw_readw() cause a Data Abort on ARM architectures if the
flash offset is odd?

The code assumes from_addr is 2-byte aligned, but userspace MTD reads
can specify arbitrary odd offsets. If from_addr is odd,
!IS_ALIGNED(from_addr, 4) evaluates to true and we execute __raw_readw()
on an odd I/O memory address.

Unaligned accesses to device memory strictly cause Alignment Faults on
ARM, even if the underlying hardware ignores the LSB.

Also, can casting the destination buffer to a u16 pointer and dereferencing
it cause unaligned access faults?

The destination buffer, derived from op->data.buf.in, might be unaligned.
Casting an unaligned void pointer to a u16 pointer and dereferencing it
causes an unaligned store exception on strict-alignment architectures.
Does this need to use put_unaligned() instead?

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
Does memcpy_fromio() guarantee the 2-byte minimum I/O access size required
by the 8D-8D-8D hardware?

If the generic memcpy_fromio() fallback is used by the architecture, or
if the destination buffer is unaligned on architectures like ARM64,
memcpy_fromio() will silently degrade to byte-wise reads.

Issuing 1-byte read requests on the AHB bus violates the hardware's 2-byte
minimum access requirement in 8D-8D-8D mode. Should this use an explicit
loop with ioread32_rep() or __raw_readl() to guarantee the minimum access
size?

> +			from +=3D len;
> +			to +=3D len;
> +			count -=3D len;
> +		}
> +
> +		/* Handle remaining 2 bytes */
> +		if (count)
> +			*(u16 *)to =3D __raw_readw(from);

[Severity: High]
As with the unaligned start handling above, does this unaligned void
pointer cast risk unaligned access faults on strict-alignment architectures?

> +
> +		return;
> +	}
> +
> +	memcpy_fromio(to, from, count);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618073725.8473=
3-1-s-k6@ti.com?part=3D10
