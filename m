Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDA6366DA5
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782731110; cv=none; b=qIPgcSyhFoTDcx9/gW/u8nttazht/b13zta75F7RTh6/mESaEdnzZWMuoxNixccRXgOeOgF+AHoLqS3UVluGnXwt+Xz6SFzi5mCKjcwCxFz/FysFbQLhlYOj8920SOTPqH/pM0vTdUvok4Ex1kIpOhwJdhmoXXxlZiXMG3EbInQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782731110; c=relaxed/simple;
	bh=YvK28msNr9lhcIPrIv8MTQ6NIxf/SLwJdQfjalLWuzo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fJWhPJJU9hdW4Q87Eaj1LoKX62VVl8x3uboSZhutD8fGTWISe8ygkX0ommwBFo+d7ij4vcVFh2B4q69aHzGJpJXKM2paxUny7/G+mPoFsDrHY1OLp8erHzkhRS0u3S6hjowoJURbJm2uyaHsZwLPgfA9EgNpnb5w/+Jd7dMBsos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FSHUgzC2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FSHUgzC2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084E71F000E9;
	Mon, 29 Jun 2026 11:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782731109;
	bh=Ew97kzABPgt0gp4AVNQppIfVmCpuY+2KFX/JSwX5l1o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FSHUgzC2kr+gbBIYZUDjzMwV+l7xO8Uh5pMfMkMbZlH4YrHtD2P/fIQAf8twzZvbi
	 XzxkgdEJfAjvz/YYAkURXObglsvYhEY7xu8a5J9oX5YnwO9oYIx6ilen9YXtNGWMsa
	 GtXAJgHZFtkQUGk04snGFCiXlL+IxiNLzZlCMyd7s7rZM6wz164E03paj9njxvyn+8
	 j7Z+7NDiA0TQCpD1WP6f+NVm3ArQiD2SKf45fXQrdXhYJEHmOMAXGZIt5o6DPn25aG
	 tiypviEtQK0ElbQBpOTX/eQCxjGtj1apEFOSrSmEgEbEgfKeY6+Ta2sCsgXaPfiPUG
	 03jDanChVNBuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/5] media: i2c: vd55g1: Fix media bus code
 initialization
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benjamin Mugnier" <benjamin.mugnier@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260629-vd55g4_and_fixes-v2-1-ea0a7cf3cd66@foss.st.com>
References: <20260629-vd55g4_and_fixes-v2-0-ea0a7cf3cd66@foss.st.com>
 <20260629-vd55g4_and_fixes-v2-1-ea0a7cf3cd66@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 11:05:08 +0000
Message-Id: <20260629110509.084E71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Meaningful code and commit message mismatch: The commit message =
states 'Rename VD55G1_MBUS_CODE_DEF to VD55G1_MBUS_CODE_IDX_DEF', but the m=
acro is deleted instead and hardcoded '0' indices are used.
- [Low] Type mismatch: The `code` variable is declared as a signed `int` bu=
t is used to store V4L2 media bus format codes, which are strictly unsigned=
 32-bit integers (`u32`).
--

commit 6cf5089e88c71a68129dc09d9aa82be4ff08d4b3
Author: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

media: i2c: vd55g1: Fix media bus code initialization

This commit passes the actual media bus code to vd55g1_get_fmt_code()
during driver initialization instead of the array index. It also renames
macro definitions to clarify their usage as indices.

> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
> index 78d18c0281541..fceb437e19bec 100644
> --- a/drivers/media/i2c/vd55g1.c
> +++ b/drivers/media/i2c/vd55g1.c

[ ... ]

> @@ -1347,6 +1346,7 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
>  {
>  	struct vd55g1 *sensor =3D to_vd55g1(sd);
>  	struct v4l2_subdev_format fmt =3D { 0 };
> +	int code;

[Severity: Low]
Does this type mismatch cause any issues? V4L2 media bus format codes are
strictly unsigned 32-bit integers (u32), but this is declared as a signed i=
nt.

>  	struct v4l2_subdev_route routes[] =3D {
>  		{ .flags =3D V4L2_SUBDEV_ROUTE_FL_ACTIVE }
>  	};
> @@ -1361,9 +1361,13 @@ static int vd55g1_init_state(struct v4l2_subdev *s=
d,
>  	if (ret)
>  		return ret;
> =20
> -	vd55g1_update_pad_fmt(sensor, &vd55g1_supported_modes[VD55G1_MODE_DEF],
> -			      vd55g1_get_fmt_code(sensor, VD55G1_MBUS_CODE_DEF),
> -			      &fmt.format);
> +	if (sensor->id =3D=3D VD55G1_MODEL_ID_VD55G1)
> +		code =3D vd55g1_mbus_formats_mono[0];
> +	else
> +		code =3D vd55g1_mbus_formats_bayer[0][0];

[Severity: Medium]
The commit message states "Rename VD55G1_MBUS_CODE_DEF to
VD55G1_MBUS_CODE_IDX_DEF", but the macro was deleted entirely in this patch.

Should these hardcoded 0 indices use the promised VD55G1_MBUS_CODE_IDX_DEF
macro instead to avoid confusion?

> +	vd55g1_update_pad_fmt(sensor,
> +			      &vd55g1_supported_modes[VD55G1_MODE_IDX_DEF],
> +			      vd55g1_get_fmt_code(sensor, code), &fmt.format);
> =20
>  	return vd55g1_set_pad_fmt(sd, sd_state, &fmt);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-vd55g4_and=
_fixes-v2-0-ea0a7cf3cd66@foss.st.com?part=3D1
