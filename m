Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE04420876
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 17:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783444482; cv=none; b=mkCY6cwNYO1uyfsNAFLGgJrNd3r4RufJmRS8tHcqSSv0s0aVL/wkbF2fZeBCz1k7QCIBxq3ri+Pvu4ec7z6c1YxwU//rO38p8Diublv4RLdGvN8dKr8wEqzXpB7fXYgrzbqsgEX0K642VVPuZxvQy0jC4GlvsqkvEADmNLPLLkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783444482; c=relaxed/simple;
	bh=nCzuFa85qpsgjwT+mPUxECleB8ZEgyUQ+7mw9LtF7sk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b3olckYj/eezp9srLK+c+xi71IFd78RHfwkDcv4LjymtEyNUlKhBJl+oF0z0TC5iwT2OVOc+81NQ1SJVFAJ8j3svOdxSI/zlRfTl5nK6BhL9aw5MS+HhPFuUr8r+B6RU+ogPamIe8USTkZqgPhLDzcwvCA/vKZ4RrA1VXNn+uzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O7D29mGG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O7D29mGG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5472B1F000E9;
	Tue,  7 Jul 2026 17:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783444480;
	bh=YE8ZB5MG8UTHBwgpU5BM3r3XR3jXcUCHgKpMeHW4YRE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O7D29mGGaU2ZVc7CrgYxyns1L5URcF5aRcn4C2czdU+ZNlsM6VRIbg+rulM46acc2
	 yXH6I7eea+vhm7wC+ijOsZIE+Iw/bPgd71AhU63IstyDtd6EJRGjHwvHtVRglqVv2E
	 tQGsDZPF79oKf2nf5zvMPEK0EpIwfUmpG5/e4yTm+tW26hPOoaWZOnterueP11lrQW
	 Nwh//RLU9meDW5XCWfiRykNNJ333kPaHqC/HmEwpkvcnSarmj76HiRT5Ll8SCFAFDZ
	 nFjw9OcBKCXoYwgzLLuZkZ3/EaayjXP+9RKLh46nyg+Zhp4leb7JIDHwJaNaF2p2iL
	 HqulLrOaAilUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/20] media: imx355: Remove duplicated registers
 from the mode tables
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260707-media-imx355-v2-3-1683ec07b897@raspberrypi.com>
References: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
 <20260707-media-imx355-v2-3-1683ec07b897@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 17:14:40 +0000
Message-Id: <20260707171440.5472B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Register 0x030b (value 0x01) was accidentally omitted when common =
registers were moved into the global register array, causing it to be dropp=
ed entirely from the initialization sequence.
--

--- Patch [3]: [PATCH v2 03/20] media: imx355: Remove duplicated registers =
from the mode tables ---
commit 5dff7585c6b01310348ab92104e830ef77f11da0
Author: Dave Stevenson <dave.stevenson@raspberrypi.com>

media: imx355: Remove duplicated registers from the mode tables

A large number of registers are identical within all the modes.
This patch moves those duplicated registers to imx355_global_regs to
reduce duplication.

> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index ad9a9464175b1..83a59aa8b0985 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -221,6 +221,28 @@ static const struct imx355_reg imx355_global_regs[] =
=3D {
>  	{ 0x68b0, 0x00 },
>  	{ 0x3058, 0x00 },
>  	{ 0x305a, 0x00 },
> +	{ 0x0112, 0x0a },
> +	{ 0x0113, 0x0a },
> +	{ 0x0114, 0x03 },
> +	{ 0x0301, 0x05 },
> +	{ 0x0303, 0x01 },
> +	{ 0x0305, 0x02 },
> +	{ 0x0306, 0x00 },
> +	{ 0x0307, 0x78 },
> +	{ 0x030d, 0x02 },

[Severity: High]
Was register 0x030b unintentionally omitted from this list?

The original mode tables contained { 0x030b, 0x01 } between 0x0307 and 0x03=
0d,
but it appears missing in the new global register array.

Omitting this PLL configuration register initialization could leave the clo=
ck
divider in an undefined state. Does this misconfigure the pixel clock when
imx355_global_regs is applied during sensor start-up?

> +	{ 0x0310, 0x00 },
> +	{ 0x0220, 0x00 },
> +	{ 0x0222, 0x01 },

[ ... ]

> @@ -253,32 +270,11 @@ static const struct imx355_reg mode_3268x2448_regs[=
] =3D {
>  	{ 0x034d, 0xc4 },
>  	{ 0x034e, 0x09 },
>  	{ 0x034f, 0x90 },
> -	{ 0x0301, 0x05 },
> -	{ 0x0303, 0x01 },
> -	{ 0x0305, 0x02 },
> -	{ 0x0306, 0x00 },
> -	{ 0x0307, 0x78 },
> -	{ 0x030b, 0x01 },
> -	{ 0x030d, 0x02 },
> -	{ 0x0310, 0x00 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-media-imx3=
55-v2-0-1683ec07b897@raspberrypi.com?part=3D3
