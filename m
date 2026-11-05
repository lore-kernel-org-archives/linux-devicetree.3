Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877857;
	b=d5jZRBaiTBdWrrJoyeGv9uZm7mYq+Cp9zODDihkHQf179EI6ATX6oit2otG1oVSkscUw
	 wcsTYu5R5MVpicR/MBYDfU32H2KmPJ9Mro6P2NUcRNwrN1gBwO0bhhsT7umic6Tc73iAM
	 M8AP6SS5RaYp0LsweD6cGHElIxPKVSvQoDpeKuw4JPQ+MBCbixmB5801YkcDhJBaYxYg/
	 g/M748ynPkTVY56L5e82YLrRh1QGg1tyw0Nx4OKoM2reHx7GB6GFvWI3VbqE3f/xPyLr9
	 2ViTXUQGbbK3BPkmZdTcsctwdF2UEbLRzX2M2xyqLBy8gpoZEgFbhNoq6J0sBpKPV1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877857;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2YI6RMQZB0W/UPBnilq8YC900utCDZtPN5nW3jVwPig=;
	b=y+n31JokvMm91n+cqZN49wlHqrh6H+0EcTfVW3s1v8pjBa9B3FRfRU4u4HH7cHaOQekR
	 Jyt6yED3kUgrEcRhOg13v4C7sssEjTR/+26tnrTtBR3Dq9PjQqBgFCJ245CIbrpgTIJLX
	 JbjEvQ7+944Mk94d9kC7DTb0D4iWk4is+QT6RXJ1P/rZCOPRRgK9x+EV2KqwQyZlfk9Sg
	 qAam+VNojUWl+HNJaDx4+QH3zZhpKc7AeRN02mJyIfvxbUEwaYl3jIGBSV59NRiJY/K+P
	 F7x7CnSqapKq/3CgvQ7CN3+hSFxsgY2D7oxhPwMPzhZrFc1zqK00jr+KgFu/YbmN4TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aixkZOD1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C9C606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 11:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aixkZOD1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520C31F000C1;
	Thu,  5 Nov 2026 11:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793877857;
	bh=2YI6RMQZB0W/UPBnilq8YC900utCDZtPN5nW3jVwPig=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aixkZOD1UV0ZCgG1jr9toasQDfYGkBCrvuKaINmmrbYQ4ti2+3jpI2HU2ehS6iHiP
	 E5AQy6yDpx8/SkSKlord/+VlPiqn4L5AnrzgKmm+AhPrFcxIlrPJu1zUyOs3iVvOWk
	 ErqFKuLv93iMbQqZLwrf3GG6DgckpmiyOaUyacIqrbWHS/4s2bb1q2wNZrUqAmFixO
	 9Z4bWCJpelCVNOav585vu+LQPjtPO/AYGqMYORyYdW7Zq9MIIWYYAhN4A7kvtSv+r2
	 NMtoVCb8TQAOrrPYph7YkCYMmNfSAhD7HdXQ0AdcOIywkgKPLkb3I4jk4QNr8bRJIq
	 xbXPGVYxrcUCQ==
Message-ID: <sashiko-outbox-198944@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 04/19] spi: spi-mem: teach spi_mem_adjust_op_freq()
 about post-config ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, praneeth@ti.com, sebin.francis@ti.com, u-kumar1@ti.com, srikanth.boyapally@amd.com, m-shah@ti.com
In-Reply-To: <20261105105832.2134313-5-s-k6@ti.com>
References: <20261105105832.2134313-1-s-k6@ti.com>
 <20261105105832.2134313-5-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 11:24:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] spi: spi-mem: false per_op_freq failure when post_config equals =
max_speed_hz
- [Medium] spi: spi-mem: spi_mem_adjust_op_freq() conflates max_freq with p=
ost-config
- [Medium] spi: spi-mem: missing controller max_speed_hz check for post-con=
fig ops
--

