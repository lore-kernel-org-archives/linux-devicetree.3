Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED1E3DAAD4
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 19:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789500494; cv=none; b=FNsH02VR5IWoyGT58Khu83QFkpTWmm0yab5rjlhyyleL+P1I6i3XFTddQX9WaOoffGdq0FZyS7wCqu5GMmfmuv4zjmBwVLwQgixqImoBqda+BTXaqY8J8B//Z9tf8eMfTLrzFWuqwrUVb8M/FR9rZq8VBuZFt3kZXF4yTcBjnOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789500494; c=relaxed/simple;
	bh=GuXfZc6yQQrduUVGfysPgNkczfeWDLpDHojy4M1XcI4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BRvXy25sO+GTTIZVb1A+thXNvJY8MjSZA+dBHvmEsozg8FKrL4tJ/SjHnqpVZ1TaH2oqv1z1dLyd87AuJJFHcrM9AxwHhdXAtwwzoc/pUNd+FHxnsMqTxkAh8CAgEcoCTFmsy9EqqHQ2gerww+isShFo1rPaLVlVOtGAUHEaWVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQ7ad8iT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQ7ad8iT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9CE21F000FF;
	Tue, 15 Sep 2026 19:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789500492;
	bh=mlv0MyNPrWz+o/6ErRSeZ0Aog13VUxj0fcnGrjljMMk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bQ7ad8iT3hDHbm7CFCkbXyp1T+vmfxMTHCT+Jr0YrbAQJ7jHYX6ywZ5q1gqSuWG8K
	 RDEohAJVKLn83SzcFmh6MS5lpjZUdhzv9TC4vhtsfKsalbfWURf+XVHBwqdkoPiYkT
	 48hom6homikDgZe+Qi92+P4AUVfKML2BOZyEe0DvXG1hsgp5vtknyrCNnAieA87PDW
	 lCp3eYqxWKgIRVlkG9mb7SOsLr+EPnHzqGg/OjMAACWSwNdN0XWbX1jh1aKl7ybxmd
	 20vEPQxq/zCPcGzcWzGKpYM3SfNZRr25dY+Oc0f8gEIOxmhaBEV685f+mBQZa7cX46
	 HrDUiPMgSCHPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/15] iio: adc: ad4134: Sign extend sample data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <7083358e62e3edfeeba0201aefd8d3195ee951d0.1789494473.git.marcelo.schmitt@analog.com>
References: <cover.1789494473.git.marcelo.schmitt@analog.com>
 <7083358e62e3edfeeba0201aefd8d3195ee951d0.1789494473.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 19:28:11 +0000
Message-Id: <20260915192811.B9CE21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] iio: adc: ad4134: info leak via uninitialized sample in ad4134_dat=
a_read()
--

commit 56b8f43cabdc9a50d1d532dbfddf01a627e253d4
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ad4134: Sign extend sample data

Sign extend ADC sample data for correct delivery of negative ADC input
difference.

> diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> index 0490218bb0e9b..7d40c0521bb3f 100644
> --- a/drivers/iio/adc/ad4134.c
> +++ b/drivers/iio/adc/ad4134.c
> @@ -172,6 +172,7 @@ static int ad4134_data_read(struct ad4134_state *st, =
unsigned int reg,
>  			    unsigned int *val)
>  {
>  	unsigned int i;
> +	u32 sample;
>  	int ret;
> =20
>  	/*

[ ... ]

> @@ -196,8 +197,9 @@ static int ad4134_data_read(struct ad4134_state *st, =
unsigned int reg,
>  		 * Clock out data from all channels to avoid that.
>  		 */
>  		if (i =3D=3D AD4134_VREG_CH(reg))
> -			*val =3D get_unaligned_be24(st->rx_buf);
> +			sample =3D get_unaligned_be24(st->rx_buf);
>  	}
> +	*val =3D sign_extend32(sample, AD4134_CHAN_PRECISION_BITS - 1);

[Severity: High]
Does this code leak uninitialized stack memory to userspace?

If a privileged user reads register 0x54 via the IIO debugfs
direct_reg_access file, ad4134_data_read() is invoked with reg=3D0x54. This=
 is
possible because of a pre-existing off-by-one error in the regmap
configuration (where AD4134_CH_VREG(AD4134_NUM_CHANNELS) evaluates to 0x54)
that allows read access to this virtual register.

Because the loop index 'i' only iterates up to 3, the condition
'i =3D=3D AD4134_VREG_CH(0x54)' is never met and 'sample' is left uninitial=
ized.
The newly introduced code then unconditionally sign-extends this uninitiali=
zed
memory and writes it back to '*val', which is then returned to the user.

> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1789494473.gi=
t.marcelo.schmitt@analog.com?part=3D1
