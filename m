Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4977340D9D
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 17:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787679186; cv=none; b=Azr+Wy7/uSGtD+jaiD3iHz5lUdenIrXhiQpo7TvV8xOkLEstc/N1UkxdggLOaP1G0ez9Mfv9zRX87tEuU8n9Euzpe8ckZdsl+YNE3wwjIuA+cXsopfjRC2QTlig4Sfxh1kfbwOh8apUhhtubDHVxtsnwkom10qppkVN35ymnOsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787679186; c=relaxed/simple;
	bh=ra3X+fMppIOXTGakwbsyivyJzRtJ3/G9A5Ft3K2EcUs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZbIF7C2SiANz22/D7yqsOAS1RR4Zg3Ni6Fiw+WiOJOw5HUI/9qTFnY7DNBeX+fMfz9LSO5TRbzX+sviJZDZcMWREmmW5+sm9JQRw0+OUEcrAC9/cBH5uTSUgUHetGzoPQFDFGkmJ79hOn73FrHOMKVrOIpPFVbY0H3Ku3y1iIB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nfU5LymF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nfU5LymF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD6791F000E9;
	Tue, 25 Aug 2026 17:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787679179;
	bh=l3u5d4aQNlvNraScxa3nedErTsjHQzi/9PCeVAa++LQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nfU5LymFhWgBxJNepl/vssq6wNX+H7XQg9/AFYBJdIzFudwpl2ljlPoG/BQEJzPZA
	 RJcMsTzv6tCayjfsuHOkkc04nli5DAl9D6wQ7LOMBo4xdiRla5AGYDLX1sa3dNDAMI
	 jh8qXTrdACtSLm4fB/bBf97rofdNSuNdgIK6emE1gnkIExjFoQv+5AJ0X9hwnMDcMx
	 nER9dSCf0q9R/iARcRRyHmRzPzuxV/ufxTwBTTe7hHqfWQrIru6d5xm21qbWTCPqTY
	 5eHdLOl1BTihezq9jU0lKC2i2qJ/Mv+QbHQkhpluvS0Q0SS+gtTr/AxzHcxkqFPdlY
	 +X3jqVXixEFvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 12/18] spi: cadence-quadspi: enable PHY for indirect
 writes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Michael Walle" <mwalle@kernel.org>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, robh@kernel.org, conor+dt@kernel.org, "Richard
 Weinberger" <richard@nod.at>, "Pratyush Yadav" <pratyush@kernel.org>, devicetree@vger.kernel.org
In-Reply-To: <20260825171737.776052-13-s-k6@ti.com>
References: <20260825171737.776052-1-s-k6@ti.com>
 <20260825171737.776052-13-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 17:32:58 +0000
Message-Id: <20260825173258.DD6791F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing verification of the current operation frequency (`op->max_=
freq`) against the calibrated PHY frequency, potentially causing the PHY to=
 be incorrectly enabled for uncalibrated writes.
--

commit f08af848763cec6062f2de1a309900c45e4f895a
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: enable PHY for indirect writes

This commit enables PHY for indirect writes of at least 1KB, restricting
PHY writes to NAND devices where a write op template was provided. It also
cancels the indirect write before disabling PHY in the error path to avoid
timeouts while the controller is still waiting for AHB data.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index d38a0253e4bda..20ece785c97a4 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c

[ ... ]

> @@ -1370,18 +1372,32 @@ static int cqspi_write_setup(struct cqspi_flash_p=
data *f_pdata,
> =20
>  static int cqspi_indirect_write_execute(struct cqspi_flash_pdata *f_pdat=
a,
>  					loff_t to_addr, const u8 *txbuf,
> -					const size_t n_tx)
> +					const size_t n_tx,
> +					u32 post_config_max_speed_hz)
>  {
>  	struct cqspi_st *cqspi =3D f_pdata->cqspi;
>  	struct device *dev =3D &cqspi->pdev->dev;
>  	void __iomem *reg_base =3D cqspi->iobase;
>  	unsigned int remaining =3D n_tx;
>  	unsigned int write_bytes;
> +	bool use_tuned_phy_write;
>  	int ret;
> =20
>  	if (!refcount_read(&cqspi->refcount))
>  		return -ENODEV;
> =20
> +	/* Use PHY only for large writes at the calibrated rate */
> +	use_tuned_phy_write =3D n_tx >=3D CQSPI_PHY_MIN_INDIRECT_WRITE_LEN &&
> +			      f_pdata->use_tuned_phy &&
> +			      f_pdata->phy_write_op.max_freq =3D=3D
> +				      post_config_max_speed_hz;

[Severity: High]
Does this logic correctly handle operations where the command-specific speed
limit (op->max_freq) is lower than post_config_max_speed_hz?

If a large indirect write is executed with an op->max_freq less than
post_config_max_speed_hz, the hardware clock will be lowered to op->max_fre=
q.
However, this condition only checks the controller's post-configuration
maximum speed against the calibrated PHY frequency, completely omitting a
check against the actual frequency of the current SPI operation.

Could this lead to the PHY being incorrectly enabled using high-speed DLL
tuning values while operating at a lower clock speed? Applying DLL delay
values calibrated for a high clock speed to a lower clock speed could cause
the PHY data transmission eye to shift, potentially leading to incorrect
sampling and silent data corruption on flash writes.

The read path explicitly validates op->max_freq via cqspi_use_tuned_phy(),
should the write path perform a similar validation before enabling the PHY?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825171737.7760=
52-1-s-k6@ti.com?part=3D12