commit 69ed76e4edf90b58e3385f80fa249633f3ea7445
Author: Santhosh Kumar K <s-k6@ti.com>

spi: spi-mem: teach spi_mem_adjust_op_freq() about post-config ops

This commit extends spi_mem_adjust_op_freq() to bypass the max_speed_hz cap
when op->max_freq matches post_config_max_speed_hz, and updates
spi_mem_default_supports_op() to require the per_op_freq controller
capability for post-config operations.

> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index b94680b60af95..7916387a4f1d0 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -206,7 +206,8 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
>  		return false;
> =20
>  	if (op->max_freq &&
> -	    op->max_freq < mem->spi->max_speed_hz) {
> +	    (op->max_freq < mem->spi->max_speed_hz ||
> +	     op->max_freq =3D=3D mem->spi->post_config_max_speed_hz)) {
>  		if (!spi_mem_controller_is_capable(ctlr, per_op_freq))
>  			return false;
>  	}

[Severity: Medium]
As reported by Sashiko on v10 [1], what happens in
spi_mem_default_supports_op() when mem->spi->post_config_max_speed_hz equals
mem->spi->max_speed_hz on a controller that does not advertise per_op_freq =
in
ctlr->mem_caps?

Both spi_mem_supports_op() and spi_mem_exec_op() call
spi_mem_adjust_op_freq() before calling spi_mem_internal_supports_op() ->
spi_mem_default_supports_op(). For any standard untuned operation where
op->max_freq is 0 or exceeds mem->spi->max_speed_hz, spi_mem_adjust_op_freq=
()
sets:

	op->max_freq =3D mem->spi->max_speed_hz;

If spi-max-frequency and spi-max-post-config-frequency-hz are configured to
the same rate in Device Tree (or if __spi_setup() clamps spi->max_speed_hz =
to
ctlr->max_speed_hz matching post_config_max_speed_hz), then
op->max_freq =3D=3D mem->spi->post_config_max_speed_hz evaluates to true for
every operation even though op->max_freq is equal to the base rate
mem->spi->max_speed_hz and no per-op frequency switching is needed.

Wouldn't this cause spi_mem_default_supports_op() to reject all SPI memory
operations with -EOPNOTSUPP on controllers without per_op_freq, and would
checking op->max_freq !=3D mem->spi->max_speed_hz avoid this regression?

