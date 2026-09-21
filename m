Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0BC3C1D7D
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 10:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789985991; cv=none; b=e3DGL0vWsWJ+87Cyzt0o+1QUuK5Zlm6jRoppJOAc8UIOctUyMtiFGp4kaJztl0ac9IICQm5pj0SJwrYc8YhMerb3Txy19QDGYRhbmX8Teeh9BgCFBK5eyt9TdU5OtaAyCOB5XQB9Uv52qXNGQBHykuPH6TkvC8xS5G0Aw19NbxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789985991; c=relaxed/simple;
	bh=ZRMQmmu3dbnP69kvMhZ/exq8zb8RNg1Vbkp2u056pmY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aheEZDAwcyD9idvq/9HFQe7jmdBmGBefWtEyc7zE7527dwQiqNoY9EngOy/al2nbesSRBsVhF5zc+Hxnza/P+HU6Y4mJrlqJGKYiQAMMKDGOY90oKdqYiAgZzafngS/ZcF6v6VwiXSsCprECU6glLjG0ED03M7lJiBBUOuZ0nFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ol6qaBFE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ol6qaBFE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F0E1F000FF;
	Mon, 21 Sep 2026 10:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789985986;
	bh=HnjGD2yp7rMy/99PzXKmhb3BN4X0XJf8/kQdleyBc24=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ol6qaBFED00w9BOnRRXvnGiOzQF0OkazeLRYzqNeyvQuv2R2JLl3tRpZRnq4N+Ma6
	 PRwKYtJxEjYVP+YP2dBQRNphKAYA9pU8DywqLWd+U/yTYi4XYETwpFgThKWCvIa+BE
	 1fnI4CwZXD3Ib1q5Pv3SQ1z1brzaTQW+nxyW8e5oscKY+TTDLyJkOB++2uzY0Gza5z
	 5R3eXayXOJd2TKovWS2AHN+mal/8cPAdP5PvnQ0xBkwjylrNKV7v9paNE4OPxUpTji
	 EUW004jSe9Zlzd4yMHunDC86Ol8i2fO2S2heXnOwqhIfCM96g6FvRVTme6FW/uD5Gd
	 M4GqSdYsinjOw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 4/4] spi: cadence-xspi: add ACMD support for SPI NOR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fei Xie" <fei.xie@horizon.auto>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260921093701.1341766-5-fei.xie@horizon.auto>
References: <20260921093701.1341766-1-fei.xie@horizon.auto>
 <20260921093701.1341766-5-fei.xie@horizon.auto>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 10:19:45 +0000
Message-Id: <20260921101946.31F0E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] spi: cadence-xspi: ACMD timeout is too short for SPI NOR erase ope=
rations
- [High] spi: cadence-xspi: Type confusion when casting SPI client's drvdat=
a to struct spi_nor
- [High] spi: cadence-xspi: Global state pollution breaks multi-device supp=
ort
- [Medium] spi: cadence-xspi: SPI NOR ACMD support is dead code
- [Medium] spi: cadence-xspi: Data race on acmd_info.initialized causes 0-b=
yte I/O failures
--

commit 9403976e689b7174f09268bad857344a4209db95
Author: fei.xie <fei.xie@horizon.auto>

spi: cadence-xspi: add ACMD support for SPI NOR

Program the automatic command sequences from the SPI NOR operation
templates. Uses the PIO command path with MDMA data transfers for reads,
page programs and erases. Unsupported command layouts continue to use STIG
mode.

