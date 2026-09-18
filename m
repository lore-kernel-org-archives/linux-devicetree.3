Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FB81F09AD
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723337; cv=none; b=sT0aPsVNYWyAdj8VBBEABmnFBTKCnw3Nh11CbNb36YrTSAbnFjdS7wIGBkMDbyrzVtEToMY4VWl2HpQra25ZqISbPJ57VJQi5y+lgoIwWRHwMplE96soAkVaOMkHb3ZC0Y+mX2r7Kuofznb9AEb/ZD4TvMuuOfJNcKAwuPGWULs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723337; c=relaxed/simple;
	bh=Y++TKWI3fhoO/JW7XjTfq5gotvvfJcR2QdQEfsDng2o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O/3Uh39RSHygGAs5HAvo/hv9rCnhuqaENaiRcQh8wOtsAVPtAQo7UdtqiuYwzXgJWX8fq5R8SCpRRNmRrh02aM4JcGau7YURZxTAELqWLHDLeWF5EbK+NQ85/DUtEjH6py2Sx7Dmqx8FcGdLvo62fwy9RKBit9l69h+FZjZyBVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwgaKorE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwgaKorE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C965E1F000FF;
	Fri, 18 Sep 2026 09:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789723336;
	bh=CJSJ3cwVMRgMSx+7w6S2L94KvzkMQdrkxPZcBJ8HcV4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bwgaKorE+fYsRVm5CL+VfcdYoyh52DLkFeiZTodUBeUjqRxIePuwl619MibQ7CtmA
	 oECUpgTfIqw/SFdAt2bqgBhlg9ytHXOAlso4V/9czAvZokLKvihiyYz8rUN8DUHxBM
	 aa4mhcFTZf1wB0HrS/ttY1VI1eq0U/dMsdyFxA9kA1QaFHQzBELCPgGq9wc8xUTOLr
	 /vh1MFa3PeqpguortVYDK7XB/eBAHJ6KTvyHg1FHdFCQZgdwWh34NXJa3koFKGB/Bl
	 I/6t/Piolz1zIL36LHSutH8ry0nsAwbW/POyB3Hf9H6twbNHkk8Xm7X5qFe6qfZCXu
	 OzbLRSdfB4yVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 06/11] iio: dac: mcp47feb02: Avoid unjustified probe
 error on missing label
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260918-mcp47feb02_refactor-v7-6-82ca794eafe2@microchip.com>
References: <20260918-mcp47feb02_refactor-v7-0-82ca794eafe2@microchip.com>
 <20260918-mcp47feb02_refactor-v7-6-82ca794eafe2@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 09:22:15 +0000
Message-Id: <20260918092215.C965E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] iio: dac: mcp47feb02: dev_warn_probe() spams on valid missing op=
tional label
--

commit e0f4987920f8a3564ad483dd9c2d2cc4904bdc2f
Author: Ariana Lazar <ariana.lazar@microchip.com>

iio: dac: mcp47feb02: Avoid unjustified probe error on missing label

This commit avoids a probe failure when the optional 'label' property is
missing by replacing dev_err_probe() with dev_warn_probe(). It also
returns -ENOENT in the read_label sysfs callback when attempting to read a
missing label.

Closes: https://lore.kernel.org/all/20260804134616.1D8A21F00A3E@smtp.kernel=
.org/

> diff --git a/drivers/iio/dac/mcp47feb02.c b/drivers/iio/dac/mcp47feb02.c
> index 9d4ba95da84ac..43cf69e43a41e 100644
> --- a/drivers/iio/dac/mcp47feb02.c
> +++ b/drivers/iio/dac/mcp47feb02.c
[ ... ]
> @@ -976,8 +979,7 @@ static int mcp47feb02_parse_fw(struct iio_dev *indio_=
dev,
> =20
>  		ret =3D fwnode_property_read_string(child, "label", &data->labels[reg]=
);
>  		if (ret)
> -			return dev_err_probe(dev, ret, "%pfw: invalid label\n",
> -					     fwnode_get_name(child));
> +			dev_warn_probe(dev, ret, "%pfw: invalid label\n", child);

[Severity: Medium]
Since the label is an optional property, fwnode_property_read_string()
returning a non-zero value is a valid and expected condition when the
property is omitted.=20

Does this unconditional dev_warn_probe() cause unnecessary warning spam in
the kernel boot log for valid configurations that don't specify a label?

> =20
>  		chanspec.address =3D reg;
>  		chanspec.channel =3D reg;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-mcp47feb02=
_refactor-v7-0-82ca794eafe2@microchip.com?part=3D6
