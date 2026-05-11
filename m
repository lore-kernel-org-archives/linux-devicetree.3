Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21DD313534
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 23:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778541491; cv=none; b=YWQYyCPBzJK6d1immTcs1Z07H908/H1TMwXPOBdqqv4of9+7hMK3plMEzZa29KaWTtZrUmB7rqt9IYrE8UvpVXadduwbwbKpbaA+2fG2bU1UZ8WYV6dq/Cca0aqqgkGVOUHR7i9WLOrJCDX7KQCaE6yKPCUA/K1mnHlj6yi9gJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778541491; c=relaxed/simple;
	bh=/0vdf8KzkQFy2G1K8NcTXiM4Eo7I3GzuSEiUdg+8Kgk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ExpwU4IqIQ3Te6ztlQda3fDi6n8PEnSAHK1f9PIbQvi9MTwzMzPbfxILMSt08sH1cM8GiVLysie1dv91+/NurAdV679JOmAInCE8SNyyscMvVCrqr43LRWUrEO+uu+y9YirHOMyHn/SIEIrMWLIWEz6tSL0F2YocUdEdOYUQ9/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MvqhqYwc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MvqhqYwc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C49C2BCB0;
	Mon, 11 May 2026 23:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778541491;
	bh=/0vdf8KzkQFy2G1K8NcTXiM4Eo7I3GzuSEiUdg+8Kgk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=MvqhqYwcJxfK5JPBeuVfVjlnvuD2qGm4ZoIHKlOB4qa91EgIc1/4eucKovV+Zb7GE
	 Egg0eIW7yscl8FmIiPWiCGArVjXoWYTMsyZbXJQMCc4yadGLCZdrcT4b0e9B+RNsw4
	 Igbl0170D1dlhXE+zO9RwgDWM/N0zoa8IxHEcBV+JT/gJ8Kfp/sCdNzzInHXCTlf0M
	 XXjG+hhpAovqylav+C0clQQU+MoxnVwXCNkfL55F1JHLPxjkwcUpJ8S07G6QKuMxly
	 hgrohpgctbH+E3rxz1Z4IZn8EH7yQFWkMbAapqjUqRniKMAbU+d5TtNPauIvW63KKm
	 T9JN65Xa+8KDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] spi: cadence-xspi: support 4bytes sdma-io-width
Reply-To: sashiko@lists.linux.dev
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260511031732.3199-3-jszhang@kernel.org>
References: <20260511031732.3199-3-jszhang@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 23:18:10 +0000
Message-Id: <20260511231811.02C49C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Mixing 32-bit and 8-bit stream accessors on the same SDMA port cau=
ses data corruption on big-endian systems and potential bus faults.
- [Low] Casting an __iomem pointer directly to uintptr_t drops the __iomem =
annotation and the alignment check on sdmabase is redundant.
--

commit e78d668225027044d0694ef2be9788b6fddb0ef3
Author: Jisheng Zhang <jszhang@kernel.org>

spi: cadence-xspi: support 4bytes sdma-io-width

This commit adds support for 4-byte SDMA I/O width to the Cadence XSPI
controller. It introduces new read and write functions that utilize 32-bit
I/O accessors when the buffer is aligned and the hardware width is configur=
ed
to 4 bytes.

> diff --git a/drivers/spi/spi-cadence-xspi.c b/drivers/spi/spi-cadence-xsp=
i.c
> index 895b4b3276a56..c1fb749540e7a 100644
> --- a/drivers/spi/spi-cadence-xspi.c
> +++ b/drivers/spi/spi-cadence-xspi.c

[ ... ]

> @@ -578,6 +579,38 @@ static int cdns_xspi_controller_init(struct cdns_xsp=
i_dev *cdns_xspi)
>  	return 0;
>  }
> =20
> +static inline void cdns_xspi_sdma_read(struct cdns_xspi_dev *cdns_xspi, =
size_t len)
> +{
> +	void __iomem *src =3D cdns_xspi->sdmabase;
> +	void *buf =3D cdns_xspi->in_buffer;
> +	size_t offset =3D 0;
> +
> +	if (cdns_xspi->sdma_io_width =3D=3D 4) {
> +		if (IS_ALIGNED((uintptr_t)src, 4) && IS_ALIGNED((uintptr_t)buf, 4)) {

This isn't a bug, but does casting the __iomem pointer to uintptr_t drop the
address space annotation and trigger a sparse warning?

Since sdmabase is mapped via devm_ioremap_resource, is the alignment check =
on
src redundant?

> +			ioread32_rep(src, buf, len >> 2);
> +			offset =3D len & ~0x3;
> +			len -=3D offset;
> +		}
> +	}
> +	ioread8_rep(src, (u8 *)buf + offset, len);

Can mixing 32-bit and 8-bit stream accessors on the same SDMA port cause da=
ta
corruption on big-endian architectures?

On big-endian systems, reading memory in 32-bit native words places bytes i=
n a
different order than processing them sequentially in 8-bit chunks.

Additionally, if the hardware port is explicitly configured for 32-bit I/O,
could falling back to 8-bit accessors for remainders or unaligned buffers
trigger bus faults?

Using 32-bit stream accessors exclusively with a temporary 32-bit variable =
and
memcpy for unaligned buffers or remainders would resolve this.

> +}
> +
> +static inline void cdns_xspi_sdma_write(struct cdns_xspi_dev *cdns_xspi,=
 size_t len)
> +{
> +	void __iomem *dst =3D cdns_xspi->sdmabase;
> +	const void *buf =3D cdns_xspi->out_buffer;
> +	size_t offset =3D 0;
> +
> +	if (cdns_xspi->sdma_io_width =3D=3D 4) {
> +		if (IS_ALIGNED((uintptr_t)dst, 4) && IS_ALIGNED((uintptr_t)buf, 4)) {
> +			iowrite32_rep(dst, buf, len >> 2);
> +			offset =3D len & ~0x3;
> +			len -=3D offset;
> +		}
> +	}
> +	iowrite8_rep(dst, (const u8 *)buf + offset, len);

Does the same accessor mixing issue apply here when writing to the SDMA por=
t?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511031732.3199=
-1-jszhang@kernel.org?part=3D2