> diff --git a/drivers/spi/spi-cadence-xspi.c b/drivers/spi/spi-cadence-xsp=
i.c
> --- a/drivers/spi/spi-cadence-xspi.c
> +++ b/drivers/spi/spi-cadence-xspi.c
[ ... ]
> +static int cdns_xspi_nor_init(struct cdns_xspi_dev *cdns_xspi,
> +			      struct spi_nor *nor)
> +{
[ ... ]
> +	if (!spi_nor_protocol_is_dtr(nor->reg_proto) &&
> +	    !cdns_xspi->acmd_info.nor_status_initialized) {
> +		ret =3D cdns_xspi_nor_status_seq_init(cdns_xspi, &status_op);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	cdns_xspi->acmd_info.initialized =3D true;
> +
> +	return 0;
> +}

[Severity: High]
If multiple SPI NOR flashes are connected on different chip selects,
will subsequent devices skip initialization and incorrectly reuse the
first flash's hardware parameters?

[ ... ]
> +static int cdns_xspi_send_nor_pio_command(struct cdns_xspi_dev *cdns_xsp=
i,
> +					  struct spi_mem *mem,
> +					  const struct spi_mem_op *op)
> +{
> +	struct spi_nor *nor =3D spi_mem_get_drvdata(mem);
> +	u8 opcode =3D cdns_xspi_get_opcode(op);
> +	int ret;
> +
> +	if (!nor)
> +		goto use_stig;
[ ... ]
> +	if (!nor->mtd.size || !nor->mtd.writebufsize)
> +		goto use_stig;

[Severity: High]
If a device other than a SPI NOR flash (like spidev or at25) is bound to
the controller, could this cast cause an out-of-bounds memory access or
read garbage data when dereferencing nor->mtd.size?

[ ... ]
> +	if (opcode =3D=3D nor->erase_opcode && op->data.dir =3D=3D SPI_MEM_NO_D=
ATA) {
> +		if (nor->mtd.numeraseregions ||
> +		    !cdns_xspi_nor_helper_sequences_ready(cdns_xspi, nor))
> +			goto use_stig;
> +
> +		ret =3D cdns_xspi_nor_erase_seq_init(cdns_xspi, nor, op);
> +		if (ret =3D=3D -EOPNOTSUPP)
> +			goto use_stig;
> +		if (ret)
> +			return ret;
> +
> +		return cdns_xspi_pio_erase(cdns_xspi, op->addr.val);

[Severity: High]
Does this sector erase operation trigger the hardcoded
CDNS_XSPI_ACMD_TIMEOUT_MS limit?

Since CDNS_XSPI_ACMD_TIMEOUT_MS is 1000 (1 second), and standard
block/sector erases commonly take 2-3 seconds, will this cause the
operation to fail with -ETIMEDOUT and potentially wedge the controller?

> +	}
> +
> +use_stig:
> +	return cdns_xspi_send_stig_command(cdns_xspi, op,
> +					   op->data.dir !=3D SPI_MEM_NO_DATA);
> +}
> +
> +static int cdns_xspi_send_pio_command(struct cdns_xspi_dev *cdns_xspi,
> +				      struct spi_mem *mem,
> +				      const struct spi_mem_op *op)
> +{
> +	switch (cdns_xspi->flash_type) {
> +	case CDNS_XSPI_FLASH_TYPE_NAND:
> +		return cdns_xspi_send_nand_pio_command(cdns_xspi, mem, op);
> +
> +	case CDNS_XSPI_FLASH_TYPE_NOR:
> +		return cdns_xspi_send_nor_pio_command(cdns_xspi, mem, op);

[Severity: Medium]
Is this NOR ACMD path actually reachable during normal operation?

Looking at cdns_driver_data, the use_acmd flag defaults to false for
NOR. This causes cdns_xspi_probe() to fall back to CDNS_XSPI_WORK_MODE_STIG
mode, completely bypassing the ACMD logic introduced by this patch.

> +
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
[ ... ]
> @@ -1484,8 +1900,18 @@ static int cdns_xspi_adjust_mem_op_size(struct spi=
_mem *mem, struct spi_mem_op *
>  {
>  	struct cdns_xspi_dev *cdns_xspi =3D
>  		spi_controller_get_devdata(mem->spi->controller);
> +	size_t max_len =3D cdns_xspi->sdmasize;
> +
> +	if (cdns_xspi->work_mode =3D=3D CDNS_XSPI_WORK_MODE_ACMD) {
> +		if (cdns_xspi->acmd_info.initialized)
> +			max_len =3D min_t(size_t, max_len,
> +					cdns_xspi->dma_buf_len);

[Severity: Medium]
Could this locklessly read initialized =3D=3D true while observing a
stale dma_buf_len =3D=3D 0 due to a lack of memory barriers?

If Thread A writes initialized =3D true in cdns_xspi_nor_init() after
configuring dma_buf_len, and Thread B concurrently evaluates this check for
a different device outside the controller lock, the operation size could
be incorrectly clamped to 0 bytes.

> +		else if (cdns_xspi->flash_type =3D=3D CDNS_XSPI_FLASH_TYPE_NOR)
> +			max_len =3D min_t(size_t, max_len,
> +					CDNS_XSPI_NOR_DMA_BUF_SIZE);
> +	}
> =20
> -	op->data.nbytes =3D clamp_val(op->data.nbytes, 0, cdns_xspi->sdmasize);
> +	op->data.nbytes =3D min_t(size_t, op->data.nbytes, max_len);
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921093701.1341=
766-1-fei.xie@horizon.auto?part=3D4