> @@ -627,9 +628,18 @@ EXPORT_SYMBOL_GPL(spi_mem_adjust_op_size);
>   * Some chips have per-op frequency limitations and must adapt the maxim=
um
>   * speed. This function allows SPI mem drivers to set @op->max_freq to t=
he
>   * maximum supported value.
> + *
> + * When @mem->spi->post_config_max_speed_hz is set, ops with @op->max_fr=
eq
> + * equal to that value are treated as post-configuration ops (e.g. PHY-t=
uned)
> + * and are allowed to run at the full post-config rate. All other ops are
> + * capped to @mem->spi->max_speed_hz, the always-reachable base rate.
>   */
>  void spi_mem_adjust_op_freq(struct spi_mem *mem, struct spi_mem_op *op)
>  {
> +	if (mem->spi->post_config_max_speed_hz &&
> +	    op->max_freq =3D=3D mem->spi->post_config_max_speed_hz)
> +		return;

[Severity: Medium]
As reported by Sashiko on v6 [2], can identifying post-configuration
operations in spi_mem_adjust_op_freq() purely by comparing
op->max_freq =3D=3D mem->spi->post_config_max_speed_hz conflate static data=
sheet
frequency limits with tuned post-config operations?

In drivers/spi/spi.c, of_spi_parse_dt() populates
spi->post_config_max_speed_hz unconditionally during Device Tree parsing,
before any SPI memory driver probes or runs controller tuning:

	if (!of_property_read_u32(nc, "spi-max-post-config-frequency-hz", &value))
		spi->post_config_max_speed_hz =3D value;

Meanwhile, flash drivers such as drivers/mtd/nand/spi/winbond.c define stat=
ic
op variant tables (e.g., read_cache_octal_variants) with non-zero datasheet
max_freq values alongside unrestricted variants with max_freq =3D=3D 0:

	SPINAND_PAGE_READ_FROM_CACHE_8D_8D_8D_OP(0, 24, NULL, 0, 120 * HZ_PER_MHZ),
	SPINAND_PAGE_READ_FROM_CACHE_8D_8D_8D_OP(0, 16, NULL, 0, 86 * HZ_PER_MHZ),
	SPINAND_PAGE_READ_FROM_CACHE_1S_1D_8D_OP(0, 3, NULL, 0, 120 * HZ_PER_MHZ),
	SPINAND_PAGE_READ_FROM_CACHE_1S_1D_8D_OP(0, 2, NULL, 0, 105 * HZ_PER_MHZ),
	SPINAND_PAGE_READ_FROM_CACHE_1S_8S_8S_OP(0, 20, NULL, 0, 0),

During initial chip detection in spinand_match_and_init() ->
spinand_select_op_variant() -> spinand_op_find_best_variant() in
drivers/mtd/nand/spi/core.c, each static variant is evaluated through
spi_mem_adjust_op_freq(), spi_mem_supports_op(), and
spi_mem_calc_op_duration() before tuning has occurred:

	spi_mem_adjust_op_freq(spinand->spimem, &op);

	if (!spi_mem_supports_op(spinand->spimem, &op))
		break;

	nbytes -=3D op.data.nbytes;

	op_duration_ns +=3D spi_mem_calc_op_duration(spinand->spimem, &op);

If a board configures spi-max-post-config-frequency-hz to a value that
happens to match a static variant's datasheet max_freq while
spi-max-frequency is set to a lower base rate, won't spi_mem_adjust_op_freq=
()
leave that variant uncapped while capping unrestricted variants (max_freq =
=3D=3D
0) and other frequency-limited variants to max_speed_hz? That can skew
spi_mem_calc_op_duration() into selecting a suboptimal variant, cause
spi_mem_default_supports_op() to reject matching variants on controllers
without per_op_freq, or allow an untuned op to execute at the post-config
rate before tuning has succeeded.

[Severity: Medium]
As reported by Sashiko on v10 [3], does returning early in
spi_mem_adjust_op_freq() when op->max_freq equals
mem->spi->post_config_max_speed_hz bypass the controller's hardware maximum
frequency limit (mem->spi->controller->max_speed_hz)?

In drivers/spi/spi.c, __spi_setup() clamps spi->max_speed_hz to
spi->controller->max_speed_hz:

	if (spi->controller->max_speed_hz &&
	    (!spi->max_speed_hz ||
	     spi->max_speed_hz > spi->controller->max_speed_hz))
		spi->max_speed_hz =3D spi->controller->max_speed_hz;

However, spi->post_config_max_speed_hz is never clamped to
spi->controller->max_speed_hz, and spi_mem_default_supports_op() only checks
mem->spi->controller->min_speed_hz:

	if (op->max_freq && mem->spi->controller->min_speed_hz &&
	    op->max_freq < mem->spi->controller->min_speed_hz)
		return false;

If spi-max-post-config-frequency-hz in Device Tree exceeds
mem->spi->controller->max_speed_hz, won't this early return pass an
op->max_freq above the controller's maximum supported speed to
spi_mem_supports_op(), spi_mem_calc_op_duration(), and
ctlr->mem_ops->exec_op()?

[1] https://lore.kernel.org/r/20260929063529.1235417-5-s-k6@ti.com
[2] https://lore.kernel.org/r/20260723113443.06C2D1F000E9@smtp.kernel.org
[3] https://lore.kernel.org/r/20260929063529.1235417-5-s-k6@ti.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105105832.2134=
313-1-s-k6@ti.com?part=3D4
