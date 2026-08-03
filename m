Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4541C409283
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 12:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761964; cv=none; b=Y2VvSJ8EmmsfuX+tYZK4F4BoggWyjfvwzMZ3CtKe1z9HN63UYt1fd6/cic3kD/Bjpt6SiQ7VgtoEzLELemNN1kDBSiwlLDSvJ0ly+X65viMG/GIZKdxSmTyf4/v2iH4eYROcUuBBsJKxL37K/b+BkxGTmr7towuKaXhw90hnlG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761964; c=relaxed/simple;
	bh=uFQqhVhdhnK7eKv3YrHDo+m3+EaHLZnCVhpjitbGy5Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q8HaLpcFZW1OveSn/DpAreA+YBY8Jf3rVSSSVkWQ83O1s2KLsIiwVwqvu5w6sJkwd6Wdi/ZggrTyWpkLTGRH3cxvd6Er6+v/9f30/22+9huBHEwhaqP15sjpGPQVE4xytv931vuy4KeRA3y1U0uHVyTBqM66z/CeozxlN0H5xhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=of9WxAsW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="of9WxAsW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A3D81F00A3A;
	Mon,  3 Aug 2026 12:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785761961;
	bh=T7SEs/+3URUGAo3ukkjPz1hMot6edgfrsjrlH5LlqJA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=of9WxAsWKj64jd01fw/nRKK7e3c98uEqc9YcVi5YxumYQrbJ8vEf0zBX4iP37mLB5
	 MS3rM2pN2H20edEJhygT/0O2GyiyxwKCcXCzkdEWtAhxhxOrMRt1Znishk7+v3wb09
	 zx7xwHW5dkKoUOv30ZRv43B/9rEns0YKxgsZd7voNce+F9GOCu/637YpV9ytNCpceq
	 SetxKGbl2NrT81euY0ZeOCiIebI5JVZgmluvlUZyMSdjE/JEgmVZ+z9aGEkLOm0rkO
	 nQtR5OUo6w99IuVpCCyOjbKYZLqtmDkpN5OVap4CsjEgu8uuc0swkMeoTAleStRm7u
	 94WZXLQFuFWpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/11] spi: dw: send cmd and addr to start the spi
 transfer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260803124044.156998-8-changhuang.liang@starfivetech.com>
References: <20260803124044.156998-1-changhuang.liang@starfivetech.com>
 <20260803124044.156998-8-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 12:59:20 +0000
Message-Id: <20260803125921.1A3D81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing Data Phase and Completion Wait in Enhanced SPI Mode
- [Medium] Address Truncation on 16-bit I/O Width
- [Medium] Preemption / FIFO Overflow Vulnerability
--

--- Patch [7]: [PATCH v2 07/11] spi: dw: send cmd and addr to start the spi=
 transfer ---
commit 0e79a8e7a3709454ed5a5603c033614bdc1b0b5a
Author: Sudip Mukherjee <sudip.mukherjee@sifive.com>

spi: dw: send cmd and addr to start the spi transfer
   =20
In enhanced spi mode, read or write will start by sending the cmd
and address (if present).

diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
index dbe8779ced865..3388f62dc695c 100644
--- a/drivers/spi/spi-dw-core.c
+++ b/drivers/spi/spi-dw-core.c
[ ... ]
> +static void dw_spi_enh_write_cmd_addr(struct dw_spi *dws, const struct s=
pi_mem_op *op)
> +{
> +       /* Send cmd as 32 bit value */
> +       dw_write_io_reg(dws, DW_SPI_DR, op->cmd.opcode);
> +       if (op->addr.nbytes) {
> +               dw_write_io_reg(dws, DW_SPI_DR, lower_32_bits(op->addr.va=
l));

[Severity: Medium]
Does passing a 32-bit chunk to dw_write_io_reg() truncate the address if the
controller is configured with a 16-bit I/O width?

Looking at dw_write_io_reg(), it uses writew_relaxed() when dws->reg_io_wid=
th
is 2. This would drop the upper 16 bits of the lower 32-bit value when
executing an enhanced SPI operation with an address phase.

> +               if (op->addr.nbytes > 4) {
> +                       /* address more than 32bit */
> +                       dw_write_io_reg(dws, DW_SPI_DR, upper_32_bits(op-=
>addr.val));
> +               }
> +       }
> +}
> +
[ ... ]
>  static int dw_spi_exec_enh_mem_op(struct spi_mem *mem, const struct spi_=
mem_op *op)
>  {
>         struct spi_controller *ctlr =3D mem->spi->controller;
> @@ -909,6 +922,8 @@ static int dw_spi_exec_enh_mem_op(struct spi_mem *mem=
, const struct spi_mem_op *
> =20
>         dw_spi_enable_chip(dws, 1);
> =20
> +       dw_spi_enh_write_cmd_addr(dws, op);
> +
>         return 0;
>  }

[Severity: High]
Is the payload data phase, chip select assertion, and completion wait
intentionally omitted here?

By returning 0 immediately after dw_spi_enh_write_cmd_addr(), the data
phase (SPI_MEM_DATA_IN or SPI_MEM_DATA_OUT) seems to be skipped entirely,
which would leave read buffers uninitialized and fail to transfer write
payloads.

[Severity: Medium]
Does dw_spi_exec_enh_mem_op() need to disable local interrupts and preempti=
on
during the IO transfer?

The standard dw_spi_exec_mem_op() wraps the transfer in local_irq_save() and
preempt_disable() to prevent the DesignWare APB SSI RX FIFO from overflowing
if the CPU is preempted or handles a long interrupt. If the CPU is preempted
here in enhanced mode under heavy system load, the incoming data might
similarly overflow the RX FIFO.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803124044.1569=
98-1-changhuang.liang@starfivetech.com?part=3D7
