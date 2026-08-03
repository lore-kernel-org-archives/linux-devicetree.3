Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5BF23507C
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 12:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761941; cv=none; b=pnYhBa8OAfu5yxO7ZNmmnKxoTx8ccVoAeQuyQOZczIFZKOmWxx4/zTxjD0JGWEFmH4CXt1ZNKjuos1+hLbbbGoaR6UcPVIPXNs8rseNvk8lAf2GNr3ulRXDe5H1Yr2MmMifcVxXwXz4QAAIIkR+/6aTXJ7q/ut1Lh2ape3da36U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761941; c=relaxed/simple;
	bh=d4RdjqkhWOkRSiqn3YEVFB0r5Vd5co6c7TI3/Wtf2Dg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HszFl3xUMItjiB/l5nVATr0fVcqWOv5qxb0Pli3+VcuzP0QzGhYF94a+NLIOXLTDPapdSwv4Ewg/Qemri+kPWzuXWOj7hF3gPbFW22B4b52Y3AbCA3RdcFr1NN8xhjNGr+ei1vEM6i/nLkMILs7r5B4MTP6ZZJK/bhowVyEtx5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eYzxySm2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eYzxySm2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC2A1F000E9;
	Mon,  3 Aug 2026 12:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785761939;
	bh=RNd8LxS6QDhsE5viaELdTNqjhen9WNng2o7q/DLZcvA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eYzxySm2yi//964lQO7cx0GxzWdrFoqmc/+40ACPzyLOTv1z4jd42EWSGgqjqaJ11
	 XJmC0/YURNtk8aRA/xJT7ww4H5z6mjQGBxLwc30EpnmRDqAHmtlQ4SznGTdP5wSlAj
	 tgpFaqjjUjahLNbu5dVh72JUKvazE10V3DCyqQHFixYb3EZIAm8Dd79kiMNhSm+KTw
	 8hRtf0Nj/TSASwYh/DjRfx54C/6PsrnHYSPAGEP+UkhBhlAg839UCPxMgmzjLimuyb
	 fRN/BWko/V3NRAEJzlUZQHgbQjgI76u8TP4/Uk7rYDC1Oh7FH2BCj6HoOusrlAwzjR
	 BYtjgvCHCsUUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/11] spi: dw: Introduce enhanced
 single/dual/quad/octal spi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260803124044.156998-7-changhuang.liang@starfivetech.com>
References: <20260803124044.156998-1-changhuang.liang@starfivetech.com>
 <20260803124044.156998-7-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 12:58:58 +0000
Message-Id: <20260803125859.5DC2A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] The newly introduced dw_spi_exec_enh_mem_op() lacks actual SPI=
 data transfer execution logic, returning success without performing I/O an=
d leaving hardware enabled.
- [High] Incorrect transfer type (trans_t) mapping for multi-bit commands w=
ithout an address phase (e.g., 4-0-4) silently misconfigures the wire proto=
col.
--

--- Patch [6]: [PATCH v2 06/11] spi: dw: Introduce enhanced single/dual/qua=
d/octal spi ---
commit 02b326945674bcd1a149d5a5a3e3cd78b2ccabda
Author: Sudip Mukherjee <sudip.mukherjee@sifive.com>

spi: dw: Introduce enhanced single/dual/quad/octal spi

If the spi transfer is using enhanced single/dual/quad/octal spi mode,
then we need to update the SPI_CTRLR0 register. The SPI_CTRLR0 register
will be updated in dw_spi_update_config() via the values in
dw_spi_enh_cfg.

> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
> index d654cb748646a..dbe8779ced865 100644
> --- a/drivers/spi/spi-dw-core.c
> +++ b/drivers/spi/spi-dw-core.c

[ ... ]

> @@ -828,6 +828,90 @@ static int dw_spi_exec_mem_op(struct spi_mem *mem, c=
onst struct spi_mem_op *op)
>  	return ret;
>  }
> =20
> +static void dw_spi_init_enh_mem_buf(struct dw_spi *dws, const struct spi=
_mem_op *op)

[ ... ]

> +static int dw_spi_exec_enh_mem_op(struct spi_mem *mem, const struct spi_=
mem_op *op)
> +{
> +	struct spi_controller *ctlr =3D mem->spi->controller;
> +	struct dw_spi *dws =3D spi_controller_get_devdata(ctlr);
> +	struct dw_spi_enh_cfg enh_cfg =3D {0};
> +	struct dw_spi_cfg cfg =3D {0};

[ ... ]

> +	if (op->data.buswidth =3D=3D op->addr.buswidth &&
> +	    op->data.buswidth =3D=3D op->cmd.buswidth)
> +		enh_cfg.trans_t =3D DW_SPI_ENH_CTRLR0_TRANS_TYPE_TT2;
> +	else if (op->data.buswidth =3D=3D op->addr.buswidth)
> +		enh_cfg.trans_t =3D DW_SPI_ENH_CTRLR0_TRANS_TYPE_TT1;
> +	else
> +		enh_cfg.trans_t =3D DW_SPI_ENH_CTRLR0_TRANS_TYPE_TT0;

[Severity: High]
Does this code handle multi-bit commands without an address phase correctly?

For example, on a 4-0-4 operation where op->addr.nbytes =3D=3D 0 and=20
op->addr.buswidth =3D=3D 0, op->data.buswidth (4) won't match op->addr.busw=
idth (0).
This logic would fall through to the else branch and set trans_t to
DW_SPI_ENH_CTRLR0_TRANS_TYPE_TT0, which misconfigures the wire protocol to
send the multi-bit command as a 1-bit Standard SPI command.

> +
> +	enh_cfg.addr_l =3D op->addr.nbytes << 1;
> +	if (op->cmd.nbytes =3D=3D 2)
> +		enh_cfg.inst_l =3D DW_SPI_ENH_CTRLR0_INST_L_INST_L16;
> +	else if (op->cmd.nbytes =3D=3D 1)
> +		enh_cfg.inst_l =3D DW_SPI_ENH_CTRLR0_INST_L_INST_L8;
> +	else
> +		enh_cfg.inst_l =3D DW_SPI_ENH_CTRLR0_INST_L_INST_L0;
> +
> +	if (op->dummy.buswidth)
> +		enh_cfg.wait_c =3D op->dummy.nbytes * BITS_PER_BYTE / op->dummy.buswid=
th;
> +
> +	dw_spi_enable_chip(dws, 0);
> +
> +	dw_spi_update_config(dws, mem->spi, &cfg, &enh_cfg);
> +
> +	dw_spi_enable_chip(dws, 1);
> +
> +	return 0;
> +}

[Severity: Critical]
Is it intentional that this function omits the actual data transfer and chip
teardown?

It appears to return success (0) immediately after enabling the chip, witho=
ut
calling any I/O routines like dw_spi_write_then_read() or dw_spi_stop_mem_o=
p().
For read operations, this would leave the caller's receive buffer uninitial=
ized
and the SPI chip enabled indefinitely.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803124044.1569=
98-1-changhuang.liang@starfivetech.com?part=3D6
