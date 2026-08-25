Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25E2352017
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 17:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787679053; cv=none; b=EMkWj5tuADDoh2DJj3Hqw5yXzOmozgh3q0b4Wf0v5phV0yIh4gd2VAHMj8TcKp6t/ZIhi1NfmaCKQolkzICwzQbPsi1kihqS6yRlRkSqXegHUcdXuIRTQQLc5KMXZLg+l/5ZwTZ2pk8nsyiikGs9uUOKbESkc/f1nQRNf/6smcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787679053; c=relaxed/simple;
	bh=HvHXDLLjeCVs9VuEN/pXzIV1l4ZlBITdHpQkfyG9ZN0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DtNDoRDDPrYB7YPJkFQnQwWsatocdcVxM+4/7neKC0VvdfbGGvc7yLfFsWaG54jZa0gBTRjqeOlWFtALYsoAqgV4V7BMJS8svs3siL4SmKvy7vWg6dt99AaZZ0AzeSjCvcIO3VtwdwyMUHlyX8WubK0I73UCgMN8k1WL2RSGmnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=St/nmvfF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="St/nmvfF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02FDF1F000E9;
	Tue, 25 Aug 2026 17:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787679045;
	bh=ZUWKSpwlnrX/InDRwIljvt/Y/MyB9TlPnCQuQDsIDf0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=St/nmvfFCTzDcT7Qx50oaQZpwA2UP8gmHtwtJafUSbljSMamvC3vvr1nBJ7eJbKRv
	 Z7mc6zGTy/y4V9Mp/l0Kno9W/5tx1wHlxiOQF4fFfnPNzBJoqJjdJUVs4AwNuW8szT
	 ozq76TdOr4crOm/angW6YUl4SqjzfveOKzmo/c3uxv6EOMGLe2UelUuAhpwazCcrq3
	 6K5Fs2olyZMno13cBh2/goUjAevaYA4fEX0Ll35VLGxjmlf3c6a3Q5t626Kc0oPlrF
	 krvmauk0VTywCNRIB+iwa/E4CkULV2eoIRVp7Yqgv9K2cfzQq1vXYGifKkJLsbKZWZ
	 5fEwvvdas2hnQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 04/18] spi: spi-mem: teach spi_mem_adjust_op_freq()
 about post-config ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: robh@kernel.org, "Richard Weinberger" <richard@nod.at>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, conor+dt@kernel.org, "Michael
 Walle" <mwalle@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Vignesh Raghavendra" <vigneshr@ti.com>, devicetree@vger.kernel.org
In-Reply-To: <20260825171737.776052-5-s-k6@ti.com>
References: <20260825171737.776052-1-s-k6@ti.com>
 <20260825171737.776052-5-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 17:30:44 +0000
Message-Id: <20260825173045.02FDF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Standard SPI memory operations are erroneously rejected on control=
lers lacking the `per_op_freq` capability if the device tree sets `post_con=
fig_max_speed_hz` equal to `max_speed_hz`.
- [Medium] `post_config_max_speed_hz` is not clamped to the controller's ma=
ximum speed limit, leading to incorrect theoretical operation duration esti=
mates.
--

commit 77b46afe94c20b6f95b9ec99806440ce9c5f6df0
Author: Santhosh Kumar K <s-k6@ti.com>

spi: spi-mem: teach spi_mem_adjust_op_freq() about post-config ops

This commit extends spi_mem_adjust_op_freq() with a bypass for post-config
ops and extends spi_mem_default_supports_op() to require the per_op_freq
controller capability for these operations.

> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index 5f973ebfb8b6e..cd4bc4c914e7f 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -206,7 +206,8 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
>  		return false;
> =20
>  	if (op->max_freq &&
> -	    op->max_freq < mem->spi->max_speed_hz) {
> +	    (op->max_freq < mem->spi->max_speed_hz ||
> +	     op->max_freq =3D=3D mem->spi->post_config_max_speed_hz)) {

[Severity: High]
Will this erroneously reject standard SPI memory operations on controllers
lacking the per_op_freq capability if the device tree sets
post_config_max_speed_hz equal to max_speed_hz?

If the device tree specifies a spi-max-post-config-frequency-hz identical to
spi-max-frequency, standard generic operations initially have op->max_freq =
=3D 0,
which spi_mem_adjust_op_freq() clamps to max_speed_hz.

Subsequently, spi_mem_default_supports_op() checks if
op->max_freq =3D=3D mem->spi->post_config_max_speed_hz to identify
post-configuration operations. When the max limits are equal, this condition
triggers for all standard operations, strictly demanding the per_op_freq
capability. Controllers without this capability will reject the standard
operations.

Does this overloaded use of the max_freq integer act as an operation type f=
lag
that leads to this conflict?

>  		if (!spi_mem_controller_is_capable(ctlr, per_op_freq))
>  			return false;
>  	}
> @@ -623,9 +624,18 @@ EXPORT_SYMBOL_GPL(spi_mem_adjust_op_size);
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
> +

[Severity: Medium]
Will this early return fail to clamp post_config_max_speed_hz to the
controller's maximum speed limit?

If the device tree specifies a spi-max-post-config-frequency-hz that exceeds
the SPI controller's absolute max_speed_hz, the post_config_max_speed_hz va=
lue
is left unbounded.

Because spi_mem_calc_op_duration() calculates time based on this unbounded
value, it could lead to incorrect theoretical operation duration estimates =
and
prefer operations that appear fast theoretically but are physically clamped=
 to
a slower speed later.

>  	if (!op->max_freq || op->max_freq > mem->spi->max_speed_hz)
>  		op->max_freq =3D mem->spi->max_speed_hz;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825171737.7760=
52-1-s-k6@ti.com?part=3D4
