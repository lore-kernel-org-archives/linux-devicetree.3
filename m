Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8302222D7B9
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 21:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778534155; cv=none; b=SixoqrMY+njh2Ee+F7NPFx6ckG6u3BZ5MCsP+Q4UFpTH4SFLTp9/ekdP0sXDHqVykQk+DrUttU98+k5s/gMAGX1vTZWcKKkxwdRDXA9G4NWzsXd4sqbYdk2WJdMMEh51A/wj+ZXhR1qT7Z+oF0kWHRS1UMt6UDR0vhGsSP8ELeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778534155; c=relaxed/simple;
	bh=UVl4yyIioXkujgYNcU/+aNsMlVpywOszcCokKko9v/I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZQHeygxEUEXDsCYaQavnhBxu6HhT+ss34rXYbXD03KCbeCO5EJ6ngG5VHwhHZQ9kcX8QpVhcVHBRydscZpmHHl6NvzqbgTF+lC8cw4b0Zs22+bLY4RmYNMd1tgo8tXehHFny9k+b936UMOykmCJ3c/i15Mssu6Ir2xhECVsgg5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yjn2C9Hf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yjn2C9Hf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE893C2BCB0;
	Mon, 11 May 2026 21:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778534155;
	bh=UVl4yyIioXkujgYNcU/+aNsMlVpywOszcCokKko9v/I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Yjn2C9HfLFZ3PrcNOO9XvtnL5l9yTm6t6K5C1cY6FDbzKLKo1zNG+/j6FnEZjJle1
	 Iy/RG/P9dT7ijpmGPZUhWu/A6eQABViCmR8nxnjb5gEnl3Pyn4tUraUcrIesOIFCof
	 4N9sYGKx5gKwtTrTNgO8nEXbRb1uZCXChSlwPVCSfSAvj0B1T75nqPeIXmCwYZEf3I
	 3k7VlWBH55ENVIL5LkRZAK8yYluAwwt72rFUfkjONhNJr2YCmGntbNXyyGyxLkgq5e
	 yw/jDqeK25xqc/LwSFwFJ7M/Mfp61QBNyZSWAywI3XAdVIwKcg+hLW0ZEtF0qOziO3
	 U4atIuLVYlemw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] iio: adc: sun20i-gpadc: add A523 gpadc support
Reply-To: sashiko@lists.linux.dev
To: "Michal Piekos" <michal.piekos@mmpsystems.pl>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260510-sunxi-a523-gpadc-v1-2-4f6b0f4000fb@mmpsystems.pl>
References: <20260510-sunxi-a523-gpadc-v1-2-4f6b0f4000fb@mmpsystems.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 21:15:54 +0000
Message-Id: <20260511211554.CE893C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing validation for 0 clocks returned by devm_clk_bulk_get_all_=
enabled() leading to a kernel panic on register access.
--

commit daf3632321b60ce8511b98ae1ad1e4b009e48e3c
Author: Michal Piekos <michal.piekos@mmpsystems.pl>

iio: adc: sun20i-gpadc: add A523 gpadc support

This commit adds support for the A523 gpadc by switching from a single
clock initialization to using devm_clk_bulk_get_all_enabled() to handle
both the bus and module clocks.

> diff --git a/drivers/iio/adc/sun20i-gpadc-iio.c b/drivers/iio/adc/sun20i-=
gpadc-iio.c
> index 861c14da75add..dd4c7e6e3d76e 100644
> --- a/drivers/iio/adc/sun20i-gpadc-iio.c
> +++ b/drivers/iio/adc/sun20i-gpadc-iio.c
[ ... ]
> @@ -205,9 +205,9 @@ static int sun20i_gpadc_probe(struct platform_device =
*pdev)
>  	if (IS_ERR(info->regs))
>  		return PTR_ERR(info->regs);
> =20
> -	clk =3D devm_clk_get_enabled(dev, NULL);
> -	if (IS_ERR(clk))
> -		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock\n"=
);
> +	ret =3D devm_clk_bulk_get_all_enabled(dev, &clks);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to enable clocks\n");

If the device tree node lacks clock definitions,
devm_clk_bulk_get_all_enabled() will return 0. Because this error handling
only checks for negative return values, could this allow the driver probe
to proceed with zero clocks enabled?

On Allwinner hardware, accessing the registers of an unclocked IP block
typically triggers a synchronous external abort or bus fault. If ret is 0,
the probe later performs a register write:

sun20i_gpadc_probe() {
    ...
	writel(FIELD_PREP(SUN20I_GPADC_CTRL_ADC_AUTOCALI_EN_MASK, 1) |
	       FIELD_PREP(SUN20I_GPADC_CTRL_WORK_MODE_MASK, SUN20I_GPADC_WORK_MODE=
_SINGLE),
	       info->regs + SUN20I_GPADC_CTRL);
    ...
}

Should we also verify that the number of clocks returned is greater than
zero to prevent a potential panic during the register configuration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-sunxi-a523=
-gpadc-v1-0-4f6b0f4000fb@mmpsystems.pl?part=3D2
