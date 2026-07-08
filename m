Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02EB34A78F
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783521935; cv=none; b=kN3uBvyjSw4GaPECXyUoKn6E1u+BsgSSw1HGRhWqnR+BDw1vFGYjvjmopfU5pPTLlHhVTwRzOPCRWykcgGmf18qkCPrNhub75Yi9nc/+7tB+MFXxF/RWr2X2YTvTa2JuQihUuymImRapDKJS6fIeEXSFWVe9c1VHZq27Ri9hmLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783521935; c=relaxed/simple;
	bh=lcHHhaTLMqh5lSM9CUI6bNtMfEFvrLAcWPWw8CASuWQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sNbmjaFXtcIOlt2BMmtqulefSLI7B8gn9PkYet0onxUaKOUAeSn138Z3I0e4tZ0pQ6ieBpkWXLn3lm/su7gdXZXmJJJSXn4LbqibBGM97ujhn4maAlAlYgaiRPBAxOGIZBZ3FwifpXULBBsK+yJpl0Be5JX0smgCXZkY++0sV2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Txsaa1Ob; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Txsaa1Ob"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE821F000E9;
	Wed,  8 Jul 2026 14:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783521934;
	bh=yVFjdnpGbbxtVEQBpzt8Fhr0sOOBSPAS0NYrZ+kYzKk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Txsaa1ObJUmsN0NfUmYrJXm14vdN3yL/cpfF8lgNrXqkGoMMsvh5bNr2etdOEnQPy
	 a4ViZRYfyKq0gyGPysR5wh4cn7MKsb7yEUXIl2Sy+Sg+3TjN+vA2mZ2o0DjDbhMcq2
	 qiAfAhAFxGpHT+2ZsijWB/b2NUe+yxE9+du2400pHxGxHKHLoLSf9ELcCZMdJLnhil
	 EtxbIertA4/nPU4tMAOPOnZuDNL1rwforChpLGRRC4ORvVFnObR2qFyhVtoTnGVD6I
	 ZIyjY8s+3YqqeIJabDakzp53aq5kIygdT6N+lbg5m+/u0yGX54MA2uFlgg4U9ezOuU
	 iEjG5UKMSoaVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] media: i2c: og0ve1b: Introduce per-sensor data
 structure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260708-og0va1b-v3-2-de8e44455a42@oss.qualcomm.com>
References: <20260708-og0va1b-v3-0-de8e44455a42@oss.qualcomm.com>
 <20260708-og0va1b-v3-2-de8e44455a42@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 14:45:33 +0000
Message-Id: <20260708144534.1DE821F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect evaluation of pm_runtime_get_if_active() return value le=
ads to unbalanced pm_runtime_put() and usage counter underflow when Runtime=
 PM is disabled.
--

--- Patch [2]: [PATCH v3 2/3] media: i2c: og0ve1b: Introduce per-sensor dat=
a structure ---
commit 7e9c88bb94dde2349f9f1531e2c8f8721c3dd997
Author: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

    media: i2c: og0ve1b: Introduce per-sensor data structure

    Refactor the driver to separate sensor-specific data from the common
    driver code. Introduce a sensor_data structure, populated through
    i2c_get_match_data(), to hold the chip ID, MCLK frequency, link
    frequencies and supported modes.

> diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
> index 84a28cdcade10..041342fbe3c82 100644
> --- a/drivers/media/i2c/og0ve1b.c
> +++ b/drivers/media/i2c/og0ve1b.c
[ ... ]
> @@ -273,11 +287,21 @@ static int og0ve1b_enable_test_pattern(struct og0ve=
1b *og0ve1b, u32 pattern)
>  	return cci_write(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP, val, NULL);
>  }
> =20
> +static const struct og0ve1b_sensor_data og0ve1b_data =3D {
> +	.chip_id =3D OG0VE1B_CHIP_ID,
> +	.mclk_freq =3D OG0VE1B_MCLK_FREQ_24MHZ,
> +	.enable_test_pattern =3D og0ve1b_enable_test_pattern,
> +	.link_freq_menu =3D og0ve1b_link_freq_menu,
> +	.num_link_freqs =3D ARRAY_SIZE(og0ve1b_link_freq_menu),
> +	.modes =3D og0ve1b_supported_modes,
> +	.num_modes =3D ARRAY_SIZE(og0ve1b_supported_modes),
> +};
> +
>  static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct og0ve1b *og0ve1b =3D container_of(ctrl->handler, struct og0ve1b,
>  					       ctrl_handler);
> -	const struct og0ve1b_mode *mode =3D &supported_modes[0];
> +	const struct og0ve1b_mode *mode =3D &og0ve1b->data->modes[0];
>  	s64 exposure_max;
>  	int ret;
> =20

[Severity: High]
This is a pre-existing issue, but does the pm_runtime_get_if_active()
check later in og0ve1b_set_ctrl() properly handle negative error codes?

The function currently checks the runtime PM state with:

	if (!pm_runtime_get_if_active(og0ve1b->dev))
		return 0;

If Runtime PM is disabled, pm_runtime_get_if_active() returns -EINVAL.
Since the logical NOT operator evaluates -EINVAL as false, the code
bypasses the early return and proceeds to the hardware accesses and the
pm_runtime_put() call at the end of the function.

Could this lead to usage counter underflows and unpowered hardware
accesses when the sensor isn't powered up? Should this be checked as
<=3D 0 instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-og0va1b-v3=
-0-de8e44455a42@oss.qualcomm.com?part=3D2
