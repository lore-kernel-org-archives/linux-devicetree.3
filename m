Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E6F3C454E
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 06:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780556324; cv=none; b=VuNFFvvrgRi8xejQBPWQ+f+CRclr15560o7+SZLqaMSHHuz9CteH3LlG/e1S914dVAO3sKAkHxfEqCMZMDmRNANWnr7tcbtkfZZkJp47jSIvZfTsn48Itz9xDXYdIdsgEUORlFhzsN9a2S7WS8eTUpl3xCT9NtSMhxO5mlNEJiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780556324; c=relaxed/simple;
	bh=j38cKoraBEkXRgkmCFo2zUSlbhVQZlWNADbLR0F91ZY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HKfPbsN2ZOdpfbFx2B+LU1yxRWjuORtukfqhwLf9stTPPL1Dh4qVI1GuDMaKC6ruMIuLZUtvXbL6waVgeFba+d7I+N8vfixXIz37qqb4dZh0EaCCV/DAq3aeLxWY/IrdjSyVjaWQLXrQ3BzDCElaHiv4X1yTFaYSqinskdZQcKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g0zRVfb7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g0zRVfb7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6821F00893;
	Thu,  4 Jun 2026 06:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780556323;
	bh=5GYQXanEtbB4awaxbRpqWuB2Z/uMS1YEvQ445tcQSmw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g0zRVfb7zGPp0+IDO5csMMr2lMj9djoMZ8kwSjEZwEVIonkPaE1PQv2+hWN6XdNdC
	 hT3p1mRrn1g+kkaeHpIGdzn1q6WGWhMwh0+R52le1JbOttQ75D86iObDpn/1a9ftAp
	 78kvm89fRI7aZFYSs+V7jC/ywvShG4PMRl/KGkLjLBz7a6FbAEfvXyvTl0qc4mRHT7
	 oHeGeqr0VkgO8CNiumYFkifF8l32LjXevlEQhMFLE8yHYhyHXxdl7TD80J9VCWvG3z
	 +PqYn7qtfiZoj+E6TNJwLLGMp1lu23NrJNiyy1rvqD2Foy8BsXTmmqpjsKYG4bLaOo
	 LqgbApW337Nzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] iio: light: isl29018: fix 32-bit overflow in
 isl29018_read_lux()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk" <github.com@herrie.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260604064925.3097108-2-github.com@herrie.org>
References: <20260604064925.3097108-2-github.com@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 06:58:42 +0000
Message-Id: <20260604065842.BC6821F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch introduces 64-bit divisions using the standard `/` operat=
or, which will cause a linker error (`undefined reference to __udivdi3`) on=
 32-bit architectures.
--

commit 37588d2a24184ed61a15690c807e6b4b16aa4002
Author: Herman van Hazendonk <github.com@herrie.org>

iio: light: isl29018: fix 32-bit overflow in isl29018_read_lux()

This commit addresses an overflow in isl29018_read_lux() by changing
intermediate calculation variables to u64. It then clamps the final result
to INT_MAX before storing it in the signed output variable.

> diff --git a/drivers/iio/light/isl29018.c b/drivers/iio/light/isl29018.c
> index 1b4c184230489..927018c531e8d 100644
> --- a/drivers/iio/light/isl29018.c
> +++ b/drivers/iio/light/isl29018.c
> @@ -193,17 +193,18 @@ static int isl29018_read_sensor_input(struct isl290=
18_chip *chip, int mode)
>  static int isl29018_read_lux(struct isl29018_chip *chip, int *lux)
>  {
>  	int lux_data;
> -	unsigned int data_x_range;
> +	u64 data_x_range, result;

[ ... ]

> -	data_x_range =3D lux_data * chip->scale.scale +
> -		       lux_data * chip->scale.uscale / 1000000;
> -	*lux =3D data_x_range * chip->calibscale +
> -	       data_x_range * chip->ucalibscale / 1000000;
> +	data_x_range =3D (u64)lux_data * chip->scale.scale +
> +		       (u64)lux_data * chip->scale.uscale / 1000000;
> +	result =3D data_x_range * chip->calibscale +
> +		 data_x_range * chip->ucalibscale / 1000000;

[Severity: Low]
Will this cause a linker error on 32-bit architectures?

Since data_x_range and the result of the multiplications are now u64, using
the native division operator (/) for 1000000 will result in an undefined
reference to __udivdi3 when compiling for 32-bit platforms.=20

Should this use div_u64() from <linux/math64.h> instead?

> +	*lux =3D (int)min_t(u64, result, INT_MAX);
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604064925.3097=
108-1-github.com@herrie.org?part=3D1
