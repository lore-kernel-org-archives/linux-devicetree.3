Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75E631E850
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 18:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779907007; cv=none; b=GCe3KArBhaEMrwBxa9TIkZeVqzhgM0FaUdBbwF+KK2VWVjAIwiB+kqUVAWWhLQC/XkaMtS+xXVhrU818IlbBCRG2C/ZeyfYZXzyAVGgYxg2FHso94lFSHOyicKSPuc0HAriO9k9pzbwIU/WDxHC9K14y8YRGXR9plQujpWSv+FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779907007; c=relaxed/simple;
	bh=lQWjx80bSKo4sgplv5933BLZq6rhl9PgKzEnN9BqwkI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t2uZbKW2bitIXIX5Ho/33TQ590cFkD2Vm+8O78TnOX7tZSim0kT2MCb1SDQLfcT+WUsJwvwmqQHPnIxt5DLrYCAKHN7XPneBO7+p5+3RtZiZ4IyaEksx+gWuTFeur1nl+rT7GQ9Zn/ShvW8kDP2hfquESvvEmpyxLADCwwc4NZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fTTfcGpr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fTTfcGpr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504BE1F000E9;
	Wed, 27 May 2026 18:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779907005;
	bh=IJzt2ZnTMoh3KZDar9s7TZkH1GNDhXl27I2Y4hHzvYM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fTTfcGprkFe5hYCJcrEsi8yM80ELDTUkAgDuD1WFLEHMP7km+5NV0hOMZmwqDOQEw
	 qqv+Ecqyy0nd86ocwT88J5qMQmF4zoRadNLzS1cWtXZRcUZVw+XjVXxVScfAILGHYL
	 XQAyQjimmKz/qfHTAxAHK6QIIlQYxN0JlnrZiMCpwToKQc7DCOAkt/pC0tXj8qZFTS
	 Eo+aOJTtwG7CpicaQbfctYKvpdSimKCAAQTNP4YSoHjOp1SJ3B3m/6YFdRXLydyyRm
	 OLW/8SODUSHCZZjdh2Jq9Zf/aac4aAJCd6CWMMe4CRJto5RG052Yy9hhuTUuFcrxRQ
	 q5Kyq1zIsDVag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/13] spi: cadence-quadspi: enable PHY for direct
 reads and indirect writes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260527175527.2247679-11-s-k6@ti.com>
References: <20260527175527.2247679-11-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 18:36:44 +0000
Message-Id: <20260527183645.504BE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [Critical] Integer underflow in `cqspi_memcpy_fromio()` leads to out-of-b=
ounds read/write and potential kernel panic.
- [High] Direct dereferencing of potentially unaligned pointers as 16-bit w=
ords in `cqspi_memcpy_fromio()` causes alignment exceptions.
- [High] Failure to revert the hardware PHY state when `cqspi_phy_enable()`=
 times out leaves the controller in a corrupted state.
- [High] Unconditionally decrementing the dummy cycle count in `cqspi_phy_e=
nable()` underflows when 0 dummy cycles are configured.
- [High] Unaligned head and tail bytes are read without PHY at tuned high f=
requencies, risking silent data corruption.
- [High] Enabling the PHY pipeline after starting an indirect write transac=
tion causes a hardware timeout.

Pre-existing issues:
- [High] Mixed usage of stream and register I/O accessors for the same FIFO=
 leads to data corruption on big-endian architectures.
--

commit 589742d2f4a5165622f7b61db11f0e9b7a819d50
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: enable PHY for direct reads and indirect writes

After PHY tuning completes, data transfers still use the default
read-capture path. The PHY pipeline must be activated around each
eligible transfer to benefit from the calibrated delay settings.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index c368dff4f1ebf..a089f2f083bf4 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c

[ ... ]

> +static int cqspi_phy_enable(struct cqspi_flash_pdata *f_pdata, bool enab=
le)
> +{
> +	struct cqspi_st *cqspi =3D f_pdata->cqspi;
> +	void __iomem *reg_base =3D cqspi->iobase;
> +	u32 reg;
> +	u8 dummy;
> +
> +	if (enable) {

[ ... ]

> +		/*
> +		 * The PHY data-capture pipeline absorbs one dummy cycle's
> +		 * worth of latency; reduce the count to avoid over-compensation.
> +		 */
> +		reg =3D readl(reg_base + CQSPI_REG_RD_INSTR);
> +		dummy =3D FIELD_GET(CQSPI_REG_RD_INSTR_DUMMY_MASK
> +					  << CQSPI_REG_RD_INSTR_DUMMY_LSB,
> +				  reg);
> +		dummy--;

[Severity: High]
Does this code underflow if the transaction has 0 dummy cycles configured?

If the dummy value is 0, it rolls over to 255. When masked back into the 5-=
bit
register field, this would truncate to 31 dummy cycles, potentially causing
the hardware to wait for non-existent cycles and corrupt captured data.

> +		reg &=3D ~(CQSPI_REG_RD_INSTR_DUMMY_MASK
> +			 << CQSPI_REG_RD_INSTR_DUMMY_LSB);
> +		reg |=3D FIELD_PREP(CQSPI_REG_RD_INSTR_DUMMY_MASK
> +					  << CQSPI_REG_RD_INSTR_DUMMY_LSB,
> +				  dummy);
> +		writel(reg, reg_base + CQSPI_REG_RD_INSTR);
> +	} else {

[ ... ]

> +	}
> +
> +	return cqspi_wait_idle(cqspi);
> +}

