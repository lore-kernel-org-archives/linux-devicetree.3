Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E6F3D34A8
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 18:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779906737; cv=none; b=IknTEobsTAiR5OFm2N0Lf+ZgVwTzDiL4dZgbXE1J0aA2iF8oJaAtzjFhFekGQ7cEDU9bfKutmRsH4jP0eEv8xjDnj1JvAYROhPfYukqe52lsXSHoeuyviIeChEpowhfY5gWCK4KAY3725+pqSrnX19jMnwIyZ7iODOdbJgc9SAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779906737; c=relaxed/simple;
	bh=WdLXc1angYmF2GSRqD4+aGpCbiu54UylJTtxGgTLQ18=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ExT+a/sA4AWsunFUhGP8e+ZmTm2haSbnKgE7q+VUxOYVrNdbETh48z6SfaUdWXcZt8tICYzavxbjGaUXd8o9lDRnOTAkUGdsErHOhC/56zqhUNphnu09FAc0Rr/ASaMiH0nXMUMB25kP3/cCcY/wUKD0gyKRj6AukQX8dumn7y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jrglx1E+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jrglx1E+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EFBA1F00A3D;
	Wed, 27 May 2026 18:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779906733;
	bh=pdv+kJrzj8X+3RKoczn7WABhHyVJL83X0NlzhlAWkiQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jrglx1E+6QUDvh1a9RxSEhNbScBDOvc62HWwq3mUBAl4EANMaWgcI9JTySywXDAT7
	 uiP3gid/yYqHWlGqh9y5b9dpDZNbzsg4ybYjIKSoKS0AMckyiLUIf94JhgOo4diHxR
	 SRDdfRhCFs927/JrcXgOZ4YBHxurBjGXfts8HvNE27M1dSHdOWVIYUkPxuArw9Vrtw
	 pWbnEHOqiBQrDjbBELej3F/VwVCjhudRorNR9M+z8iL0Tnu0eRCKH6MpmEqVEsjnMa
	 X0dzo/g9yf1bJ/LobYbMhEJZlb4nm/tMq9q4giKJJt76XO4f4joMRfGlC2hpag2Twl
	 EROVxFwJx0/tg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/13] spi: spi-mem: add
 spi_mem_apply_base_freq_cap()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260527175527.2247679-5-s-k6@ti.com>
References: <20260527175527.2247679-5-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 18:32:12 +0000
Message-Id: <20260527183213.0EFBA1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] The base frequency cap is omitted from validation, duration ca=
lculation, and native execution paths, leading to bypassed limits and incon=
sistent behavior.
- [High] spi_mem_apply_base_freq_cap() incorrectly overrides explicitly req=
uested intermediate frequencies, heavily throttling them to the base speed.
--

commit 6ec1a9a4c4cab8ccebd526a9ea576bc96e8ba16e
Author: Santhosh Kumar K <s-k6@ti.com>

spi: spi-mem: add spi_mem_apply_base_freq_cap()

This patch introduces spi_mem_apply_base_freq_cap() to cap operation
frequencies to a conservative base speed when they are not explicitly
configured for maximum speed. It aims to prevent unconfigured operations
from being silently raised to the device's maximum speed.

> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index f64eda9bbd9f0..37d10c4e614b2 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -391,7 +391,11 @@ int spi_mem_exec_op(struct spi_mem *mem, const struc=
t spi_mem_op *op)
>  	u8 *tmpbuf;
>  	int ret;
> =20
> -	/* Make sure the operation frequency is correct before going futher */
> +	/*
> +	 * Ops not configured for maximum speed are limited to the conservative
> +	 * base speed; spi_mem_adjust_op_freq() then caps to the device maximum.
> +	 */
> +	spi_mem_apply_base_freq_cap(mem, (struct spi_mem_op *)op);

[Severity: Critical]
Are we omitting the base frequency cap from validation, duration calculatio=
n,
and native execution paths, which could lead to bypassed limits and
inconsistent behavior?

For instance, spi_mem_supports_op() evaluates templates during initializati=
on
and mutates their max_freq to max_speed_hz, which modifies the underlying
static .data arrays. When these mutated ops are later executed, the equality
check op->max_freq =3D=3D max_speed_hz evaluates as true and bypasses the c=
ap
entirely before phy tuning occurs.

Native direct mapping paths like dirmap_read or dirmap_write completely byp=
ass
spi_mem_exec_op(). The spi_mem_dirmap_create() function uses
spi_mem_adjust_op_freq(), locking templates to max_speed_hz without applying
the base cap. This causes untuned reads to run at uncapped maximum speeds.

Also, spi_mem_calc_op_duration() calculates timeouts based on max_speed_hz
instead of applying the base cap. This drastically underestimates the durat=
ion
for operations actually executed at base_speed_hz, potentially causing
premature timeouts.

[ ... ]

> @@ -592,6 +596,26 @@ void spi_mem_adjust_op_freq(struct spi_mem *mem, str=
uct spi_mem_op *op)
>  }
>  EXPORT_SYMBOL_GPL(spi_mem_adjust_op_freq);
> =20
> +/**
> + * spi_mem_apply_base_freq_cap() - Enforce the conservative base speed f=
or
> + *				   operations that are not explicitly validated
> + * @mem: the SPI memory
> + * @op: the operation to adjust
> + *
> + * When @mem->spi->base_speed_hz is non-zero, caps @op->max_freq to that
> + * value unless @op->max_freq is already set to @mem->spi->max_speed_hz,
> + * which signals the operation has been configured for max-speed use.
> + */
> +void spi_mem_apply_base_freq_cap(struct spi_mem *mem, struct spi_mem_op =
*op)
> +{
> +	if (!mem->spi->base_speed_hz || op->max_freq =3D=3D mem->spi->max_speed=
_hz)
> +		return;
> +
> +	if (!op->max_freq || op->max_freq > mem->spi->base_speed_hz)
> +		op->max_freq =3D mem->spi->base_speed_hz;

[Severity: High]
Could this logic unintentionally override explicitly requested intermediate
frequencies, heavily throttling them to the base speed?

If a driver intentionally limits specific operations to a safe intermediate
frequency, such as 86 MHz for read_cache_octal_variants in the Winbond
driver, the exact equality check for max_speed_hz will fail.

If base_speed_hz < op->max_freq < max_speed_hz, this function will discard
the driver's intentional constraint, aggressively downgrading op->max_freq
to base_speed_hz even after phy tuning.

Would it be better to apply the cap only to unconfigured operations where
op->max_freq =3D=3D 0?

> +}
> +EXPORT_SYMBOL_GPL(spi_mem_apply_base_freq_cap);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527175527.2247=
679-1-s-k6@ti.com?part=3D4
