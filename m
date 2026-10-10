Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DF74A1DEA
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637911; cv=none; b=c3xg/306dE4mi7DFtZ+2aNB9zZvl3dRBO3G3CEqhXGEHubeuoyDL8nGZsP518CyfLlgI8fKQ3jz6n+NCKbSRAnXmdVcu7chZkGvltDccqWoFOhvyebAgCpkabuy4vrUW6NZXzz5l7aPREAypbi4NBVn8tV8/uIFFz4BXL4bYhvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637911; c=relaxed/simple;
	bh=3fscxGL6D/x6Q1EHXOxP43wRrCw1B1vyyNqZpekZmK8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=UMr5xW2pGqOA1RSeGxUGuQk8VFhDc334HSYLnk2KGJx/DjHujNNJ31KWI6DfYfRBzf51H1qR/c8o8p0fD3yLiVyWfqZQqOyoIvi9HCV56vpn1dfP7bus8NriXHoBxMcuqFSZTRK2r2KRoos9AtIPa/1F1biL6B9BuFSxEfpUn0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NthThA3E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NthThA3E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FDAA1F000FF;
	Sat, 10 Oct 2026 13:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791637909;
	bh=xmZ2KumSDm4dwYR6o09H4qyV2pbpvH1kp+otB0ub9Ec=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NthThA3E4zUyorocxB9ZV5zdmf02O3oUmSIIbXkmAXPRxdHrWQuulJ2EvRJVCDJYm
	 Z78dTf0lyloFRYka3oQyjcfeuitcRsQTZAa1rlFKZLgUoTJcYOLn79jgSf2jJn4aMH
	 1zbZoamG2ObKcPANyPXA8zzNt3yk7Jf/y4nW9lRhzKgzSi21YmIOui+02nSAIZJiQL
	 jp+E9xsJ/aVulpREWGjs4C6kYSQaB8a4hPNzqaNc6sdxGC7L4v6SGyf+VEjvXs9gIc
	 vjtrnEuiH8glpv2SUxS67WevnoyKmxy2NJsq6jmy4kuhB8iyTtm+0NcpZmDBKr7Jid
	 f19r8VyvyZUcg==
Message-ID: <sashiko-outbox-166571@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 20/24] spi: Add ZTE ZX279128S SPI flash controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Navid Ghahremani" <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261010130024.177503-21-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-21-ghahramani.navid@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 13:11:48 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] spi: zx279128s: Endianness corruption in FIFO byte stream access
- [Medium] spi: zx279128s: hardware register overwrite while controller is =
busy
--

commit 4810c7a0849d088839c80d7f592b0dcb4167dff5
Author: Navid Ghahremani <ghahramani.navid@gmail.com>

spi: Add ZTE ZX279128S SPI flash controller

This commit adds support for the SPI flash controller of the ZTE
zx279128s SoC, implementing the spi-mem interface for bounded SPI-memory
operations.

> diff --git a/drivers/spi/spi-zx279128s-spifc.c b/drivers/spi/spi-zx279128=
s-spifc.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/spi/spi-zx279128s-spifc.c

[ ... ]

> +static int zx_spifc_read_fifo(struct zx_spifc *spifc, u8 *buf,
> +			      unsigned int len)
> +{
> +	unsigned int i;
> +	u32 word;
> +	int ret;
> +
> +	for (i =3D 0; i < len; i +=3D 4) {
> +		ret =3D zx_spifc_wait_fifo(spifc, SPIFC_FIFO_RX_AVAIL);
> +		if (ret)
> +			return ret;
> +		word =3D readl(spifc->base + SPIFC_FIFO_DATA);
> +		memcpy(buf + i, &word, min(4U, len - i));

[Severity: High]
Does this code cause byte-order corruption on big-endian architectures?

The readl() accessor implicitly performs CPU-to-little-endian byteswapping.
When used with memcpy() to handle a byte stream, this byteswapping reverses
the byte order within each 32-bit word on big-endian systems.

Could stream accessors like readsl() or ioread32_rep() be used here
instead to preserve memory byte order without endianness conversions?

> +	}
> +
> +	return 0;
> +}

[ ... ]

