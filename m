Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09ADF367B92
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782731143; cv=none; b=iUjUSJhvn3Qi0vSwvUACHKQUilN9gMHxDe65Z8A5VveohF5jN1DOipjbt97eHD3u39EA/B7Gjrew8j/wz3dEsZ5vAiDXBGnJShu+Cv4nrNwtkRo1iiJLk07mGwVbDZyb8v25C5jg4T2akQdb17nAd0to2UpDQM/JZp4OIKkQoyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782731143; c=relaxed/simple;
	bh=FSQb6ZpE8VVXi/jfcaVs6EfAbRkf2SmUzltq38Ie0gc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ObMGhV29ceetbw7Qa+hTDDXFOIKMRRxWYz1v8fSmmltAFp+2+zqoKREVUfgjMyVvfgH9v9YHlTbpUkr/xvFh2fSRZqWGGVvp98JeS8BRNXnR/OwiMGZ+T0Kq0EPsvCZzYZ7D3jmdFcduFYrfifTyGDHRmXwyVPPROoicU5zDaIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=huJEamqy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="huJEamqy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F7831F000E9;
	Mon, 29 Jun 2026 11:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782731141;
	bh=2GZ7qQk+fAqMlOHOt/jgJhApgudXlPli1H9aOQ8rQNU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=huJEamqyuUG6rSAGIwNwpNE/5BfJXG8Ckf9A9I9sYxwF7+t9z/M0PClOMd73v/V3t
	 ppxOltegR5NPjXMWZFRtFu+0Ae6ZdPWzU2xH298ja6MAqlKCC8wA5rMZWrP4c90IjW
	 o58GR2W/dWDBpZeBrjLNS1bJ3B2WZR97TY87ipVG6WS5kXmbAJcTmnxopqR+r51WCN
	 r3stkaG8P7FSHxnJV0R7RXT8MvMs6hXNGp5lJC2PUmUA+plbRyd+5FR+yKwkAVgSf1
	 8RppEllLvkr++NhmMrcZmyrJoUCuw39eCtP8BUZFakMw3x7dv1blFJXOa/ZqR2C2nh
	 yzSdbuQ7Mg94g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] media: i2c: vd55g1: Remove spurious pad format
 update on init_state()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benjamin Mugnier" <benjamin.mugnier@foss.st.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260629-vd55g4_and_fixes-v2-2-ea0a7cf3cd66@foss.st.com>
References: <20260629-vd55g4_and_fixes-v2-0-ea0a7cf3cd66@foss.st.com>
 <20260629-vd55g4_and_fixes-v2-2-ea0a7cf3cd66@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 11:05:40 +0000
Message-Id: <20260629110541.0F7831F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The subdev state lock and the control handler lock are not shared,=
 leading to lockdep failures and data races.
--

commit e1c6d43eeca25a31bf4c1014650f4e8b8276a063
Author: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

media: i2c: vd55g1: Remove spurious pad format update on init_state()

This patch prevents vd55g1_update_pad_fmt() from being called twice during
initialization by setting the format directly in vd55g1_init_state(). The
actual update is now deferred entirely to vd55g1_set_pad_fmt().

> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
> index fceb437e19bec..22464fe315624 100644
> --- a/drivers/media/i2c/vd55g1.c
> +++ b/drivers/media/i2c/vd55g1.c
> @@ -1365,9 +1365,9 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
>  		code =3D vd55g1_mbus_formats_mono[0];
>  	else
>  		code =3D vd55g1_mbus_formats_bayer[0][0];
> -	vd55g1_update_pad_fmt(sensor,
> -			      &vd55g1_supported_modes[VD55G1_MODE_IDX_DEF],
> -			      vd55g1_get_fmt_code(sensor, code), &fmt.format);
> +	fmt.format.code =3D vd55g1_get_fmt_code(sensor, code);
> +	fmt.format.width =3D vd55g1_supported_modes[VD55G1_MODE_IDX_DEF].width;
> +	fmt.format.height =3D vd55g1_supported_modes[VD55G1_MODE_IDX_DEF].heigh=
t;
> =20
>  	return vd55g1_set_pad_fmt(sd, sd_state, &fmt);
>  }

[Severity: High]
This is a pre-existing issue, but does the initialization order in the driv=
er
leave the control handler and subdev state locks unshared, potentially lead=
ing
to data races and lockdep warnings?

In vd55g1_subdev_init(), the lock assignment happens before the control han=
dler
is initialized:

drivers/media/i2c/vd55g1.c:vd55g1_subdev_init() {
    ...
    sensor->sd.state_lock =3D sensor->ctrl_handler.lock;
    ret =3D v4l2_subdev_init_finalize(&sensor->sd);
    ...
}

Since sensor->ctrl_handler.lock is still NULL here, v4l2_subdev_init_finali=
ze()
falls back to allocating an unshared lock for the active state.

The control handler lock is actually initialized later in vd55g1_init_ctrls=
():

drivers/media/i2c/vd55g1.c:vd55g1_init_ctrls() {
    ...
    v4l2_ctrl_handler_init(hdl, 16);
    ...
}

This means vd55g1_s_ctrl() runs with ctrl_handler.lock held, but expects the
active state lock to be held:

drivers/media/i2c/vd55g1.c:vd55g1_s_ctrl() {
    ...
    struct v4l2_subdev_state *state =3D
        v4l2_subdev_get_locked_active_state(&sensor->sd);
    ...
}

Because the locks are distinct, this triggers a lockdep assertion failure i=
nside
v4l2_subdev_get_locked_active_state(). It also seems to expose a data race,=
 as
vd55g1_s_ctrl() can read format and crop while vd55g1_set_pad_fmt() modifies
them concurrently using the active state lock.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-vd55g4_and=
_fixes-v2-0-ea0a7cf3cd66@foss.st.com?part=3D2
