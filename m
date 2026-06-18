Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEA831F9AB
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 08:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781769731; cv=none; b=h5Cw+Lwq+nrqmMb/bHpv9usNL6Qx0wgu+EjXEeqrD0SyjbU+63tFIkcmAtMwgFMh2S9Is9cSEHpnmbHL3H2eWuXzcCzGOKjS8dciXgi8DKAVirNtMr+pVWzFMysB/2ElyDEdJ6hG2N4r0LzL4ILFIbwSODkczKBZQShsDxWjTNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781769731; c=relaxed/simple;
	bh=xC9u81+Zovq36igvcJmANd0c4hcUrkGagdcNZPPcaBE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C8GdLqdjGwIipgsREwaWtTtxBrZH7gCItsqtKHtZiCGt3AIiAhXK+HxtuwGMN7ToM4bGHN+fUSwJ6fn3MJDIYLC0+isHAk+B4BGwi88BICdRUdwsOUXh+K523bCG+iNSffnIZ8GK2wERF5o1onqtL7a0YqlBS6tsTz/WmZfJ5Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NdLMHLMx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NdLMHLMx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5701E1F000E9;
	Thu, 18 Jun 2026 08:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781769729;
	bh=k7z67xJB1ZK6BlxA9YWvUL0R7ht0RIUe1VQHnqjRi0U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NdLMHLMxnOG0lBMCSEcmMjvtzl50+asPYdwVv328hjHKKypa7Czk9nSZRSRe2X5dF
	 VdVTD8YlQ2DfMa84jGKebWJCvbd5XX1EDXQazmNHckBE2A9zDv1pIdxA4jIbqXSRT1
	 2ZpzcHKtaTvaR8nWvA3hEJLZSdbhvZc6bgQDRvSuZVS8tyaOw/G+7KpTVDURol1vW/
	 1PcSp5AXJasVwEXqd3Wz8Ipeh+//T1KAjgpKHYC7evnk8Dm/W9AaHh1OUmpqq996oA
	 XYZSuPBpUrLmZ0F97jhRAbxFU7NmQpvzYe30+hlijBH+xG7NI6f5mCjtWMqg4/A6Ui
	 UW2RpLz7jrQHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 14/16] mtd: spinand: negotiate optimal PHY operating
 point before dirmap creation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260618073725.84733-15-s-k6@ti.com>
References: <20260618073725.84733-1-s-k6@ti.com>
 <20260618073725.84733-15-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 08:02:09 +0000
Message-Id: <20260618080209.5701E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] Fallback to SSDR during PHY tuning does not invalidate ODTR te=
mplates, causing a mode mismatch and persistent flash failure upon system r=
esume.
- [High] Fallback PHY tuning downgrades only the primary read operation, le=
aving write, update, and continuous read operations at their original unval=
idated high-speed variants.
- [High] Missing reset of `max_freq` on PHY tuning error paths and across t=
uning loops violates the zero-frequency invariant, leading to operations at=
 unvalidated frequencies.
--

commit 0f63572c37a35621b6ca824014ba943d4c511e93
Author: Santhosh Kumar K <s-k6@ti.com>
mtd: spinand: negotiate optimal PHY operating point before dirmap creation

This commit moves dirmap creation to spinand_probe() and introduces PHY
tuning negotiation before dirmaps are created. It iterates through DTR
and SDR variants in descending performance order to find the best PHY
operating point, and falls back to non-PHY modes on complete failure.

> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index b678d05342979..5dcfaabaf2cc5 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -1294,9 +1300,11 @@ static int spinand_create_dirmap(struct spinand_de=
vice *spinand,
>  	/* Read descriptor */
>  	info.primary_op_tmpl =3D *spinand->op_templates->read_cache;
>  	info.primary_op_tmpl.data.ecc =3D enable_ecc;
> +	info.primary_op_tmpl.max_freq =3D spinand->max_read_op.max_freq;
>  	if (secondary_op) {
>  		info.secondary_op_tmpl =3D *spinand->op_templates->cont_read_cache;
>  		info.secondary_op_tmpl.data.ecc =3D enable_ecc;
> +		info.secondary_op_tmpl.max_freq =3D spinand->max_read_op.max_freq;

[Severity: High]
When the fallback tuning negotiates a slower read variant, the read_cache
is updated but the cont_read_cache, update_cache, and write_cache are not
downgraded.

Does this result in the uncalibrated high-speed cont_read_cache and
update_cache variants being embedded into the dirmaps using the max_freq
of the downgraded read variant?

Could this lead to I/O failures or data corruption when the controller
executes these uncalibrated high-speed variants?

>  	}
>  	desc =3D spinand_create_rdesc(spinand, &info);

[ ... ]

> +static bool spinand_try_phy_ranked(struct spinand_device *spinand,
> +				   struct spi_mem *mem, bool odtr,
> +				   u32 *tried_mask)
> +{
> +	const struct spinand_op_variants *variants =3D spinand->phy_read_varian=
ts;
> +	const struct spi_mem_op *best;
> +	int ret;
> +
> +	if (!variants)
> +		return false;
> +
> +	while ((best =3D spinand_op_find_best(spinand, variants, odtr,
> +					    *tried_mask))) {
> +		*tried_mask |=3D BIT(best - variants->ops);
> +		spinand->max_read_op =3D *best;
> +		spinand->max_read_op.max_freq =3D 0;
> +		ret =3D spi_mem_execute_tuning(mem, &spinand->max_read_op,
> +					     &spinand->max_write_op);

[Severity: High]
The loop zeroes out spinand->max_read_op.max_freq before each iteration,
but it does not reset spinand->max_write_op.max_freq.

If spi_mem_execute_tuning() mutates max_write_op.max_freq before failing,
does this leaked non-zero frequency propagate to subsequent iterations?

> +		if (ret && ret !=3D -EOPNOTSUPP)
> +			dev_warn(&mem->spi->dev, "%s PHY tuning failed: %d\n",
> +				 odtr ? "ODTR" : "SSDR", ret);
> +		if (!ret && spinand->max_read_op.max_freq) {
> +			if (odtr)
> +				spinand->odtr_op_templates.read_cache =3D best;
> +			else
> +				spinand->ssdr_op_templates.read_cache =3D best;
> +			return true;
> +		}
> +	}
> +	return false;
> +}

[ ... ]

> +static void spinand_configure_phy(struct spinand_device *spinand,
> +				  struct spi_mem *mem)
> +{
> +	u32 tried_mask;
> +	int ret;
> +
> +	spinand_reset_max_ops(spinand, spinand->op_templates);
> +
> +	ret =3D spi_mem_execute_tuning(mem, &spinand->max_read_op,
> +				     &spinand->max_write_op);
> +	if (ret && ret !=3D -EOPNOTSUPP)
> +		dev_warn(&mem->spi->dev, "Failed to execute PHY tuning: %d\n",
> +			 ret);
> +
> +	/*
> +	 * Any non-zero return or a set max_freq means we are done (error,
> +	 * unsupported, or success). Fallback only for the op-specific "skip"
> +	 * signal: ret =3D=3D 0 with max_freq still 0.
> +	 */
> +	if (ret || spinand->max_read_op.max_freq)
> +		return;

[Severity: High]
If the initial tuning call fails and returns early here, does it leave the
potentially mutated max_write_op.max_freq without resetting it?

Could this leaked frequency be embedded into dirmap descriptors and cause
operations to run at unvalidated frequencies?

> +
> +	if (!mem->spi->post_config_max_speed_hz || spinand->bus_iface =3D=3D SS=
DR ||
> +	    !spinand->phy_read_variants)
> +		return;

[ ... ]

> +	/*
> +	 * Pass 2: switch to SSDR and try all SSDR variants in performance
> +	 * order.
> +	 *
> +	 * Only enter if we actually have SSDR support and a reconfigure
> +	 * callback. The hardware is still in ODTR mode here so no
> +	 * configure_chip call is needed to undo; just set up the ODTR non-PHY
> +	 * fallback and return.
> +	 */
> +	if (!spinand->ssdr_op_templates.read_cache ||
> +	    !spinand->ssdr_op_templates.write_cache ||
> +	    !spinand->configure_chip)
> +		goto use_odtr_non_phy;
> +
> +	if (spinand->configure_chip(spinand, SSDR))
> +		goto use_odtr_non_phy;
> +
> +	spinand->op_templates =3D &spinand->ssdr_op_templates;
> +	spinand->bus_iface =3D SSDR;
> +	spinand->max_write_op =3D *spinand->ssdr_op_templates.write_cache;
> +	spinand->max_write_op.max_freq =3D 0;

[Severity: Critical]
When dynamically falling back to SSDR mode, spinand->odtr_op_templates is
not cleared.

When the system resumes from suspend, spinand_configure_chip() uses the
uncleared ODTR templates to determine the mode:

    if (spinand->odtr_op_templates.read_cache &&
        spinand->odtr_op_templates.write_cache &&
        spinand->odtr_op_templates.update_cache)
        odtr =3D true;

Will this cause the flash chip to be incorrectly reconfigured back to ODTR
mode upon resume, while the statically created dirmaps still contain SSDR
commands?

Can this command desynchronization cause I/O failures after the device
resumes?

> +
> +	/*
> +	 * Only ODTR variants were candidates in Pass 1; SSDR bit positions
> +	 * are clear
> +	 */
> +	if (spinand_try_phy_ranked(spinand, mem, false, &tried_mask))
> +		return;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618073725.8473=
3-1-s-k6@ti.com?part=3D14