> +static int zx_spifc_write_fifo(struct zx_spifc *spifc, const u8 *buf,
> +			       unsigned int len)
> +{
> +	unsigned int i =3D 0;
> +	bool started =3D false;
> +	u32 word;
> +	int ret;
> +
> +	while (i < len) {
> +		if (!(readl(spifc->base + SPIFC_FIFO_STATUS) &
> +		      SPIFC_FIFO_TX_FREE)) {
> +			if (!started) {
> +				zx_spifc_start(spifc);
> +				started =3D true;
> +			}
> +			ret =3D zx_spifc_wait_fifo(spifc, SPIFC_FIFO_TX_FREE);
> +			if (ret)
> +				return ret;
> +		}
> +		word =3D 0;
> +		memcpy(&word, buf + i, min(4U, len - i));
> +		writel(word, spifc->base + SPIFC_FIFO_DATA);

[Severity: High]
Similarly, does this writel() call reverse the byte order of the outgoing
stream on big-endian systems?

Could writesl() or iowrite32_rep() be used to avoid unintended
byteswapping during flash writes?

> +		i +=3D 4;
> +	}
> +
> +	if (!started)
> +		zx_spifc_start(spifc);
> +
> +	return 0;
> +}

[ ... ]

> +static int zx_spifc_exec_op(struct spi_mem *mem, const struct spi_mem_op=
 *op)
> +{
> +	struct zx_spifc *spifc =3D spi_controller_get_devdata(mem->spi->control=
ler);
> +	void __iomem *base =3D spifc->base;
> +	u32 fmt0 =3D 0, fmt1 =3D 0, val;
> +	int ret;
> +
> +	ret =3D zx_spifc_set_speed(spifc, op->max_freq ?: mem->spi->max_speed_h=
z);
> +	if (ret)
> +		return ret;
> +
> +	if (op->addr.nbytes) {
> +		fmt0 |=3D SPIFC_FMT0_ADDR;
> +		fmt1 |=3D FIELD_PREP(SPIFC_FMT1_ADDR_BYTES, op->addr.nbytes - 1);
> +	}
> +	if (op->dummy.nbytes) {
> +		fmt0 |=3D SPIFC_FMT0_DUMMY;
> +		fmt1 |=3D FIELD_PREP(SPIFC_FMT1_DUMMY_BYTES, op->dummy.nbytes);
> +	}
> +	if (op->data.nbytes) {
> +		fmt0 |=3D op->data.dir =3D=3D SPI_MEM_DATA_IN ? SPIFC_FMT0_DATA_IN :
> +							  SPIFC_FMT0_DATA_OUT;
> +		fmt1 |=3D FIELD_PREP(SPIFC_FMT1_DATA_LINES,
> +				   zx_spifc_lines(op->data.buswidth));
> +	}
> +
> +	zx_spifc_ack(spifc);
> +	writel(op->cmd.opcode, base + SPIFC_OPCODE);
> +	writel(fmt0, base + SPIFC_FMT0);

[Severity: Medium]
Does this code overwrite active controller registers while the hardware is
still busy?

If a previous SPI operation times out, the hardware's busy flag might
still be active. When zx_spifc_ack() is called, it observes the busy state
and skips the acknowledge:

    static void zx_spifc_ack(struct zx_spifc *spifc)
    {
        u32 val =3D readl(spifc->base + SPIFC_ACK);
        if (!(val & SPIFC_ACK_BUSY))
            writel(val | SPIFC_ACK_DONE, spifc->base + SPIFC_ACK);
    }

However, execution immediately continues and unconditionally writes new
configuration to SPIFC_OPCODE and SPIFC_FMT0. Modifying active controller
registers while the hardware state machine is processing a previous
transaction could lead to undefined behavior or bus lockups.

Should the driver ensure the hardware is idle or properly reset before
starting a new operation here?

> +	writel(fmt1, base + SPIFC_FMT1);
> +	writel(op->data.nbytes ? op->data.nbytes - 1 : 0, base + SPIFC_LEN);
> +	writel(op->addr.nbytes ? op->addr.val : 0, base + SPIFC_ADDR);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010130024.1775=
03-1-ghahramani.navid@gmail.com?part=3D20
