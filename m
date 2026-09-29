Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3514D39A800
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790664706; cv=none; b=dCzQneyTu4abgwnsJEIA1CS5j29kgwMY4wd3++ASEBNxtYOUppzJ9+hBz7QJnQifBf1LspEifmJBLPq6C2daNntCZAT5MLGZ0dMTNvO8kA59+fcZqjRIoIikmaNaHDouSCcDH62EOmBm4OIeByFKpfoqpoZ2eKcWSeq9r9LD/6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790664706; c=relaxed/simple;
	bh=gYbJamSe7xTbh2w5Nr1H+4QVmCxpsm9JEC2i7j0ggxc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=flcU+CqN7TznExt2MiGPLJq4sQcJtRtFXqnT+rumcB6Fo1riXMXgqra0MQAFOiYbxWtVYcBn+isfi5LUzQOB/K2YiyeXPyT9T9LOP+TjMOeW77tuC1kM01dPzHCn3MvKcUvIFNxkwuqm7LIt5Zok0L9yPaXf9akI4cMDNZoHBVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mJxokNYz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJxokNYz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D711F000FF;
	Tue, 29 Sep 2026 06:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790664704;
	bh=PcPw812IHhGWcF+nl/mty2gKpyykIs5mSXQMtH/Y1Fk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mJxokNYz4qc42sM0OBwCoPtatztNBF99Bkh+uDxhC4s/PbVHQyuQXa/SeQmtWP2l1
	 H8D1s3j5o8FmmHwIXVELmLNW7uzXjkSlqt7raUVQRlzZp/A8Ei/tzKAQO2u5G0qUx0
	 Nd4F4kPE3xMEMPr/Y094bpSE+OnBJv582Kn8bkUJf8P51SKJHc3sOuW4B6SqG/I4Me
	 lmNzAiftU7/jl4JCrCjxcRecw8t7DrWnSX5gcbXFAO3eJb+ymHCQw6DCneMWMK/G7V
	 R2FW9dP5wgEXtpWmdZVMC9vUy+b/2M/Qyg83pBur39w8g0nMweGs2nmQcyv31UVRbg
	 k18gFdvZ8Usxg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 04/19] spi: spi-mem: teach spi_mem_adjust_op_freq()
 about post-config ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260929063529.1235417-5-s-k6@ti.com>
References: <20260929063529.1235417-1-s-k6@ti.com>
 <20260929063529.1235417-5-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 06:51:44 +0000
Message-Id: <20260929065144.95D711F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] spi-mem: falsely rejects normal ops when max_speed_hz matches post=
_config speed
- [Medium] spi-mem: premature high-speed execution due to numerical frequen=
cy match
- [Medium] spi-mem: missing hardware limit clamp for post-config operations
--

commit 597934102ffdf54ebc8e13a8b68844c8afbc350b
Author: Santhosh Kumar K <s-k6@ti.com>

spi: spi-mem: teach spi_mem_adjust_op_freq() about post-config ops

This patch extends spi_mem_adjust_op_freq() to handle post-config
operations by adding a bypass when op->max_freq matches
post_config_max_speed_hz. It also updates spi_mem_default_supports_op()
to require per-op frequency switching capability for such ops.

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

[Severity: High]
Could this falsely reject standard operations if a board's Device Tree
configures spi-max-frequency and spi-max-post-config-frequency-hz to the
same value?

If post_config_max_speed_hz equals max_speed_hz, spi_mem_adjust_op_freq()
will set an untuned operation's max_freq to max_speed_hz. When
spi_mem_default_supports_op() checks this, it sees op->max_freq =3D=3D
mem->spi->post_config_max_speed_hz and strictly requires the per_op_freq
capability.

Controllers lacking per_op_freq would fail this check and reject standard
operations, even though the pre-config and post-config frequencies are iden=
tical
and no per-op frequency switching is actually needed.

[ ... ]

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
> +

[Severity: Medium]
Does this logic prematurely elevate standard untuned operations to run at h=
igh
post-config speeds just because their frequency happens to match numericall=
y?

Since spi->post_config_max_speed_hz is unconditionally populated from the
Device Tree during probe:

drivers/spi/spi.c:of_spi_parse_dt() {
    ...
	if (!of_property_read_u32(nc, "spi-max-post-config-frequency-hz", &value))
		spi->post_config_max_speed_hz =3D value;
    ...
}

If a standard untuned operation specifies a max_freq limit that
serendipitously matches the DT-populated value, it will be treated as a
post-config op and bypass the base-rate safety cap. Could this result in bus
failures or data corruption for unrelated ops?

[Severity: Medium]
Does this early return also miss a hardware limit clamp for post-config
operations?

Unlike standard max_speed_hz, post_config_max_speed_hz isn't clamped to
the controller's maximum supported hardware speed (ctlr->max_speed_hz) duri=
ng
device setup. If a misconfigured device tree specifies a
spi-max-post-config-frequency-hz that exceeds ctlr->max_speed_hz, this early
return bypasses the fallback clamping logic entirely. Could this cause the
hardware to receive a frequency request exceeding its absolute physical lim=
its?

>  	if (!op->max_freq || op->max_freq > mem->spi->max_speed_hz)
>  		op->max_freq =3D mem->spi->max_speed_hz;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929063529.1235=
417-1-s-k6@ti.com?part=3D4
