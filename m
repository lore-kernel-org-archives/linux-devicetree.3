Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D17374E5A
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 03:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862585; cv=none; b=EUG3KNvTRmJHb33ytoOGQfYg2JHyc7Q6v1uzChbNwmAsMcilpNMP/jtamblsNncvHrLNSXS8WtaGkSfzizf/ZajkYvzFg+l6Uri3XO/QPB34c5S335GWvysMM70aJe92yACNvdb5Ww6HHEgdLvzqiq/LksHh9uqpAyzNA9fGZDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862585; c=relaxed/simple;
	bh=dD1EE3WFvAWvd/EDSYeIxCvaGuhw80sfAw1IKDa4bJg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=OSr+iTcjbocLtmAG566Z26ZuS6VtyiLhRI1cEqrkWMdt2W7569Z9lrJXm/G+6XoTInqJ24TPcKACrPrpvxYJiE0jF3ljHI4IMKkJ36E4QKNygHk4SD7FVRJyn/dM/0P9mr0Ws36DgjV8NGe/AZQBkeLZ8fSF6jvcuR0ax17GbM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eR5/Hi9/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eR5/Hi9/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A681C1F000FF;
	Tue, 13 Oct 2026 03:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791862583;
	bh=pwUmRWNpWQv7nNJlxejJ3uSo/DIOOFm7Bjk4E4Ahk0g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eR5/Hi9/yngCj2xKZ1i53AWONV7fXi9P3AG+uTVhS5juT8aOGco5rmY7ZpGOiTlNe
	 ujln6OtlJTOX+LEA/9K0wj0O3+UuuXZO6L8nc4gSe5pRRwpNwOuzHpFOHo7Z6zfhuF
	 jst/7kuRI7m0ajl8N3VntiYskJP5R0WvSseMtvTBrR0Qb3dwzpeyWlV8WC3ynAkdSZ
	 W2KqE97wcFa60wkePfVC0UzQfl8sgl/8xBigsKTRnTpDq7F8EypXuBe7a3lEw444ec
	 IEefr7Ytg2ezooGsnNSINAyEf7Unv/G2qwN1Vlb5W6G3IIXIakmXumn8iyTP6/D5mv
	 Easar/Yt+84wQ==
Message-ID: <sashiko-outbox-168909@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/3] media: i2c: hm1092: Add ACPI enumeration and the
 19.2 MHz configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ramshouriesh R" <rshouriesh@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261013-hm1092-driver-v7-3-d81a9b152ffd@gmail.com>
References: <20261013-hm1092-driver-v7-0-d81a9b152ffd@gmail.com>
 <20261013-hm1092-driver-v7-3-d81a9b152ffd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 03:36:23 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] media: hm1092: crop rectangle exceeds crop bounds for 19.2 MHz m=
ode
--

commit 49dd5f72932dde1fcdf6ace7b8dcb87f89cb643e
Author: Jake Steinman <j@metarealtyinc.ca>

media: i2c: hm1092: Add ACPI enumeration and the 19.2 MHz configuration

This commit adds support for the HIMX1092 sensor enumerated through ACPI on
Intel IPU6/IPU7 laptops. It converts the single fixed mode into a table of
configurations based on the external clock rate, adding a 19.2 MHz configur=
ation.

Link: https://lore.kernel.org/r/b0d32a3b82eca233652f878b7ca91e4dc2d8e863.17=
91608336.git.j@metarealtyinc.ca

> diff --git a/drivers/media/i2c/hm1092.c b/drivers/media/i2c/hm1092.c
> index 0ae30fb6b78ff..c7b148076e94c 100644
> --- a/drivers/media/i2c/hm1092.c
> +++ b/drivers/media/i2c/hm1092.c
> @@ -277,18 +275,265 @@ static const struct cci_reg_sequence hm1092_init_r=
egs[] =3D {

[ ... ]

> +static const struct hm1092_mode hm1092_modes[] =3D {
> +	{
> +		.mclk =3D 24000000,
> +		.link_freq_index =3D 0,
> +		.width =3D 560,
> +		.height =3D 360,
> +		.hts =3D 0x0650,
> +		.vts =3D 0x02ee,
> +		.exposure_def =3D 500,
> +		.crop =3D {
> +			.left =3D 48,
> +			.top =3D 8,
> +			.width =3D 1150,
> +			.height =3D 718,
> +		},
> +		.regs =3D hm1092_560x360_regs,
> +		.num_regs =3D ARRAY_SIZE(hm1092_560x360_regs),
> +	}, {
> +		.mclk =3D 19200000,
> +		.link_freq_index =3D 1,
> +		.width =3D 648,
> +		.height =3D 368,
> +		.hts =3D 0x0654,
> +		.vts =3D 0x02e4,
> +		.exposure_def =3D 360,
> +		.crop =3D {
> +			.left =3D 0,
> +			.top =3D 0,
> +			.width =3D 1294,
> +			.height =3D 734,
> +		},

[Severity: Medium]
Does this crop rectangle exceed the crop bounds reported by
hm1092_get_selection()?

Looking at hm1092_get_selection() when V4L2_SEL_TGT_CROP_BOUNDS is requeste=
d,
it returns a smaller region:

	case V4L2_SEL_TGT_CROP_BOUNDS:
		sel->r.left =3D HM1092_ACTIVE_LEFT; /* 8 */
		sel->r.top =3D HM1092_ACTIVE_TOP; /* 8 */
		sel->r.width =3D HM1092_ACTIVE_WIDTH; /* 1280 */
		sel->r.height =3D HM1092_ACTIVE_HEIGHT; /* 720 */
		return 0;

Since the crop rectangle for the 19.2 MHz mode has a width of 1294 (which
is greater than 1280) and starts at a left offset of 0 (instead of 8), it
extends outside the reported bounds. This violates the V4L2 API contract.
Will this cause v4l2-compliance test failures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-hm1092-dri=
ver-v7-0-d81a9b152ffd@gmail.com?part=3D3
