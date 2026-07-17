Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5092EEE93
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 19:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784315234; cv=none; b=FxriybzRvpgDo24RJ9zPzaD0+UwjnFmJc++NsJghoRCM7I/tvQYdsersYUg6mEZBWMl3FRlE1zlo/OEhLQ1o36nxHlfTc/T4XBafMTFXWgvRQPc7Bua08D4AnLODMCY6JQLkTEpXHsZX3CJsTVsUDjZydV9Zg9vtIV9EDpnU3t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784315234; c=relaxed/simple;
	bh=dX9OZMjd2nmlODAk6ahL2dn02PuzedMg3xUHQH8sWVk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M/vB9cLxA8m5sSVpulrgb/M+j1nl7ftz3C3hmqRJs0weSi0mL1nScgdJDSMJjKimn5qT5TxWQqVvcHKCG5F9C2OwakXUjDVH3d0+hAXgWhlTZq0LYItWJYZ626WCaO3JEaCT0CMP29QwDP7lVpRoQ83tNjLlER1CjlZISmYgfvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HWgCAL1/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWgCAL1/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B9841F000E9;
	Fri, 17 Jul 2026 19:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784315232;
	bh=5loyAfEoXwaAw7vtcbwOnRz8Ql229JYVX7MWtODD5tA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HWgCAL1/L2hqpug4qTVd+WdJn3pDym521V0UzLMIufKJvNIEkqlnwSRwUkTiR+Bn3
	 sXWw56Hlm7XJlxfZMbo+mO88DerBL+9XGRl50t1LiVEMU0Pv+6f4Cd0tF7OL9QH8Ud
	 N7YjAsmu57yeib3KxUraLYEu35csx5/vbGRm4ig9jQ5PiTVowKrL8bHZsLxP9a5w4Q
	 r04/fJi7hEdObavrUiBAhoJond6aMcWbQpi5DXsH18HcBFTjVSAp50uyqSX68QzaS5
	 vmBtJEF1FwlgAgMz8YiRkU+64NRPQlIteWQJSB79j7rr0jJcWjtm6Wf8uplZJ34QV7
	 0K3h0EDiCbPLg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 10/17] spi: cadence-quadspi: refactor direct read
 path for PHY support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260717185116.2065505-11-s-k6@ti.com>
References: <20260717185116.2065505-1-s-k6@ti.com>
 <20260717185116.2065505-11-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 19:07:10 +0000
Message-Id: <20260717190712.4B9841F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] In 8D-8D-8D mode, `cqspi_memcpy_fromio()` performs an unaligned 16=
-bit I/O read (`__raw_readw()`) if the requested SPI read offset (`op->addr=
.val`) is not 2-byte aligned. This causes a synchronous Alignment Fault (ke=
rnel panic) on architectures with strict I/O alignment rules.
- [High] Directly casting the generic destination buffer `to` to a `u16 *` =
and dereferencing it causes an unaligned memory store if the buffer is not =
2-byte aligned.
- [High] Relying on `memcpy_fromio()` to perform 4-byte hardware reads in 8=
D-8D-8D mode violates hardware access width requirements, as `memcpy_fromio=
()` does not guarantee 32-bit I/O transactions.

Pre-existing issues:
- [High] When the `CQSPI_NO_INDIRECT_MODE` quirk is set, `cqspi_read()` and=
 `cqspi_write()` bypass the `ahb_size` boundary check, allowing out-of-boun=
ds MMIO accesses.
--

--- Patch [10]: [PATCH v5 10/17] spi: cadence-quadspi: refactor direct read=
 path for PHY support ---
commit 2b5af9ab10a299ef73d9e0a5cb2201de2b8ee054
Author: Santhosh Kumar K <s-k6@ti.com>
Subject: spi: cadence-quadspi: refactor direct read path for PHY support

This patch extracts the DMA transfer code from cqspi_direct_read_execute()
into a new cqspi_direct_read_dma() helper. It adds cqspi_memcpy_fromio() to
handle non-DMA transfers, with 2-byte-aligned I/O accesses for 8D-8D-8D
mode.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index 5070ffc53d5e8..322e95b3bc17d 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c

[ ... ]

> @@ -1580,8 +1577,61 @@ static int cqspi_direct_read_execute(struct cqspi_=
flash_pdata *f_pdata,
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
Could this cause a synchronous alignment fault on architectures with strict
I/O alignment rules? If the requested SPI read offset (from_addr) is an odd
address, !IS_ALIGNED(from_addr, 4) evaluates to true, which results in
__raw_readw() executing on an unaligned I/O address.

Additionally, does casting the generic destination buffer 'to' to a u16
pointer risk unaligned memory stores? If the buffer provided by userspace or
another subsystem is not 2-byte aligned, this might cause undefined behavio=
r.
Would it be safer to use put_unaligned() here?

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
Can we rely on memcpy_fromio() to guarantee 32-bit hardware transactions on
all architectures? The comment mentions using 4-byte reads for aligned bulk,
but on some platforms memcpy_fromio() falls back to byte-by-byte reads. Sho=
uld
this use ioread32_rep() or a manual readl() loop to enforce the hardware
access width requirements for 8D-8D-8D mode?

> +			from +=3D len;
> +			to +=3D len;
> +			count -=3D len;
> +		}
> +
> +		/* Handle remaining 2 bytes */
> +		if (count)
> +			*(u16 *)to =3D __raw_readw(from);

[Severity: High]
Similarly to the unaligned start logic, does this risk unaligned I/O reads =
or
unaligned memory stores if the trailing bytes involve an odd start address =
or
an unaligned destination buffer?

> +
> +		return;
> +	}
> +
> +	memcpy_fromio(to, from, count);
> +}

[ ... ]

> @@ -1597,7 +1647,8 @@ static ssize_t cqspi_read(struct cqspi_flash_pdata =
*f_pdata,
> =20
>  	if ((cqspi->use_direct_mode && ((from + len) <=3D cqspi->ahb_size)) ||
>  	    (cqspi->ddata && cqspi->ddata->quirks & CQSPI_NO_INDIRECT_MODE))
> -		return cqspi_direct_read_execute(f_pdata, buf, from, len);
> +		return cqspi_direct_read_execute(f_pdata, op,
> +						 post_config_max_speed_hz);

[Severity: High]
This is a pre-existing issue, but does the CQSPI_NO_INDIRECT_MODE quirk
bypass the ahb_size boundary check here? Because of the logical OR conditio=
n,
an SPI read with an offset and length exceeding the controller's memory-map=
ped
AHB window might proceed and access out-of-bounds MMIO.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717185116.2065=
505-1-s-k6@ti.com?part=3D10
