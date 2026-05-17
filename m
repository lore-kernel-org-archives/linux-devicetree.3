Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A723644A0
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779044162; cv=none; b=aj6WdOUYhth9VN/gZsA/67b7VxNPxCX0mLabRnhhwWX254ffBwJdnXia0zghq2VMxoOR7Zs7XZZEP1jM+UPQ119RX1ztO4YNrRG+cLg6GzweimReRLHLLYzS8j4LOO88Q7hRPv5K7JIzvYuA22ghbc7shIOQ5w27sxBGv/hHo5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779044162; c=relaxed/simple;
	bh=UIkJwPLXUcsKrGAPH+NKGr1zxfxUruyCStCfMVqc3q4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SCyv9/K9nxOpwg1ViwLJ1s2XRLtVUmNwOZZBMbSq9rAkphFHlSjphopOCRrEwM2L2lwkt71IRdvO7xxG63SQZelMoYl+Q/EIhbaG9qIPYaxD5jF59EUHo3sa/Fk5O3JksH+2XofdlYssaImng8Y5AyJdaftJhV7rgYVNw75BfRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ow7zDtII; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ow7zDtII"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E7B0C2BCB0;
	Sun, 17 May 2026 18:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779044162;
	bh=UIkJwPLXUcsKrGAPH+NKGr1zxfxUruyCStCfMVqc3q4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ow7zDtIILTwKOlOod8DwCbCjtpRw+/xcE7b64bqef6RmdgjWUb/g7vblhlvpN/lSZ
	 Pt8/4PkxEKMWTYrksuKUBwzqfhOPtfebKZdiDLemOYDP1fq8VWepz2tz3vCP8eT/rh
	 QhCEOUo0dpjMYlmsCmdA5gBVBjQIUstpwqkhnC8SkdzzAIYlHY2HKrlDtyhKNX9e7z
	 w0btHKXZ6yoJBvCme+iBS55VDzaG0AmEkjuztvSXT+Z6jaHlUjXEx/1JPLxQbK/I/T
	 2XHHr/TWLNOztvQE9k/BEZJCM/lnU0kk4iq/cqD3HmZXZW2BfJbcyHbnoxj+54/9uw
	 ibO2eXwe3qZjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 02/13] iio: core: support 64-bit register through
 debugfs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260517-ad9910-iio-driver-v5-2-31599c88314a@analog.com>
References: <20260517-ad9910-iio-driver-v5-2-31599c88314a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 18:56:01 +0000
Message-Id: <20260517185602.4E7B0C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Silent truncation of 64-bit values when written to a 32-bit regi=
ster access function.
--

commit 64785a0c1416e2cf718b558aa7a2cc9ac39b2d81
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: core: support 64-bit register through debugfs

This commit introduces a debugfs_reg64_access function pointer to iio_info
to allow 64-bit register reads and writes through debugfs. The file operati=
on
callbacks are modified to prefer the 64-bit variant when available.

> diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-c=
ore.c
> index e587aca79b8e7..5c8404efd0a56 100644
> --- a/drivers/iio/industrialio-core.c
> +++ b/drivers/iio/industrialio-core.c

[ ... ]

> @@ -429,7 +439,7 @@ static ssize_t iio_debugfs_write_reg(struct file *fil=
e,
> =20
>  	buf[ret] =3D '\0';
> =20
> -	ret =3D sscanf(buf, "%i %i", &reg, &val);
> +	ret =3D sscanf(buf, "%i %lli", &reg, &val64);
> =20
>  	switch (ret) {
>  	case 1:
> @@ -437,8 +447,12 @@ static ssize_t iio_debugfs_write_reg(struct file *fi=
le,
>  		break;
>  	case 2:
>  		iio_dev_opaque->cached_reg_addr =3D reg;
> -		ret =3D indio_dev->info->debugfs_reg_access(indio_dev, reg,
> -							  val, NULL);
> +		if (indio_dev->info->debugfs_reg64_access)
> +			ret =3D indio_dev->info->debugfs_reg64_access(indio_dev, reg,
> +								    val64, NULL);
> +		else
> +			ret =3D indio_dev->info->debugfs_reg_access(indio_dev, reg,
> +								  val64, NULL);

Could this introduce a regression where values are silently truncated if the
provided input exceeds 32 bits?

Since the input is now unconditionally parsed as a 64-bit integer, falling
back to debugfs_reg_access (which takes an unsigned int for writeval) will
implicitly cast val64. If a user provides a value larger than UINT_MAX to a
driver that only provides the 32-bit callback, it appears the value will be
truncated rather than rejected with an error like -EINVAL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517-ad9910-iio=
-driver-v5-0-31599c88314a@analog.com?part=3D2
