Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D053346776
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 19:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784315695; cv=none; b=tOF8o5je9CS6SljP3q+oKmU8mpRUWaQnEC29HpgXKSeJZDaJvnVcUnlpFf1pYJn7NPo0koGwcTWbPrfQnI/dQQ/ES9ctwimixUWmIeAN88LEhnZFpiMxIvVgULUtTvgUIkyOfP1pPZFBKSYOXLa9/rZB06ytGhPQz7AcCLafv+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784315695; c=relaxed/simple;
	bh=2rzx/+ExjMfXYUtsOQEmUQagkmTBEZtUJzEu9V7OU3A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Te4ZfvQxTJ0qyZDuBa9wbTVJUz0HaMGCsD8bBouZ5ulnNuErWXvZ+jP5RmEwjct7u+uqILvQBa1QkBDISiOQ6L40G2H7wuE5rCvLup1Byot/zo4HNCh16qX7ViX9DGnYJ1buRRq2nIUR84k/JCPUsP/lHyfzyl/FJ4WGFu/olkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oLXphY1y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oLXphY1y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87B331F000E9;
	Fri, 17 Jul 2026 19:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784315693;
	bh=akO1FjXfE9wIq9jJwpoMRmu60PlmsWDrHu4OlYeSvF0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oLXphY1yWd9yomBmeC0Q07+1QmomU3pwpo1skBgI0KaV4qpGuVRP7GRSxyZJzXy6a
	 X5dWdOHihnnIPWNzEkl+hABl0JwJlLVCmoiRqHHg9M7c3G33BmyAKrGURLygopZvM+
	 hN+Y66TVQCBnJaVtwmTgMLAUwYlaPaurBNDMbC+BYp9U7ZoBMqmgZPNxAsgt4vct6o
	 B5deP56gSvULwgu3faTxDPPIyqI5m9haKVt0gXj3v3+yGYoQNgW4dl4eO5ObgVX1jk
	 wbWowkEkxKIxs5y94HuAOOyVwcvl73lZlnsOVyFeA41iL2NzuIUlE5KS+0Sodq2ixN
	 2t9EZXNItx0CQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 12/17] spi: cadence-quadspi: enable PHY for indirect
 writes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260717185116.2065505-13-s-k6@ti.com>
References: <20260717185116.2065505-1-s-k6@ti.com>
 <20260717185116.2065505-13-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 19:14:53 +0000
Message-Id: <20260717191453.87B331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] PHY tuning is incorrectly executed after the indirect write operat=
ion has been started, causing hardware hangs and a guaranteed timeout.
- [High] A failure during PHY enablement permanently corrupts the controlle=
r's dummy cycle configuration due to asymmetric error handling.
- [High] Restoring PHY state before canceling a pending indirect write caus=
es secondary timeouts in the error handler.
--

--- Patch [12]: [PATCH v5 12/17] spi: cadence-quadspi: enable PHY for indir=
ect writes ---
commit ee250e92bd8277b7a8635c4c209796570036798e
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: enable PHY for indirect writes

Enable PHY for indirect writes of at least CQSPI_PHY_MIN_INDIRECT_WRITE_LEN
bytes. PHY is activated only when tuning completed successfully and the
write op runs at the calibrated post-config frequency.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index 35a4000739449..542ad331ff167 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c
[ ... ]
> @@ -1377,6 +1381,18 @@ static int cqspi_indirect_write_execute(struct cqs=
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
> +

[Severity: High]
Does this execute PHY tuning after the indirect write operation has already
started? Modifying global controller configuration while an indirect
operation is active could violate hardware sequencing rules.=20

Since the controller is actively waiting for FIFO data, would the call chain
cqspi_tune_phy()->cqspi_wait_idle() time out and fail the write?

>  	while (remaining > 0) {
>  		size_t write_words, mod_bytes;
[ ... ]
> @@ -1425,9 +1441,15 @@ static int cqspi_indirect_write_execute(struct cqs=
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
If cqspi_tune_phy(f_pdata, true) fails to enable the PHY and returns an
error, it returns early and avoids decrementing the dummy cycle count.=20

Would jumping to failwr here and unconditionally calling
cqspi_tune_phy(f_pdata, false) end up incrementing the dummy cycle count
without a prior decrement? This could permanently corrupt the controller's
dummy cycle configuration for subsequent read operations.

[Severity: High]
Is cqspi_tune_phy() called here before the pending indirect write is cancel=
ed
in the error handler?=20

If cqspi_tune_phy() calls cqspi_wait_idle(), could this cause a secondary
timeout in the error handler since the indirect write hasn't been canceled
yet?

>  	/* Disable interrupt. */
>  	writel(0, reg_base + CQSPI_REG_IRQMASK);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717185116.2065=
505-1-s-k6@ti.com?part=3D12
