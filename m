Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DD53B7B91
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 10:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783074206; cv=none; b=jP6ffJWVFgdOuSLk2EsFRTQlBUut3+GkdVLI9PDa4aJut853CpYMzikoKpN6NnFN1lCg9MZxnoZbIGPnijqfRkWitw6xCryVoXtg/OfDOung7/JeLZMPOGnqRXMLtj3Vdq98CNsJXqKDCzFu01UKOnM4iZxPd1ynfcw0gISZWrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783074206; c=relaxed/simple;
	bh=f3UD53QA++4gf/j8StYZwjebBR6id0nxpbS1ZRGMd/k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OyDSygd1orGMy+AB2bMot/aEGGFPOIXg84kBVCaaH5NS3bNr3gsmgJxNuHM6dVwtaxT1LxTnBWiwyLaPENXV9gNCbs6tEO8kQJiv+c1mxNpYr8YpaUSe1EUsgSoYU101cKQRpG0EW/ZNPtblaKb7LutoYyz/jsQdBWs6PonZQPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eDcEzzZT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eDcEzzZT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A096F1F000E9;
	Fri,  3 Jul 2026 10:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783074204;
	bh=U9pxc6lX1FrYwUS/7AXcDjWsHF2OclLB8U2SfgVkzsE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eDcEzzZT29NNvFURgarFLspsZ3a5wGzPZxx/kignmJKHeqotwm8r54WaCtai4renG
	 wCRKEPtc8JhRzf3G0z+smiuRqFob43mF/wiNs1QsVDjJJhV2A9qeZYEwpr7nBAGMGy
	 BYKZgFw6d/jfUOJjpGcW3+2xcPXnzmTn0SrTupRUVVKNz403GsE54a7hWL8dO+Mw9m
	 grUiEqWPYhhDM0J7XRqCycYzsvB0mjniOtmqEPf+lskdIRDtPyWmWu+vfGh1h9tpKG
	 lYErVMgw2AeVt0ynsSJF9wp38DKVjjGhLYJsjNEQ/4AQ8/izk08UnIYPP18D0LGTS0
	 fTI2o7fAQjfyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/6] iio: dac: ad3530r: Convert sw_ldac_trig_reg to a
 function pointer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kim Seer Paller" <kimseer.paller@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260703-iio-ad3532r-support-v4-3-69d9a336f4e8@analog.com>
References: <20260703-iio-ad3532r-support-v4-0-69d9a336f4e8@analog.com>
 <20260703-iio-ad3532r-support-v4-3-69d9a336f4e8@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 10:23:23 +0000
Message-Id: <20260703102323.A096F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Writing to the highest channel (channel 7 on AD3530/R, channel 15 =
on AD3532/R) fails with -EINVAL because max_register excludes the second by=
te of the 16-bit DAC value.
--

commit 744847f13949cc21f1d21acc0a27b2cff1da3ef3
Author: Kim Seer Paller <kimseer.paller@analog.com>

iio: dac: ad3530r: Convert sw_ldac_trig_reg to a function pointer

This commit converts the sw_ldac_trig_reg fixed register address into a
function pointer that returns the trigger register for a given channel.
This supports multi-bank register architectures where the trigger
register depends on the channel being updated.

> diff --git a/drivers/iio/dac/ad3530r.c b/drivers/iio/dac/ad3530r.c
> index 9d4545e2c9b33..7841546f0c07b 100644
> --- a/drivers/iio/dac/ad3530r.c
> +++ b/drivers/iio/dac/ad3530r.c

[ ... ]

> @@ -215,7 +225,7 @@ static int ad3530r_dac_write(struct ad3530r_state *st=
, unsigned int chan,
>  	if (st->ldac_gpio)
>  		return ad3530r_trigger_hw_ldac(st->ldac_gpio);
> =20
> -	return regmap_set_bits(st->regmap, st->chip_info->sw_ldac_trig_reg,
> +	return regmap_set_bits(st->regmap, st->chip_info->sw_ldac_trig_reg(chan=
),
>  			       AD3530R_SLD_TRIG_A);
>  }

[Severity: High]
This is a pre-existing issue, but looking at ad3530r_dac_write(), the
function writes a 16-bit value using regmap_bulk_write() just before
triggering the LDAC:

	ret =3D regmap_bulk_write(st->regmap, st->chip_info->input_ch_reg(chan),
				&st->buf, sizeof(st->buf));

When writing to the highest channel (channel 7 for AD3530/R, or channel 15
for AD3532/R), the base register address is calculated as 0xF9 or 0x30F9.
Because the DAC value is 2 bytes and val_bits is 8, regmap will try to
write to both 0xF9 and 0xFA (or 0x30F9 and 0x30FA).

However, AD3530R_MAX_REG_ADDR is defined as 0xF9 and AD3532R_MAX_REG_ADDR
is defined as 0x30F9. Does this cause writes to the highest channel to
unconditionally fail with -EINVAL since the second byte's address exceeds
the max_register limit?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-iio-ad3532=
r-support-v4-0-69d9a336f4e8@analog.com?part=3D3
