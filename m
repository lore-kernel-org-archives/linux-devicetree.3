Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225953D6CCF
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 07:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781769213; cv=none; b=YxHD8iT6j8/gJ09Caf4AfDqaqyY98NkgcynITqdRBDT+qUF3ITcPXNTwD0NhWmHMCT8meiaEeBch3QKVl5GtDjvRmDL8zCNWWlla4AOLQ9PhOkTSz1K+DpnTtNqf9RUnsCqcdGOqZw07CkK3qTd+Dftg/N4kRgSZCUqfJxtHcW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781769213; c=relaxed/simple;
	bh=NyysQiiG9VsmvfHIRK7CyoqszlTzn6a5k96M8SJ4nRc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SJGh/w4c9Q3LvsYTytONpuQJ1myOU+hycXmONHTqjDSbo0Nj0YT6fYY0Jv+/RhH5orHGmEGVQBA+RZPNnMXHjMFVISX2EJSzuVQ4j4oao5etO8E+Gx2k/460H4jp1xhqdI7bZXp6nd2I2hy3eM0YRXyfU3jF910yePlkghfk+Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IenevB4t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IenevB4t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED831F000E9;
	Thu, 18 Jun 2026 07:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781769211;
	bh=T5cJrOU6A9FmqD+blXjtAj3ZTN4V8pnewXa191bVb1I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IenevB4teYEZm3w6IN1Cm9xPcVHzZrkURa4urqKm9tKzA1pAKe63PDaJNLvCPAaIR
	 S2LYU8L9PGEj5fu8qzLlgeMeOKep+qw1tNsrS1ZHTTSRHdoRqvMGNh8GPBjwoYAUuF
	 yzlU5PmDhKHJfNLXyN5hAx+99vt1ORRZUwCNlbPsDCcjBmcbwgwn/6cAPNx/Oi5ND0
	 rdSFTZLuj1EwbfH+lzvPMda1zxjGBhEPHlHR4yQp2qhrtr8kmt++bpiXvXTxTO+yu8
	 3P/q+frvhGDBTp3DjvPqUm7i9IOCO0ziLRTAg77kY4c+1z68JU6HvSZMJjRLAMfYqx
	 diiswNsvHk+pA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 12/16] spi: cadence-quadspi: enable PHY for indirect
 writes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260618073725.84733-13-s-k6@ti.com>
References: <20260618073725.84733-1-s-k6@ti.com>
 <20260618073725.84733-13-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 07:53:31 +0000
Message-Id: <20260618075331.6ED831F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Enabling PHY after starting the indirect write operation guarantee=
s a deadlock and hardware timeout, while the error path compounds the issue=
 with a secondary timeout.

Pre-existing issues:
- [High] Missing PHY disable cleanup when `cqspi_tune_phy(true)` fails duri=
ng direct read.
--

commit 58e38b1c2aa32f1b8542b6e43dd5365e97bd7dce
Author: Santhosh Kumar K <s-k6@ti.com>
Subject: spi: cadence-quadspi: enable PHY for indirect writes

Enable PHY for indirect writes of at least CQSPI_PHY_MIN_INDIRECT_WRITE_LEN
bytes. PHY is activated only when tuning completed successfully and the
write op runs at the calibrated post-config frequency, matching the same
frequency guard used by the read path.

Thread max_speed_hz from cqspi_mem_process() through cqspi_write() into
cqspi_indirect_write_execute() for the frequency check.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index 057381e56a7fd..f4cf97a909fc5 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c

[ ... ]

> @@ -1073,13 +1242,15 @@ static int cqspi_write_setup(struct cqspi_flash_p=
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

[ ... ]

> @@ -1115,6 +1286,18 @@ static int cqspi_indirect_write_execute(struct cqs=
pi_flash_pdata *f_pdata,
>  	if (cqspi->apb_ahb_hazard)
>  		readl(reg_base + CQSPI_REG_INDIRECTWR);
> =20
> +	/* Use PHY only for large writes at the calibrated rate */
> +	use_tuned_phy_write =3D n_tx >=3D CQSPI_PHY_MIN_INDIRECT_WRITE_LEN &&
> +			      f_pdata->use_tuned_phy &&
> +			      f_pdata->phy_write_op.max_freq =3D=3D
> +				      post_config_max_speed_hz;
> +
> +	if (use_tuned_phy_write) {
> +		ret =3D cqspi_tune_phy(f_pdata, true);
> +		if (ret)
> +			goto failwr;
> +	}

[Severity: High]
Does calling cqspi_tune_phy() here guarantee a timeout?

Since cqspi_tune_phy() internally calls cqspi_wait_idle(), and this is
executed after writing CQSPI_REG_INDIRECTWR_START_MASK to start the indirect
write controller, the controller is already busy waiting for data on the AHB
interface.

Will this cause cqspi_wait_idle() to deterministically poll for 500ms and
return -ETIMEDOUT?

>  	while (remaining > 0) {
>  		size_t write_words, mod_bytes;

[ ... ]

> @@ -1163,9 +1346,15 @@ static int cqspi_indirect_write_execute(struct cqs=
pi_flash_pdata *f_pdata,
> =20
>  	cqspi_wait_idle(cqspi);
> =20
> +	if (use_tuned_phy_write)
> +		cqspi_tune_phy(f_pdata, false);
> +
>  	return 0;
> =20
>  failwr:
> +	if (use_tuned_phy_write)
> +		cqspi_tune_phy(f_pdata, false);
> +

[Severity: High]
Could this error path cause a secondary timeout?

Since the indirect write operation is not yet canceled when cqspi_tune_phy()
is called, the controller is still busy.

When cqspi_tune_phy() calls cqspi_wait_idle(), wouldn't it time out again
for another 500ms before we write CQSPI_REG_INDIRECTWR_CANCEL_MASK below?

>  	/* Disable interrupt. */
>  	writel(0, reg_base + CQSPI_REG_IRQMASK);


This is a pre-existing issue, but I noticed a similar cleanup problem in
cqspi_direct_read_execute():

drivers/spi/spi-cadence-quadspi.c:cqspi_direct_read_execute() {
    ...
	if (len_aligned) {
		ret =3D cqspi_tune_phy(f_pdata, true);
		if (ret)
			return ret;
		ret =3D cqspi_direct_read_dma(f_pdata, buf, from_aligned,
					    len_aligned);
		cqspi_tune_phy(f_pdata, false);
    ...
}

[Severity: High]
If cqspi_tune_phy(f_pdata, true) fails, it returns directly without calling
cqspi_tune_phy(f_pdata, false).

Since cqspi_tune_phy(true) modifies the hardware state by enabling the PHY
in CQSPI_REG_CONFIG and decrementing the read dummy cycles in
CQSPI_REG_RD_INSTR before checking for idle, doesn't returning here leave
the QSPI controller with the PHY partially enabled and an incorrect number
of dummy cycles?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618073725.8473=
3-1-s-k6@ti.com?part=3D12
