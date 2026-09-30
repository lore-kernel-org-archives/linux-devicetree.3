Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B562A547074
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766513; cv=none; b=UaNtQUYet1/cufJ/hRlDI+OUpKZ00BTsN5Vjdj/YkF/vO06fTVZ/f+K1VKWgJdVVhvHdw3/QVf1t2ipBd7AXXhUaHwyx1ykW2TWtJrYt/ajfQi2Mpc1gMOjQNRlaH8wlPF315CiyxL1sG6hBZ48UlUs9+XsQ32D7qhZB12KZYWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766513; c=relaxed/simple;
	bh=Wkq5rJ+0vf/FyCSAs6aBitPLnxW6RCgteSTDmt0K68Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s/HkCt3WtoK/4rif52ytzlmtSOOkPF3wRK1PI6VIVXMEoU+FZBGLDQQQBalcFfeZLN1xRJXx7hd/nMZzzHxxAe7YC3ODJNklIE1VhXPjVRm/p/nM0AcDhg0rp1dZ+K9coGDwtZKb46RoMbYQ9VddLkylkiolKIc8VZU6DynJi5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dy/Itc7l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dy/Itc7l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE091F000FF;
	Wed, 30 Sep 2026 11:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790766512;
	bh=dXBPci6gCirSA/jWqt05EdNPAfxBQK9VAerVDckyQSg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dy/Itc7lOifNGWMQpo77wraEsnPhFiaE9SqvMRjK4YBUwkfPbS9YBVMJ0bU26rQdn
	 NgmPLMWuyx7EPB8pSUndCsWBP18TgEZ9FAdpkcw0qz6zyxgXXJVdQNEmbD+nSG3mDN
	 uJf/JUeqtpDIj8rEWDOs/q872auqYwYpDGllp6yKV6MXIwuzZpPgRceJjbEJl0h0i5
	 xuSdQu4SuZ5z9i5lJgqka46Fy6KHOIKc+r+PxbA6v8OeqRhBRMcBAzkZl6YBGUQd5z
	 WSdW1q6+T6stz1lBu2vOSb51M5QH7sWmCY9olLgT4Dt58zLKL48oUosPLYJX1TgRyi
	 t75GRaLmt6wQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 2/2] media: i2c: Add driver for AMS-OSRAM Mira220
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacopo Mondi" <jacopo.mondi@ideasonboard.com>
Cc: robh@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260930-mira220-v12-2-07061064cd7b@ideasonboard.com>
References: <20260930-mira220-v12-0-07061064cd7b@ideasonboard.com>
 <20260930-mira220-v12-2-07061064cd7b@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 11:08:31 +0000
Message-Id: <20260930110832.0EE091F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] media: i2c: mira220: NULL pointer dereference in mira220_set_ctrl
- [Medium] media: i2c: mira220: Missing set_selection implementation breaks=
 windowing
--

commit fd4dc828a5972aefbff92b9b37845b066b6f6659
Author: Philippe Baetens <philippebaetens@gmail.com>
media: i2c: Add driver for AMS-OSRAM Mira220

This commit adds a V4L2 subdev driver for the AMS-OSRAM Mira220 image senso=
r.
It implements support for mono and RGB 12, 10 and 8 bits formats with a
maximum frame rate up to 90 fps.

> diff --git a/drivers/media/i2c/mira220.c b/drivers/media/i2c/mira220.c
> new file mode 100644
> index 0000000000000..581999b46d953
> --- /dev/null
> +++ b/drivers/media/i2c/mira220.c

[ ... ]

> +static int mira220_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct mira220 *mira220 =3D
> +		container_of(ctrl->handler, struct mira220, ctrl_handler);
> +	struct i2c_client *client =3D v4l2_get_subdevdata(&mira220->sd);
> +	struct v4l2_mbus_framefmt *format;
> +	struct v4l2_subdev_state *state;
> +	int ret =3D 0;
> +
> +	state =3D v4l2_subdev_get_locked_active_state(&mira220->sd);
> +	format =3D v4l2_subdev_state_get_format(state, 0);
> +
> +	if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> +		int exposure_max, exposure_def;
> +
> +		/* Update max exposure while meeting expected vblanking */
> +		exposure_max =3D mira220_calc_exposure(mira220, format->height,
> +						     ctrl->val);

[Severity: High]
Does this code risk a kernel panic if the state lookup fails?

The v4l2_subdev_state_get_format() helper can return NULL, and the returned
format pointer is immediately dereferenced here (format->height) without any
NULL check.

Unlike pad operations, the s_ctrl callback is invoked directly by the contr=
ol
framework and is not guarded by the v4l2_subdev_call() and check_state()
wrappers that normally ensure the format lookup succeeds before invoking the
driver.

[ ... ]

> +static void mira220_update_pad_format(struct mira220 *mira220,
> +				      struct v4l2_mbus_framefmt *fmt, u32 code)
> +{
> +	/* Bayer order varies with flips */
> +	fmt->code =3D mira220_get_format_code(mira220, code);
> +	/*
> +	 * The mira220 sensor doesn't support binning/skipping but only
> +	 * cropping to reduce the frame size so the correct API to configure
> +	 * windowing is the .set_selection one, while format is fixed to
> +	 * the full resolution 1600x1400 one.
> +	 */
> +	fmt->width =3D MIRA220_PIXEL_ARRAY_WIDTH;
> +	fmt->height =3D MIRA220_PIXEL_ARRAY_HEIGHT;
> +	fmt->field =3D V4L2_FIELD_NONE;

[ ... ]

> +static const struct v4l2_subdev_pad_ops mira220_pad_ops =3D {
> +	.enum_mbus_code =3D mira220_enum_mbus_code,
> +	.get_fmt =3D v4l2_subdev_get_fmt,
> +	.set_fmt =3D mira220_set_pad_format,
> +	.get_selection =3D mira220_get_selection,
> +	.enum_frame_size =3D mira220_enum_frame_size,
> +	.enable_streams =3D mira220_enable_streams,
> +	.disable_streams =3D mira220_disable_streams,
> +};

[Severity: Medium]
Will this break the advertised windowing capability?

The driver explicitly restricts set_fmt to the maximum physical resolution =
of
1600x1400 and notes that cropping configuration is deferred to the
set_selection API. However, the .set_selection callback is omitted entirely
in the v4l2_subdev_pad_ops structure.

Without it, userspace has no mechanism to configure cropping or adjust the
frame size, permanently locking the sensor to its maximum resolution.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-mira220-v1=
2-0-07061064cd7b@ideasonboard.com?part=3D2
