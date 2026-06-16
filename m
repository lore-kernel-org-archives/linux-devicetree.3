Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3E83CC310
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 08:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781598848; cv=none; b=MAvhqxeIHfCPW3hGla7fHCFBQ97UxGK4U6g/XqHg1RxpOKuZVroOAT5XWZ2GHqSWEs8ua/W9kjNXi8Hy2Bwkq6glbg73VrtiN65at+YmZ/9ifYzjUpca2FQ2GgA9/jo11491XMrwbAmVGSw82hCXk1xzfKG7afUVDjFl7Fcd2KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781598848; c=relaxed/simple;
	bh=Cp8S7jFDzZz381IouAyHE2JbCtE38hMVMnp8eJjj1Tw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O+C6HKGRm4g7TKQ7aIf7xS1LKT5CMxZbx9Xz5Kcb0PrcOqr7bD7mTkAo6R8v3WYvnTcH7dM3GfYurw+MU1shmUHZOPCwB3d3xoj0XoZgDOpyqmvGLEVm5qy+IPj25Wmngm4/ppeLF2EcGp5ERBAW9MITBCKkRNcpjuHmQLLOByQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=frmIXn+y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="frmIXn+y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 987B21F000E9;
	Tue, 16 Jun 2026 08:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781598846;
	bh=on8rChG0OpK7Rm5zEKjU0JvcGw6KdqHyDjTyeCfvzBU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=frmIXn+y+VjVbai3SDztLTRgVi8tsPcA0JCEvHDcw+kbgjMFoOLB2k5rOFG8Mp6CZ
	 bcFqigAC2TcIKqYDgJ6F/z0OeiSrsdCOylIkGUEgU4LDYktdQz4AG08MfbMqyuE2o/
	 TRNHuoXUj3e0F5Yj7X60p0NW2AzHKTOT5FwgGyAOoMe+9HOP634qwSk0fhHDDPliZe
	 O3AQkMBdXJt+aiMX4t88s8iCUou7lZCRx5sBPsEsdYYNboXRTjmItN8lV/aCBGxrLw
	 Wgiu39b0vWIyQe2q4UnhLsJbHdUhJ9FCX/cKGCXltVIVEBwQuGNNNeevoCws59ifJw
	 9KsSmxsszdO2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 12/12] iio: dac: ad5686: add gain control support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260616-ad5686-new-features-v3-12-f829fb7e9262@analog.com>
References: <20260616-ad5686-new-features-v3-12-f829fb7e9262@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 08:34:06 +0000
Message-Id: <20260616083406.987B21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The GAIN GPIO is unconditionally requested as driven low, causin=
g a potential DAC output glitch during probe.
--

commit 2f56ef5391a1b46c707191ed6f4562758e4e5acc
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: dac: ad5686: add gain control support

This commit adds gain control support to the AD5686 DAC driver. It handles
gain multiplication either via an external hardware GAIN pin or through
internal control register bits, initializing the default scale based on
device properties.

> diff --git a/drivers/iio/dac/ad5686.c b/drivers/iio/dac/ad5686.c
> index 6ae788f665b4d..c186213a46f6d 100644
> --- a/drivers/iio/dac/ad5686.c
> +++ b/drivers/iio/dac/ad5686.c
[ ... ]
> @@ -579,6 +681,14 @@ int ad5686_probe(struct device *dev,
>  		return dev_err_probe(dev, PTR_ERR(st->ldac_gpio),
>  				     "Failed to get LDAC GPIO\n");
> =20
> +	st->gain_gpio =3D devm_gpiod_get_optional(dev, "gain", GPIOD_OUT_LOW);
> +	if (IS_ERR(st->gain_gpio))
> +		return dev_err_probe(dev, PTR_ERR(st->gain_gpio),
> +				     "Failed to get GAIN GPIO\n");
> +
> +	st->double_scale =3D device_property_read_bool(dev, "adi,range-double");

[Severity: Medium]
Could this cause an unwanted glitch on the analog output during probe?

If the system is warm-booted and the DAC is already outputting voltage with
a 2x gain, unconditionally forcing the gain pin low here will abruptly halve
the output voltage before the device is reset or the pin is corrected later=
 in
the probe sequence.

Would it be safer to read the adi,range-double property before requesting t=
he
GPIO, so that the pin can be initialized to its correct target state without
the temporary drop to 1x gain?

> +	ad5686_init_scale_avail(st);
> +
>  	reset_control_assert(rstc);
>  	fsleep(1); /* reset pulse: comfortably bigger than the spec */
>  	reset_control_deassert(rstc);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-ad5686-new=
-features-v3-0-f829fb7e9262@analog.com?part=3D12
