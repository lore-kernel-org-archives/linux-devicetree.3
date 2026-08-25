Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2719B445AD1
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 17:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787679083; cv=none; b=S4HzY94pC4npq2O1BqEb4KthrxC7kee8Mv6dBlLt7A9CfMYclxv3UQ0hV/IEXm11ICM8XciJYBlg5zhOQHqKcLqUG2fefAfSMCYzxUk3K2fqxe8eUE/i2xGtQZI4X7QOIrIPBUO9KlLLTU23xUZFJ0fPIyeqwYZRv9Sz2QqrKJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787679083; c=relaxed/simple;
	bh=XUqxVn4YxITcr+a0DgfhN92D1cj0MI01FgWYJ//45wk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XkjZeWBSEbD/vwZPfajVaTMYysmXdM+lZdv28dv/Yi6HW643B2TA6EvDCTip0rj/lWjkQC31zNwTpP46ZQKLd/xxOGaLaFUnpm2Xw4G4gyrOaZhTEifVqQ/6kaoJRFyumtR8u8Op8ps/A0KpbZlmxBLJFhYuA5KrOomW/ZFfEzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZRC7yomk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZRC7yomk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDFEF1F00A3A;
	Tue, 25 Aug 2026 17:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787679071;
	bh=I9rTec06oLu2GpaxoECo+poQJvbvpuK81ZZYj8saVqc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZRC7yomkmHsNcdcCUFLSP0OUIElrLw/AUEd2nTH6glyzeD4MGrxY0x2mRloDST0SW
	 KjZ2vkX7AxOSOWMacFbbl2pEX5CLlmXbrLNB6jsBtHUS9ebDdpWT3zA8bBMtCJAZT3
	 blyupNACks4RojoA4dnLn5FvWdD2ciYu/zkFZjmSgrO4gCH5DWNboMSYZblR69iohm
	 GSHa5zpwlC4cInWb+NGP//ErVpI2/2RyuF8GfV9MlKyU1fFsCt5h9FqKWf5B4jV4Er
	 /Iqk+l1ExzKEgNEUzYof/EK3AZ4CJFK5UBebflF+cXf9nQp/QyxZU0u4DCk4iSAqex
	 5mxb9RWavZoQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 10/18] spi: cadence-quadspi: refactor direct read
 path for PHY support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: robh@kernel.org, "Pratyush Yadav" <pratyush@kernel.org>, "Richard
 Weinberger" <richard@nod.at>, devicetree@vger.kernel.org, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Michael
 Walle" <mwalle@kernel.org>, conor+dt@kernel.org
In-Reply-To: <20260825171737.776052-11-s-k6@ti.com>
References: <20260825171737.776052-1-s-k6@ti.com>
 <20260825171737.776052-11-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 17:31:10 +0000
Message-Id: <20260825173110.DDFEF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The custom memory-mapped I/O read loop in cqspi_memcpy_fromio() by=
teswaps and corrupts data on Big Endian architectures.
- [High] Unaligned I/O memory accesses in cqspi_memcpy_fromio() cause hardw=
are exceptions (Alignment Faults) on architectures like ARM/ARM64.

Pre-existing issues:
- [High] Mixed I/O accessors in cqspi_indirect_write_execute() corrupt part=
ial FIFO writes on big-endian architectures.
--

commit ece753244f464ecb928c830b6abeb4d3b99224f1
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: refactor direct read path for PHY support

Extract the DMA transfer code from cqspi_direct_read_execute() into a
new cqspi_direct_read_dma() helper. Add cqspi_memcpy_fromio() to handle
non-DMA transfers, using 2-byte-aligned I/O reads for 8D-8D-8D mode.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index fc33bbf56dd61..58bca15dbd6ec 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c

[ ... ]

> @@ -1588,8 +1586,63 @@ static int cqspi_direct_read_execute(struct cqspi_=
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
> +			put_unaligned_le16(__raw_readw(from), to);

[Severity: High]
Can these MMIO reads cause alignment faults on architectures like ARM/ARM64?

If a user or filesystem requests a SPI read at an unaligned odd byte offset,
the start address from_addr could be odd. If it is odd, !IS_ALIGNED() is tr=
ue,
and the code executes __raw_readw(from) from an odd device memory address.
Unaligned accesses to device I/O memory are forbidden on some architectures
and can trigger a data abort panic.

> +			from +=3D 2;
> +			to +=3D 2;
> +			count -=3D 2;
> +		}
> +
> +		/*
> +		 * Use an explicit 32-bit read loop for the bulk; this
> +		 * guarantees the minimum 16-bit AHB transaction width required
> +		 * in 8D-8D-8D mode on all architectures.
> +		 */
> +		while (count >=3D 4) {
> +			put_unaligned_le32(__raw_readl(from), to);

[Severity: High]
Does combining native-endian __raw_readl() with little-endian
put_unaligned_le32() cause unwanted byte-swapping of stream data on
big-endian platforms?

Because __raw_readl() natively loads a 32-bit word from the bus, and
put_unaligned_le32() forces it into little-endian byte order in memory, the
byte sequence within each chunk gets reversed on big-endian architectures.
This reverses the exact byte stream from device memory, breaking the semant=
ics
guaranteed by the standard memcpy_fromio() fallback.

Additionally, if the initial offset was odd, adding 2 in the block above me=
ans
from remains odd. Does executing __raw_readl(from) here also trigger an
unaligned device memory access fault during the 32-bit read?

[ ... ]


[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the I/O
accessors, I noticed a pre-existing issue in cqspi_indirect_write_execute():

drivers/spi/spi-cadence-quadspi.c:cqspi_indirect_write_execute() {
    ...
		if (write_words) {
			iowrite32_rep(cqspi->ahb_base, txbuf, write_words);
			txbuf +=3D (write_words * 4);
		}
		if (mod_bytes) {
			unsigned int temp =3D 0xFFFFFFFF;

			memcpy(&temp, txbuf, mod_bytes);
			iowrite32(temp, cqspi->ahb_base);
			txbuf +=3D mod_bytes;
		}
    ...
}

Does using iowrite32() for the remainder bytes corrupt partial FIFO writes
on big-endian systems?

The bulk data loop uses iowrite32_rep(), which is a stream accessor that
preserves byte semantics. However, the remainder writes use iowrite32(),
which byte-swaps on big-endian architectures. This mixes stream and register
accessors for the same FIFO base, which can corrupt the final 1-3 bytes
of an indirect write transfer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825171737.7760=
52-1-s-k6@ti.com?part=3D10
