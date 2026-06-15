Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685933B14BA
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781505023; cv=none; b=ANtvP7Oj+xPcREO5AUy1TiS39Bjc8YvoEVpHwJROxKMTK1s06uMGC/+qbgVecjyzkpEuwcHF/7zFKwNP1rWPb1NR2UzSR+BFKTHA84vZEOJRyeIkscLYVmi0/SkU1joX4u77DQtRKFKM/+CHmHLkvkSU1ZQq/C18hNCTvT/PvT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781505023; c=relaxed/simple;
	bh=2GnlzbNWMVeDy1soDalLhjX/JsJbPWx1WgprvQHs6x4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V+l28Nn9DAKO3dn/GcgTftQXYtliO6xpxnzNcqVPx4a5RqLUymgTyR6WGgJMoallYzL21OZJwWAnBkjP1YpJBfEMzr2lr8+Ll8N+cQZhFI9orhiZ/Xwk5sS9T41TkR6OUOrRoHQvrlVS4xZI382eSLWDHGfKkdWMsg1SLIDEH2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S7r0VEdq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S7r0VEdq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E651F000E9;
	Mon, 15 Jun 2026 06:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781505022;
	bh=IwtL5vuViFdeGZGbPSa+bajFoZ9U35ZueHzM3DfQV88=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S7r0VEdq/FzWQg29Ngu24pZy/X3zuIs8rWIYF50MsxujdElBRVgXxUrz81ksru+7E
	 Fp4pBGF7w0TgOWQOhD22pBqUtHMvpuk89+IMqrbG0E0GzgwWB9NtRq2QaGfuwl7/0D
	 EGJfTyZilXV56kYroMShDf8bfZEJTpya5P8AjXP+6Y/bYhxu4EUMWSCD2jU3B6sgZC
	 8cB9myxm95TBaOROYgDlq+E0QfYER5Tnsw9AO1/rq5VaLTZ+tvVMh6TWLhzOmDnNB8
	 GlWSjyIdzfosRnsQ8b1T6QIAd67jFoVWf2RI7WaZXM/5RIs3wjleZv31LZlMW7o20k
	 Su6CC06j3KQEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] iio: dac: ad3530r: Refactor setup to
 table-driven register bank approach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kim Seer Paller" <kimseer.paller@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260615-iio-ad3532r-support-v2-1-84a0af8b83fa@analog.com>
References: <20260615-iio-ad3532r-support-v2-1-84a0af8b83fa@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 06:30:21 +0000
Message-Id: <20260615063021.C8E651F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Duplicate field initialization for `input_ch_reg` in the `ad3530r_c=
hip` structure.
--

commit 2528c529a11e7b49d5cde3c0238451d59c5f698b
Author: Kim Seer Paller <kimseer.paller@analog.com>

iio: dac: ad3530r: Refactor setup to table-driven register bank approach

This commit replaces direct register accesses in ad3530r_setup() with a
table-driven register bank approach using per-chip address arrays. It also
converts the software LDAC trigger register from a static address to a
function pointer.

> diff --git a/drivers/iio/dac/ad3530r.c b/drivers/iio/dac/ad3530r.c
> index d9db3226ecd64..e4346bc729ba5 100644
> --- a/drivers/iio/dac/ad3530r.c
> +++ b/drivers/iio/dac/ad3530r.c

[ ... ]

> @@ -344,7 +387,14 @@ static const struct ad3530r_chip_info ad3530r_chip =
=3D {
>  	.name =3D "ad3530r",
>  	.channels =3D ad3530r_channels,
>  	.num_channels =3D ARRAY_SIZE(ad3530r_channels),
> -	.sw_ldac_trig_reg =3D AD3530R_SW_LDAC_TRIG_A,
> +	.sw_ldac_trig_reg =3D ad3530r_trigger_sw_ldac_reg,
> +	.input_ch_reg =3D ad3530r_input_ch_reg,
> +	.interface_config_a =3D ad3530r_if_config,
> +	.output_control =3D ad3530r_out_ctrl,
> +	.reference_control =3D ad3530r_ref_ctrl,
> +	.op_mode =3D ad3530r_op_mode,
> +	.num_banks =3D ARRAY_SIZE(ad3530r_if_config),
> +	.num_op_mode_regs =3D ARRAY_SIZE(ad3530r_op_mode),
>  	.input_ch_reg =3D ad3530r_input_ch_reg,

[Severity: Low]
This isn't a bug, but there is now a duplicate initialization of
.input_ch_reg in ad3530r_chip. Should the newly added instance be removed
to prevent compiler warnings like -Winitializer-overrides?

>  	.internal_ref_support =3D true,
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615-iio-ad3532=
r-support-v2-0-84a0af8b83fa@analog.com?part=3D1
