Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D7528541A
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781505203; cv=none; b=lt9PAjYnT5ru4A6voqHBEGQILz2a/nghQ5w1+ITbQIi5RMLQbGMeamawG+E7bumHhPrGwwUryfUs+ayOoDERllY7DytKm2YC6yRH64wzo0VTs2cSzxqDKyWilnGtNRKvJNPERgLKctxXRrAojSQ3FLuU1EMF0aYCBh8xu/I87qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781505203; c=relaxed/simple;
	bh=nzO2zgyt9J+x11p32VUmgb54uNujxbZuMjjY90xiVQw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IWj1ShgVUMIIh2K/+BZuoFkXvfgE4e7KvANA9BEV+nxsRsawAWqG6RUnpO9QPlot5qeKzihSjNqYnESi8QocIc/r8ETS+S0vnE63HoXedYHsaYcfwJDlZHV9tqkyFY9naqyRu11KewgSR+usqZRyMC331SF9zrOfJCT2AbI3Cz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSO9daLV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSO9daLV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D12091F000E9;
	Mon, 15 Jun 2026 06:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781505202;
	bh=Sx7iz8jFx4o/z70sjukhDvOyVkCcR2lJqbus2U/QkeE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cSO9daLVYqULnfhp2AmnFcNrjTxHPcA48Pauu4q2+EOyMI6q4+w618zhKmCJpVbXt
	 BixYlErmXpLfSofaVpQbR4Evp9o44YMLGE4vD1KzR+01YyVn4uwIYW7GTgQ478J7yQ
	 Zs5WePag1vX8QtThiKS9NzORg247iNGwxsAbXx5c/4kTdIYRi3gpX/QhZJ98ZZDuAu
	 dO7GqHFmPnmyTHcVX3LyCVR2NuBvAo8Ekp0XwtGIy7bLIoL1UCFDgLsfh8g50VXkJt
	 gXY9Y4fm5MUyZJKAe0suXFeIdH68rRtwjM7dGDSRisZKf+i+T9pXix5rEiQgcuX2Em
	 lTGJ5Uf0Um2Xw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: iio: dac: add support for
 AD3532R/AD3532
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kim Seer Paller" <kimseer.paller@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615-iio-ad3532r-support-v2-3-84a0af8b83fa@analog.com>
References: <20260615-iio-ad3532r-support-v2-3-84a0af8b83fa@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 06:33:21 +0000
Message-Id: <20260615063321.D12091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `ad3530r_chip` struct initialization redundantly initializes `.=
input_ch_reg` twice.
--

commit 2528c529a11e7b49d5cde3c0238451d59c5f698b
Author: Kim Seer Paller <kimseer.paller@analog.com>

iio: dac: ad3530r: Refactor setup to table-driven register bank approach

Replace direct register calls in ad3530r_setup() with per-chip register
address arrays and bank helpers. Convert sw_ldac_trig_reg from a static
register address to a function pointer for per-bank LDAC trigger
register selection. Switch spi_device_id to named initializers.

> diff --git a/drivers/iio/dac/ad3530r.c b/drivers/iio/dac/ad3530r.c
> index d9db3226ecd64..e4346bc729ba5 100644
> --- a/drivers/iio/dac/ad3530r.c
> +++ b/drivers/iio/dac/ad3530r.c

[ ... ]

> @@ -344,7 +387,14 @@ static const struct ad3530r_chip_info ad3530r_chip =
=3D {
>  	.name =3D "ad3530r",
>  	.channels =3D ad3530r_channels,
>  	.num_channels =3D ARRAY_SIZE(ad3530r_channels),
> -	.sw_ldac_trig_reg =3D AD3530R_SW_LDAC_TRIG_A,
> +	.sw_ldac_trig_reg =3D ad3530r_trigger_sw_ldac_reg,
> +	.input_ch_reg =3D ad3530r_input_ch_reg,
        ^^^^^^^^^^^^^

[Severity: Low]
Is .input_ch_reg redundantly initialized here?  It looks like .input_ch_reg
is also assigned just a few lines down in this struct.

> +	.interface_config_a =3D ad3530r_if_config,
> +	.output_control =3D ad3530r_out_ctrl,
> +	.reference_control =3D ad3530r_ref_ctrl,
> +	.op_mode =3D ad3530r_op_mode,
> +	.num_banks =3D ARRAY_SIZE(ad3530r_if_config),
> +	.num_op_mode_regs =3D ARRAY_SIZE(ad3530r_op_mode),
>  	.input_ch_reg =3D ad3530r_input_ch_reg,
>  	.internal_ref_support =3D true,
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615-iio-ad3532=
r-support-v2-0-84a0af8b83fa@analog.com?part=3D3
