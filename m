Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948537;
	b=nVjGKvuzbDi5Pqw3L5BuxKfGpLet81X2hG77MsiaqmXu6DMQrxUBRdr8MZi3paexdSNX
	 EO+NzAdwoi2QGqnNVtt49Hk5qUWAQObALVI8BvN1hpWqfWpTx2SN5z4qOqKpgpfdmJMaN
	 KWF5lrC/GIPoz1z4O/18wbgpdqM1BOYCEXkX/zN8VQMBKbt3InhEWfp6GEGL/hY6ejAHe
	 LHiSm7CFvEVmR2BNjGnR96FC/E5ThLMq5TsY0QCIubbcBSAbV45dsPrIsBay+O/ZR0sfw
	 /fvKp+Zll8KmyrEsP5BMOnZGRiA+Tylrc71QBxAsRpjQLAwsv9xldo1xLwB3Q+Bw38A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948537;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Y/1AyX037khND5HvlDpCq/vB9CjIk4JCmeojvWRF77M=;
	b=BgUtwd2baD1SiCCqO247mKWAUaer56RrAHGvJHaEvgw51sxyuYZ8gkUU5nXn0BTr2eMh
	 RA8B1ZhNQHPWRvdOCNMcRW+7fBGFolyfNMFhAmA+acdLS3mpxL6fG7Y9ehJXmbDEGDASH
	 pf0zsUQCDrRyon2gHt9BIEagJJ+d0AVkBEtILKjb4k6249JGYI7ZNuPack5Ir3yR2ZPog
	 CdjX3zJQl71Jm9jGzYh1p6ijwVxnauHjXhtCZqzt98J3ROm1nVC5nge+lnJpy7idy0I1H
	 Uv6uQ3lBLKw6u7ix1/zuTjPYKIy3VjBZx0HtCCtmy7/Mlex0b9HBhyGxGBcUQxfZzyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rs6wRt1z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4211A606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 20:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rs6wRt1z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2F91F000C4;
	Tue, 17 Nov 2026 20:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794948536;
	bh=Y/1AyX037khND5HvlDpCq/vB9CjIk4JCmeojvWRF77M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rs6wRt1zOWLbGr8V38PBVi7x6wIOBAz+Ae9avJ3BW9NHAA8ilDRB0syI4KrD5HpOu
	 2fjV3p/0y6XYh9c0SNpLWPHYgapwzytjNBsOIQlL6pTzoy659xTA3Sjb+tfrkxn26J
	 elM9PgS0qRdYrYrv/iWUPVZpIbk0S0XGGbBKz5l0ABIRIM5R7bM84bWe9Hgi4RbZO7
	 CT1ax9fVPkIer376zXQgR1MKZtnP5DefDXT/AWVh0CjydRvwlqEa2B6W+/Wz7Upu5z
	 UGJkRu7lp7yw4WAN0ilQwbhCsbYljXQM3kA7uCp9V/SNBpmJC4tTkFsW688k9Ose47
	 wPZxSDUf8cYqA==
Message-ID: <sashiko-outbox-219647@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] media: i2c: Add Samsung S5K3T2 image sensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armandas Kvietkus" <armandas.kvietkus@proton.me>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261117-upstream-s5k3t2-v5-2-1f7f5fde9e2a@proton.me>
References: <20261117-upstream-s5k3t2-v5-0-1f7f5fde9e2a@proton.me>
 <20261117-upstream-s5k3t2-v5-2-1f7f5fde9e2a@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 20:48:56 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] media: i2c: s5k3t2: update pad format code on flip in
  s5k3t2_set_ctrl()
--

commit 1494222806e207d51c67e719677f2ad981aa484e
Author: Armandas Kvietkus <armandas.kvietkus@proton.me>

media: i2c: Add Samsung S5K3T2 image sensor driver

This commit adds a V4L2 subdevice driver for the Samsung S5K3T2 20MP CMOS
image sensor.

> diff --git a/drivers/media/i2c/s5k3t2.c b/drivers/media/i2c/s5k3t2.c
> new file mode 100644
> index 0000000000000..1e504bf5fa24e
> --- /dev/null
> +++ b/drivers/media/i2c/s5k3t2.c
[ ... ]
> +static int s5k3t2_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct s5k3t2 *s5k3t2 =3D container_of_const(ctrl->handler, struct s5k3=
t2,
> +						   ctrl_handler);
> +	const struct v4l2_mbus_framefmt *fmt;
> +	struct v4l2_subdev_state *state;
> +	s64 exposure_max, exposure_def;
> +	int ret;
> +
> +	state =3D v4l2_subdev_get_locked_active_state(&s5k3t2->sd);
> +	fmt =3D v4l2_subdev_state_get_format(state, 0);
> +
> +	if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> +		exposure_max =3D fmt->height + ctrl->val - S5K3T2_EXPOSURE_MARGIN;
> +		exposure_def =3D min(s5k3t2->exposure->default_value,
> +				   exposure_max);
> +		ret =3D __v4l2_ctrl_modify_range(s5k3t2->exposure,
> +					       s5k3t2->exposure->minimum,
> +					       exposure_max,
> +					       s5k3t2->exposure->step,
> +					       exposure_def);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (!pm_runtime_get_if_active(s5k3t2->dev))
> +		return 0;
> +
> +	switch (ctrl->id) {
[ ... ]
> +	case V4L2_CID_HFLIP:
> +		ret =3D cci_write(s5k3t2->regmap, S5K3T2_REG_ORIENTATION,
> +				(s5k3t2->hflip->val ? S5K3T2_HFLIP : 0) |
> +				(s5k3t2->vflip->val ? S5K3T2_VFLIP : 0), NULL);
> +		break;

[Severity: Medium]
Should s5k3t2_set_ctrl() also update fmt->code =3D
s5k3t2_get_format_code(s5k3t2) before the pm_runtime_get_if_active() check
when ctrl->id =3D=3D V4L2_CID_HFLIP?

Both s5k3t2->hflip and s5k3t2->vflip advertise V4L2_CTRL_FLAG_MODIFY_LAYOUT
and change the Bayer order returned by s5k3t2_get_format_code(), while
s5k3t2_pad_ops uses v4l2_subdev_get_fmt() for .get_fmt.  Without updating
fmt->code in the active subdev state when the flip controls change,
VIDIOC_SUBDEV_G_FMT and media link validation see a stale media bus format
code unless userspace calls VIDIOC_SUBDEV_S_FMT again.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-upstream-s=
5k3t2-v5-0-1f7f5fde9e2a@proton.me?part=3D2
