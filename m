Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334F54BC009
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 14:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321604; cv=none; b=dZxYwmoTWyBXpdYn2DErAIY3iB5kzO9fQSXaRvX49DOylQTRB263Nwsx4QLaIICdJnTHeUy6z03nOlGDZsq8vqNI0MZbZNx2f1WtwqgNklwZb9iAy2bqjIMCchWyYMrJgN72Ti5hFwZEBT+jyTSAyA5x6T2Qv0rgoDjRHZvGMWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321604; c=relaxed/simple;
	bh=lFRQTiZpXhyoqe7VRjJtZK0foYtWJtEvD6FDAtpImkM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hZ8vEnw1qkK+a0OVBDN64heH2xsztOFeVmhRIebQxTmHpyCnKjoKEKZbbpic3u6rZfHsK+cvjIvhWqP4NV3KMLEjmXTpLIkD3xZ8uOkbJlV+Pu8LDjEG9mP4zH1ehz4k+dNSS/xIG/IFMXm+V/36enfQCUU3Cf5UxCH5xXg4P+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y69oG8rG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y69oG8rG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7537E1F000E9;
	Fri, 21 Aug 2026 14:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787321603;
	bh=+iddaUZHdct9kdzL4gdzEBabUlHQkmBZHSgMxA5Ywv0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y69oG8rG0gAQcS63f/3Jdl4rmxaP46AsUYCdwKqd0fWISjgML43aQD07WZrdTk6Ih
	 VuZg1Rj1XsoDXuv63Xr+JK7qSDy9WnvAqKAdCHD5EnizEUxsPEQA3kGpFh/Y0FxH3N
	 61ldgUMj8sKLEemcf7oz0zSHK82v1z2nF6/JSLxVYgXLGcrKYq/pjYu3weFb8HsR6Q
	 LC8QHHRO3I5PErMU665E3mZISDCuK934p3Xrk0J4yjgOOlQ1lHDXxbrto9n+PTRoAA
	 HthgjJ7CBxA9ZqwnjPHMODlnwXIiunsKPlx6hvMzVh99d0CQ3JS1xImsjPKmhpq61R
	 OjDOWzAWxtHOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 16/18] mtd: spinand: negotiate optimal controller
 operating point before dirmap creation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: devicetree@vger.kernel.org, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Richard Weinberger" <richard@nod.at>, conor+dt@kernel.org, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, robh@kernel.org
In-Reply-To: <20260821114822.4040338-17-s-k6@ti.com>
References: <20260821114822.4040338-1-s-k6@ti.com>
 <20260821114822.4040338-17-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 14:13:21 +0000
Message-Id: <20260821141322.7537E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] `spinand_try_ranked_variant()` unconditionally overwrites `spinand=
->cont_read_possible`, bypassing SPI controller capability constraints.
- [Medium] Inconsistent tuning error handling in `spinand_optimize_controll=
er()` prevents ranked fallback when tuning fails.
--

--- Patch [16]: [PATCH v8 16/18] mtd: spinand: negotiate optimal controller=
 operating point before dirmap creation ---
commit 1ac90d4e8f96020586049b7af66688b1ba996146
Author: Santhosh Kumar K <s-k6@ti.com>

mtd: spinand: negotiate optimal controller operating point before dirmap cr=
eation

This commit negotiates the optimal SPI controller operating point before
creating dirmaps. It introduces spinand_optimize_controller() to evaluate
variants in descending performance order if the initial tuning attempt fail=
s.

> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index f839438a44ff2..cd353eb8b5374 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c

[ ... ]

> +static bool spinand_try_ranked_variant(struct spinand_device *spinand,
> +				       struct spi_mem *mem,
> +				       enum spinand_bus_interface iface,
> +				       u32 *tried_mask)
> +{
> +	const struct spinand_op_variants *variants =3D spinand->all_read_varian=
ts;
> +	struct spinand_mem_ops *templates =3D iface =3D=3D ODTR ?
> +		&spinand->odtr_op_templates : &spinand->ssdr_op_templates;
> +	const struct spi_mem_op *best;
> +	int ret;
> +
> +	if (!variants)
> +		return false;
> +
> +	while ((best =3D spinand_op_find_best_variant(spinand, variants, iface,
> +						    *tried_mask, NULL))) {
> +		*tried_mask |=3D BIT(best - variants->ops);
> +		spinand->max_read_op =3D *best;
> +		spinand->max_read_op.max_freq =3D 0;
> +		spinand->max_write_op.max_freq =3D 0;
> +		ret =3D spi_mem_execute_tuning(mem, &spinand->max_read_op,
> +					     &spinand->max_write_op);
> +		if (ret && ret !=3D -EOPNOTSUPP)
> +			dev_dbg(&mem->spi->dev, "%s optimization failed: %d\n",
> +				iface =3D=3D ODTR ? "ODTR" : "SSDR", ret);
> +		if (!ret && spinand->max_read_op.max_freq) {
> +			templates->read_cache =3D best;
> +			if (spinand->all_cont_read_variants) {
> +				templates->cont_read_cache =3D
> +					spinand_find_cont_read_variant(spinand, best, iface);
> +				spinand->cont_read_possible =3D
> +					!!templates->cont_read_cache;

[Severity: High]
Does this unconditionally overwrite spinand->cont_read_possible and bypass =
the
controller capability constraints evaluated earlier in
spinand_cont_read_init()?

Forcing continuous read on a SPI controller or ECC engine that does not
support maintaining chip select assertion across operations could cause the
controller to prematurely de-assert CS during a read. Could this lead to
corrupted data when a fallback variant is selected?

> +			}
> +			return true;
> +		}
> +	}
> +	return false;
> +}

[ ... ]

> +static void spinand_optimize_controller(struct spinand_device *spinand,
> +					struct spi_mem *mem)
> +{
> +	u32 tried_mask;
> +	int ret;
> +
> +	/* Skip entirely when no post-config target is configured. */
> +	if (!mem->spi->post_config_max_speed_hz)
> +		return;
> +
> +	spinand_reset_max_freq_ops(spinand, spinand->op_templates);
> +
> +	ret =3D spi_mem_execute_tuning(mem, &spinand->max_read_op,
> +				     &spinand->max_write_op);
> +	if (ret && ret !=3D -EOPNOTSUPP)
> +		dev_dbg(&mem->spi->dev, "Controller optimization failed: %d\n",
> +			ret);
> +
> +	/*
> +	 * Any non-zero return or a set max_freq means we are done (error,
> +	 * unsupported, or success). Fallback only for the op-specific "skip"
> +	 * signal: ret =3D=3D 0 with max_freq still 0.
> +	 */
> +	if (ret || spinand->max_read_op.max_freq)
> +		return;

[Severity: Medium]
Does this explicit early return abort the ranked fallback process if the
first tuning attempt returns an error (such as -EINVAL)?

In spinand_try_ranked_variant(), tuning errors on subsequent variants allow
the loop to continue falling back to slower variants. By aborting the fallb=
ack
process entirely here on the first error, does it leave the device operating
in the fastest mode at base frequency without tuning? Could this result in
unstable transfers and data corruption?

> +
> +	/* SSDR-only devices have no ranked ODTR fallback available. */
> +	if (spinand->bus_iface =3D=3D SSDR || !spinand->all_read_variants)
> +		return;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821114822.4040=
338-1-s-k6@ti.com?part=3D16
