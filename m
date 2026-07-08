Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCA821B192
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523851; cv=none; b=UTjdfDAyQe++3ip6tr2D5W/1u3joZUYA4+ye/ZQLOOEX3ZmCD5tOI3HRcFesU1kCs4IpUg5+afnXowTnJ2WQEM8fFIcMUgZXThGKAAmYDC1wutg0Zwn7+WN3UKLFMjr7MbnSjLtxYk63yxx1Bn15Tu4NAmVx/K62iACa4aox/AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523851; c=relaxed/simple;
	bh=PJIVZR5GpFSRks1yX9EiULL0qh7ioFgMICayzbCMH5Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SryDEcAMKdOoH64JSJ63R3S1ol4B3of9/ExqqrGg/W2r5CMn2kGi/hB9RNfLpk1qu8Hg0o0oq6poz9Cz8PLnLT9dqts3BqpMGONZoitQqCv9vh1ful/c+6Hl57GIgfUTMd6W4h9/7jTuWHKxgBtiAvVY/rCZ3xH0yr1sR8uG1xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ccdIgqXK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ccdIgqXK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D32B1F000E9;
	Wed,  8 Jul 2026 15:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783523849;
	bh=r7PIt4o++8bsZVaLzUMaWEjGh8GLg0kTo8MNwXcLh3k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ccdIgqXKOf8ZcQnfkyZfSnBppNxj6MN2o5lMJdfVYtoc1u+KBInkLqxmraXT5NkbK
	 yUcX06h8SnTqotTHsJ/A0JUvPJoiSMkTjH5tJ5HPpv/0RVrugvrQr90RcBCLs2HXZs
	 LaGgf2wFXxbT99qqH/elJCIy5cOlCI89mPkrr19RaSuop7/gnYrnWatO5zaY0DxJau
	 bw0KriqK81knHZ+OPq8y4EJBR2R8BnJr9ZLoEcOEMWq6qV0GW4016RK43gAcksNU7G
	 7+OF5Q0jbnSrFv9bVAyDNHGr/SFPgidYQevmzyp0RirVS1RMzMqCiOCqK9ExfNhDie
	 qIdZZr8tRvf/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 20/20] media: imx355: Remove storing cur_mode in the
 state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260708-media-imx355-v3-20-9df386a623d7@raspberrypi.com>
References: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
 <20260708-media-imx355-v3-20-9df386a623d7@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 15:17:28 +0000
Message-Id: <20260708151729.4D32B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `__v4l2_ctrl_grab()` function is called without holding the re=
quired control handler lock, triggering a lockdep BUG and causing a data ra=
ce.
--

--- Patch [20]: [PATCH v3 20/20] media: imx355: Remove storing cur_mode in =
the state ---
commit 0f6829a36bfe297cb0fe5da42f9da61884297d27
Author: Dave Stevenson <dave.stevenson@raspberrypi.com>

media: imx355: Remove storing cur_mode in the state

This commit removes the cur_mode pointer from the imx355 structure. It
changes the driver to retrieve the mode information directly from the subdev
state instead.

> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -892,19 +892,23 @@ static int imx355_stop_streaming(struct imx355 *imx=
355)
>  static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct imx355 *imx355 =3D to_imx355(sd);
> +	struct v4l2_subdev_state *state;
>  	int ret =3D 0;
> =20
>  	if (enable) {
>  		ret =3D pm_runtime_resume_and_get(imx355->dev);
>  		if (ret < 0)
>  			return ret;
> =20
>  		/*
>  		 * Apply default & customized values
>  		 * and then start streaming.
>  		 */
> +		state =3D v4l2_subdev_lock_and_get_active_state(sd);
>  		ret =3D imx355_start_streaming(imx355);
> +		v4l2_subdev_unlock_state(state);
>  		if (ret)
>  			goto err_rpm_put;
>  	} else {
>  		imx355_stop_streaming(imx355);
>  		pm_runtime_put_autosuspend(imx355->dev);
>  	}
> =20
>  	/* vflip and hflip cannot change during streaming */
>  	__v4l2_ctrl_grab(imx355->vflip, enable);
>  	__v4l2_ctrl_grab(imx355->hflip, enable);

[Severity: High]
Is it safe to call __v4l2_ctrl_grab() without holding the control handler l=
ock
here?

This patch adds v4l2_subdev_lock_and_get_active_state() around
imx355_start_streaming(), but releases the lock immediately with
v4l2_subdev_unlock_state().

It then calls __v4l2_ctrl_grab() completely unprotected. In the enable =3D=
=3D 0
path, the lock is never taken at all.

Since __v4l2_ctrl_grab() asserts lockdep_assert_held(ctrl->handler->lock),
could this cause a lockdep splat or a data race on the control state? Should
the driver use the locked v4l2_ctrl_grab() variant here instead?

> =20
>  	return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-media-imx3=
55-v3-0-9df386a623d7@raspberrypi.com?part=3D20
