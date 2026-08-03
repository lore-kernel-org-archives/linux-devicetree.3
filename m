Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A654407CF6
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 12:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761943; cv=none; b=piFQplKsyIS0H56NOtJvHekst+asx/31mFVP0Mi7PmXqhhr0yjMpLs3LYSyJOsXoMH5RYqakbyuFvorjpJ2U5wKrwdsc98DOJXpCrtQPFmKKmbz/Hu/d7lC6/++xO7TZSFcmVwvY6pyCouH+V82B2n+o5ehpuT0Ijefnmjv8UJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761943; c=relaxed/simple;
	bh=6Q9qWncgBYR7a/8s3d+8efofGrC6Dzg/VVta2hPYA/M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZmJ2F20tdH5Gubl0RJ88rYwdNe4Ryl/S0Bcvp+zRz2yY4inpKymUkAnAHJE2V1ea3Bzd0RnMFzGm3YnWwYkdDf8ZnSB07u/Z9/7MBpAIvObyO+zKDyYrIaudOMHsndzlEkMqMrfHrRwhzwR66Rzdh+pP5l+gsViH98i0KeBaWd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E5oVfU7I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E5oVfU7I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83AB71F000E9;
	Mon,  3 Aug 2026 12:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785761942;
	bh=fhcznpkgjCNGKjjOWquz0c3kwmztGqpSx6lpwM+3prk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E5oVfU7IWFviQ48L2xfjvaDlaAqZnusBJaBm02t3OGiPNZ2dgibcJEDF44+PeGM3O
	 a9yl6YpoMcC2QqrRoncuI3RxGWoJukfsLd2BYIC3QWwfNm5AgWNbbewXFmBoXbfRaW
	 uPN5JhQWGveXbaRYPYqG5eHdbG6z/qOVVUJhMVvaybYLw8L06MV2cCa1zKBmDzUVJr
	 ZoBXzEahaK6IiH4ndGQdNS0c3Q028eOXwI5v+b8iAeBblm6LFW2/iBS1jHlQZgnAdT
	 Ct2cb7JTVXrUecv+EtYXYl4kM0FzMPotSg+s3I5PQJ7eSTJQYex1+gVE4wRSmEOogx
	 pmmys4Ebozmxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/11] spi: dw: use irq handler for enhanced spi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260803124044.156998-9-changhuang.liang@starfivetech.com>
References: <20260803124044.156998-1-changhuang.liang@starfivetech.com>
 <20260803124044.156998-9-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 12:59:01 +0000
Message-Id: <20260803125901.83AB71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The SPI controller's FIFO threshold registers are modified while t=
he controller is active, and a hardcoded delay introduces a race condition =
leading to silent RX FIFO overflows.
- [High] dw_spi_exec_enh_mem_op() unconditionally relies on interrupts, bre=
aking SPI operations on systems without an IRQ line.
--

--- Patch [8]: [PATCH v2 08/11] spi: dw: use irq handler for enhanced spi -=
--
commit e91a45b5a4fd49e726c98b12e74d1f4306f85fe7
Author: Sudip Mukherjee <sudip.mukherjee@sifive.com>

spi: dw: use irq handler for enhanced spi

This commit introduces an interrupt handler for enhanced SPI read/write
operations. It utilizes the controller's xfer_completion to wait for
transfer completion or timeout from the IRQ handler. It also adjusts
RXFTLR dynamically based on the expected data length.

> --- a/drivers/spi/spi-dw-core.c
> +++ b/drivers/spi/spi-dw-core.c
[ ... ]
> @@ -920,11 +979,54 @@ static int dw_spi_exec_enh_mem_op(...)
> =20
>  	dw_spi_update_config(dws, mem->spi, &cfg, &enh_cfg);
> =20
> +	dw_spi_mask_intr(dws, 0xff);
> +	reinit_completion(&ctlr->xfer_completion);
>  	dw_spi_enable_chip(dws, 1);
> =20
>  	dw_spi_enh_write_cmd_addr(dws, op);
> +	dw_spi_set_cs(mem->spi, false);
> =20
> -	return 0;
> +	/*
> +	 * FIXME: The exact reason for this delay is not fully understood,
> +	 * but empirical testing shows it significantly improves the stability
> +	 * of read/write operations. Without this delay, occasional transfer
> +	 * errors or timeouts may occur under certain conditions.
> +	 * Keeping it as a safeguard based on practical validation.
> +	 */
> +	udelay(5);
> +
> +	dw_spi_enh_irq_setup(dws);

[Severity: High]
Does modifying the SPI controller's FIFO threshold registers inside
dw_spi_enh_irq_setup() while the controller is active (after calling
dw_spi_enable_chip()) violate the DW APB SSI hardware specifications?

Additionally, with this 5us delay between starting the transfer and unmaski=
ng
interrupts, could the RX FIFO overflow before dw_spi_enh_irq_setup() prepar=
es
the IRQ handler to drain it?

At typical SPI frequencies (e.g., 50MHz), 5us is enough time to clock in
more data than a small RX FIFO can hold, which might lead to silent data lo=
ss
and immediate -EIO timeouts.

> +
> +	/* Use timeout calculation from spi_transfer_wait() */
> +	ms =3D 8LL * MSEC_PER_SEC * (dws->rx_len ? dws->rx_len : dws->tx_len);
> +	do_div(ms, dws->current_freq);
> +
> +	/*
> +	 * Increase it twice and add 200 ms tolerance, use
> +	 * predefined maximum in case of overflow.
> +	 */
> +	ms +=3D ms + 200;
> +	if (ms > UINT_MAX)
> +		ms =3D UINT_MAX;
> +
> +	ms =3D wait_for_completion_timeout(&ctlr->xfer_completion,
> +					 msecs_to_jiffies(ms));
> +	if (ms =3D=3D 0) {

[Severity: High]
Will this wait unconditionally time out on platforms without a connected IR=
Q?

Unlike the standard dw_spi_exec_mem_op() which falls back to polling, this
appears to rely solely on the interrupt handler to signal completion. If a
system uses polling mode (no dedicated SPI IRQ), it seems enhanced memory
operations will always result in an -EIO timeout here.

> +		dw_spi_mask_intr(dws, 0xff);
> +		synchronize_irq(dws->irq);
> +		dws->rx =3D NULL;
> +		dws->tx =3D NULL;
> +		dws->rx_len =3D 0;
> +		dws->tx_len =3D 0;
> +		dw_spi_stop_mem_op(dws, mem->spi);
> +		return -EIO;
> +	}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803124044.1569=
98-1-changhuang.liang@starfivetech.com?part=3D8
