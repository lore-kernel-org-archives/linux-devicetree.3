Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4F730648A
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781505171; cv=none; b=Q9XN0p3jsDhoc24Gxc7yYt+OBImzODjHpibbF6otDOSDI3YZLwuqGV91uweoDfoq9G8Ae4bAUrRlVDOsdhrZm39W5ekVZCvbHBryMQfO24d58HdisUwIqPY1+COxNPu4fn5vqCxt4S9pKyBqGWS+1o6DjcZSwBRp9y7wi2aSzU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781505171; c=relaxed/simple;
	bh=i7VluU/3qkhYqgv7iDvWcuIMGbZZwZtOnNpKKgjpkmc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UrBIr6kqL8xQRVajxC7xbrxtdSH3+3KG4/9QWnTU2dzEaW9GzQ8jjV1xTmiwa39h0WTEfyCTBPKp0opgj8Gkmw5PzE/CEQPh8dLffvJoZLJcReIWv3q2Sn3hVoZJKLsKMr1dFpGnNJib7MfGHs8ROxh+FgZcLAsB1mYLtlOkxDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RNToIshC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RNToIshC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C97A1F000E9;
	Mon, 15 Jun 2026 06:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781505170;
	bh=x4rTlq7L6SbF4qGk/fgIEJ2sItYkyhjCZzBoumx0bH0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RNToIshCn3l3Ms8X+OEn48UhAFfAHsoUOCQZV9sdGFJV86RpiokPrbA6KomzUPUty
	 +LXVDdXCsHB1FxJPUqeJg82zobttUewvl/41GZdGPNn3L9FruwId4DIB0LZ8BW/CbF
	 PXHpvlbXzzFyNbecaVxwVoFimZ4aei0Uyxtull4aMG9LTSnZrIEJU6e0/9LnfZi7bO
	 zUAweMMwoyCa6JTY+pjYB1qrpOjJJ9Z2jkSxLH0xUiEupnnHnvz1aMVuipJsXNuSYc
	 0vpFyL1MpoUqG5HaCWfUSRllRk8nyP5lETAgpmKEJL8bPWnUaAS5Yp5VwMrDH9yjZ/
	 cEk3a8A9Q+bMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] iio: ABI: add DAC 10kohm_to_gnd powerdown mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kim Seer Paller" <kimseer.paller@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615-iio-ad3532r-support-v2-2-84a0af8b83fa@analog.com>
References: <20260615-iio-ad3532r-support-v2-2-84a0af8b83fa@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 06:32:49 +0000
Message-Id: <20260615063250.0C97A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Duplicate field initialization in the `ad3530r_chip` structure.
--

commit 2528c529a11e7b49d5cde3c0238451d59c5f698b
Author: Kim Seer Paller <kimseer.paller@analog.com>

iio: dac: ad3530r: Refactor setup to table-driven register bank approach

Replace direct register calls in ad3530r_setup() with per-chip register
address arrays and bank helpers. Convert sw_ldac_trig_reg from a static
register address to a function pointer for per-bank LDAC trigger register
selection.

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
> +	.interface_config_a =3D ad3530r_if_config,
> +	.output_control =3D ad3530r_out_ctrl,
> +	.reference_control =3D ad3530r_ref_ctrl,
> +	.op_mode =3D ad3530r_op_mode,
> +	.num_banks =3D ARRAY_SIZE(ad3530r_if_config),
> +	.num_op_mode_regs =3D ARRAY_SIZE(ad3530r_op_mode),
>  	.input_ch_reg =3D ad3530r_input_ch_reg,
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: Low]
Is this duplicate initialization intended? It looks like .input_ch_reg is
initialized twice in the ad3530r_chip structure, once in the newly added
lines and again here.

>  	.internal_ref_support =3D true,
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615-iio-ad3532=
r-support-v2-0-84a0af8b83fa@analog.com?part=3D2