[Severity: High]
If cqspi_wait_idle() times out after the PHY is enabled in CQSPI_REG_CONFIG,
does the hardware get left in a corrupted state?

The function returns an error without reverting the register changes.
Callers like cqspi_direct_read_execute() return this error directly, which
could permanently leave PHY features enabled for subsequent non-PHY
transactions.

[ ... ]

> @@ -1226,6 +1282,15 @@ static int cqspi_indirect_write_execute(struct cqs=
pi_flash_pdata *f_pdata,
>  	if (cqspi->apb_ahb_hazard)
>  		readl(reg_base + CQSPI_REG_INDIRECTWR);
> =20
> +	/* Use PHY only for large writes where setup overhead is amortized */
> +	use_phy_write =3D n_tx >=3D SZ_1K && f_pdata->use_phy;
> +
> +	if (use_phy_write) {
> +		ret =3D cqspi_phy_enable(f_pdata, true);
> +		if (ret)
> +			goto failwr;
> +	}

[Severity: High]
Is the PHY being enabled after the indirect write transaction has already
been started?

Writing to the start register earlier in this function puts the controller =
in
an active state waiting for AHB FIFO data. Calling cqspi_phy_enable() then
polls cqspi_wait_idle(). Because the controller is actively waiting for data
that hasn't been written yet, the idle check will always time out.

>  	while (remaining > 0) {
>  		size_t write_words, mod_bytes;

[Severity: High]
This is a pre-existing issue, but does the driver use mixed accessors for t=
he
same FIFO inside this loop?

The driver violates the subsystem I/O accessor guidelines by using stream
accessors for bulk data and register accessors for remainder bytes on the
same FIFO. On big-endian architectures, register accessors byte-swap the da=
ta,
while stream accessors do not, leading to silent data corruption for partial
transfers.

[ ... ]

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
Does this direct cast to a 16-bit pointer cause unaligned access faults?

The destination pointer comes from the SPI framework and may lack strict
2-byte alignment. Dereferencing it directly will trigger an alignment fault
and kernel panic on architectures without unaligned access support. Should
put_unaligned() be used here?

> +			from +=3D 2;
> +			to +=3D 2;
> +			count -=3D 2;
> +		}

[Severity: Critical]
Can the count variable underflow to a large integer here?

If count is odd (for example, 1 byte), subtracting 2 will underflow an
unsigned integer. The subsequent check below for count >=3D 4 will then pas=
s,
and memcpy_fromio() will attempt to copy an enormous amount of memory,
resulting in a buffer overflow.

> +
> +		/* Use 4-byte reads for aligned bulk (no readq for 32-bit) */
> +		if (count >=3D 4) {
> +			size_t len =3D round_down(count, 4);

[ ... ]

> +static int cqspi_direct_read_execute(struct cqspi_flash_pdata *f_pdata,
> +				     const struct spi_mem_op *op)
> +{

[ ... ]

> +	/* Split into unaligned head, aligned middle, unaligned tail */
> +	from_aligned =3D ALIGN(from, 16);
> +	to_aligned =3D ALIGN_DOWN(from + len, 16);
> +	len_aligned =3D to_aligned - from_aligned;
> +
> +	if (from !=3D from_aligned) {
> +		ret =3D cqspi_direct_read_dma(f_pdata, buf, from,
> +					    from_aligned - from);
> +		if (ret)
> +			return ret;
> +		buf +=3D from_aligned - from;
> +	}

[Severity: High]
Are the unaligned head and tail bytes being read at the tuned maximum
frequency without the PHY enabled?

Bypassing the PHY at high frequencies forces these bytes through the default
uncalibrated capture path. This violates hardware timing margins and can
result in silent data corruption.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527175527.2247=
679-1-s-k6@ti.com?part=3D10
